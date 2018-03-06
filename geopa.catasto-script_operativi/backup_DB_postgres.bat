REM **L'eseguibile 7za.exe per comprimere i file si deve trovare nello stesso percorso di QUESTO file .BAT **
REM **da Utilita di Pianificazione di Windows lanci l'azione aggiungendo come argomento il nome e il percorso del file di log. Ad esempio:
REM C:\workspace\DocWEB\geopa_trenzano\script\backup_DB_postgres.bat >> C:\workspace\DocWEB\orbassano\script\logs\%date:~-4%%date:~3,2%%date:~0,2%_pg_dump.txt

REM Setto alcune variabili generali:
set db_name=geo_trenzano_l380
set datetimef=%date:~-4%%date:~3,2%%date:~0,2%
REM set base_dir=C:\Users\webmaster\Desktop\BACKUP_DB
set base_dir=F:\BCK\DB\Postgres
REM set THIS_dir=%CD%
set THIS_dir=C:\workspace\DocWEB\geopa_trenzano\script
md %base_dir%\%datetimef%
set dir_bckp=%base_dir%\%datetimef%

REM Eseguo il backup:
set schema_name=geopa
pg_dump.exe -F plain -n %schema_name% -U postgres -p 5433 %db_name% > %dir_bckp%\%datetimef%-%db_name%-%schema_name%.bckp.sql

set schema_name=catasto
pg_dump.exe -F plain -n %schema_name% -U postgres -p 5433 %db_name% > %dir_bckp%\%datetimef%-%db_name%-%schema_name%.bckp.sql

set schema_name=public
pg_dump.exe -F plain -n %schema_name% -U postgres -p 5433 %db_name% > %dir_bckp%\%datetimef%-%db_name%-%schema_name%.bckp.sql

REM Comprimo la cartella ed elimino i file singoli:
%THIS_dir%\7za.exe a -tzip %base_dir%\%datetimef%-%db_name%.bckp.zip %dir_bckp%\
rmdir /s /q %dir_bckp%

echo Backup Completato!