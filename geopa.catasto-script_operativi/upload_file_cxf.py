# In questo script entro in una directory che contiene i file CXF compattati in file .zip, dunque scompatto il file compresso ed inizio ad elaborare le informazioni caricandole su un DB.

#Viene richiamato con:
#python.exe C:\\workspace\\DocWEB\\orbassano\\script\upload_file_cxf.py "C:\\workspace\\DocWEB\\orbassano\\File_upload\\file_cxf" "C:\\workspace\\DocWEB\\orbassano\\File_upload\\processati\\file_cxf" "C:\\workspace\\DocWEB\\orbassano\\script" "PostgreSQL" "dbname='geo_test' host='localhost' port='5433' user='postgres' password='root' active_schema=public"

from sys import argv
import zipfile
import sys, os
import psycopg2
import datetime

start_time = datetime.datetime.now()
start_date = start_time.strftime("%Y%m%d")
start_timestamp = start_time.strftime("%Y-%m-%d %H:%M:%S")
################################ VARIABILI GENERALI ###############################

my_dir = argv[1]
my_processed_dir = argv[2]
path_mypy_raw = argv[3]
# Percorso del DB e vista planimetrie:
format_dst = argv[4]
db_path = argv[5]
dirLog = argv[6]
update_info = argv[7]
conn_string = argv[8]
db_schema = argv[9]
# Variabili che servono per tenere traccia sul DB di questo update:
codice_ammvo, type_update, note, upload_table_name = update_info.split(',')
schema_tableupdate, table_update = upload_table_name.split('.')
file_processed = 'CXF'
logfile = "%s\\\cxf2db-%s" % (dirLog, start_date)
this_script = os.path.basename(__file__)

# Percorso dello script che cicla dentro la dir e carica i dati sul DB e che qui IMPORTO:
#path_mypy = os.path.abspath('C:\\workspace\\DocWEB\\orbassano\\script\\')
path_mypy = os.path.abspath(path_mypy_raw)
if not path_mypy in sys.path:
    sys.path.insert(1, path_mypy)
import ciclo_cxf2db

################################ FINE VARIABILI GENERALI ###############################



def unzip_no_structure(my_dir, my_zip):
    zip_file = zipfile.ZipFile(my_zip, 'r')
    for files in zip_file.namelist():
        data = zip_file.read(files, my_dir)
        # I am almost shure zip represents directory separator char as "/" regardless of OS, but I  don't have DOS or Windos here to test it
        myfile_path = os.path.join(my_dir, files.split("/")[-1])
        myfile = open(myfile_path, "wb")
        myfile.write(data)
        myfile.close()
        filename = os.path.basename(myfile_path)
        if (filename.endswith(".ZIP") or filename.endswith(".zip")):
            fileList.append(filename)
    zip_file.close()


dirList=os.listdir(my_dir)
#Recupero i nomi dei file ZIP - devo ciclare all'interno di dirList:
zipList=[]
fileList=[] #lista dei file ZIP nidificati
for item in dirList:
    if (item.endswith(".ZIP") or item.endswith(".zip")):
        zipList.append(item)
if len(zipList) != 0:
    print zipList
    for zip in zipList:
        my_zip = os.path.join(my_dir, zip)
        unzip_no_structure(my_dir, my_zip)
        #sposto i file ZIP nella cartella "processati" x archivio:
        my_processed_zip = os.path.join(my_processed_dir, zip)
        if os.path.exists(my_processed_zip):
            os.remove(my_processed_zip)
            os.rename(my_zip, my_processed_zip)
        else:
            os.rename(my_zip, my_processed_zip)


############## elaboro eventuali ulteriori file ZIP nidificati (solo ad un PRIMO LIVELLO...): ####
if len(fileList) != 0:
    print fileList
    for zip in fileList:
        my_zip = os.path.join(my_dir, zip)
        unzip_no_structure(my_dir, my_zip)
else:
    print "Nessun file ZIP nidificato"


############################### Carico i file CXF su DB: #################################

ciclo_cxf2db.main(my_dir, format_dst, db_path, dirLog)

del path_mypy #forse elimino il nuovo percorso di ricerca per script python


############################### Elimino i file processati caricati sul DB, etc... #########################

file_to_delete = os.listdir(my_dir)
for f in file_to_delete:
    full_path = os.path.join(my_dir, f)
    os.remove(full_path)


############################### Tengo traccia di questa operazione di UPDATE su DB: #################################
end_time = datetime.datetime.now()
diff = (end_time-start_time).total_seconds()
results = 'OK'
zip_str = ', '.join(zipList) #trasformo la lista in stringa col separatore scelto

conn = None
try:
    conn = psycopg2.connect(conn_string)
    query =  'INSERT INTO %s(start_update, time_update, codice_ammvo, zip_processed, file_processed, script_executed, results, logfile, target_schema, type_update, note) VALUES (\'%s\', %s, \'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\', \'%s\');' % (upload_table_name, start_timestamp, diff, codice_ammvo, zip_str, file_processed, this_script, results, logfile, db_schema, type_update, note)
    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
finally:
    if conn:
        conn.close()
