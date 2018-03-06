#!C:\Python27\python.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'geopa.catasto==1.0','console_scripts','fab2db'
#MODIFICATO DA ME per provare ad importare i file FAB su DB
#Per delle prove di TEST lanciare:
#python.exe C:\Python27\Scripts\fab2db-script.py C:\Users\webmaster\Downloads\FAB_G087\test\G087618390 -d "postgresql://postgres:root@localhost:5433/geo_test" <schema_name>
#per permettere di specificare lo schema, occorre modificare rigo 32 di apps.py, ed aggiungere il recupero dell'informazione da argv in db.py

import os, sys
from sys import argv
import datetime

#I file di LOG li faccio creare dallo script padre "ciclo_cat2db.py"
'''
start_time = datetime.datetime.now()
start_date = start_time.strftime("%Y%m%d")
# open our log file
logname = "fab2db-%s" % (start_date)
so = se = open("%s.log" % logname, 'w', 0)    
# re-open stdout without buffering
sys.stdout = os.fdopen(sys.stdout.fileno(), 'w', 0)
# redirect stdout and stderr to the log file opened above
os.dup2(so.fileno(), sys.stdout.fileno())
os.dup2(se.fileno(), sys.stderr.fileno())
'''

__requires__ = 'geopa.catasto==1.0'
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('geopa.catasto==1.0', 'console_scripts', 'fab2db')()
    )

'''
so.close()
se.close()
'''