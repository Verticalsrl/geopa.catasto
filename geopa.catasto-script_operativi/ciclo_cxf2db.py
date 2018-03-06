### SCRIPT GENERICO: Le variabili specifiche vanno passata come argomenti esterni ###

# recupera i file con "extension" da un percorso dichiarato dall'utente, e richiama il comando "cxf2ogr"
# quindi converte i file CXF trovati nel percorso o come shapefile
# oppure se si e' indicata come destinazione un DB in postgres li converte in tavole PostGIS. In quest'ultimo caso lo script crea una tavola per ogni foglio, che poi unisce in base alle 5 categorie del catasto: bordi, testi, simboli, etc., cancellando successivamente le singole tavole
# Nel caso di destinazione su DB Postgres le tavole di unione DOPO LA PRIMA CREAZIONE o SE GIA' ESISTONO devono avere per una corretta visualizzazione su GIS: la colonna "gid" seriale come PK, essere registrate nella tavola "public.geometry_columns" con il corretto SRID, ed avere indice "gist" sul campo geometry

##esempio di richiamo del presente script: python ciclo_cxf2db.py C:\Users\webmaster\Downloads\G087_673305_1 "PostgreSQL" "dbname='geo_orbassano' host='localhost' port='5433' user='postgres' password='root' active_schema=test"
#Per i TEST usa: python ciclo_cxf2db.py C:\Users\webmaster\Downloads\FAB_G087\test "PostgreSQL" "dbname='geo_orbassano' host='localhost' port='5433' user='postgres' password='root' active_schema=test" "C:\\workspace\\DocWEB\\orbassano\\script\\logs"

#Oppure puo' essere lanciato all'interno di un altro script python, richiamandone prima il percorso:
#path = os.path.abspath('C:\\workspace\\DocWEB\\orbassano\\script\\')
#if not path in sys.path:
#    sys.path.insert(1, path)
#import ciclo_cxf2db
#format_dst = '-d'
#db_path = "postgresql://postgres:root@localhost:5433/geo_test"
#ciclo_cat2db.main(my_dir, format_dst, db_path, dirLog)

#Il comando "cxf2ogr.exe" puo' invece essere lanciato direttamente con ad esempio:
#C:\Python27\Scripts\cxf2ogr.exe G535_006100.CXF -f "PostgreSQL" -d PG:"dbname='geo_pa_test' host='localhost' port='5433' user='postgres' password='root' active_schema=catasto_g087"

import os, sys
from sys import argv
import datetime
import psycopg2
    
def main(cxf_path, format_dst, db_path, dirLog):

    con = None
    cxf2ogr_path = "C:\Python27\Scripts\cxf2ogr.exe"
    #dirLog = 'C:\\workspace\\DocWEB\\orbassano\\script\\logs'
    extension = ".CXF"
    
    start_time = datetime.datetime.now()
    start_date = start_time.strftime("%Y%m%d")
    dirList=os.listdir(cxf_path)
    
    b = [item for item in range(len(dirList)) if (dirList[item].endswith(extension))]
    
    table = [ 0 for i in range(len(b)) ]
    
    i=0
    for findex in b:
        table[i] = dirList[findex]
        i=i+1
    
    try:
    
        # open our log file
        logname = "%s\\cxf2db-%s" % (dirLog, start_date)
        so = se = open("%s.log" % logname, 'w', 0)    
        # re-open stdout without buffering
        sys.stdout = os.fdopen(sys.stdout.fileno(), 'w', 0)
        # redirect stdout and stderr to the log file opened above
        os.dup2(so.fileno(), sys.stdout.fileno())
        os.dup2(se.fileno(), sys.stderr.fileno())
        print "Inizio operazioni: %s" % start_time
    
        infile=None
        for infile in table:
            # open our log file
            #logname = "%s-%s" % (infile[:-4], start_date)
            print '#########################################'
            print infile
            #if len(sys.argv) == 4:
            if (format_dst == 0) or (db_path == 0):
                command = "%s %s/%s" % (cxf2ogr_path, cxf_path, infile)
            else:
                command = "%s %s/%s -f \"%s\" -d PG:\"%s\"" % (cxf2ogr_path, cxf_path, infile, format_dst, db_path)
            os.system(command)
    
    
    ########################################
    
        if infile:
            #TEST: cerchiamo di raggruppare tutte le tavole in UNA ed eliminare le altre
            #Si cicla su tutti i tipi di tavole
            codice_comune = infile[:4].lower()
            tables = ["catasto_bordi_XXXX_%", "catasto_fiduciali_XXXX_%", "catasto_linee_XXXX_%", "catasto_simboli_XXXX_%", "catasto_testi_XXXX_%"]
        
            #Si cicla anche per "schemaname" nel caso in cui ci siano tavole del catasto in altri schemi
            #if len(sys.argv) == 4: #cioe' faccio questo lavoro solo se la destinazione e' su un DB
            if (format_dst != 0) and (db_path != 0): #cioe' faccio questo lavoro solo se la destinazione e' su un DB
                for tavolaccia in tables:
                    print '#########################################'
                    print tavolaccia
                    db_path_less = db_path[0: (db_path.find('active_schema'))]; #recupero i dati di connessione al DB senza lo schema
                    con = psycopg2.connect(db_path_less)
                    #Specifico diverse connessioni per eseguire altrettante query sul DB:
                    cur = con.cursor()
                    cur_bckp = con.cursor()
                    cur_transazione1 = con.cursor()
                    query = "SELECT schemaname, array_agg(tablename) FROM pg_tables where tablename like '%s' GROUP BY schemaname;" % tavolaccia #ottengo delle righe de tipo "test";"{catasto_bordi_g087_1,catasto_bordi_g087_2}"
                    query = query.replace("XXXX", codice_comune)
                    #nome_tavola_unica = tavolaccia.replace("XXXX_%", codice_comune)
                    nome_tavola_unica = tavolaccia.replace("_XXXX_%", "")
                    cur.execute(query)
                    print query
                    data = cur.fetchall()
                    len_data = len(data)
                    count = 0
                    catasto = {}
                    
                    #creo la query per unire le tavole di uno stesso argomento:
                    while (count < len_data):
                        nomi_tavole = str(data[count][1]).replace(" ","").replace("'","").replace("[","").replace("]","")
                        list_tavole = nomi_tavole.split(',')
                        catasto[str(data[count][0])] = list_tavole
                        count = count + 1
                    
                    for key, value in catasto.items():
                        # #Per ogni schema-key vedo se e' gia' presenta una tavola unica, e se si' ne faccio una copia di BACKUP:
                        #query_bckp = "SELECT schemaname, tablename FROM pg_tables where tablename like '%s';" % nome_tavola_unica
                        query_bckp = "select count(*)::int from pg_tables where schemaname = '%s' and tablename like '%s'" % (key, nome_tavola_unica)
                        cur_bckp.execute(query_bckp)
                        data_bckp = cur_bckp.fetchone()
                        query_transazione1 = "BEGIN;"
                        print data_bckp[0]
                        if int(data_bckp[0]) > 0:
                            print "OK ci sono altre vecchie tavole la rinomino"
                            query_rename = ""
                            #query_rename += "DROP INDEX IF EXISTS %s_gist;" % (nome_tavola_unica)
                            #query_rename += "ALTER TABLE %s.%s RENAME TO bckp%s_%s;" % (key, nome_tavola_unica, start_date, nome_tavola_unica)
                            ## Il metodo TRUNCATE non funziona poiche' poi dovrei reinserire i valori specificando le colonne, in quanto ho aggiunto la colonna "gid"...la elimino e via, poiche' col metodo RENAME le eventuali VIEW che si rifanno alle tavole continuano a puntare alle vecchie tavole rinominate:
                            query_rename += "CREATE TABLE %s.bckp%s_%s AS SELECT * FROM %s.%s;" % (key, start_date, nome_tavola_unica, key, nome_tavola_unica)
                            query_rename += "TRUNCATE %s.%s;" % (key, nome_tavola_unica)
                            #query_rename += "ALTER TABLE %s.%s DROP COLUMN gid;" % (key, nome_tavola_unica)
                            query_transazione1 += query_rename
                        #E poi compongo le query di UNION e di DROP
                        #query_union = "CREATE TABLE %s.%s AS (" % (key, nome_tavola_unica)
                        query_union = "INSERT INTO %s.%s " % (key, nome_tavola_unica)
                        query_drop = "DROP TABLE "
                        query_delete = "DELETE FROM public.geometry_columns WHERE f_table_name IN ("
                        numero_tavole = len(value)
                        ii = 0
                        for tavole in value:
                            if ii < (numero_tavole-1):
                                query_union +=  "SELECT * FROM %s.%s UNION " % (key, tavole)
                                query_drop += "%s.%s," % (key, tavole)
                                query_delete += "'%s'," % (tavole)
                            else:
                                query_union +=  "SELECT * FROM %s.%s" % (key, tavole)
                                query_drop += "%s.%s" % (key, tavole)
                                query_delete += "'%s'" % (tavole)
                            ii = ii + 1
                        #query_union += ");"
                        query_union += ";"
                        query_drop += ";"
                        query_delete += ");"
                        query_transazione1 += query_union
                        query_transazione1 += query_drop
                        query_transazione1 += query_delete
                        ### LE TAVOLE DI UNIONE SUL DB devono gia' avere colonna "gid" come PK, essere registrate in "public.geometry_columns" ed avere indice "gist" sul campo geometry. In questo caso pero' risulta problematica la stringa di INSERT in cui dovrei specificare le colonne: al momento opto per una creazione da zero della tavola di unione.
                        query_table = ""
                        #query_table += "ALTER TABLE %s.%s ADD COLUMN gid serial;" % (key, nome_tavola_unica)
                        #query_table += "ALTER TABLE %s.%s ADD PRIMARY KEY (gid);" % (key, nome_tavola_unica)
                        query_transazione1 += query_table
                        query_transazione1 += "COMMIT;"
                        #query_transazione1 += "CREATE INDEX %s_gist ON %s.%s USING gist(wkb_geometry);" % (nome_tavola_unica, key, nome_tavola_unica)
                        print query_transazione1
                        cur_transazione1.execute(query_transazione1)
        else:
            print "non e' stato trovato alcun file nella directory da elaborare"
            
        print '#########################################'
        end_time = datetime.datetime.now()
        print "Fine operazioni: %s" % end_time
        diff = (end_time-start_time).total_seconds()
        print "Durata processo: %s secondi" % (diff)
        so.close()
        se.close()                
    
    except psycopg2.DatabaseError, e:
        print 'Error %s' % e    
        sys.exit(1)

    finally:
        if con:
            con.close()


if len(sys.argv) == 5:
    cxf_path = argv[1]
    format_dst = argv[2]
    db_path = argv[3]
    dirLog = argv[4]
    main(cxf_path, format_dst, db_path, dirLog)
elif len(sys.argv) == 3:
    cxf_path = argv[1]
    format_dst = 0
    db_path = 0
    dirLog = argv[2]
    main(cxf_path, format_dst, db_path, dirLog)


