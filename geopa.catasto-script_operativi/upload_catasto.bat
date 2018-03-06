REM ANALIZZA LA CARTELLA FILE_UPLOAD E SE TROVA DEGLI ZIP LI SCOMPATTA E CARICA I DATI CATASTALI CXF, FAB, TER, TIT, SOG, SE CI SONO, SUL DB E ELABORA I TIFF E I DAT DELLE PLANIMETRIE

@ECHO OFF
echo "inizio attivita' %date% alle %time:~-11,2%:%time:~-8,2%:%time:~-5,2%"
REM SCRIPT SPECIFICO: Le variabili specifiche sono definite qui, e serviranno come argomenti per altri script
REM si puo' lanciare direttamente da riga di comando OPPURE ..
REM ..da Utilita di Pianificazione di Windows lanci l'azione aggiungendo come argomento il nome e il percorso del file di log. Ad esempio:
REM C:\workspace\DocWEB\geopa_trenzano\script\upload_catasto_piacenza.bat >> C:\workspace\DocWEB\geopa_trenzano\script\logs\%date:~-4%%date:~3,2%%date:~0,2%_upload_catasto_piacenza.txt

REM MODIFICARE anche il percorso delle librerie python nei file:
REM ciclo_cxf2db.py: cxf2ogr_path = "C:\Python27\Scripts\cxf2ogr.exe"
REM ciclo_cat2db.py: cat2ogr_path = 'C:\\Python27\\Scripts\\fab2db-script.py'
REM ciclo_docfa2db.py: cat2ogr_path = 'C:\\Python27\\Scripts\\fab2db-script.py'

REM VARIABILI GENERALI SUL DB:
set format_dst1="PostgreSQL"
REM format_dst1 vale 0 se si vuole uno shapefile in output - per elaborazione file CXF
set format_dst=-d
REM format_dst per elaborare file Immobili e Planimetrie
set db_type=postgres
set db_name=geo_trenzano_l380
set db_host=localhost
set db_port=5433
set db_user=postgres
set db_pwd=root
set db_schema=catasto
REM Variabili per tenere traccia su DB di queste operazioni di aggiornamento; il nome della tavola deve essere COMPLETA di schema; le note SENZA VIRGOLE; il campo type_update assume valori "test" o "produzione"
set codice_ammvo=I258
set type_update=andrea
set note=caricamento completo dati catasto secondo nuova procedura
set upload_table_name=catasto.upload_catasto

REM Variabili costruite dalle precedenti - NON OCCORRE MODIFICARE
set conn_string="dbname='%db_name%' host='%db_host%' port='%db_port%' user='%db_user%' password='%db_pwd%'"
REM conn_string="host='localhost' port='5433' dbname='geo_orbassano' user='postgres' password='root'"
set db_path="%db_type%://%db_user%:%db_pwd%@%db_host%:%db_port%/%db_name%"
REM db_path="postgresql://postgres:root@localhost:5433/geo_test"
set update_info=%codice_ammvo%,%type_update%,%note%,%upload_table_name%

REM VARIABILI GENERALI SULLE DIRECTORY:
set script_dir=C:\\workspace\\DocWEB\\\geopa_trenzano\\script
REM tutti gli script .py personalizzati stanno in questa dir
set dir_pdf=C:\\workspace\\DocWEB\\\geopa_trenzano\\catasto\\planimetrie
REM directory per i pdf dei tiff delle planimetrie
set dirLog=C:\\workspace\\DocWEB\\\geopa_trenzano\\script\\logs


REM CARICO PRIMA LE GEOMETRIE - FILE CXF:
set my_dir=C:\\workspace\\DocWEB\\\geopa_trenzano\\File_upload\\file_cxf
set my_processed_dir=C:\\workspace\\DocWEB\\\geopa_trenzano\\File_upload\\processati\\file_cxf
set db_path="dbname='%db_name%' host='%db_host%' port='%db_port%' user='%db_user%' password='%db_pwd%' active_schema=%db_schema%"
REM db_path="dbname='geo_orbassano' host='localhost' port='5433' user='postgres' password='root' active_schema=test"

python.exe %script_dir%\upload_file_cxf.py "%my_dir%" "%my_processed_dir%" "%script_dir%" %format_dst1% %db_path% "%dirLog%" "%update_info%" %conn_string% %db_schema%


REM CARICO GLI IMMOBILI - FILE FAB, TER, SOG E TIT:
set my_dir=C:\\workspace\\DocWEB\\geopa_trenzano\\File_upload\\immobili
set my_processed_dir=C:\\workspace\\DocWEB\\geopa_trenzano\\File_upload\\processati\\immobili
set db_path="%db_type%://%db_user%:%db_pwd%@%db_host%:%db_port%/%db_name%"
REM db_path="postgresql://postgres:root@localhost:5433/geo_test"

python.exe %script_dir%\upload_immobili.py "%my_dir%" "%my_processed_dir%" "%script_dir%" %format_dst% %db_path% %db_schema% "%dirLog%" "%update_info%" %conn_string%


REM CARICO I DATI DELE PLANIMETRIE - FILE .DAT E .TIFF:
set my_dir=C:\\workspace\\DocWEB\\geopa_trenzano\\File_upload\\planimetrie
set my_processed_dir=C:\\workspace\\DocWEB\\geopa_trenzano\\File_upload\\processati\\planimetrie
set query_parte1="SELECT formato_scheda FROM %db_schema%.cf_planimetrie_schede WHERE nome_file||'.'||lpad(n_scheda::text,3,'0') ="

python.exe %script_dir%\upload_planimetrie.py "%my_dir%" "%my_processed_dir%" "%script_dir%" "%dir_pdf%" %format_dst% %db_path% %conn_string% %db_schema% %query_parte1% "%dirLog%" "%update_info%"

echo "fine attivita' %date% alle %time:~-11,2%:%time:~-8,2%:%time:~-5,2%"
