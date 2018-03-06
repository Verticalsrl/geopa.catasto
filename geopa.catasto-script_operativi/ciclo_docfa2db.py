### SCRIPT GENERICO: Le variabili specifiche vanno passata come argomenti esterni ###

# Ciclo sui dati DAT delle planimetrie per recuperare la radice comune del nome dei file, ed avviare lo script, scritto da me, "fab2db.py".
# Il comando andrebbe lanciato cosi':
# python.exe C:\Python27\Scripts\ciclo_cat2db.py <percorso_files> -d "postgresql://postgres:root@localhost:5433/geo_test" <schema_name> <dirLog>

#Oppure puo' essere lanciato all'interno di un altro script python, richiamandone prima il percorso:
#path = os.path.abspath('C:\\workspace\\DocWEB\\orbassano\\script\\')
#if not path in sys.path:
#    sys.path.insert(1, path)
#import ciclo_cat2db
#format_dst = '-d'
#db_path = "postgresql://postgres:root@localhost:5433/geo_test"
#ciclo_cat2db.main(my_dir, format_dst, db_path, dirLog)
    
# A sua volta questo script dovrebbe lanciare, per ogni file recuperato dal percorso indicato, lo script python in questo modo:
# python.exe C:\Python27\Scripts\fab2db-script.py <percorso_files>\<nomefile_senza_estensione> -d "postgresql://postgres:root@localhost:5433/geo_test" <schema_name>
    
# Proviamo a lanciare questo script con:
# python.exe C:\workspace\DocWEB\orbassano\script\ciclo_cat2db.py C:\Users\webmaster\Downloads\Catasto-Luglio_2013\Fabbricati -d "postgresql://postgres:root@localhost:5433/geo_test" "C:\\workspace\\DocWEB\\orbassano\\script\\logs"

import os, sys
from sys import argv
import datetime
import sqlalchemy
import warnings

def main(cxf_path, format_dst, db_path, dirLog, schema='public'):

    cat2ogr_path = 'C:\\Python27\\Scripts\\fab2db-script.py'
    #dirLog = 'C:\\workspace\\DocWEB\\orbassano\\script\\logs'
    
    #cxf_path = 'C:\Users\webmaster\Downloads\Catasto-Luglio_2013\Fabbricati'
    dirList=os.listdir(cxf_path)
    # get the current working directory or take it from the argv:
    #script_path=os.getcwd()
    #script_path=argv[0]
    
    #Recupero il nome dei file senza estensioni - devo ciclare all'interno di dirList:
    fileList=[]
    for item in dirList:
        if item[-6:] == 'SC.DAT' or item[-6:] == 'DM.DAT': #considero anche i file per le planimetrie
            fileList.append(os.path.splitext(item[:-6])[0])
        else:
            fileList.append(os.path.splitext(item)[0])
    #Prendo solo i nomi file univoci - genero un "set":
    uniqueSet = set(fileList)
    uniqueList = list(uniqueSet)
    
    # File di LOG:
    start_time = datetime.datetime.now()
    start_date = start_time.strftime("%Y%m%d")
    # open our log file
    #dirLog = os.path.dirname(script_path) #se presa da argv, occorre togliere il nome dello script lanciato
    logname = "%s\\docfa2db-%s" % (dirLog, start_date)
    so = se = open("%s.log" % logname, 'w', 0)    
    # re-open stdout without buffering
    sys.stdout = os.fdopen(sys.stdout.fileno(), 'w', 0)
    # redirect stdout and stderr to the log file opened above
    os.dup2(so.fileno(), sys.stdout.fileno())
    os.dup2(se.fileno(), sys.stderr.fileno())
    
    connection = None
    trans = None

    try:
        #Se ho dei file nel percorso indicato, svuoto le tavole sul DB:
        if not uniqueList == []:
            print "File trovati nella directory: svuoto le tavole su DB"
            #db_path = "postgresql://postgres:root@localhost:5433/geo_test"
            engine = sqlalchemy.create_engine(db_path)
            #meta = sqlalchemy.MetaData()
            #meta.reflect(bind=engine)
            #METODO 2: Specifico direttamente le tabelle creando una transazione:
            #Riporto le tabelle in una lista:
            tables = ['cf_planimetrie_poligoni', 'cf_planimetrie_schede']
            connection = engine.connect()
            trans = connection.begin()
            #Ciclo nella lista per troncare le tavole:
            for table in tables:
                query_trunc = 'truncate table %s.%s;' % (schema, table)
                connection.execute(query_trunc)
            trans.commit()
            old_lvl = connection.connection.isolation_level
            connection.connection.set_isolation_level(0)
            for table in tables:
                query_vacuum = 'vacuum full %s.%s;' % (schema, table)
                connection.execute(query_vacuum)
            connection.connection.set_isolation_level(old_lvl)
            print "Le tavole %s sono state svuotate" % (tables)
    except:
        if trans:
            trans.rollback()
        print "ERRORE nella procedura di svuotamento delle tavole %s" % (tables)
        # Bisognerebbe TRONCARE le tabelle delle planimetrie prima di caricare i dati nuovi. Come esser sicuri che ci siano i file corretti in cartella in modo da non svuotare la tabella per niente??
    finally:
        if connection:
            connection.close()
    
    connection_create = None
    try:
        #Adesso ho una lista dei nomi UNIVOCI dei file SENZA estensione, ciclo dentro e carico su DB:
        infile = None
        for infile in uniqueList:
            print '#########################################'
            print infile
            #if len(sys.argv) >= 4:
            command = "python.exe %s %s\%s %s \"%s\" %s" % (cat2ogr_path, cxf_path, infile, format_dst, db_path, schema)
            #print 'python.exe %s %s\%s %s \"%s\" %s' % (cat2ogr_path, cxf_path, infile, format_dst, db_path, schema)
            #Qui i dati andranno SOLO SU DB.
            #else:
            #    command = "%s %s/%s" % (cat2ogr_path, cxf_path, infile)
                #print 'python.exe %s %s\%s' % (cat2ogr_path, cxf_path, infile, format_dst, db_path, schema)
            os.system(command)
    
        if not infile:
            print "non e' stato trovato alcun file nella directory da elaborare"
        else:
            engine_create = sqlalchemy.create_engine(db_path)
            connection_create = engine_create.connect()
            trans_drop = connection_create.begin()
            query_drop = "DROP TABLE IF EXISTS public.cat_planimetrie;"
            connection_create.execute(query_drop)
            trans_drop.commit()
            trans_create = connection_create.begin()
            query_create = "CREATE TABLE public.cat_planimetrie AS (SELECT * FROM schema.v_planimetrie);COMMENT ON TABLE public.cat_planimetrie IS 'tavola creata da codice a seguito di caricamento da file con i dati dalla vista schema.v_planimetrie';ALTER TABLE public.cat_planimetrie ADD COLUMN gid serial;ALTER TABLE public.cat_planimetrie ADD PRIMARY KEY (gid);"
            query_create = query_create.replace('schema', schema)
            connection_create.execute(query_create)
            trans_create.commit()
    
    except:
        if trans_create:
            trans_create.rollback()
        print "ERRORE! Qualcosa non e' andato a buon fine"
        
    finally:
        if connection_create:
            connection_create.close()
        print '#########################################'
        print "Tutto sembra essere andato a buon fine"
        end_time = datetime.datetime.now()
        print "Fine operazioni: %s" % end_time
        diff = (end_time-start_time).total_seconds()
        print "Durata processo: %s secondi" % (diff)
        so.close()
        se.close()

if len(sys.argv) == 5:
    cxf_path = argv[1]
    format_dst = argv[2]
    db_path = argv[3]
    schema = 'public'
    dirLog = argv[4]
    main(cxf_path, format_dst, db_path, dirLog, schema)
elif len(sys.argv) == 6:
    cxf_path = argv[1]
    format_dst = argv[2]
    db_path = argv[3]
    schema = argv[4]
    dirLog = argv[5]
    main(cxf_path, format_dst, db_path, dirLog, schema)


# A cosa servono?
#if __name__ == "__main__":
#    main()

#def __name__ == "__main__":
#    main()