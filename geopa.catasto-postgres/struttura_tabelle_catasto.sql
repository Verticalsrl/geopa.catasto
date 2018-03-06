-- Creazione struttura per il CATASTO
BEGIN;

--Inizio con lo schema PUBLIC - tavole PADRE
CREATE TABLE cat_cf_identificativi
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  progressivo smallint,
  tipo_record smallint,
  sezione_urbana character varying(3),
  foglio character varying(4),
  numero character varying(5),
  denominatore character varying(4),
  subalterno character varying(4),
  edificialita character varying(1),
  gid integer NOT NULL,
  id_particella character varying(25),
  CONSTRAINT cat_cf_identificativi_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cat_cf_identificativi
  OWNER TO postgres;
COMMENT ON TABLE cat_cf_identificativi
  IS 'tavola padre che eredita i dati da catasto.cf_identificativi';

CREATE TABLE cat_cf_immobili
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  progressivo smallint,
  tipo_record smallint,
  zona character varying(3),
  categoria character varying(5),
  classe character varying(2),
  consistenza integer,
  superficie double precision,
  rendita_lire double precision,
  rendita_euro double precision,
  lotto character varying(2),
  edificio character varying(2),
  scala character varying(2),
  interno1 character varying(3),
  interno2 character varying(3),
  piano1 character varying(4),
  piano2 character varying(4),
  piano3 character varying(4),
  piano4 character varying(4),
  data_di_efficacia00 date,
  data_di_registrazione00 date,
  tipo_nota00 character varying(1),
  numero_nota00 character varying(6),
  progressivo_nota00 character varying(3),
  anno_nota00 character varying(4),
  data_di_efficacia99 date,
  data_di_registrazione99 date,
  tipo_nota99 character varying(1),
  numero_nota99 character varying(6),
  progressivo_nota99 character varying(3),
  anno_nota99 character varying(4),
  partita character varying(7),
  annotazione character varying(200),
  identificativo_mutazione_iniziale character varying(9),
  identificativo_mutazione_finale character varying(9),
  protocollo_notifica character varying(18),
  data_notifica date,
  codice_causale_atto_generante character varying(3),
  descrizione_atto_generante character varying(100),
  codice_causale_atto_conclusivo character varying(3),
  descrizione_atto_conclusivo character varying(100),
  flag_classamento character varying(1),
  gid integer NOT NULL,
  CONSTRAINT cat_cf_immobili_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cat_cf_immobili
  OWNER TO postgres;
COMMENT ON TABLE cat_cf_immobili
  IS 'tavola padre che eredita i dati da catasto.cf_immobili';


CREATE TABLE cat_ct_terreni
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  progressivo smallint,
  tipo_record smallint,
  foglio character varying(5),
  numero character varying(5),
  denominatore character varying(4),
  subalterno character varying(4),
  edificialita character varying(1),
  qualita character varying(3),
  classe character varying(2),
  ettari double precision,
  are double precision,
  centiare double precision,
  flag_reddito character varying(1),
  flag_porzione character varying(1),
  flag_deduzioni character varying(1),
  reddito_dominicale_lire double precision,
  reddito_agrario_lire double precision,
  reddito_dominicale_euro double precision,
  reddito_agrario_euro double precision,
  data_di_efficacia00 date,
  data_di_registrazione00 date,
  tipo_nota00 character varying(1),
  numero_nota00 character varying(6),
  progressivo_nota00 character varying(3),
  anno_nota00 character varying(4),
  data_di_efficacia99 date,
  data_di_registrazione99 date,
  tipo_nota99 character varying(1),
  numero_nota99 character varying(6),
  progressivo_nota99 character varying(3),
  anno_nota99 character varying(4),
  partita character varying(7),
  annotazione character varying(200),
  identificativo_mutazione_iniziale character varying(9),
  identificativo_mutazione_finale character varying(9),
  codice_causale_atto_generante character varying(3),
  descrizione_atto_generante character varying(100),
  codice_causale_atto_conclusivo character varying(3),
  descrizione_atto_conclusivo character varying(100),
  gid integer NOT NULL,
  id_particella character varying(25) NOT NULL,
  CONSTRAINT cat_ct_terreni_pkey PRIMARY KEY (id_particella)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cat_ct_terreni
  OWNER TO postgres;
COMMENT ON TABLE cat_ct_terreni
  IS 'tavola padre che eredita i dati da catasto.ct_terreni';


CREATE TABLE cat_cu_soggetti
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_soggetto character varying(9),
  tipo_soggetto character varying(1),
  cognome character varying(64),
  nome character varying(64),
  sesso character varying(1),
  data_di_nascita date,
  luogo_di_nascita character varying(4),
  codice_fiscale character varying(16),
  info_suppl character varying(125),
  denominazione character varying(150),
  sede character varying(4),
  gid integer NOT NULL,
  CONSTRAINT cat_cu_soggetti_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cat_cu_soggetti
  OWNER TO postgres;
COMMENT ON TABLE cat_cu_soggetti
  IS 'tavola padre che eredita i dati da catasto.cu_soggetti';

CREATE TABLE cat_cu_titolarita
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_soggetto character varying(9),
  tipo_soggetto character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  codice_diritto character varying(3),
  titolo_non_codificato character varying(200),
  quota_numeratore character varying(9),
  quota_denominatore character varying(9),
  regime character varying(1),
  soggetto_di_riferimento character varying(9),
  data_di_validita00 date,
  tipo_nota00 character varying(1),
  numero_nota00 character varying(6),
  progressivo_nota00 character varying(3),
  anno_nota00 character varying(4),
  data_registrazione_atti00 date,
  partita character varying(7),
  data_di_validita99 date,
  tipo_nota99 character varying(1),
  numero_nota99 character varying(6),
  progressivo_nota99 character varying(3),
  anno_nota99 character varying(4),
  data_registrazione_atti99 date,
  identificativo_mutazione_iniziale character varying(9),
  identificativo_mutazione_finale character varying(9),
  identificativo_titolarita character varying(9),
  codice_causale_atto_generante character varying(3),
  descrizione_atto_generante character varying(100),
  codice_causale_atto_conclusivo character varying(3),
  descrizione_atto_conclusivo character varying(100),
  gid integer NOT NULL,
  CONSTRAINT cat_cu_titolarita_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cat_cu_titolarita
  OWNER TO postgres;
COMMENT ON TABLE cat_cu_titolarita
  IS 'tavola padre che eredita i dati da catasto.cu_titolarita';



-- Poi la struttura dello schema CATASTO:

-- Table: catasto.catasto_bordi

-- DROP TABLE catasto.catasto_bordi;

CREATE TABLE catasto.catasto_bordi
(
  ogc_fid integer,
  wkb_geometry geometry(PolygonZ,4326),
  comune character varying(4),
  foglio character varying(11),
  tipo character varying(11),
  particella character varying(8),
  dimensione integer,
  angolo double precision,
  posizionex double precision,
  posizioney double precision,
  p_internox double precision,
  p_internoy double precision,
  area integer,
  etichetta character varying(32),
  gid serial NOT NULL,
  CONSTRAINT catasto_bordi_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.catasto_bordi
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.catasto_bordi TO postgres;
GRANT SELECT ON TABLE catasto.catasto_bordi TO maphosting;

CREATE INDEX catasto_bordi_gist
  ON catasto.catasto_bordi
  USING gist
  (wkb_geometry);


CREATE TABLE catasto.catasto_fiduciali
(
  ogc_fid integer,
  wkb_geometry geometry(Point,4326),
  comune character varying(4),
  foglio character varying(11),
  numero character varying,
  simbolo integer,
  posizionex double precision,
  posizioney double precision,
  etichetta character varying(32),
  gid serial,
  CONSTRAINT catasto_fiduciali_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.catasto_fiduciali
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.catasto_fiduciali TO postgres;
GRANT SELECT ON TABLE catasto.catasto_fiduciali TO maphosting;


CREATE INDEX catasto_fiduciali_gist
  ON catasto.catasto_fiduciali
  USING gist
  (wkb_geometry);

CREATE TABLE catasto.catasto_linee
(
  ogc_fid integer,
  wkb_geometry geometry(LinestringZ, 4326),
  comune character varying(4),
  foglio character varying(11),
  simbolo integer,
  gid serial,
  CONSTRAINT catasto_linee_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.catasto_linee
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.catasto_linee TO postgres;
GRANT SELECT ON TABLE catasto.catasto_linee TO maphosting;


CREATE INDEX catasto_linee_gist
  ON catasto.catasto_linee
  USING gist
  (wkb_geometry);

CREATE TABLE catasto.catasto_simboli
(
  ogc_fid integer,
  wkb_geometry geometry(Point, 4326),
  comune character varying(4),
  foglio character varying(11),
  simbolo integer,
  angolo double precision,
  gid serial,
  CONSTRAINT catasto_simboli_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.catasto_simboli
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.catasto_simboli TO postgres;
GRANT SELECT ON TABLE catasto.catasto_simboli TO maphosting;



CREATE INDEX catasto_simboli_gist
  ON catasto.catasto_simboli
  USING gist
  (wkb_geometry);

  CREATE TABLE catasto.catasto_testi
(
  ogc_fid integer,
  wkb_geometry geometry(Point, 4326),
  comune character varying(4),
  foglio character varying(11),
  testo character varying(256),
  dimensione integer,
  angolo double precision,
  etichetta character varying(32),
  gid serial,
  CONSTRAINT catasto_testi_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.catasto_testi
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.catasto_testi TO postgres;
GRANT SELECT ON TABLE catasto.catasto_testi TO maphosting;


CREATE INDEX catasto_testi_gist
  ON catasto.catasto_testi
  USING gist
  (wkb_geometry);

CREATE TABLE catasto.cf_identificativi
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  progressivo smallint,
  tipo_record smallint,
  sezione_urbana character varying(3),
  foglio character varying(4),
  numero character varying(5),
  denominatore character varying(4),
  subalterno character varying(4),
  edificialita character varying(1),
  gid serial NOT NULL,
  id_particella character varying(25),
  CONSTRAINT cf_identificativi_pkey PRIMARY KEY (gid),
  CONSTRAINT cf_identificativi_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_immobile, tipo_immobile, progressivo, tipo_record, sezione_urbana, foglio, numero, denominatore, subalterno)
)
INHERITS (cat_cf_identificativi)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.cf_identificativi
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.cf_identificativi TO postgres;
GRANT SELECT ON TABLE catasto.cf_identificativi TO maphosting;
COMMENT ON TABLE catasto.cf_identificativi
  IS 'creata per importare i file FAB su DB usando lo script db.py del geopa.catasto. Struttura ripresa dalle specifiche sui file FAB. Tavola per "tipo_record"=2';


CREATE TABLE catasto.cf_immobili
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  progressivo smallint,
  tipo_record smallint,
  zona character varying(3),
  categoria character varying(5),
  classe character varying(2),
  consistenza integer,
  superficie double precision,
  rendita_lire double precision,
  rendita_euro double precision,
  lotto character varying(2),
  edificio character varying(2),
  scala character varying(2),
  interno1 character varying(3),
  interno2 character varying(3),
  piano1 character varying(4),
  piano2 character varying(4),
  piano3 character varying(4),
  piano4 character varying(4),
  data_di_efficacia00 date,
  data_di_registrazione00 date,
  tipo_nota00 character varying(1),
  numero_nota00 character varying(6),
  progressivo_nota00 character varying(3),
  anno_nota00 character varying(4),
  data_di_efficacia99 date,
  data_di_registrazione99 date,
  tipo_nota99 character varying(1),
  numero_nota99 character varying(6),
  progressivo_nota99 character varying(3),
  anno_nota99 character varying(4),
  partita character varying(7),
  annotazione character varying(200),
  identificativo_mutazione_iniziale character varying(9),
  identificativo_mutazione_finale character varying(9),
  protocollo_notifica character varying(18),
  data_notifica date,
  codice_causale_atto_generante character varying(3),
  descrizione_atto_generante character varying(100),
  codice_causale_atto_conclusivo character varying(3),
  descrizione_atto_conclusivo character varying(100),
  flag_classamento character varying(1),
  gid serial NOT NULL,
  CONSTRAINT cf_immobili_pkey PRIMARY KEY (gid),
  CONSTRAINT cf_immobili_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_immobile, tipo_immobile, progressivo, tipo_record)
)
INHERITS (cat_cf_immobili)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.cf_immobili
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.cf_immobili TO postgres;
GRANT SELECT ON TABLE catasto.cf_immobili TO maphosting;
COMMENT ON TABLE catasto.cf_immobili
  IS 'creata per importare i file FAB su DB usando lo script db.py del geopa.catasto. Struttura ripresa dalle specifiche sui file FAB. Tavola per "tipo_record"=1';


CREATE TABLE catasto.cf_indirizzi
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  progressivo smallint,
  tipo_record smallint,
  toponimo integer,
  indirizzo character varying(64),
  civico1 character varying(6),
  civico2 character varying(6),
  civico3 character varying(6),
  codice_strada character varying(5),
  gid serial NOT NULL,
  CONSTRAINT cf_indirizzi_pkey PRIMARY KEY (gid),
  CONSTRAINT cf_indirizzi_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_immobile, tipo_immobile, progressivo, tipo_record, toponimo, indirizzo, civico1, civico2, civico3, codice_strada)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.cf_indirizzi
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.cf_indirizzi TO postgres;
GRANT SELECT ON TABLE catasto.cf_indirizzi TO maphosting;
COMMENT ON TABLE catasto.cf_indirizzi
  IS 'creata per importare i file FAB su DB usando lo script db.py del geopa.catasto. Struttura ripresa dalle specifiche sui file FAB. Tavola per "tipo_record"=3';

CREATE TABLE catasto.cf_planim_poly_storiche
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  orfano1 character varying(32),
  orfano2 character varying(32),
  orfano3 character varying(32),
  data_registrazione date,
  orfano4 character varying(32),
  protocollo_registrazione character varying(9),
  anno character varying(4),
  categoria character varying(5),
  orfano5 character varying(32),
  orfano6 character varying(32),
  formato_scheda smallint,
  scala_scheda smallint,
  gid serial,
  CONSTRAINT cf_planim_poly_vecchie_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.cf_planim_poly_storiche
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.cf_planim_poly_storiche TO postgres;
GRANT SELECT ON TABLE catasto.cf_planim_poly_storiche TO maphosting;
COMMENT ON TABLE catasto.cf_planim_poly_storiche
  IS 'tavola per recuperare le informazioni da file .dat senza istruzioni per la decodifica, da cui i campi "orfani"';

CREATE TABLE catasto.cf_planim_schede_storiche
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  orfano1 character varying(32),
  foglio character varying(5),
  numero character varying(5),
  denominatore character varying(4),
  subalterno character varying(4),
  nome_file character varying(32),
  gid serial,
  CONSTRAINT cf_planim_schede_vecchie_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.cf_planim_schede_storiche
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.cf_planim_schede_storiche TO postgres;
GRANT SELECT ON TABLE catasto.cf_planim_schede_storiche TO maphosting;
COMMENT ON TABLE catasto.cf_planim_schede_storiche
  IS 'tavola per recuperare le informazioni da file .dat senza istruzioni per la decodifica, da cui i campi "orfani"';

CREATE TABLE catasto.cf_planimetrie_poligoni
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  protocollo_registrazione character varying(9),
  data_registrazione date,
  progressivo_poligono smallint,
  superficie_poligono smallint,
  ambiente_poligono character varying(1),
  altezza smallint,
  altezza_max smallint,
  gid serial NOT NULL,
  CONSTRAINT cf_planimetrie_poligoni_pkey PRIMARY KEY (gid),
  CONSTRAINT cf_planimetrie_poligoni_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_immobile, progressivo_poligono)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.cf_planimetrie_poligoni
  OWNER TO postgres;
COMMENT ON TABLE catasto.cf_planimetrie_poligoni
  IS 'creata per importare i file DM.DAT, relativi alle planimetrie catastali, su DB usando lo script db.py del geopa.catasto';

CREATE TABLE catasto.cf_planimetrie_schede
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  protocollo_registrazione character varying(9),
  data_registrazione date,
  nome_file character varying(13),
  n_scheda smallint,
  formato_scheda smallint,
  scala_scheda smallint,
  gid serial NOT NULL,
  CONSTRAINT cf_planimetrie_schede_pkey PRIMARY KEY (gid),
  CONSTRAINT cf_planimetrie_schede_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_immobile, nome_file, n_scheda)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.cf_planimetrie_schede
  OWNER TO postgres;
COMMENT ON TABLE catasto.cf_planimetrie_schede
  IS 'creata per importare i file SC.DAT, relativi alle planimetrie catastali, su DB usando lo script db.py del geopa.catasto';

CREATE TABLE catasto.cf_riserve
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  progressivo smallint,
  tipo_record smallint,
  codice_riserva character varying(1),
  partita_iscrizione_riserva character varying(7),
  gid serial NOT NULL,
  CONSTRAINT cf_riserve_pkey PRIMARY KEY (gid),
  CONSTRAINT cf_riserve_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_immobile, tipo_immobile, progressivo, tipo_record, codice_riserva, partita_iscrizione_riserva)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.cf_riserve
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.cf_riserve TO postgres;
GRANT SELECT ON TABLE catasto.cf_riserve TO maphosting;
COMMENT ON TABLE catasto.cf_riserve
  IS 'creata per importare i file FAB su DB usando lo script db.py del geopa.catasto. Struttura ripresa dalle specifiche sui file FAB. Tavola per "tipo_record"=5';

CREATE TABLE catasto.cf_utilita_comuni
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  progressivo smallint,
  tipo_record smallint,
  sezione_urbana character varying(3),
  foglio character varying(4),
  numero character varying(5),
  denominatore character varying(4),
  subalterno character varying(4),
  gid serial NOT NULL,
  CONSTRAINT cf_utilita_comuni_pkey PRIMARY KEY (gid),
  CONSTRAINT cf_utilita_comuni_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_immobile, tipo_immobile, progressivo, tipo_record, sezione_urbana, foglio, numero, denominatore, subalterno)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.cf_utilita_comuni
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.cf_utilita_comuni TO postgres;
GRANT SELECT ON TABLE catasto.cf_utilita_comuni TO maphosting;
COMMENT ON TABLE catasto.cf_utilita_comuni
  IS 'creata per importare i file FAB su DB usando lo script db.py del geopa.catasto. Struttura ripresa dalle specifiche sui file FAB. Tavola per "tipo_record"=4';

CREATE TABLE catasto.ct_deduzioni
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  progressivo smallint,
  tipo_record smallint,
  simbolo_deduzione character varying(6),
  gid serial NOT NULL,
  CONSTRAINT ct_deduzioni_pkey PRIMARY KEY (gid),
  CONSTRAINT ct_deduzioni_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_immobile, tipo_immobile, progressivo, tipo_record, simbolo_deduzione)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.ct_deduzioni
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.ct_deduzioni TO postgres;
GRANT SELECT ON TABLE catasto.ct_deduzioni TO maphosting;
COMMENT ON TABLE catasto.ct_deduzioni
  IS 'creata per importare i file TER su DB usando lo script db.py del geopa.catasto. Struttura ripresa dalle specifiche sui file TER. Tavola per "tipo_record"=2';

CREATE TABLE catasto.ct_porzioni
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  progressivo smallint,
  tipo_record smallint,
  identificativo_porzione character varying(2),
  qualita character varying(3),
  classe character varying(2),
  ettari character varying(5),
  are character varying(2),
  centiare character varying(2),
  gid serial NOT NULL,
  CONSTRAINT ct_porzioni_pkey PRIMARY KEY (gid),
  CONSTRAINT ct_porzioni_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_immobile, tipo_immobile, progressivo, tipo_record, identificativo_porzione)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.ct_porzioni
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.ct_porzioni TO postgres;
GRANT SELECT ON TABLE catasto.ct_porzioni TO maphosting;
COMMENT ON TABLE catasto.ct_porzioni
  IS 'creata per importare i file TER su DB usando lo script db.py del geopa.catasto. Struttura ripresa dalle specifiche sui file TER. Tavola per "tipo_record"=4';

CREATE TABLE catasto.ct_riserve
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  progressivo smallint,
  tipo_record smallint,
  codice_riserva character varying(1),
  partita_iscrizione_riserva character varying(7),
  gid serial NOT NULL,
  CONSTRAINT ct_riserve_pkey PRIMARY KEY (gid),
  CONSTRAINT ct_riserve_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_immobile, tipo_immobile, progressivo, tipo_record, codice_riserva, partita_iscrizione_riserva)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.ct_riserve
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.ct_riserve TO postgres;
GRANT SELECT ON TABLE catasto.ct_riserve TO maphosting;
COMMENT ON TABLE catasto.ct_riserve
  IS 'creata per importare i file TER su DB usando lo script db.py del geopa.catasto. Struttura ripresa dalle specifiche sui file TER. Tavola per "tipo_record"=3';

CREATE TABLE catasto.ct_terreni
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  progressivo smallint,
  tipo_record smallint,
  foglio character varying(5),
  numero character varying(5),
  denominatore character varying(4),
  subalterno character varying(4),
  edificialita character varying(1),
  qualita character varying(3),
  classe character varying(2),
  ettari double precision,
  are double precision,
  centiare double precision,
  flag_reddito character varying(1),
  flag_porzione character varying(1),
  flag_deduzioni character varying(1),
  reddito_dominicale_lire double precision,
  reddito_agrario_lire double precision,
  reddito_dominicale_euro double precision,
  reddito_agrario_euro double precision,
  data_di_efficacia00 date,
  data_di_registrazione00 date,
  tipo_nota00 character varying(1),
  numero_nota00 character varying(6),
  progressivo_nota00 character varying(3),
  anno_nota00 character varying(4),
  data_di_efficacia99 date,
  data_di_registrazione99 date,
  tipo_nota99 character varying(1),
  numero_nota99 character varying(6),
  progressivo_nota99 character varying(3),
  anno_nota99 character varying(4),
  partita character varying(7),
  annotazione character varying(200),
  identificativo_mutazione_iniziale character varying(9),
  identificativo_mutazione_finale character varying(9),
  codice_causale_atto_generante character varying(3),
  descrizione_atto_generante character varying(100),
  codice_causale_atto_conclusivo character varying(3),
  descrizione_atto_conclusivo character varying(100),
  gid serial NOT NULL,
  id_particella character varying(25) NOT NULL,
  CONSTRAINT ct_terreni_pkey PRIMARY KEY (gid),
  CONSTRAINT ct_terreni_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_immobile, tipo_immobile, progressivo, tipo_record)
)
INHERITS (cat_ct_terreni)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.ct_terreni
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.ct_terreni TO postgres;
GRANT SELECT ON TABLE catasto.ct_terreni TO maphosting;
COMMENT ON TABLE catasto.ct_terreni
  IS 'creata per importare i file TER su DB usando lo script db.py del geopa.catasto. Struttura ripresa dalle specifiche sui file TER. Tavola per "tipo_record"=1';

CREATE TABLE catasto.cu_soggetti
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_soggetto character varying(9),
  tipo_soggetto character varying(1),
  cognome character varying(64),
  nome character varying(64),
  sesso character varying(1),
  data_di_nascita date,
  luogo_di_nascita character varying(4),
  codice_fiscale character varying(16),
  info_suppl character varying(125),
  denominazione character varying(150),
  sede character varying(4),
  gid serial NOT NULL,
  CONSTRAINT cu_soggetti_pkey PRIMARY KEY (gid),
  CONSTRAINT cu_soggetti_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_soggetto, tipo_soggetto)
)
INHERITS (cat_cu_soggetti)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.cu_soggetti
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.cu_soggetti TO postgres;
GRANT SELECT ON TABLE catasto.cu_soggetti TO maphosting;
COMMENT ON TABLE catasto.cu_soggetti
  IS 'creata per importare i file SOG su DB usando lo script db.py del geopa.catasto. Struttura ripresa dalle specifiche sui file SOG.';

CREATE TABLE catasto.cu_titolarita
(
  codice_ammvo character varying(4),
  sezione character varying(1),
  identificativo_soggetto character varying(9),
  tipo_soggetto character varying(1),
  identificativo_immobile character varying(9),
  tipo_immobile character varying(1),
  codice_diritto character varying(3),
  titolo_non_codificato character varying(200),
  quota_numeratore character varying(9),
  quota_denominatore character varying(9),
  regime character varying(1),
  soggetto_di_riferimento character varying(9),
  data_di_validita00 date,
  tipo_nota00 character varying(1),
  numero_nota00 character varying(6),
  progressivo_nota00 character varying(3),
  anno_nota00 character varying(4),
  data_registrazione_atti00 date,
  partita character varying(7),
  data_di_validita99 date,
  tipo_nota99 character varying(1),
  numero_nota99 character varying(6),
  progressivo_nota99 character varying(3),
  anno_nota99 character varying(4),
  data_registrazione_atti99 date,
  identificativo_mutazione_iniziale character varying(9),
  identificativo_mutazione_finale character varying(9),
  identificativo_titolarita character varying(9),
  codice_causale_atto_generante character varying(3),
  descrizione_atto_generante character varying(100),
  codice_causale_atto_conclusivo character varying(3),
  descrizione_atto_conclusivo character varying(100),
  gid serial NOT NULL,
  CONSTRAINT cu_titolarita_pkey PRIMARY KEY (gid),
  CONSTRAINT cu_titolarita_codice_ammvo_key UNIQUE (codice_ammvo, sezione, identificativo_soggetto, tipo_soggetto, identificativo_immobile, tipo_immobile, identificativo_titolarita)
)
INHERITS (cat_cu_titolarita)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.cu_titolarita
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.cu_titolarita TO postgres;
GRANT SELECT ON TABLE catasto.cu_titolarita TO maphosting;
COMMENT ON TABLE catasto.cu_titolarita
  IS 'creata per importare i file TIT su DB usando lo script db.py del geopa.catasto. Struttura ripresa dalle specifiche sui file TIT.';

CREATE TABLE catasto.upload_catasto
(
  start_update timestamp without time zone,
  time_update integer,
  codice_ammvo character varying(4),
  zip_processed character varying(255),
  script_executed character varying(24),
  file_processed character varying(24),
  results character varying(6),
  logfile character varying(125),
  target_schema character varying(24),
  type_update character varying(24),
  note character varying(255),
  gid serial NOT NULL,
  CONSTRAINT upload_catasto_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE catasto.upload_catasto
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.upload_catasto TO postgres;
GRANT SELECT ON TABLE catasto.upload_catasto TO maphosting;
COMMENT ON TABLE catasto.upload_catasto
  IS 'Tavola che tiene traccia delle procedure di aggiornamento del DB catasto compiuto tramite lo script upload_catasto.bat o i vari script upload.py';


--Creazione delle VISTE dello schema CATASTO:
CREATE OR REPLACE VIEW catasto.v_cat_bordi_geo AS 
 SELECT catasto_bordi.gid,
    catasto_bordi.comune,
    catasto_bordi.foglio,
    catasto_bordi.tipo,
    catasto_bordi.wkb_geometry::geometry(PolygonZ,4326) AS wkb_geometry,
    catasto_bordi.ogc_fid,
    catasto_bordi.particella,
    catasto_bordi.area,
    ((('<a href="/mapguide/mapviewerphp/script_ric/visura_fabbricati.php?foglio='::text || catasto_bordi.foglio::text) || '&numero='::text) || catasto_bordi.particella::text) || '" target="blank"> Apri Scheda </a>'::text AS visura,
    (((catasto_bordi.comune::text || '_'::text) || catasto_bordi.foglio::text) || '_'::text) || catasto_bordi.particella::text AS linkcatnew
   FROM catasto.catasto_bordi catasto_bordi;

ALTER TABLE catasto.v_cat_bordi_geo
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.v_cat_bordi_geo TO postgres;
GRANT SELECT ON TABLE catasto.v_cat_bordi_geo TO maphosting;


-- View: catasto.v_cat_fabbricati_geo

-- DROP VIEW catasto.v_cat_fabbricati_geo;

CREATE OR REPLACE VIEW catasto.v_cat_fabbricati_geo AS 
 SELECT catasto_bordi.gid,
    catasto_bordi.comune,
    catasto_bordi.foglio,
    catasto_bordi.tipo,
    catasto_bordi.wkb_geometry::geometry(PolygonZ,4326) AS wkb_geometry,
    catasto_bordi.ogc_fid,
    catasto_bordi.particella,
    catasto_bordi.area,
    replace(st_asewkt(catasto_bordi.wkb_geometry), 'SRID=4326;'::text, ''::text) AS geometria,
    ((((('<a href="/mapguide/mapviewerphp/script_ric/visura_fabbricati.php?progetto='::text || catasto_bordi.comune::text) || '&foglio='::text) || catasto_bordi.foglio::text) || '&numero='::text) || catasto_bordi.particella::text) || '" target="blank"> Apri Scheda </a>'::text AS visura,
    (((catasto_bordi.comune::text || '_'::text) || catasto_bordi.foglio::text) || '_'::text) || catasto_bordi.particella::text AS linkcatnew,
    st_area(st_transform(st_geomfromtext(catasto_bordi.wkb_geometry::text), 32632)) AS superficie
   FROM catasto.catasto_bordi catasto_bordi
  WHERE catasto_bordi.tipo::text = 'FABBRICATO'::text;

ALTER TABLE catasto.v_cat_fabbricati_geo
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.v_cat_fabbricati_geo TO postgres;
GRANT SELECT ON TABLE catasto.v_cat_fabbricati_geo TO maphosting;

-- View: catasto.v_cat_particella_geo

-- DROP VIEW catasto.v_cat_particella_geo;

CREATE OR REPLACE VIEW catasto.v_cat_particella_geo AS 
 SELECT catasto_bordi.gid,
    catasto_bordi.comune,
    catasto_bordi.foglio,
    catasto_bordi.particella,
    catasto_bordi.wkb_geometry::geometry(PolygonZ,4326) AS wkb_geometry,
    catasto_bordi.tipo,
    (((catasto_bordi.comune::text || '_'::text) || catasto_bordi.foglio::text) || '_'::text) || catasto_bordi.particella::text AS linkcatnew,
    ((((('<a href="/mapguide/mapviewerphp/script_ric/visura_terreni.php?progetto='::text || catasto_bordi.comune::text) || '&foglio='::text) || catasto_bordi.foglio::text) || '&numero='::text) || catasto_bordi.particella::text) || '" target="blank"> Visura </a>'::text AS visura,
    catasto_bordi.area,
    catasto_bordi.ogc_fid
   FROM catasto.catasto_bordi
  WHERE catasto_bordi.tipo::text = 'PARTICELLA'::text;

ALTER TABLE catasto.v_cat_particella_geo
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.v_cat_particella_geo TO postgres;
GRANT SELECT ON TABLE catasto.v_cat_particella_geo TO maphosting;

-- View: catasto.v_fabbricati

-- DROP VIEW catasto.v_fabbricati;

CREATE OR REPLACE VIEW catasto.v_fabbricati AS 
 SELECT a.codice_ammvo,
    m.descrizione AS comune,
    a.sezione,
    a.identificativo_immobile,
    a.tipo_immobile,
    a.progressivo,
    a.tipo_record,
    a.zona,
    a.categoria,
    f.descrizione AS descrizione_categoria,
    a.classe,
    a.consistenza,
    g.descrizione AS descrizione_consistenza,
    a.superficie,
    a.rendita_lire,
    a.rendita_euro,
    a.lotto,
    a.edificio,
    a.scala,
    a.interno1,
    a.interno2,
    a.piano1,
    a.piano2,
    a.piano3,
    a.piano4,
    a.data_di_efficacia00,
    a.data_di_registrazione00,
    a.tipo_nota00,
    i.descrizione AS descr_nota00,
    a.numero_nota00,
    a.progressivo_nota00,
    a.anno_nota00,
    a.data_di_efficacia99,
    a.data_di_registrazione99,
    a.tipo_nota99,
    l.descrizione AS descr_nota99,
    a.numero_nota99,
    a.progressivo_nota99,
    a.anno_nota99,
    a.partita,
    n.descrizione AS descrizione_partita,
    a.annotazione,
    a.identificativo_mutazione_iniziale,
    a.identificativo_mutazione_finale,
    a.protocollo_notifica,
    a.data_notifica,
    a.codice_causale_atto_generante,
    a.descrizione_atto_generante,
    a.codice_causale_atto_conclusivo,
    a.descrizione_atto_conclusivo,
    a.flag_classamento,
    h.descrizione AS descr_flag_classamento,
    a.gid,
    b.id_particella,
    b.sezione_urbana,
    b.foglio,
    b.numero,
    b.denominatore,
    b.subalterno,
    b.edificialita,
    c.toponimo,
    p.descrizione AS descrizione_toponimo,
    c.indirizzo,
    c.civico1,
    c.civico2,
    c.civico3,
    c.codice_strada,
    d.sezione_urbana AS sezione_urbana_4,
    d.foglio AS foglio_4,
    d.numero AS numero_4,
    d.denominatore AS denominatore_4,
    d.subalterno AS subalterno_4,
    e.codice_riserva,
    e.partita_iscrizione_riserva
   FROM catasto.cf_immobili a
     LEFT JOIN catasto.cf_identificativi b ON a.codice_ammvo::text = b.codice_ammvo::text AND a.sezione::text = b.sezione::text AND a.identificativo_immobile::text = b.identificativo_immobile::text AND a.tipo_immobile::text = b.tipo_immobile::text AND a.progressivo = b.progressivo
     LEFT JOIN catasto.cf_indirizzi c ON a.codice_ammvo::text = c.codice_ammvo::text AND a.sezione::text = c.sezione::text AND a.identificativo_immobile::text = c.identificativo_immobile::text AND a.tipo_immobile::text = c.tipo_immobile::text AND a.progressivo = c.progressivo
     LEFT JOIN catasto.cf_utilita_comuni d ON a.codice_ammvo::text = d.codice_ammvo::text AND a.sezione::text = d.sezione::text AND a.identificativo_immobile::text = d.identificativo_immobile::text AND a.tipo_immobile::text = d.tipo_immobile::text AND a.progressivo = d.progressivo
     LEFT JOIN catasto.cf_riserve e ON a.codice_ammvo::text = e.codice_ammvo::text AND a.sezione::text = e.sezione::text AND a.identificativo_immobile::text = e.identificativo_immobile::text AND a.tipo_immobile::text = e.tipo_immobile::text AND a.progressivo = e.progressivo
     LEFT JOIN catasto.cf_decode_categoria f ON a.categoria::text = f.codice::text
     LEFT JOIN catasto.cf_decode_consistenza g ON "substring"(a.categoria::text, 1, 1) = g.codice::text
     LEFT JOIN catasto.cf_decode_flag_classamento h ON a.flag_classamento::text = h.codice::text
     LEFT JOIN catasto.cu_decode_nota i ON (a.tipo_nota00::text || a.tipo_immobile::text) = (i.codice::text || i.tipo_immobile::text)
     LEFT JOIN catasto.cu_decode_nota l ON (a.tipo_nota99::text || a.tipo_immobile::text) = (l.codice::text || l.tipo_immobile::text)
     LEFT JOIN catasto.cu_decode_comune m ON a.codice_ammvo::text = m.codice::text
     LEFT JOIN catasto.cu_decode_partite_speciali n ON a.partita::text = n.codice::text AND a.tipo_immobile::text = n.tipo_immobile::text
     LEFT JOIN catasto.cf_decode_toponimo p ON c.toponimo = p.codice;

ALTER TABLE catasto.v_fabbricati
  OWNER TO postgres;

-- View: catasto.v_planimetrie

-- DROP VIEW catasto.v_planimetrie;

CREATE OR REPLACE VIEW catasto.v_planimetrie AS 
 SELECT b.codice_ammvo,
    b.sezione,
    b.identificativo_immobile,
    b.protocollo_registrazione,
    b.data_registrazione,
    b.nome_file,
    b.n_scheda,
    b.formato_scheda,
    b.scala_scheda,
    (b.nome_file::text || '.'::text) || lpad(b.n_scheda::text, 3, '0'::text) AS path_file,
    c.progressivo_poligono,
    c.superficie_poligono,
    c.ambiente_poligono,
    c.altezza,
    c.altezza_max
   FROM catasto.cf_planimetrie_schede b,
    catasto.cf_planimetrie_poligoni c
  WHERE c.identificativo_immobile::text = b.identificativo_immobile::text;

ALTER TABLE catasto.v_planimetrie
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.v_planimetrie TO postgres;
GRANT SELECT ON TABLE catasto.v_planimetrie TO maphosting;

-- View: catasto.v_planimetrie_storiche

-- DROP VIEW catasto.v_planimetrie_storiche;

CREATE OR REPLACE VIEW catasto.v_planimetrie_storiche AS 
 SELECT b.codice_ammvo,
    b.sezione,
    b.identificativo_immobile,
    c.protocollo_registrazione,
    c.data_registrazione,
    b.nome_file,
    1 AS n_scheda,
    c.formato_scheda,
    c.scala_scheda,
    b.nome_file::text AS path_file,
    NULL::smallint AS progressivo_poligono,
    NULL::smallint AS superficie_poligono,
    NULL::text AS ambiente_poligono,
    NULL::smallint AS altezza,
    NULL::smallint AS altezza_max
   FROM catasto.cf_planim_schede_storiche b,
    catasto.cf_planim_poly_storiche c
  WHERE c.identificativo_immobile::text = b.identificativo_immobile::text;

ALTER TABLE catasto.v_planimetrie_storiche
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.v_planimetrie_storiche TO postgres;
GRANT SELECT ON TABLE catasto.v_planimetrie_storiche TO maphosting;

-- View: catasto.v_terreni

-- DROP VIEW catasto.v_terreni;

CREATE OR REPLACE VIEW catasto.v_terreni AS 
 SELECT a.codice_ammvo,
    m.descrizione AS comune,
    a.sezione,
    a.identificativo_immobile,
    a.tipo_immobile,
    a.progressivo,
    a.tipo_record,
    a.foglio,
    a.numero,
    a.denominatore,
    a.subalterno,
    a.edificialita,
    a.qualita,
    e.descrizione AS destinazione,
    a.classe,
    a.ettari,
    a.are,
    a.centiare,
    a.flag_reddito,
    a.flag_porzione,
    a.flag_deduzioni,
    a.reddito_dominicale_lire,
    a.reddito_agrario_lire,
    a.reddito_dominicale_euro,
    a.reddito_agrario_euro,
    a.data_di_efficacia00,
    a.data_di_registrazione00,
    a.tipo_nota00,
    i.descrizione AS descr_nota_00,
    a.numero_nota00,
    a.progressivo_nota00,
    a.anno_nota00,
    a.data_di_efficacia99,
    a.data_di_registrazione99,
    a.tipo_nota99,
    l.descrizione AS descr_nota_99,
    a.numero_nota99,
    a.progressivo_nota99,
    a.anno_nota99,
    a.partita,
    n.descrizione AS descrizione_partita,
    a.annotazione,
    a.identificativo_mutazione_iniziale,
    a.identificativo_mutazione_finale,
    a.codice_causale_atto_generante,
    a.descrizione_atto_generante,
    a.codice_causale_atto_conclusivo,
    a.descrizione_atto_conclusivo,
    a.gid,
    a.id_particella,
    b.simbolo_deduzione,
    c.codice_riserva,
    c.partita_iscrizione_riserva,
    d.identificativo_porzione,
    d.qualita AS qualita4,
    d.classe AS classe4,
    d.ettari AS ettari4,
    d.are AS are4,
    d.centiare AS centiare4
   FROM catasto.ct_terreni a
     LEFT JOIN catasto.ct_deduzioni b ON a.codice_ammvo::text = b.codice_ammvo::text AND a.sezione::text = b.sezione::text AND a.identificativo_immobile::text = b.identificativo_immobile::text AND a.tipo_immobile::text = b.tipo_immobile::text AND a.progressivo = b.progressivo
     LEFT JOIN catasto.ct_riserve c ON a.codice_ammvo::text = c.codice_ammvo::text AND a.sezione::text = c.sezione::text AND a.identificativo_immobile::text = c.identificativo_immobile::text AND a.tipo_immobile::text = c.tipo_immobile::text AND a.progressivo = c.progressivo
     LEFT JOIN catasto.ct_porzioni d ON a.codice_ammvo::text = d.codice_ammvo::text AND a.sezione::text = d.sezione::text AND a.identificativo_immobile::text = d.identificativo_immobile::text AND a.tipo_immobile::text = d.tipo_immobile::text AND a.progressivo = d.progressivo
     LEFT JOIN catasto.ct_decode_destinazioni e ON a.qualita::text = e.codice::text
     LEFT JOIN catasto.cu_decode_nota i ON (a.tipo_nota00::text || a.tipo_immobile::text) = (i.codice::text || i.tipo_immobile::text)
     LEFT JOIN catasto.cu_decode_nota l ON (a.tipo_nota99::text || a.tipo_immobile::text) = (l.codice::text || l.tipo_immobile::text)
     LEFT JOIN catasto.cu_decode_comune m ON a.codice_ammvo::text = m.codice::text
     LEFT JOIN catasto.cu_decode_partite_speciali n ON a.partita::text = n.codice::text AND a.tipo_immobile::text = n.tipo_immobile::text;

ALTER TABLE catasto.v_terreni
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.v_terreni TO postgres;
GRANT SELECT ON TABLE catasto.v_terreni TO maphosting;

-- View: catasto.v_tit_sog

-- DROP VIEW catasto.v_tit_sog;

CREATE OR REPLACE VIEW catasto.v_tit_sog AS 
 SELECT a.codice_ammvo,
    m.descrizione AS comune,
    a.sezione,
    a.identificativo_soggetto,
    a.tipo_soggetto,
    a.identificativo_immobile,
    a.tipo_immobile,
    b.cognome,
    b.nome,
    b.luogo_di_nascita,
    b.data_di_nascita,
    b.sesso,
    b.codice_fiscale,
    b.info_suppl,
    b.denominazione,
    b.sede,
    c.descrizione AS descrizione_diritto,
    a.quota_numeratore,
    a.quota_denominatore,
    a.titolo_non_codificato,
    a.tipo_nota00,
    i.descrizione AS descr_nota_00,
    a.numero_nota00,
    a.tipo_nota99,
    l.descrizione AS descr_nota_99,
    a.numero_nota99,
    a.data_di_validita00,
    a.data_registrazione_atti00,
    a.data_di_validita99,
    a.data_registrazione_atti99
   FROM catasto.cu_titolarita a
     LEFT JOIN catasto.cu_soggetti b USING (identificativo_soggetto, tipo_soggetto)
     LEFT JOIN catasto.cu_decode_diritto c ON a.codice_diritto::text = c.codice::text
     LEFT JOIN catasto.cu_decode_nota i ON (a.tipo_nota00::text || a.tipo_immobile::text) = (i.codice::text || i.tipo_immobile::text)
     LEFT JOIN catasto.cu_decode_nota l ON (a.tipo_nota99::text || a.tipo_immobile::text) = (l.codice::text || l.tipo_immobile::text)
     LEFT JOIN catasto.cu_decode_comune m ON a.codice_ammvo::text = m.codice::text;

ALTER TABLE catasto.v_tit_sog
  OWNER TO postgres;

-- View: catasto.v_tit_sog_fab

-- DROP VIEW catasto.v_tit_sog_fab;

CREATE OR REPLACE VIEW catasto.v_tit_sog_fab AS 
 SELECT b.codice_ammvo,
    b.comune,
    b.sezione,
    b.identificativo_soggetto,
    b.tipo_soggetto,
    b.cognome,
    b.nome,
    b.luogo_di_nascita,
    b.data_di_nascita,
    b.sesso,
    b.codice_fiscale,
    b.info_suppl,
    b.denominazione,
    b.sede,
    b.descrizione_diritto,
    b.quota_numeratore,
    b.quota_denominatore,
    b.titolo_non_codificato,
    b.tipo_nota00,
    b.descr_nota_00,
    b.numero_nota00,
    b.tipo_nota99,
    b.descr_nota_99,
    b.numero_nota99,
    b.data_di_validita00,
    b.data_registrazione_atti00,
    b.data_di_validita99,
    b.data_registrazione_atti99,
    a.identificativo_immobile,
    a.tipo_immobile,
    a.progressivo,
    a.zona,
    a.categoria,
    a.descrizione_categoria,
    a.classe,
    a.consistenza,
    a.descrizione_consistenza,
    a.superficie,
    a.rendita_lire,
    a.rendita_euro,
    a.lotto,
    a.edificio,
    a.scala,
    a.interno1,
    a.interno2,
    a.piano1,
    a.piano2,
    a.piano3,
    a.piano4,
    a.data_di_efficacia00,
    a.data_di_registrazione00,
    a.tipo_nota00 AS tipo_nota00fab,
    a.descr_nota00 AS descr_nota00fab,
    a.numero_nota00 AS numero_nota00fab,
    a.progressivo_nota00,
    a.anno_nota00,
    a.data_di_efficacia99,
    a.data_di_registrazione99,
    a.tipo_nota99 AS tipo_nota99fab,
    a.descr_nota99 AS descr_nota99fab,
    a.numero_nota99 AS numero_nota99fab,
    a.progressivo_nota99,
    a.anno_nota99,
    a.partita,
    a.descrizione_partita,
    a.annotazione,
    a.identificativo_mutazione_iniziale,
    a.identificativo_mutazione_finale,
    a.protocollo_notifica,
    a.data_notifica,
    a.codice_causale_atto_generante,
    a.descrizione_atto_generante,
    a.codice_causale_atto_conclusivo,
    a.descrizione_atto_conclusivo,
    a.flag_classamento,
    a.descr_flag_classamento,
    a.id_particella,
    a.sezione_urbana,
    a.foglio,
    a.numero,
    a.denominatore,
    a.subalterno,
    a.edificialita,
    a.toponimo,
    a.descrizione_toponimo,
    a.indirizzo,
    a.civico1,
    a.civico2,
    a.civico3,
    a.codice_strada,
    a.sezione_urbana_4,
    a.foglio_4,
    a.numero_4,
    a.denominatore_4,
    a.subalterno_4,
    a.codice_riserva,
    a.partita_iscrizione_riserva
   FROM catasto.v_fabbricati a,
    catasto.v_tit_sog b
  WHERE b.codice_ammvo::text = a.codice_ammvo::text AND b.sezione::text = a.sezione::text AND b.identificativo_immobile::text = a.identificativo_immobile::text AND b.tipo_immobile::text = a.tipo_immobile::text AND b.tipo_immobile::text = 'F'::text;

ALTER TABLE catasto.v_tit_sog_fab
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.v_tit_sog_fab TO postgres;
GRANT SELECT ON TABLE catasto.v_tit_sog_fab TO maphosting;

-- View: catasto.v_tit_sog_ter

-- DROP VIEW catasto.v_tit_sog_ter;

CREATE OR REPLACE VIEW catasto.v_tit_sog_ter AS 
 SELECT b.codice_ammvo,
    b.comune,
    b.sezione,
    b.identificativo_soggetto,
    b.tipo_soggetto,
    b.cognome,
    b.nome,
    b.luogo_di_nascita,
    b.data_di_nascita,
    b.sesso,
    b.codice_fiscale,
    b.info_suppl,
    b.denominazione,
    b.sede,
    b.descrizione_diritto,
    b.quota_numeratore,
    b.quota_denominatore,
    b.titolo_non_codificato,
    b.tipo_nota00,
    b.descr_nota_00,
    b.numero_nota00,
    b.tipo_nota99,
    b.descr_nota_99,
    b.numero_nota99,
    b.data_di_validita00,
    b.data_registrazione_atti00,
    b.data_di_validita99,
    b.data_registrazione_atti99,
    a.identificativo_immobile,
    a.tipo_immobile,
    a.progressivo,
    a.foglio,
    a.numero,
    a.denominatore,
    a.subalterno,
    a.edificialita,
    a.qualita,
    a.destinazione,
    a.classe,
    a.ettari,
    a.are,
    a.centiare,
    a.flag_reddito,
    a.flag_porzione,
    a.flag_deduzioni,
    a.reddito_dominicale_lire,
    a.reddito_agrario_lire,
    a.reddito_dominicale_euro,
    a.reddito_agrario_euro,
    a.data_di_efficacia00,
    a.data_di_registrazione00,
    a.tipo_nota00 AS tipo_nota00ter,
    a.descr_nota_00 AS descr_nota00ter,
    a.numero_nota00 AS numero_nota00ter,
    a.progressivo_nota00,
    a.anno_nota00,
    a.data_di_efficacia99,
    a.data_di_registrazione99,
    a.tipo_nota99 AS tipo_nota99ter,
    a.descr_nota_99 AS descr_nota99ter,
    a.numero_nota99 AS numero_nota99ter,
    a.progressivo_nota99,
    a.anno_nota99,
    a.partita,
    a.descrizione_partita,
    a.annotazione,
    a.identificativo_mutazione_iniziale,
    a.identificativo_mutazione_finale,
    a.codice_causale_atto_generante,
    a.descrizione_atto_generante,
    a.codice_causale_atto_conclusivo,
    a.descrizione_atto_conclusivo,
    a.id_particella,
    a.simbolo_deduzione,
    a.codice_riserva,
    a.partita_iscrizione_riserva,
    a.identificativo_porzione,
    a.qualita4,
    a.classe4,
    a.ettari4,
    a.are4,
    a.centiare4
   FROM catasto.v_terreni a,
    catasto.v_tit_sog b
  WHERE b.codice_ammvo::text = a.codice_ammvo::text AND b.sezione::text = a.sezione::text AND b.identificativo_immobile::text = a.identificativo_immobile::text AND b.tipo_immobile::text = a.tipo_immobile::text AND b.tipo_immobile::text = 'T'::text;

ALTER TABLE catasto.v_tit_sog_ter
  OWNER TO postgres;
GRANT ALL ON TABLE catasto.v_tit_sog_ter TO postgres;
GRANT SELECT ON TABLE catasto.v_tit_sog_ter TO maphosting;



COMMIT;