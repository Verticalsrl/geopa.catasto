# In questo script entro in una directory che contiene i file delle planimetrie TIFF e DAT compattati in file .zip, dunque scompatto il file compresso ed inizio ad elaborare le informazioni caricando i DAT su un DB, e convertendo i file TIFF in PDF.

#Viene richiamato con:
# python.exe C:\\workspace\\DocWEB\\orbassano\\script\upload_planimetrie.py "C:\\workspace\\DocWEB\\orbassano\\File_upload\\planimetrie" "C:\\workspace\\DocWEB\\orbassano\\File_upload\\processati\\planimetrie" "C:\\workspace\\DocWEB\\orbassano\\script" "C:\\workspace\\DocWEB\\orbassano\\catasto\\planimetrie" -d "postgres://postgres:root@localhost:5433/geo_test" "dbname='geo_test' host='localhost' port='5433' user='postgres' password='root'" public "'SELECT formato_scheda FROM public.v_planimetrie WHERE path_file ='"

from sys import argv
import zipfile
import imghdr
import sys, os
from PIL import Image 
from reportlab.pdfgen import canvas 
from reportlab.lib.pagesizes import A4, A3, landscape
from reportlab.lib.utils import ImageReader
from reportlab.lib.units import cm, mm
import psycopg2
import datetime

start_time = datetime.datetime.now()
start_date = start_time.strftime("%Y%m%d")
start_timestamp = start_time.strftime("%Y-%m-%d %H:%M:%S")
################################ VARIABILI GENERALI ###############################

my_dir = argv[1]
my_processed_dir = argv[2]
path_mypy_raw = argv[3]
dir_pdf = argv[4]
# Percorso del DB e vista planimetrie:
format_dst = argv[5]
db_path = argv[6]
conn_string = argv[7]
db_schema = argv[8]
query_parte1 = argv[9]
dirLog = argv[10]
update_info = argv[11]
# Variabili che servono per tenere traccia sul DB di questo update:
codice_ammvo, type_update, note, upload_table_name = update_info.split(',')
schema_tableupdate, table_update = upload_table_name.split('.')
file_processed = 'DAT-TIFF to PDF'
logfile = "%s\\\docfa2db-%s" % (dirLog, start_date)
this_script = os.path.basename(__file__)

# Percorso dello script che cicla dentro la dir e carica i dati sul DB e che qui IMPORTO:
path = os.path.abspath(path_mypy_raw)
if not path in sys.path:
    sys.path.insert(1, path)
import ciclo_docfa2db

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


############################### Carico i file .DAT sul DB: #################################

ciclo_docfa2db.main(my_dir, format_dst, db_path, dirLog, db_schema)

del path


############## elaboro eventuali ulteriori file ZIP nidificati (solo ad un PRIMO LIVELLO...): ####
# Nel caso delle planimetrie, questi .zip nidificati dovrebbero contenere i tiff
if len(fileList) != 0:
    print "File zip nidificati ", fileList
    for zip in fileList:
        my_zip = os.path.join(my_dir, zip)
        unzip_no_structure(my_dir, my_zip)
else:
    print "Nessun file ZIP nidificato"

#Cerco tra i file rimasti quelli TIFF:
file_in_dir = os.listdir(my_dir)
tiff_files = []
for tiff in file_in_dir:
    tiff_path = os.path.join(my_dir, tiff)
    if (imghdr.what(tiff_path) == 'tiff'):
        tiff_files.append(tiff)
#print tiff_files[1]

############################### Converto i TIFF in PDF: #################################
for tiff_file in tiff_files:
    dir_image = os.path.join(my_dir, tiff_file)
    image_name = os.path.basename(dir_image)
    pdf_name = '%s.pdf' % (image_name)

    # Mi connetto al DB per sapere le dim del documento:
    conn = None
    try:
        conn = psycopg2.connect(conn_string)
        query =  '%s\'%s\';' % (query_parte1, image_name)
        cur = conn.cursor()
        cur.execute(query)
        pdf_iso = cur.fetchone()
        if not pdf_iso:
            pdf_iso = [4]
    finally:
        if conn:
            conn.close()
    
    paper = 'A%s' % (pdf_iso[0])
    width_pdf, height_pdf = eval(paper) #sono in PIXEL considerando una risoluzione di 72dpi
    resolution_pdf = 72 #dpi
    fp = open(dir_image, "rb")
    hello = Image.open(fp)# open from file object
    hello.load() # make sure PIL has read the data
    width_img, height_img = hello.size #in pixel
    xres_img, yres_img = hello.info["dpi"] #restituisce 199,199dpi, che penso siano 200x200dpi!!
    # im.info["dpi"] = new dpi # (x-res, y-res) per cambiare i dpi. Cmq di default il pdf viene creato a 72dpi
    # Apriamo il canvas che ospita il PDF:
    canv = canvas.Canvas(os.path.join(dir_pdf, pdf_name)) #di default e' un A4
    canv.setPageCompression( 0 )
    canv.setPageSize(eval(paper))
    #Ridimensioniamo l'img: scriviamo direttamente l'img nel canvas con le dimensioni che vogliamo prese dall'img stessa cosi' da esser sicuri di mantenere le proporzioni
    width_dot = (width_img / xres_img) * resolution_pdf
    height_dot = (height_img / yres_img) * resolution_pdf
    canv.drawImage(ImageReader(hello), 7*mm, 0, width_dot, height_dot) #la prima coppia e' il pto origine x,y da dove inserire l'immagine; la seconda coppia sono le dimensioni!!! Se non si specifica l'unita' di misura sono in "punti"
    canv.showPage()
    canv.save()
    fp.close()


############################### Elimino i file processati caricati sul DB, etc... #################################

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
