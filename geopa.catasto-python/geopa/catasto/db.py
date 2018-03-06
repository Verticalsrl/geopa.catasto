
###Aggiungo queste righe per evitare l'errore sull'Unicode...NON FUNZIONA!!
from sqlalchemy.types import TypeDecorator, Unicode
class CoerceUTF8(TypeDecorator):
    """Safely coerce Python bytestrings to Unicode before passing off to the database."""
    impl = Unicode
    def process_bind_param(self, value, dialect):
        if isinstance(value, str):
            value = value.decode('utf-8')
        return value



from sqlalchemy import Column, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.types import Integer, Unicode, String, Float

Base = declarative_base()

from sys import argv
global schema
schema = 'public'
if len(argv) == 5:
    schema = argv[4]

class Particella(Base):
    __tablename__ = 'catasto_particelle'
    __table_args__ = {'schema' : schema}

    id = Column(Integer, primary_key=True)
    comune = Column(Unicode())
    foglio = Column(Unicode())
    tipo = Column(Unicode())
    particella = Column(Unicode())
    QUALITA = Column(Unicode())
    CLASSE = Column(Unicode())
    ETTARI = Column(Unicode())
    ARE = Column(Unicode())
    CENTIARE = Column(Unicode())
    REDDITO_DOMINICALE = Column(Unicode())
    REDDITO_AGRICOLO = Column(Unicode())

class Terreni(Base):
    __tablename__ = 'ct_terreni'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())    
    identificativo_immobile = Column(String())
    tipo_immobile = Column(String())
    progressivo = Column(Integer())
    tipo_record = Column(Integer())
    foglio = Column(String())
    numero = Column(String())
    denominatore = Column(String())
    subalterno = Column(String())
    edificialita = Column(String())
    qualita = Column(String())
    classe = Column(String())
    ettari = Column(Float())
    are = Column(Float())
    centiare = Column(Float())
    flag_reddito = Column(String())
    flag_porzione = Column(String())
    flag_deduzioni = Column(String())
    reddito_dominicale_lire = Column(Float())
    reddito_agrario_lire = Column(Float())
    reddito_dominicale_euro = Column(Float())
    reddito_agrario_euro = Column(Float())
    data_di_efficacia00 = Column(String())
    data_di_registrazione00 = Column(String())
    tipo_nota00 = Column(String())
    numero_nota00 = Column(String())
    progressivo_nota00 = Column(String())
    anno_nota00 = Column(String())
    data_di_efficacia99 = Column(String())
    data_di_registrazione99 = Column(String())
    tipo_nota99 = Column(String())
    numero_nota99 = Column(String())
    progressivo_nota99 = Column(String())
    anno_nota99 = Column(String())
    partita = Column(String())
    annotazione = Column(String())
    identificativo_mutazione_iniziale = Column(String())
    identificativo_mutazione_finale = Column(String())
    codice_causale_atto_generante = Column(String())
    descrizione_atto_generante = Column(String())
    codice_causale_atto_conclusivo = Column(String())
    descrizione_atto_conclusivo = Column(String())
    id_particella = Column(String())

class Deduzioni(Base):
    __tablename__ = 'ct_deduzioni'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())
    identificativo_immobile = Column(String())
    tipo_immobile = Column(String())
    progressivo = Column(Integer())
    tipo_record = Column(Integer())
    simbolo_deduzione = Column(String())

class CT_Riserve(Base):
    __tablename__ = 'ct_riserve'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())
    identificativo_immobile = Column(String())
    tipo_immobile = Column(String())
    progressivo = Column(Integer())
    tipo_record = Column(Integer())
    codice_riserva = Column(String())
    partita_iscrizione_riserva = Column(String())

class Porzioni(Base):
    __tablename__ = 'ct_porzioni'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())
    identificativo_immobile = Column(String())
    tipo_immobile = Column(String())
    progressivo = Column(Integer())
    tipo_record = Column(Integer())
    identificativo_porzione = Column(String())
    qualita = Column(String())
    classe = Column(String())
    ettari = Column(String())
    are = Column(String())
    centiare = Column(String())

class Unita_imm(Base):
    __tablename__ = 'cf_immobili'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())    
    identificativo_immobile = Column(String())
    tipo_immobile = Column(String())
    progressivo = Column(Integer())
    tipo_record = Column(Integer())
    zona = Column(String())
    categoria = Column(String())
    classe = Column(String())
    consistenza = Column(Float())
    superficie = Column(Float())
    rendita_lire = Column(Float())
    rendita_euro = Column(Float())
    lotto = Column(String())
    edificio = Column(String())
    scala = Column(String())
    interno1 = Column(String())
    interno2 = Column(String())
    piano1 = Column(String())
    piano2 = Column(String())
    piano3 = Column(String())
    piano3 = Column(String())
    piano4 = Column(String())
    data_di_efficacia00 = Column(String())
    data_di_registrazione00 = Column(String())
    tipo_nota00 = Column(String())
    numero_nota00 = Column(String())
    progressivo_nota00 = Column(String())
    anno_nota00 = Column(String())
    data_di_efficacia99 = Column(String())
    data_di_registrazione99 = Column(String())
    tipo_nota99 = Column(String())
    numero_nota99 = Column(String())
    progressivo_nota99 = Column(String())
    anno_nota99 = Column(String())
    partita = Column(String())
    annotazione = Column(String())
    identificativo_mutazione_iniziale = Column(String())
    identificativo_mutazione_finale = Column(String())
    protocollo_notifica = Column(String())
    data_notifica = Column(String())
    codice_causale_atto_generante = Column(String())
    descrizione_atto_generante = Column(String())
    codice_causale_atto_conclusivo = Column(String())
    descrizione_atto_conclusivo = Column(String())
    flag_classamento = Column(String())
    #La tavola inizialmente la creo io manualmente.

class Identificativi(Base):
    __tablename__ = 'cf_identificativi'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())    
    identificativo_immobile = Column(String())
    tipo_immobile = Column(String())
    progressivo = Column(Integer())
    tipo_record = Column(Integer())
    sezione_urbana = Column(String())
    foglio = Column(String())
    numero = Column(String())
    denominatore = Column(String())
    subalterno = Column(String())
    edificialita = Column(String())
    id_particella = Column(String())
    #La tavola inizialmente la creo io manualmente.

class Indirizzi(Base):
    __tablename__ = 'cf_indirizzi'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())    
    identificativo_immobile = Column(String())
    tipo_immobile = Column(String())
    progressivo = Column(Integer())
    tipo_record = Column(Integer())
    toponimo = Column(Integer())
    indirizzo = Column(String())
    civico1 = Column(String())
    civico2 = Column(String())
    civico3 = Column(String())
    codice_strada = Column(Integer())
    #La tavola inizialmente la creo io manualmente.

class Ut_Comuni(Base):
    __tablename__ = 'cf_utilita_comuni'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())    
    identificativo_immobile = Column(String())
    tipo_immobile = Column(String())
    progressivo = Column(Integer())
    tipo_record = Column(Integer())
    sezione_urbana = Column(String())
    foglio = Column(String())
    numero = Column(String())
    denominatore = Column(String())
    subalterno = Column(String())
    #La tavola inizialmente la creo io manualmente.

class Riserve(Base):
    __tablename__ = 'cf_riserve'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())    
    identificativo_immobile = Column(String())
    tipo_immobile = Column(String())
    progressivo = Column(Integer())
    tipo_record = Column(Integer())
    codice_riserva = Column(String())
    partita_iscrizione_riserva = Column(String())
    #La tavola inizialmente la creo io manualmente.

class Subalterno(Base):
    __tablename__ = 'catasto_subalterni'
    __table_args__ = {'schema' : schema}

    id = Column(Integer, primary_key=True)

    particella_id = Column(Integer, ForeignKey('catasto_particelle.id'))
    SUBALTERNO = Column(Unicode())
    ZONA = Column(Unicode())
    CATEGORIA = Column(Unicode())
    CLASSE = Column(Unicode())
    CONSISTENZA = Column(Unicode())
    SUPERFICIE = Column(Unicode())
    RENDITA = Column(Unicode())


class Soggetto(Base):
    __tablename__ = 'cu_soggetti'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())    
    identificativo_soggetto = Column(String())
    tipo_soggetto = Column(String())
    cognome = Column(String())
    nome = Column(String())
    sesso = Column(String())
    data_di_nascita = Column(String())
    luogo_di_nascita = Column(String())
    codice_fiscale = Column(String())
    info_suppl = Column(String())
    denominazione = Column(String())
    sede = Column(String())

    #id = Column(Integer, primary_key=True)
    #CODICE_COMUNE = Column(Unicode())
    #IDENTIFICATIVO_SOGGETTO = Column(Unicode())
    #TIPO_SOGGETTO = Column(Unicode())
    #DENOMINAZIONE = Column(Unicode())
    #SEDE = Column(Unicode())
    #CODICE_FISCALE = Column(Unicode())

class Titolarita(Base):
    __tablename__ = 'cu_titolarita'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())    
    identificativo_soggetto = Column(String())
    tipo_soggetto = Column(String())
    identificativo_immobile = Column(String())
    tipo_immobile = Column(String())
    codice_diritto = Column(String())
    titolo_non_codificato = Column(String())
    quota_numeratore = Column(String())
    quota_denominatore = Column(String())
    regime = Column(String())
    soggetto_di_riferimento = Column(String())
    data_di_validita00 = Column(String())
    tipo_nota00 = Column(String())
    numero_nota00 = Column(String())
    progressivo_nota00 = Column(String())
    anno_nota00 = Column(String())
    data_registrazione_atti00 = Column(String())
    partita = Column(String())
    data_di_validita99 = Column(String())
    tipo_nota99 = Column(String())
    numero_nota99 = Column(String())
    progressivo_nota99 = Column(String())
    anno_nota99 = Column(String())
    data_registrazione_atti99 = Column(String())
    identificativo_mutazione_iniziale = Column(String())
    identificativo_mutazione_finale = Column(String())
    identificativo_titolarita = Column(String())
    codice_causale_atto_generante = Column(String())
    descrizione_atto_generante = Column(String())
    codice_causale_atto_conclusivo = Column(String())
    descrizione_atto_conclusivo = Column(String())

class Titolarita_MM(Base):
    __tablename__ = 'catasto_titolarita_mm'
    __table_args__ = {'schema' : schema}

    particella_id = Column(Integer, ForeignKey('catasto_particelle.id'), primary_key=True)
    soggetto_id = Column(Integer, ForeignKey('catasto_soggetti.id'), primary_key=True)


class Planimetrie_SC(Base):
    __tablename__ = 'cf_planimetrie_schede'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())    
    identificativo_immobile = Column(String())
    protocollo_registrazione = Column(String())
    data_registrazione = Column(String())
    nome_file = Column(String())
    n_scheda = Column(Integer())
    formato_scheda = Column(Integer())
    scala_scheda = Column(Integer())

class Planimetrie_DM(Base):
    __tablename__ = 'cf_planimetrie_poligoni'
    __table_args__ = {'schema' : schema}

    gid = Column(Integer, primary_key=True)
    codice_ammvo = Column(String())
    sezione = Column(String())    
    identificativo_immobile = Column(String())
    protocollo_registrazione = Column(String())
    data_registrazione = Column(String())
    progressivo_poligono = Column(Integer())
    superficie_poligono = Column(Integer())
    ambiente_poligono = Column(String())
    altezza = Column(Integer())
    altezza_max = Column(Integer())


def upload_censuario(dns, censuario):
    Base.metadata.bind = dns
    #Base.metadata.bind = "('%s', client_encoding='utf8')" % dns

    #CENSUARIO e' un dizionario-array che contiene TUTTO il contenuto dei file TER, FAB, SOG e TIT, e viene creato all'interno di "censuario.py" e poi passato qui da "apps.py", dalla funzione "main_censuario.py"
    #La variabile "censuario" e' corretta, bisogna per cui capire perche' qui il codice non riesce a caricarla correttamente sul DB e da un errore di "Unicode type received non-unicode bind param value"
    CODICE_COMUNE = censuario['CODICE_COMUNE']

############################# INIZIO ANALISI FILE .FAB ###############################
    #Proviamo a creare DA ZERO uno script per inserire i fabbricati nel DB:
    #TEST: ricordarsi poi di creare una tavola per ogni TIPO_RECORD e richiamarla adeguatamente. Nella mia modifica degli script l'identificativo del'immmobile nel dizionario "censuario" e' seguita da un pedice che identifica il tipo_record, cosi: <id_immobile>_<tipo-record>
    #TEST: per completare la tabella del TIPO_RECORD=1 segui questo esempio:
    #'1843864_1':{'CATEGORIA': 'A05', 'CONSISTENZA': '3', 'ZONA': '', 'TIPO_RECORD': '1', 'CLASSE': '01', 'PROGRESSIVO': '1', 'IDENTIFICATIVO_IMMOBILE': '1843864', 'RENDITA': '89,86', 'SUPERFICIE': ''}, 
    unita_immobiliari_table = Unita_imm.__table__
    identificativi_table = Identificativi.__table__
    indirizzi_table = Indirizzi.__table__
    utilita_comuni_table = Ut_Comuni.__table__
    riserve_table = Riserve.__table__
    #print "FABbricATI: %s" % censuario['FABBRICATI']
    for identificativo_immobile, immobile in censuario['FABBRICATI'].items():
        if int(immobile['tipo_record']) == 1:
            imm = unita_immobiliari_table.select().where(
                unita_immobiliari_table.c.codice_ammvo==immobile['codice_ammvo']
            ).where(
                unita_immobiliari_table.c.sezione==immobile['sezione']
            ).where(
                unita_immobiliari_table.c.identificativo_immobile==immobile['identificativo_immobile']
            ).where(
                unita_immobiliari_table.c.tipo_immobile==immobile['tipo_immobile']
            ).where(
                unita_immobiliari_table.c.progressivo==immobile['progressivo']
            ).where(
                unita_immobiliari_table.c.tipo_record==immobile['tipo_record']
            ).execute().fetchall()
            if len(imm) >= 1:
                print 'duplicate UNITA_IMM! ', identificativo_immobile
            else:
                result = unita_immobiliari_table.insert().values(**immobile).execute()
                print "OK! inserito UNITA_IMM ", identificativo_immobile
    #OK!!!!
        elif int(immobile['tipo_record']) == 2:
            imm = identificativi_table.select().where(
                identificativi_table.c.codice_ammvo==immobile['codice_ammvo']
            ).where(
                identificativi_table.c.sezione==immobile['sezione']
            ).where(
                identificativi_table.c.identificativo_immobile==immobile['identificativo_immobile']
            ).where(
                identificativi_table.c.tipo_immobile==immobile['tipo_immobile']
            ).where(
                identificativi_table.c.progressivo==immobile['progressivo']
            ).where(
                identificativi_table.c.tipo_record==immobile['tipo_record']
            ).where(
                identificativi_table.c.sezione_urbana==immobile['sezione_urbana']
            ).where(
                identificativi_table.c.foglio==immobile['foglio']
            ).where(
                identificativi_table.c.numero==immobile['numero']
            ).where(
                identificativi_table.c.denominatore==immobile['denominatore']
            ).where(
                identificativi_table.c.subalterno==immobile['subalterno']
            ).execute().fetchall()
            if len(imm) >= 1:
                print 'duplicate imm_identificativi! ', identificativo_immobile
            else:
                result = identificativi_table.insert().values(**immobile).execute()
                print "OK! inserito imm_identificativi ", identificativo_immobile
        #OK!!!!!!!
        elif int(immobile['tipo_record']) == 3:
            imm = indirizzi_table.select().where(
                indirizzi_table.c.codice_ammvo==immobile['codice_ammvo']
            ).where(
                indirizzi_table.c.sezione==immobile['sezione']
            ).where(
                indirizzi_table.c.identificativo_immobile==immobile['identificativo_immobile']
            ).where(
                indirizzi_table.c.tipo_immobile==immobile['tipo_immobile']
            ).where(
                indirizzi_table.c.progressivo==immobile['progressivo']
            ).where(
                indirizzi_table.c.tipo_record==immobile['tipo_record']
            ).where(
                indirizzi_table.c.toponimo==immobile['toponimo']
            ).where(
                indirizzi_table.c.indirizzo==immobile['indirizzo']
            ).where(
                indirizzi_table.c.civico1==immobile['civico1']
            ).where(
                indirizzi_table.c.civico2==immobile['civico2']
            ).where(
                indirizzi_table.c.civico2==immobile['civico2']
            ).where(
                indirizzi_table.c.codice_strada==immobile['codice_strada']
            ).execute().fetchall()
            if len(imm) >= 1:
                print 'duplicate imm_indirizzi! ', identificativo_immobile
            else:
                result = indirizzi_table.insert().values(**immobile).execute()
                print "OK! inserito imm_indirizzi ", identificativo_immobile
        #OK!!!!!!
        elif int(immobile['tipo_record']) == 4:
            imm = utilita_comuni_table.select().where(
                utilita_comuni_table.c.codice_ammvo==immobile['codice_ammvo']
            ).where(
                utilita_comuni_table.c.sezione==immobile['sezione']
            ).where(
                utilita_comuni_table.c.identificativo_immobile==immobile['identificativo_immobile']
            ).where(
                utilita_comuni_table.c.tipo_immobile==immobile['tipo_immobile']
            ).where(
                utilita_comuni_table.c.progressivo==immobile['progressivo']
            ).where(
                utilita_comuni_table.c.tipo_record==immobile['tipo_record']
            ).where(
                utilita_comuni_table.c.sezione_urbana==immobile['sezione_urbana']
            ).where(
                utilita_comuni_table.c.foglio==immobile['foglio']
            ).where(
                utilita_comuni_table.c.numero==immobile['numero']
            ).where(
                utilita_comuni_table.c.denominatore==immobile['denominatore']
            ).where(
                utilita_comuni_table.c.subalterno==immobile['subalterno']
            ).execute().fetchall()
            if len(imm) >= 1:
                print 'duplicate imm_utilita_comuni! ', identificativo_immobile
            else:
                result = utilita_comuni_table.insert().values(**immobile).execute()
                print "OK! inserito imm_utilita_comuni ", identificativo_immobile
        #OK!!!!!!!
        elif int(immobile['tipo_record']) == 5:
            imm = riserve_table.select().where(
                riserve_table.c.codice_ammvo==immobile['codice_ammvo']
            ).where(
                riserve_table.c.sezione==immobile['sezione']
            ).where(
                riserve_table.c.identificativo_immobile==immobile['identificativo_immobile']
            ).where(
                riserve_table.c.tipo_immobile==immobile['tipo_immobile']
            ).where(
                riserve_table.c.progressivo==immobile['progressivo']
            ).where(
                riserve_table.c.tipo_record==immobile['tipo_record']
            ).where(
                riserve_table.c.codice_riserva==immobile['codice_riserva']
            ).where(
                riserve_table.c.partita_iscrizione_riserva==immobile['partita_iscrizione_riserva']
            ).execute().fetchall()
            if len(imm) >= 1:
                print 'duplicate imm_riserve! ', identificativo_immobile
            else:
                result = riserve_table.insert().values(**immobile).execute()
                print "OK! inserito imm_riserve ", identificativo_immobile
        #OK!!!!!!!

############################# FINE ANALISI FILE .FAB ###############################


############################# INIZIO ANALISI FILE .TER ###############################
    terreni_table = Terreni.__table__
    deduzioni_table = Deduzioni.__table__
    riserve_table = CT_Riserve.__table__
    porzioni_table = Porzioni.__table__
    
    for identificativo_immobile, terreno in censuario['TERRENI'].items():
        if int(terreno['tipo_record']) == 1:
            ter = terreni_table.select().where(
                terreni_table.c.codice_ammvo==terreno['codice_ammvo']
            ).where(
                terreni_table.c.sezione==terreno['sezione']
            ).where(
                terreni_table.c.identificativo_immobile==terreno['identificativo_immobile']
            ).where(
                terreni_table.c.tipo_immobile==terreno['tipo_immobile']
            ).where(
                terreni_table.c.progressivo==terreno['progressivo']
            ).where(
                terreni_table.c.tipo_record==terreno['tipo_record']
            ).execute().fetchall()
            if len(ter) >= 1:
                print 'duplicate TER! ', identificativo_immobile
            else:
                result = terreni_table.insert().values(**terreno).execute()
                print "OK! inserito TER ", identificativo_immobile
    #OK!!!!
        elif int(terreno['tipo_record']) == 2:
            ter = deduzioni_table.select().where(
                deduzioni_table.c.codice_ammvo==terreno['codice_ammvo']
            ).where(
                deduzioni_table.c.sezione==terreno['sezione']
            ).where(
                deduzioni_table.c.identificativo_immobile==terreno['identificativo_immobile']
            ).where(
                deduzioni_table.c.tipo_immobile==terreno['tipo_immobile']
            ).where(
                deduzioni_table.c.progressivo==terreno['progressivo']
            ).where(
                deduzioni_table.c.tipo_record==terreno['tipo_record']
            ).where(
                deduzioni_table.c.simbolo_deduzione==terreno['simbolo_deduzione']
            ).execute().fetchall()
            if len(ter) >= 1:
                print 'duplicate ter_deduzioni! ', identificativo_immobile
            else:
                result = deduzioni_table.insert().values(**terreno).execute()
                print "OK! inserito ter_deduzioni ", identificativo_immobile
    #OK!!!!!!!
        elif int(terreno['tipo_record']) == 3:
            ter = riserve_table.select().where(
                riserve_table.c.codice_ammvo==terreno['codice_ammvo']
            ).where(
                riserve_table.c.sezione==terreno['sezione']
            ).where(
                riserve_table.c.identificativo_immobile==terreno['identificativo_immobile']
            ).where(
                riserve_table.c.tipo_immobile==terreno['tipo_immobile']
            ).where(
                riserve_table.c.progressivo==terreno['progressivo']
            ).where(
                riserve_table.c.tipo_record==terreno['tipo_record']
            ).where(
                riserve_table.c.codice_riserva==terreno['codice_riserva']
            ).where(
                riserve_table.c.partita_iscrizione_riserva==terreno['partita_iscrizione_riserva']
            ).execute().fetchall()
            if len(ter) >= 1:
                print 'duplicate ter_riserve! ', identificativo_immobile
            else:
                result = riserve_table.insert().values(**terreno).execute()
                print "OK! inserito ter_riserve ", identificativo_immobile
    #OK!!!!!!!
        elif int(terreno['tipo_record']) == 4:
            ter = porzioni_table.select().where(
                porzioni_table.c.codice_ammvo==terreno['codice_ammvo']
            ).where(
                porzioni_table.c.sezione==terreno['sezione']
            ).where(
                porzioni_table.c.identificativo_immobile==terreno['identificativo_immobile']
            ).where(
                porzioni_table.c.tipo_immobile==terreno['tipo_immobile']
            ).where(
                porzioni_table.c.progressivo==terreno['progressivo']
            ).where(
                porzioni_table.c.tipo_record==terreno['tipo_record']
            ).where(
                porzioni_table.c.identificativo_porzione==terreno['identificativo_porzione']
            ).execute().fetchall()
            if len(ter) >= 1:
                print 'duplicate ter_porzione! ', identificativo_immobile
            else:
                result = porzioni_table.insert().values(**terreno).execute()
                print "OK! inserito ter_porzione ", identificativo_immobile
    #OK!!!!!!!

############################# FINE ANALISI FILE .TER ###############################


############################# INIZIO ANALISI FILE .SOG ###############################
    soggetti_table = Soggetto.__table__

    for soggetto_id, soggetto in censuario['SOGGETTI'].items():
        IDENTIFICATIVO_SOGGETTO, TIPO_SOGGETTO = soggetto_id
        #if TIPO_SOGGETTO not in ['G']:
        #    continue
        #print soggetto
        #print "soggetto_id: ", soggetto_id, "; ID_SGGETTO: ", IDENTIFICATIVO_SOGGETTO
        sogg = soggetti_table.select().where(
            soggetti_table.c.codice_ammvo==soggetto['codice_ammvo']
        ).where(
            soggetti_table.c.sezione==soggetto['sezione']
        ).where(
            soggetti_table.c.identificativo_soggetto==IDENTIFICATIVO_SOGGETTO
        ).where(
            soggetti_table.c.tipo_soggetto==TIPO_SOGGETTO
        ).execute().fetchall()
        if len(sogg) >= 1:
            print 'duplicate SOGG! ', IDENTIFICATIVO_SOGGETTO
        #elif len(sogg) == 1:
        #    print 'update', sogg[0].IDENTIFICATIVO_SOGGETTO, IDENTIFICATIVO_SOGGETTO
        #    sogg_id = sogg[0].id
        #    soggetti_table.update().where(soggetti_table.c.id==sogg_id).values(**soggetto).execute()
        else:
            result = soggetti_table.insert().values(**soggetto).execute()
            print 'OK! inserito SOGG ', IDENTIFICATIVO_SOGGETTO
            #sogg_id = result.last_inserted_ids()[0]

        #print sogg_id

############################# FINE ANALISI FILE .SOG ###############################


############################# INIZIO ANALISI FILE .TIT ###############################
    titolarita_table = Titolarita.__table__

    for soggetto_id, soggetto in censuario['TITOLARITA'].items():
        #if TIPO_SOGGETTO not in ['G']:
        #    continue
        #print soggetto
        #print "soggetto_id: ", soggetto_id, "; ID_SGGETTO: ", IDENTIFICATIVO_SOGGETTO
        tit = titolarita_table.select().where(
            titolarita_table.c.codice_ammvo==soggetto['codice_ammvo']
        ).where(
            titolarita_table.c.sezione==soggetto['sezione']
        ).where(
            titolarita_table.c.identificativo_soggetto==soggetto['identificativo_soggetto']
        ).where(
            titolarita_table.c.tipo_soggetto==soggetto['tipo_soggetto']
        ).where(
            titolarita_table.c.identificativo_immobile==soggetto['identificativo_immobile']
        ).where(
            titolarita_table.c.tipo_immobile==soggetto['tipo_immobile']
        ).where(
            titolarita_table.c.identificativo_titolarita==soggetto['identificativo_titolarita']
        ).execute().fetchall()
        if len(tit) >= 1:
            print 'duplicate TIT! ', soggetto['identificativo_soggetto'], '-', soggetto['identificativo_immobile']
        #elif len(tit) == 1:
        #    print 'update', tit[0].IDENTIFICATIVO_SOGGETTO, IDENTIFICATIVO_SOGGETTO
        #    sogg_id = tit[0].id
        #    titolarita_table.update().where(titolarita_table.c.id==sogg_id).values(**soggetto).execute()
        else:
            result = titolarita_table.insert().values(**soggetto).execute()
            print 'OK! inserito TIT ', soggetto['identificativo_soggetto'], '-', soggetto['identificativo_immobile']
            #sogg_id = result.last_inserted_ids()[0]

        #print sogg_id

############################# FINE ANALISI FILE .TIT ###############################


############################# INIZIO ANALISI FILE SC.DAT PLANIMETRIE ###############################
    planimetrie_sc_table = Planimetrie_SC.__table__

    for soggetto_id, soggetto in censuario['PLANIMETRIE_SC'].items():
        #if TIPO_SOGGETTO not in ['G']:
        #    continue
        #print soggetto
        #print "soggetto_id: ", soggetto_id, "; ID_SGGETTO: ", IDENTIFICATIVO_SOGGETTO
        tit = planimetrie_sc_table.select().where(
            planimetrie_sc_table.c.identificativo_immobile==soggetto['identificativo_immobile']
        ).where(
            planimetrie_sc_table.c.nome_file==soggetto['nome_file']
        ).where(
            planimetrie_sc_table.c.n_scheda==soggetto['n_scheda']
        ).execute().fetchall()
        if len(tit) >= 1:
            print 'duplicate SC.DAT! ', soggetto['identificativo_immobile'], '-', soggetto['nome_file'], '-', soggetto['n_scheda']
        #elif len(tit) == 1:
        #    print 'update', tit[0].IDENTIFICATIVO_SOGGETTO, IDENTIFICATIVO_SOGGETTO
        #    sogg_id = tit[0].id
        #    titolarita_table.update().where(titolarita_table.c.id==sogg_id).values(**soggetto).execute()
        else:
            result = planimetrie_sc_table.insert().values(**soggetto).execute()
            print 'OK! inserito SC.DAT ', soggetto['identificativo_immobile'], '-', soggetto['nome_file'], '-', soggetto['n_scheda']
            #sogg_id = result.last_inserted_ids()[0]

        #print sogg_id

############################# FINE ANALISI FILE SC.DAT ###############################


############################# INIZIO ANALISI FILE DM.DAT PLANIMETRIE ###############################
    planimetrie_dm_table = Planimetrie_DM.__table__

    for soggetto_id, soggetto in censuario['PLANIMETRIE_DM'].items():
        #if TIPO_SOGGETTO not in ['G']:
        #    continue
        #print soggetto
        #print "soggetto_id: ", soggetto_id, "; ID_SGGETTO: ", IDENTIFICATIVO_SOGGETTO
        tit = planimetrie_dm_table.select().where(
            planimetrie_dm_table.c.identificativo_immobile==soggetto['identificativo_immobile']
        ).where(
            planimetrie_dm_table.c.progressivo_poligono==soggetto['progressivo_poligono']
        ).execute().fetchall()
        if len(tit) >= 1:
            print 'duplicate DM.DAT! ', soggetto['identificativo_immobile'], '-', soggetto['progressivo_poligono']
        #elif len(tit) == 1:
        #    print 'update', tit[0].IDENTIFICATIVO_SOGGETTO, IDENTIFICATIVO_SOGGETTO
        #    sogg_id = tit[0].id
        #    titolarita_table.update().where(titolarita_table.c.id==sogg_id).values(**soggetto).execute()
        else:
            result = planimetrie_dm_table.insert().values(**soggetto).execute()
            print 'OK! inserito DM.DAT ', soggetto['identificativo_immobile'], '-', soggetto['progressivo_poligono']
            #sogg_id = result.last_inserted_ids()[0]

        #print sogg_id

############################# FINE ANALISI FILE DM.DAT ###############################



############################# PARTE DI CODICE "ORIGINALE" SUI DATI TER e TIT ###############################

    particelle_table = Particella.__table__

    #print "TERRENI: %s" % censuario['TERRENI']
    #non so perche' richiami questa variabile "TERRENI" visto che non e' mai stata riempita...

    for identificativo_immobile, terreno in censuario['TERRENI'].items():
        #print terreno
        #part = particelle_table.select().where(
        #    particelle_table.c.comune==CODICE_COMUNE
        #).where(
        #    particelle_table.c.foglio=='%s_%s00' % (CODICE_COMUNE, ('000' + terreno['FOGLIO'])[-4:])
        #).where(
        #    particelle_table.c.particella==terreno['NUMERO'].lstrip('0')
        #).execute().fetchall()
        part = '' #aggiungo io per evitare errore Unicode
        if len(part) > 1:
            print 'duplicate part!'
        elif len(part) == 1:
            #print 'update', terreno
            part_id = part[0].id
            #particelle_table.update().where(particelle_table.c.id==part_id).values(**terreno).execute()
        else:
            continue
            #print 'missing', terreno
            #Queste 2 righe sono originariamente commentate nel codice e penso servano per inserire il nuovo terreno nel db:
            #result = particelle_table.insert().values(**terreno).execute()
            #part_id = result.last_inserted_ids()[0]


    subalterni_table = Subalterno.__table__

    #print "FABBRICATI_TERRENI: %s" % censuario['FABBRICATI_TERRENI']
    #restituisce una cosa del tipo: {('', '0001', '00002'): ['1843863', '1843864', '1843865']}

    for terreno, subalterni in censuario['FABBRICATI_TERRENI'].items():
        #part = particelle_table.select().where(
        #    particelle_table.c.comune==CODICE_COMUNE
        #).where(
        #    particelle_table.c.foglio=='%s_%s00' % (CODICE_COMUNE, terreno[1])
        #).where(
        #    particelle_table.c.particella==terreno[2].lstrip('0')
        #).execute().fetchall()
        part = '' #aggiungo io per evitare errore Unicode
        if len(part) > 1:
            print 'duplicate part!'
        elif len(part) == 1:
            #print 'update', terreno
            part_id = part[0].id
            for identificativo_immobile in subalterni:
                subalterno = censuario['FABBRICATI'][identificativo_immobile]
                sub = subalterni_table.select().where(
                    subalterni_table.c.particella_id==part_id
                ).where(
                    subalterni_table.c.SUBALTERNO==subalterno['SUBALTERNO']
                ).execute().fetchall()
                if len(sub) > 1:
                    print 'duplicate sub!'
                elif len(sub) == 1:
                    sub_id = sub[0].id
                    #subalterni_table.update().where(subalterni_table.c.id==sub_id).values(**subalterno).execute()
                else:
                    continue
                    #print 'insert', identificativo_immobile, subalterno
                    #subalterni_table.insert().values(particella_id=part_id, **subalterno).execute()
        else:
            pass #
            #Queste 3 righe sono originariamente commentate ma penso servano ad inserire la nuova particella:
            #print 'missing', terreno, '%s_%s00' % (CODICE_COMUNE, terreno[1]), terreno[2].lstrip('0')
            #result = particelle_table.insert().values(**terreno).execute()
            #part_id = result.last_inserted_ids()[0]

    return





    particella_table = Particella.__table__

        # for tit in censuario['TITOLARITA']:
        #     T_IDENTIFICATIVO_SOGGETTO, T_TIPO_SOGGETTO, IDENTIFICATIVO_IMMOBILE, TIPO_IMMOBILE = tit
        #     if (T_IDENTIFICATIVO_SOGGETTO, T_TIPO_SOGGETTO) != (IDENTIFICATIVO_SOGGETTO, TIPO_SOGGETTO):
        #         continue
            
        #     if TIPO_IMMOBILE == 'T':
        #         immobile = censuario['TERRENI'][IDENTIFICATIVO_IMMOBILE]
        #     elif TIPO_IMMOBILE == 'F':
        #         immobile = censuario['FABBRICATI'][IDENTIFICATIVO_IMMOBILE]

        #     part = particella_table.select().where(
        #         particella_table.c.comune==CODICE_COMUNE
        #     ).where(
        #         particella_table.c.foglio=='%s_%s00' % (CODICE_COMUNE, ('000' + terreno['FOGLIO'])[-4:])
        #     ).where(
        #         particella_table.c.particella==terreno['NUMERO'].lstrip('0')
        #     ).execute().fetchall()
        #     if len(part) > 1:
        #         print 'duplicate terreno!'
        #     elif len(part) == 1:
        #         Titolarita_MM.__table__.delete().where(Titolarita_MM.__table__.c.soggetto_id==sogg_id).where(Titolarita_MM.__table__.c.particella_id==part[0].id).execute()
        #         Titolarita_MM.__table__.insert().values(soggetto_id=sogg_id, particella_id=part[0].id).execute()
        #     else:
        #         print 'missing!', terreno
