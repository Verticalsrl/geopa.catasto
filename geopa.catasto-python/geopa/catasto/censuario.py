
from os.path import basename as path_basename
import os
import unicodedata

#creo alcune funzioni per il casting dei dati:
def to_float(attributo, valore):
    if valore == '':
        oggetto[attributo] = 0
    else:
        oggetto[attributo] = float(valore.replace(',','.'))

def to_int(attributo, valore):
    if valore == '':
        oggetto[attributo] = 0
    else:
        oggetto[attributo] = int(valore)

def to_date(attributo, valore):
    if len(valore) == 8:
        oggetto[attributo] = valore[:2]+'-'+valore[2:4]+'-'+valore[4:]
    elif valore == '' or valore == ' ':
        oggetto[attributo] = None
    else:
        print "ATTENZIONE! Formato DATA errato all'origine: %s=%s" % (attributo, valore)
        oggetto[attributo] = '01-01-1000'

#Rimuovo lettere accentate o caratteri strani, convertendoli in "latin-1" per una corretta decodifica:
def remove_accents(input_str):
    nkfd_form = unicodedata.normalize('NFKD', unicode(input_str.decode('latin-1')))
    return u"".join([c for c in nkfd_form if not unicodedata.combining(c)])
def parse_censuario(basepath):
    censuario = {}

    basename = path_basename(basepath).upper()
    print basename

    # check basename #modifico la condizione lunghezza ponendola anche a 10, nella forma: 'G087618390'
    assert len(basename) == 7 or len(basename) == 8 or len(basename) == 10 or len(basename) == 12, basename

    censuario['CODICE_COMUNE'] = basename[:4]
    if len(basename) == 8:
        censuario['SEZIONE'] = basename[4]
    censuario['IDENTIFICATIVO RICHIESTA'] = basename[-4:]

    censuario['FABBRICATI'] = {}
    censuario['FABBRICATI_TERRENI'] = {}


############################# INIZIO ANALISI FILE .FAB ###############################
    try:
        fab = open(basepath + '.FAB')
    except:
        fab = ()

    for i, raw_line in enumerate(fab):
        record = raw_line.strip()
        fields = record.split('|')
        global oggetto
        oggetto = {}
        tipo_record = fields[5]
        assert tipo_record in ['1', '2', '3', '4', '5']
        ###Definisco "oggetto" a seconda del tipo_record per considerare i multi-record di certe tavole
        #oggetto['codice_ammvo'] = censuario['CODICE_COMUNE']
        #oggetto['sezione'] = fields[1]
        #oggetto['identificativo_immobile'], oggetto['tipo_immobile'], oggetto['progressivo'], oggetto['tipo_record'] = fields[2:6]
        #assert tipo_immobile == 'F'
        #assert oggetto['tipo_record'] in ['1', '2', '3', '4', '5']
        #if oggetto['tipo_record'] == '1':
        if tipo_record == '1':
            record_len = 40
            #CAMPI COMUNI per qualsiasi tipo_record:
            oggetto['codice_ammvo'] = censuario['CODICE_COMUNE']
            oggetto['sezione'] = fields[1]
            oggetto['identificativo_immobile'], oggetto['tipo_immobile'], oggetto['progressivo'], oggetto['tipo_record'] = fields[2:6]
            assert oggetto['tipo_immobile'] == 'F'
            assert oggetto['tipo_record'] == '1'
            #CAMPI PROPRI di ogni tipo_record:
            id_immobile = "%s_%s" % (oggetto['identificativo_immobile'], oggetto['tipo_record'])
            oggetto['zona'], oggetto['categoria'], oggetto['classe'] = fields[6:9]
            to_float('consistenza', fields[9])
            to_float('superficie', fields[10])
            to_float('rendita_lire', fields[11])
            to_float('rendita_euro', fields[12])
            # Dati relativi all'ubicazione dell'immobile nel fabbricato:
            oggetto['lotto'], oggetto['edificio'], oggetto['scala'], oggetto['interno1'], oggetto['interno2'], oggetto['piano1'], oggetto['piano2'], oggetto['piano3'], oggetto['piano4'] = fields[13:22]
            # Dati relativi all'atto che ha generato la situazione oggettiva dell'unita':
            to_date('data_di_efficacia00', fields[22])
            to_date('data_di_registrazione00', fields[23])
            oggetto['tipo_nota00'], oggetto['numero_nota00'], oggetto['progressivo_nota00'], oggetto['anno_nota00'] = fields[24:28]
            oggetto['numero_nota00'] = oggetto['numero_nota00'].lstrip('0')
            # Dati relativi all'atto che ha concluso la situazione oggettiva dell'unita':
            to_date('data_di_efficacia99', fields[28])
            to_date('data_di_registrazione99', fields[29])
            oggetto['tipo_nota99'], oggetto['numero_nota99'], oggetto['progressivo_nota99'], oggetto['anno_nota99'] = fields[30:34]
            oggetto['numero_nota99'] = oggetto['numero_nota99'].lstrip('0')
            oggetto['partita'], oggetto['annotazione'], oggetto['identificativo_mutazione_iniziale'], oggetto['identificativo_mutazione_finale'], oggetto['protocollo_notifica'] = fields[34:39]
            to_date('data_notifica', fields[39])
            #Dati aggiunti dal 2007:
            if len(fields) > 40:
                # Dati relativi all'atto che ha generato la situazione oggettiva dell'unita':
                oggetto['codice_causale_atto_generante'], oggetto['descrizione_atto_generante'] = fields[40:42]
                # Dati relativi all'atto che ha concluso la situazione oggettiva dell'unita':
                oggetto['codice_causale_atto_conclusivo'], oggetto['descrizione_atto_conclusivo'] = fields[42:44]
                oggetto['flag_classamento'] = fields[44]
                record_len = 40
            #fields = fields[6:] #togli questo controllo sulla lunghezza del record
            censuario['FABBRICATI'][id_immobile] = {}
            censuario['FABBRICATI'][id_immobile].update(oggetto)
        #elif oggetto['tipo_record'] == '2':
        elif tipo_record == '2':
            record_len = 6
            #CAMPI COMUNI per qualsiasi tipo_record:
            oggetto['codice_ammvo'] = censuario['CODICE_COMUNE']
            oggetto['sezione'] = fields[1]
            oggetto['identificativo_immobile'], oggetto['tipo_immobile'], oggetto['progressivo'], oggetto['tipo_record'] = fields[2:6]
            assert oggetto['tipo_record'] == '2'
            assert oggetto['tipo_immobile'] == 'F'
            #CAMPI PROPRI di ogni tipo_record - cerco di recuperare i multi-record:
            fields = fields[6:]
            n_record = len(fields) / 6 #numero di multi-record, essendo 6 i campi per ogni record
            for ii in range(int(n_record)):
                #print "n_record: ", n_record, "; valore di ii: ", ii
                mm = ii*6
                id_immobile = "%s_%s_%s" % (oggetto['identificativo_immobile'], oggetto['tipo_record'], ii)
                oggetto['sezione_urbana'], oggetto['foglio'], oggetto['numero'], oggetto['denominatore'], oggetto['subalterno'], oggetto['edificialita'] = fields[mm:(mm+6)]
                oggetto['foglio'] = oggetto['foglio'].lstrip('0')
                oggetto['numero'] = oggetto['numero'].lstrip('0')
                oggetto['subalterno'] = oggetto['subalterno'].lstrip('0')
                oggetto['id_particella'] = censuario['CODICE_COMUNE'] + '_' + oggetto['foglio'] + '_' + oggetto['numero']
                censuario['FABBRICATI'][id_immobile] = {}
                censuario['FABBRICATI'][id_immobile].update(oggetto)
            fields = fields[:6]

            #Stringhe originali del codice che ancora non elimino perche' non so bene a cosa servono:
            terreno_id = (oggetto['sezione_urbana'], oggetto['foglio'], oggetto['numero'])
            if terreno_id not in censuario['FABBRICATI_TERRENI']:
                censuario['FABBRICATI_TERRENI'][terreno_id] = []
            terreno = censuario['FABBRICATI_TERRENI'][terreno_id]
            terreno.append(oggetto['identificativo_immobile'])
            #print terreno
        #elif oggetto['tipo_record'] == '3':
        elif tipo_record == '3':
            record_len = 6
            #CAMPI COMUNI per qualsiasi tipo_record:
            oggetto['codice_ammvo'] = censuario['CODICE_COMUNE']
            oggetto['sezione'] = fields[1]
            oggetto['identificativo_immobile'], oggetto['tipo_immobile'], oggetto['progressivo'], oggetto['tipo_record'] = fields[2:6]
            assert oggetto['tipo_record'] == '3'
            assert oggetto['tipo_immobile'] == 'F'
            #CAMPI PROPRI di ogni tipo_record - cerco di recuperare i multi-record:
            fields = fields[6:]
            #print fields
            n_record = len(fields) / 6 #numero di multi-record, essendo 6 i campi per ogni record
            #print n_record
            for ii in range(int(n_record)):
                mm = ii*6
                #print 'mm %s' % mm
                id_immobile = "%s_%s_%s" % (oggetto['identificativo_immobile'], oggetto['tipo_record'], ii)
                oggetto['toponimo'], oggetto['indirizzo'], oggetto['civico1'], oggetto['civico2'], oggetto['civico3'], oggetto['codice_strada'] = fields[mm:(mm+6)]
                oggetto['civico1'] = oggetto['civico1'].lstrip('0')
                oggetto['civico2'] = oggetto['civico2'].lstrip('0')
                oggetto['civico3'] = oggetto['civico3'].lstrip('0')
                censuario['FABBRICATI'][id_immobile] = {}
                censuario['FABBRICATI'][id_immobile].update(oggetto)
            fields = fields[:6]
        elif tipo_record == '4':
            record_len = 6
            #CAMPI COMUNI per qualsiasi tipo_record:
            oggetto['codice_ammvo'] = censuario['CODICE_COMUNE']
            oggetto['sezione'] = fields[1]
            oggetto['identificativo_immobile'], oggetto['tipo_immobile'], oggetto['progressivo'], oggetto['tipo_record'] = fields[2:6]
            assert oggetto['tipo_record'] == '4'
            assert oggetto['tipo_immobile'] == 'F'
            #CAMPI PROPRI di ogni tipo_record - cerco di recuperare i multi-record:
            fields = fields[6:]
            n_record = len(fields) / 5 #numero di multi-record, essendo 5 i campi per ogni record
            for ii in range(int(n_record)):
                #print "n_record: ", n_record, "; valore di ii: ", ii
                mm = ii*5
                id_immobile = "%s_%s_%s" % (oggetto['identificativo_immobile'], oggetto['tipo_record'], ii)
                oggetto['sezione_urbana'], oggetto['foglio'], oggetto['numero'], oggetto['denominatore'], oggetto['subalterno'] = fields[mm:(mm+5)]
                oggetto['foglio'] = oggetto['foglio'].lstrip('0')
                oggetto['numero'] = oggetto['numero'].lstrip('0')
                oggetto['subalterno'] = oggetto['subalterno'].lstrip('0')
                censuario['FABBRICATI'][id_immobile] = {}
                censuario['FABBRICATI'][id_immobile].update(oggetto)
            fields = fields[:6]
        elif tipo_record == '5':
            record_len = 2
            #CAMPI COMUNI per qualsiasi tipo_record:
            oggetto['codice_ammvo'] = censuario['CODICE_COMUNE']
            oggetto['sezione'] = fields[1]
            oggetto['identificativo_immobile'], oggetto['tipo_immobile'], oggetto['progressivo'], oggetto['tipo_record'] = fields[2:6]
            assert oggetto['tipo_record'] == '5'
            assert oggetto['tipo_immobile'] == 'F'
            #CAMPI PROPRI di ogni tipo_record - cerco di recuperare i multi-record:
            fields = fields[6:]
            n_record = len(fields) / 2 #numero di multi-record, essendo 5 i campi per ogni record
            for ii in range(int(n_record)):
                #print "n_record: ", n_record, "; valore di ii: ", ii
                mm = ii*2
                id_immobile = "%s_%s_%s" % (oggetto['identificativo_immobile'], oggetto['tipo_record'], ii)
                oggetto['codice_riserva'], oggetto['partita_iscrizione_riserva'] = fields[mm:(mm+2)]
                censuario['FABBRICATI'][id_immobile] = {}
                censuario['FABBRICATI'][id_immobile].update(oggetto)
            fields = fields[:2]
        else:
            continue

        assert len(fields) == record_len, 'Anomalous record schema line: %d, type: %r, len: %d, record: %r' % (i + 1, oggetto['tipo_record'], len(fields),  record)

        #Con queste stringhe pero' tiene solo UN immobile poiche' fa un update! Io voglio TUTTI gli immobili per ogni TIPO_RECORD - modifico e sposto questa parte negli IF sul tipo_record per considerare le tavole multi-record:
        #if oggetto['identificativo_immobile'] not in censuario['FABBRICATI']:
        #    censuario['FABBRICATI'][oggetto['identificativo_immobile']] = {}
        #censuario['FABBRICATI'][oggetto['identificativo_immobile']].update(oggetto)

############################# FINE ANALISI FILE .FAB ###############################


############################# INIZIO ANALISI FILE .TER ###############################
    censuario['TERRENI'] = {}
    try:
        ter = open(basepath + '.TER')
    except:
        ter = ()

    for i, raw_line in enumerate(ter):
        record = raw_line.strip()
        fields = record.split('|')
        oggetto = {}
        tipo_record = fields[5]
        assert tipo_record in ['1', '2', '3', '4']
        ###Definisco "oggetto" a seconda del tipo_record per considerare i multi-record di certe tavole
        if tipo_record == '1':
            record_len = 40
            #CAMPI COMUNI per qualsiasi tipo_record:
            oggetto['codice_ammvo'] = censuario['CODICE_COMUNE']
            oggetto['sezione'] = fields[1]
            oggetto['identificativo_immobile'], oggetto['tipo_immobile'], oggetto['progressivo'], oggetto['tipo_record'] = fields[2:6]
            assert oggetto['tipo_record'] == '1'
            assert oggetto['tipo_immobile'] == 'T'
            #CAMPI PROPRI di ogni tipo_record:
            id_immobile = "%s_%s" % (oggetto['identificativo_immobile'], oggetto['tipo_record'])
            oggetto['foglio'], oggetto['numero'], oggetto['denominatore'], oggetto['subalterno'], oggetto['edificialita'] = fields[6:11]
            oggetto['foglio'] = oggetto['foglio'].lstrip('0')
            oggetto['numero'] = oggetto['numero'].lstrip('0')
            oggetto['subalterno'] = oggetto['subalterno'].lstrip('0')
            oggetto['id_particella'] = censuario['CODICE_COMUNE'] + '_' + oggetto['foglio'] + '_' + oggetto['numero']
            # Dati caratteristici della particella (terreno):
            oggetto['qualita'], oggetto['classe'] = fields[11:13]
            to_float('ettari', fields[13])
            to_float('are', fields[14])
            to_float('centiare', fields[15])
            # Dati relativi al reddito:
            oggetto['flag_reddito'], oggetto['flag_porzione'], oggetto['flag_deduzioni'] = fields[16:19]
            to_float('reddito_dominicale_lire', fields[19])
            to_float('reddito_agrario_lire', fields[20])
            to_float('reddito_dominicale_euro', fields[21])
            to_float('reddito_agrario_euro', fields[22])
            # Dati relativi all'atto che ha generato la situazione oggettiva della particella:
            to_date('data_di_efficacia00', fields[23])
            to_date('data_di_registrazione00', fields[24])
            oggetto['tipo_nota00'], oggetto['numero_nota00'], oggetto['progressivo_nota00'], oggetto['anno_nota00'] = fields[25:29]
            oggetto['numero_nota00'] = oggetto['numero_nota00'].lstrip('0')
            # Dati relativi all'atto che ha concluso la situazione oggettiva della particella:
            to_date('data_di_efficacia99', fields[29])
            to_date('data_di_registrazione99', fields[30])
            oggetto['tipo_nota99'], oggetto['numero_nota99'], oggetto['progressivo_nota99'], oggetto['anno_nota99'] = fields[31:35]
            oggetto['numero_nota99'] = oggetto['numero_nota99'].lstrip('0')
            oggetto['partita'] = fields[35]
            oggetto['annotazione'] = remove_accents(fields[36])
            oggetto['identificativo_mutazione_iniziale'], oggetto['identificativo_mutazione_finale'] = fields[37:39]
            #Dati aggiunti dal 2007:
            if len(fields) > 40:
                record_len = 44
                # Dati relativi all'atto che ha generato la situazione oggettiva dell'unita':
                oggetto['codice_causale_atto_generante'], oggetto['descrizione_atto_generante'] = fields[39:41]
                # Dati relativi all'atto che ha concluso la situazione oggettiva dell'unita':
                oggetto['codice_causale_atto_conclusivo'], oggetto['descrizione_atto_conclusivo'] = fields[41:43]
            #fields = fields[6:] #togli questo controllo sulla lunghezza del record
            censuario['TERRENI'][id_immobile] = {}
            censuario['TERRENI'][id_immobile].update(oggetto)
        elif tipo_record == '2': #DEDUZIONI
            record_len = 1
            #CAMPI COMUNI per qualsiasi tipo_record:
            oggetto['codice_ammvo'] = censuario['CODICE_COMUNE']
            oggetto['sezione'] = fields[1]
            oggetto['identificativo_immobile'], oggetto['tipo_immobile'], oggetto['progressivo'], oggetto['tipo_record'] = fields[2:6]
            assert oggetto['tipo_record'] == '2'
            assert oggetto['tipo_immobile'] == 'T'
            #CAMPI PROPRI di ogni tipo_record - cerco di recuperare i multi-record:
            fields = fields[6:]
            n_record = len(fields) / 1 #numero di multi-record, essendo 1 i campi per ogni record
            for ii in range(int(n_record)):
                #print "n_record: ", n_record, "; valore di ii: ", ii
                mm = ii*1
                id_immobile = "%s_%s_%s" % (oggetto['identificativo_immobile'], oggetto['tipo_record'], ii)
                oggetto['simbolo_deduzione'] = fields[mm]
                censuario['TERRENI'][id_immobile] = {}
                censuario['TERRENI'][id_immobile].update(oggetto)
            fields = fields[:1]
        elif tipo_record == '3': #RISERVE
            record_len = 2
            #CAMPI COMUNI per qualsiasi tipo_record:
            oggetto['codice_ammvo'] = censuario['CODICE_COMUNE']
            oggetto['sezione'] = fields[1]
            oggetto['identificativo_immobile'], oggetto['tipo_immobile'], oggetto['progressivo'], oggetto['tipo_record'] = fields[2:6]
            assert oggetto['tipo_record'] == '3'
            assert oggetto['tipo_immobile'] == 'T'
            #CAMPI PROPRI di ogni tipo_record - cerco di recuperare i multi-record:
            fields = fields[6:]
            n_record = len(fields) / 2 #numero di multi-record, essendo 2 i campi per ogni record
            for ii in range(int(n_record)):
                mm = ii*2
                id_immobile = "%s_%s_%s" % (oggetto['identificativo_immobile'], oggetto['tipo_record'], ii)
                oggetto['codice_riserva'], oggetto['partita_iscrizione_riserva'] = fields[mm:(mm+2)]
                censuario['TERRENI'][id_immobile] = {}
                censuario['TERRENI'][id_immobile].update(oggetto)
            fields = fields[:2]
        elif tipo_record == '4': #PORZIONI
            record_len = 6
            #CAMPI COMUNI per qualsiasi tipo_record:
            oggetto['codice_ammvo'] = censuario['CODICE_COMUNE']
            oggetto['sezione'] = fields[1]
            oggetto['identificativo_immobile'], oggetto['tipo_immobile'], oggetto['progressivo'], oggetto['tipo_record'] = fields[2:6]
            assert oggetto['tipo_record'] == '4'
            assert oggetto['tipo_immobile'] == 'T'
            #CAMPI PROPRI di ogni tipo_record - cerco di recuperare i multi-record:
            fields = fields[6:]
            n_record = len(fields) / 6 #numero di multi-record, essendo 6 i campi per ogni record
            for ii in range(int(n_record)):
                mm = ii*6
                id_immobile = "%s_%s_%s" % (oggetto['identificativo_immobile'], oggetto['tipo_record'], ii)
                oggetto['identificativo_porzione'], oggetto['qualita'], oggetto['classe'], oggetto['ettari'], oggetto['are'], oggetto['centiare'] = fields[mm:(mm+6)]
                censuario['TERRENI'][id_immobile] = {}
                censuario['TERRENI'][id_immobile].update(oggetto)
            fields = fields[:6]
        else:
            continue
    
        assert len(fields) == record_len, 'Anomalous record schema line: %d, type: %r, len: %d, record: %r' % (i + 1, oggetto['tipo_record'], len(fields),  record)
            

############################# FINE ANALISI FILE .TER ###############################


############################# INIZIO ANALISI FILE .SOG ###############################
    censuario['SOGGETTI'] = {}    
    try:
        sog = open(basepath + '.SOG')
    except:
        sog = ()
    #sog = open(basepath + '.SOG')

    for i, raw_line in enumerate(sog):
        record = raw_line.strip()
        fields = record.split('|')
        oggetto = {}
        oggetto['codice_ammvo'] = fields[0]
        oggetto['sezione'] = fields[1]
        oggetto['identificativo_soggetto'], oggetto['tipo_soggetto'] = fields[2:4]
        assert oggetto['tipo_soggetto'] in ['P', 'G'], oggetto['tipo_soggetto']
        if oggetto['tipo_soggetto'] == 'P':
            record_len = 12
            oggetto['cognome'], oggetto['nome'], oggetto['sesso'] = fields[4:7]
            to_date('data_di_nascita', fields[7])
            oggetto['luogo_di_nascita'], oggetto['codice_fiscale'], oggetto['info_suppl'] = fields[8:11]
        elif oggetto['tipo_soggetto'] == 'G':
            record_len = 8
            oggetto['denominazione'], oggetto['sede'], oggetto['codice_fiscale'] = fields[4:7]

        assert len(fields) == record_len, 'Anomalous record schema line: %d, type: %r, len: %d, record: %r' % (i + 1, oggetto['TIPO SOGGETTO'], len(fields),  record)

        identificativo_soggetto = oggetto['identificativo_soggetto'], oggetto['tipo_soggetto']
        censuario['SOGGETTI'][identificativo_soggetto] = oggetto
    #print "id_soggetto: ", identificativo_soggetto, "; DATI: ", censuario['SOGGETTI'][identificativo_soggetto]

############################# FINE ANALISI FILE .SOG ###############################


############################# INIZIO ANALISI FILE .TIT ###############################
    censuario['TITOLARITA'] = {}    
    try:
        tit = open(basepath + '.TIT')
    except:
        tit = ()
    #tit = open(basepath + '.TIT')

    for i, raw_line in enumerate(tit):
        record = raw_line.strip()
        fields = record.split('|')
        oggetto = {}
        oggetto['codice_ammvo'] = fields[0]
        oggetto['sezione'] = fields[1]
        oggetto['identificativo_soggetto'], oggetto['tipo_soggetto'] = fields[2:4]
        oggetto['identificativo_immobile'], oggetto['tipo_immobile'] = fields[4:6]
        # Dati della titolarita':
        oggetto['codice_diritto'] = fields[6]
        oggetto['titolo_non_codificato'] = remove_accents(fields[7])
        oggetto['quota_numeratore'], oggetto['quota_denominatore'], oggetto['regime'], oggetto['soggetto_di_riferimento'] = fields[8:12]
        # Dati relativi all'atto che ha generato la titolarita':
        to_date('data_di_validita00', fields[12])
        oggetto['tipo_nota00'], oggetto['numero_nota00'], oggetto['progressivo_nota00'], oggetto['anno_nota00'] = fields[13:17]
        oggetto['numero_nota00'] = oggetto['numero_nota00'].lstrip('0')
        to_date('data_registrazione_atti00', fields[17])
        oggetto['partita'] = fields[18]
        # Dati relativi all'atto che ha concluso la situazione oggettiva dell'unita':
        to_date('data_di_validita99', fields[19])
        oggetto['tipo_nota99'], oggetto['numero_nota99'], oggetto['progressivo_nota99'], oggetto['anno_nota99'] = fields[20:24]
        oggetto['numero_nota99'] = oggetto['numero_nota99'].lstrip('0')
        to_date('data_registrazione_atti99', fields[24])
        oggetto['identificativo_mutazione_iniziale'], oggetto['identificativo_mutazione_finale'] = fields[25:27]
        if len(fields) > 28:
            # Campo introdotto solo dal 2001:
            oggetto['identificativo_titolarita'] = fields[27]
        if len(fields) > 29:
            # Campi introdotti dal 2007:
            oggetto['codice_causale_atto_generante'], oggetto['descrizione_atto_generante'], oggetto['codice_causale_atto_conclusivo'], oggetto['descrizione_atto_conclusivo'] = fields[28:32]
        
        #id_tit = tuple(fields[2:6])
        #censuario['TITOLARITA'].append(id_tit)
        id_titolarita = "%s_%s" % (fields[2], i)
        censuario['TITOLARITA'][id_titolarita] = {}
        censuario['TITOLARITA'][id_titolarita].update(oggetto)

############################# FINE ANALISI FILE .TIT ###############################


############################# INIZIO ANALISI FILE SC.DAT PLANIMETRIE ###############################
    censuario['PLANIMETRIE_SC'] = {}
    try:
        sc_dat = open(basepath + 'SC.DAT')
    except:
        sc_dat = ()
    #sc_dat = open(basepath + 'SC.DAT')

    for i, raw_line in enumerate(sc_dat):
        record = raw_line.strip()
        fields = record.split('|')
        oggetto = {}
        oggetto['codice_ammvo'] = fields[0]
        oggetto['sezione'] = fields[1]
        oggetto['identificativo_immobile'], oggetto['protocollo_registrazione'] = fields[2:4]
        to_date('data_registrazione', fields[4])
        oggetto['nome_file'] = fields[5]
        to_int('n_scheda', fields[6])
        to_int('formato_scheda', fields[7])
        to_int('scala_scheda', fields[8])

        #id_tit = tuple(fields[2:6])
        #censuario['PLANIMETRIE_SC'].append(id_tit)
        id_sc = "%s_%s" % (fields[2], i)
        censuario['PLANIMETRIE_SC'][id_sc] = {}
        censuario['PLANIMETRIE_SC'][id_sc].update(oggetto)

############################# FINE ANALISI FILE SC.DAT ###############################



############################# INIZIO ANALISI FILE DM.DAT PLANIMETRIE ###############################
    censuario['PLANIMETRIE_DM'] = {}    
    try:
        dm_dat = open(basepath + 'DM.DAT')
    except:
        dm_dat = ()
    #dm_dat = open(basepath + 'DM.DAT')

    for i, raw_line in enumerate(dm_dat):
        record = raw_line.strip()
        fields = record.split('|')
        oggetto = {}
        oggetto['codice_ammvo'] = fields[0]
        oggetto['sezione'] = fields[1]
        oggetto['identificativo_immobile'], oggetto['protocollo_registrazione'] = fields[2:4]
        to_date('data_registrazione', fields[4])
        to_int('progressivo_poligono', fields[5])
        to_int('superficie_poligono', fields[6])
        oggetto['ambiente_poligono'] = fields[7]
        to_int('altezza', fields[8])
        to_int('altezza_max', fields[9])

        #id_tit = tuple(fields[2:6])
        #censuario['PLANIMETRIE_DM'].append(id_tit)
        id_dm = "%s_%s" % (fields[2], i)
        censuario['PLANIMETRIE_DM'][id_dm] = {}
        censuario['PLANIMETRIE_DM'][id_dm].update(oggetto)

############################# FINE ANALISI FILE DM.DAT ###############################



    #print "fabbricati: %s" % censuario['FABBRICATI']
    #print "soggetti: %s" % censuario['SOGGETTI']
    #print "titolarita: %s" % censuario['TITOLARITA']

    return censuario
