--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.1
-- Started on 2015-04-13 12:11:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = catasto, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 263 (class 1259 OID 35007)
-- Name: cf_decode_categoria; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cf_decode_categoria (
    codice character varying(5) NOT NULL,
    descrizione character varying(255)
);


--
-- TOC entry 5723 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE cf_decode_categoria; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cf_decode_categoria IS 'tavola di decodifica delle categorie catastali - file FAB';


--
-- TOC entry 264 (class 1259 OID 35010)
-- Name: cf_decode_consistenza; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cf_decode_consistenza (
    codice character varying(1) NOT NULL,
    descrizione character varying(24)
);


--
-- TOC entry 5724 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE cf_decode_consistenza; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cf_decode_consistenza IS 'tavola di decodifica della consistenza: dipende dal primo carattere del campo categoria - file FAB';


--
-- TOC entry 265 (class 1259 OID 35013)
-- Name: cf_decode_flag_classamento; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cf_decode_flag_classamento (
    codice character varying(1) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5725 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE cf_decode_flag_classamento; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cf_decode_flag_classamento IS 'tavola di decodifica del flag classamento - file FAB';


--
-- TOC entry 266 (class 1259 OID 35016)
-- Name: cf_decode_toponimo; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cf_decode_toponimo (
    codice integer NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5726 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE cf_decode_toponimo; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cf_decode_toponimo IS 'tavola di decodifica del toponimo';


--
-- TOC entry 287 (class 1259 OID 35076)
-- Name: ct_decode_destinazioni; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE ct_decode_destinazioni (
    codice character varying(3) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5727 (class 0 OID 0)
-- Dependencies: 287
-- Name: TABLE ct_decode_destinazioni; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE ct_decode_destinazioni IS 'tavola di decodifica qualita e destinazioni terreni';


--
-- TOC entry 288 (class 1259 OID 35079)
-- Name: ct_decode_flag; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE ct_decode_flag (
    codice character varying(1) NOT NULL,
    descrizione character varying(24)
);


--
-- TOC entry 5728 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE ct_decode_flag; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE ct_decode_flag IS 'tavola di decodifica del flag reddito-porzioni-deduzioni - file TER';


--
-- TOC entry 298 (class 1259 OID 35111)
-- Name: cu_decode_comune; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cu_decode_comune (
    codice character varying(9) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5729 (class 0 OID 0)
-- Dependencies: 298
-- Name: TABLE cu_decode_comune; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cu_decode_comune IS 'tavola di decodifica del codice amministrativo indicante il comune - TUTTA ITALIA';


--
-- TOC entry 299 (class 1259 OID 35114)
-- Name: cu_decode_diritto; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cu_decode_diritto (
    codice character varying(3) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5730 (class 0 OID 0)
-- Dependencies: 299
-- Name: TABLE cu_decode_diritto; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cu_decode_diritto IS 'tavola di decodifica del codice diritto - file TIT';


--
-- TOC entry 300 (class 1259 OID 35117)
-- Name: cu_decode_immobile; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cu_decode_immobile (
    codice character varying(1) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5731 (class 0 OID 0)
-- Dependencies: 300
-- Name: TABLE cu_decode_immobile; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cu_decode_immobile IS 'tavola di decodifica del tipo immobile';


--
-- TOC entry 301 (class 1259 OID 35120)
-- Name: cu_decode_nota; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cu_decode_nota (
    codice character varying(1) NOT NULL,
    tipo_immobile character varying(1) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5732 (class 0 OID 0)
-- Dependencies: 301
-- Name: TABLE cu_decode_nota; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cu_decode_nota IS 'tavola di decodifica del tipo nota';


--
-- TOC entry 302 (class 1259 OID 35123)
-- Name: cu_decode_partite_speciali; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cu_decode_partite_speciali (
    tipo_immobile character varying(1) NOT NULL,
    codice character varying(1) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5733 (class 0 OID 0)
-- Dependencies: 302
-- Name: TABLE cu_decode_partite_speciali; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cu_decode_partite_speciali IS 'tavola di decodifica delle partite speciali - file FAB_1 e TER_1';


--
-- TOC entry 303 (class 1259 OID 35126)
-- Name: cu_decode_regime; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cu_decode_regime (
    codice character varying(2) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5734 (class 0 OID 0)
-- Dependencies: 303
-- Name: TABLE cu_decode_regime; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cu_decode_regime IS 'tavola di decodifica del Regime patrimoniale di possesso del bene - file TIT';


--
-- TOC entry 304 (class 1259 OID 35129)
-- Name: cu_decode_riserva; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cu_decode_riserva (
    codice smallint NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5735 (class 0 OID 0)
-- Dependencies: 304
-- Name: TABLE cu_decode_riserva; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cu_decode_riserva IS 'tavola di decodifica del codice riserva';


--
-- TOC entry 305 (class 1259 OID 35132)
-- Name: cu_decode_sesso; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cu_decode_sesso (
    codice character varying(1) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5736 (class 0 OID 0)
-- Dependencies: 305
-- Name: TABLE cu_decode_sesso; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cu_decode_sesso IS 'tavola di decodifica del sesso - file SOG';


--
-- TOC entry 306 (class 1259 OID 35135)
-- Name: cu_decode_soggetto; Type: TABLE; Schema: catasto; Owner: -; Tablespace: 
--

CREATE TABLE cu_decode_soggetto (
    codice character varying(1) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5737 (class 0 OID 0)
-- Dependencies: 306
-- Name: TABLE cu_decode_soggetto; Type: COMMENT; Schema: catasto; Owner: -
--

COMMENT ON TABLE cu_decode_soggetto IS 'tavola di decodifica del tipo soggetto';


SET search_path = public, pg_catalog;

--
-- TOC entry 399 (class 1259 OID 35776)
-- Name: cat_cf_decode_consistenza; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_cf_decode_consistenza (
    codice character varying(1) NOT NULL,
    descrizione character varying(24)
);


--
-- TOC entry 5738 (class 0 OID 0)
-- Dependencies: 399
-- Name: TABLE cat_cf_decode_consistenza; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cat_cf_decode_consistenza IS 'tavola di decodifica della consistenza: dipende dal primo carattere del campo categoria - file FAB';


--
-- TOC entry 400 (class 1259 OID 35779)
-- Name: cat_cf_decode_flag_classamento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_cf_decode_flag_classamento (
    codice character varying(1) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5739 (class 0 OID 0)
-- Dependencies: 400
-- Name: TABLE cat_cf_decode_flag_classamento; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cat_cf_decode_flag_classamento IS 'tavola di decodifica del flag classamento - file FAB';


--
-- TOC entry 401 (class 1259 OID 35782)
-- Name: cat_ct_decode_destinazioni; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_ct_decode_destinazioni (
    codice character varying(3) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5740 (class 0 OID 0)
-- Dependencies: 401
-- Name: TABLE cat_ct_decode_destinazioni; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cat_ct_decode_destinazioni IS 'tavola di decodifica qualita e destinazioni terreni';


--
-- TOC entry 402 (class 1259 OID 35785)
-- Name: cat_ct_decode_flag; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_ct_decode_flag (
    codice character varying(1) NOT NULL,
    descrizione character varying(24)
);


--
-- TOC entry 5741 (class 0 OID 0)
-- Dependencies: 402
-- Name: TABLE cat_ct_decode_flag; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cat_ct_decode_flag IS 'tavola di decodifica del flag reddito-porzioni-deduzioni - file TER';


--
-- TOC entry 403 (class 1259 OID 35788)
-- Name: cat_cu_decode_diritto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_cu_decode_diritto (
    codice character varying(3) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5742 (class 0 OID 0)
-- Dependencies: 403
-- Name: TABLE cat_cu_decode_diritto; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cat_cu_decode_diritto IS 'tavola di decodifica del codice diritto - file TIT';


--
-- TOC entry 404 (class 1259 OID 35791)
-- Name: cat_cu_decode_immobile; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_cu_decode_immobile (
    codice character varying(1) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5743 (class 0 OID 0)
-- Dependencies: 404
-- Name: TABLE cat_cu_decode_immobile; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cat_cu_decode_immobile IS 'tavola di decodifica del tipo immobile';


--
-- TOC entry 405 (class 1259 OID 35794)
-- Name: cat_cu_decode_nota; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_cu_decode_nota (
    codice character varying(1) NOT NULL,
    tipo_immobile character varying(1) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5744 (class 0 OID 0)
-- Dependencies: 405
-- Name: TABLE cat_cu_decode_nota; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cat_cu_decode_nota IS 'tavola di decodifica del tipo nota';


--
-- TOC entry 406 (class 1259 OID 35797)
-- Name: cat_cu_decode_partite_speciali; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_cu_decode_partite_speciali (
    tipo_immobile character varying(1) NOT NULL,
    codice character varying(1) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5745 (class 0 OID 0)
-- Dependencies: 406
-- Name: TABLE cat_cu_decode_partite_speciali; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cat_cu_decode_partite_speciali IS 'tavola di decodifica delle partite speciali - file FAB_1 e TER_1';


--
-- TOC entry 407 (class 1259 OID 35800)
-- Name: cat_cu_decode_regime; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_cu_decode_regime (
    codice character varying(2) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5746 (class 0 OID 0)
-- Dependencies: 407
-- Name: TABLE cat_cu_decode_regime; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cat_cu_decode_regime IS 'tavola di decodifica del Regime patrimoniale di possesso del bene - file TIT';


--
-- TOC entry 408 (class 1259 OID 35803)
-- Name: cat_cu_decode_riserva; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_cu_decode_riserva (
    codice smallint NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5747 (class 0 OID 0)
-- Dependencies: 408
-- Name: TABLE cat_cu_decode_riserva; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cat_cu_decode_riserva IS 'tavola di decodifica del codice riserva';


--
-- TOC entry 409 (class 1259 OID 35806)
-- Name: cat_cu_decode_sesso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_cu_decode_sesso (
    codice character varying(1) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5748 (class 0 OID 0)
-- Dependencies: 409
-- Name: TABLE cat_cu_decode_sesso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cat_cu_decode_sesso IS 'tavola di decodifica del sesso - file SOG';


--
-- TOC entry 410 (class 1259 OID 35809)
-- Name: cat_cu_decode_soggetto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cat_cu_decode_soggetto (
    codice character varying(1) NOT NULL,
    descrizione character varying(125)
);


--
-- TOC entry 5749 (class 0 OID 0)
-- Dependencies: 410
-- Name: TABLE cat_cu_decode_soggetto; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cat_cu_decode_soggetto IS 'tavola di decodifica del tipo soggetto';


--
-- TOC entry 422 (class 1259 OID 35850)
-- Name: cf_decode_categoria; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cf_decode_categoria (
    codice character varying(5) NOT NULL,
    descrizione character varying(255)
);


--
-- TOC entry 5750 (class 0 OID 0)
-- Dependencies: 422
-- Name: TABLE cf_decode_categoria; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE cf_decode_categoria IS 'tavola di decodifica delle categorie catastali - file FAB';


SET search_path = catasto, pg_catalog;

--
-- TOC entry 5691 (class 0 OID 35007)
-- Dependencies: 263
-- Data for Name: cf_decode_categoria; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cf_decode_categoria (codice, descrizione) FROM stdin;
A01	Abitazione di tipo signorile
A02	Abitazione di tipo civile
A03	Abitazioni di tipo economico
A04	Abitazioni di tipo popolari
A05	Abitazioni di tipo ultrapopolare
A06	Abitazione di tipo rurale
A07	Abitazione in villini
A08	Abitazione in villa
A09	Castelli, palazzi di eminenti pregi artistici o storici
A10	Uffici e studi privati
A11	Abitazioni o alloggi tipici dei luoghi
B01	Collegi e convitti, educandati, ricoveri, orfanotrofi, ospizi, conventi, seminari, caserme
B02	Case di cura e ospedali senza fine di lucro
B03	Prigioni e riformatori
B04	Uffici Pubblici
B05	Scuole e laboratori scientifici
B06	Biblioteche, pinacoteche, musei, gallerie, accademie che non hanno sede in edifici della categoria A09. Circoli ricreativi e culturali, ed attivita similari se non hanno fine di lucro
B07	Cappelle ed oratori non destinati all esercizio pubblico del culto
B08	Magazzini sotterranei per depositi di derrate
C01	Negozi e Botteghe
C02	Magazzini e locali di Deposito
C03	Laboratori per arti e mestieri
C04	Fabbricati e locali per esercizi sportivi (senza fine di lucro)
C05	Stabilimenti balneari e di acque curative (senza fine di lucro)
C06	Stalle, scuderie, rimesse, autorimesse (senza fine di lucro)
C07	Tettoie chiuse od aperte
D01	Opifici
D02	Alberghi e pensioni (con fine di lucro)
D03	Teatri, cinematografi, sale per concerti e spettacoli e simili (con fine di lucro)
D04	Case di cura ed ospedali (con fine di lucro)
D05	Istituto di credito, cambio e assicurazione (con fine di lucro)
D06	Fabbricati e locali per esercizi sportivi (con fine di lucro)
D07	Fabbricati costruiti o adattati per le speciali esigenze di un attivita industriale e non suscettibili di destinazione diversa senza radicali trasformazioni
D08	Fabbricati costruiti o adattati per le speciali esigenze di un attivita commerciale e non suscettibili di destinazione diversa senza radicali trasformazioni
D09	Edifici galleggianti o sospesi assicurati a punti fissi del suolo, ponti privati soggetti a pedaggio
D10	Fabbricati per funzioni produttive connesse alle attivita agricole
E01	Stazioni per servizi di trasporto, terrestri, marittimi ed aerei
E02	Ponti comunali e provinciali soggetti a pedaggio
E03	Costruzioni e fabbricati per speciali esigenze pubbliche
E04	Recinti chiusi per speciali esigenze pubbliche
E05	Fabbricati costituenti fortificazioni e loro dipendenze
E06	Fari, semafori, torri per rendere d uso pubblico l orologio comunale
E07	Fabbricati destinati all esercizio pubblico dei culti
E08	Fabbricati e costruzioni nei cimiteri, esclusi i colombari, i sepolcri e le tombe di famiglia
E09	Edifici a destinazione particolare non compresi nelle categorie precedenti del gruppo E
F01	Area urbana
F02	Unita collabenti
F03	Unita in corso di costruzione
F04	Unita in corso di definizione
F05	Lastrico solare
\.


--
-- TOC entry 5692 (class 0 OID 35010)
-- Dependencies: 264
-- Data for Name: cf_decode_consistenza; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cf_decode_consistenza (codice, descrizione) FROM stdin;
A	vani
B	metri cubi
C	metri quadrati
\.


--
-- TOC entry 5693 (class 0 OID 35013)
-- Dependencies: 265
-- Data for Name: cf_decode_flag_classamento; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cf_decode_flag_classamento (codice, descrizione) FROM stdin;
1	classamento proposto dalla parte
2	classamento proposto dalla parte e validato dall’ufficio
3	classamento automatico (attribuito in sostituzione del classamento proposto)
4	classamento rettificato (in sostituzione del classamento proposto)
5	classamento proposto divenuto definitivo per decorrenza termini
\.


--
-- TOC entry 5694 (class 0 OID 35016)
-- Dependencies: 266
-- Data for Name: cf_decode_toponimo; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cf_decode_toponimo (codice, descrizione) FROM stdin;
1	ALZATA
2	ANDRONA
4	ARCHIVOLTO
6	ARCO
8	ASCENSORE
10	ATRIO
12	BACINO
14	BAGLIO
16	BANCHINA
18	BASTIONI
20	BORGATA
22	BORGHETTO
24	BORGO
26	CALATA
28	CALLE
30	CALLESELLA
32	CAMPASSO
34	CAMPAZZO
36	CAMPIELLO
38	CAMPO
40	CASALE
42	CASE
44	CAVA
46	CAVALCAVIA
48	CHIASSO
50	CIRCONVALLAZIONE
52	CLIVIO
54	CONTRADA
56	CORSETTO
58	CORSO
60	CORTE
62	CORTICELLA
64	CORTILE
66	CUPA
68	DIRAMAZIONE
70	DISCESA
72	FONDACO
74	FONDAMENTA
76	FONDO
77	FRAZIONE
78	GALLERIA
80	GIARDINO
82	GRADINI
84	GRADONI
86	LARGO
88	LISTA
90	LOCALITA'
92	LOGGE
94	LUNGADIGE
96	LUNGARGINE
98	LUNGARNO
100	LUNGODORA
102	LUNGOMARE
106	LUNGOPO
108	LUNGOSTURA
110	LUNGOTEVERE
112	MASSERIA
114	MERCATO
116	MOLO
118	MULATTIERA
120	MURA
122	PARCO
124	PASSAGGIO
126	PASSEGGIATA
128	PASSETTO
130	PIAZZA
132	PIAZZALE
134	PIAZZETTA
136	PISCINA
138	PONTE
140	PONTILE
142	PORTA
144	PORTICO
146	PORTO
148	PROLUNGAMENTO
150	QUARTIERE
152	RAMI
154	RAMO
156	RAMPA
158	RAMPE
160	RECINTO
162	RIONE
164	RIVA
166	RIVIERA
168	ROTONDA
170	RUA
172	SALITA
174	SL
176	SALIZZATA
178	SCALA
180	SCALE
182	SCALEA
184	SCALETTA
186	SCALETTE
188	SCALI
190	SCALINATA
192	SCALONE
194	SDRUCCIOLO
196	SENTIERO
198	SESTRIERI
200	SITO
202	SOBBORGO
204	SOTTOPORTICO
206	SOTTOVIA
208	SPIANATA
210	STRADA
212	STRADALE
214	STRADELLA
216	STRADONE
218	SUPPORTICO
220	SVINCOLO
222	TRATTO
224	TRAVERSA
226	TRAVERSA VIA
228	TRESANDA
230	TRONCO
232	VALLONE
234	VARCO
236	VIA
238	VIADOTTO
240	VIALE
242	VIALETTO
244	VICO
246	VICOLETTO
248	VICOLO
250	VILLAGGIO
252	VIOTTOLO
254	VIUZZO
256	VO
258	VOLTA
260	PASSO
262	FORO
264	RIPA
266	RACCORDO
268	ALZAIA
300	ACCESSO
301	ACCESSO A CORSO
302	ACCESSO ALLA PIAZZA
303	ACCESSO ALLA VIA
304	ACCESSO VIALE
305	ACCESSO PRIVATO
306	ACCESSO STRADA
307	ACCESSO TRAVERSA
308	ALLEE
309	ALVEO
310	ANDRONE
311	ANGIPORTO
312	ARGINE
313	ARGINE DESTRO
314	ARGINE DI CANALE
315	ARGINE SINISTRO
316	AUTOSTRADA
317	AVENUE
318	BALUARDO
319	BARRIERA
320	BASTIONE
321	BASTIONI DI PORTA
322	BATTERIA
323	BISAGNO
324	BOCCA
325	BOULEVARD
326	CA'
327	CALA
328	CALETTA
329	CALLE DESTRA
330	CALLE LARGA
331	CALLE LITORANEA
332	CALLE SINISTRA
333	CALLE STRETTA
334	CALLESELLA DESTRA
335	CALLESELLA LARGA
336	CALLESELLA SINISTRA
337	CALLESELLE
338	CALLESELLE LARGHE
339	CALLESELLE STRETTE
340	CANALE
341	CANALE LARGO
342	CANTO
343	CANTONE
344	CAPO
345	CARRARA
346	CASCINA
347	CASE SPARSE
348	CAVALCAVIA DESTRO
349	CAVALCAVIA SINISTRO
350	CAVONE
351	CHIASSETTO
352	CHIASSUOLO
353	CIRCONVALLAZIONE DESTRA
354	CIRCONVALLAZIONE ESTERNA
355	CIRCONVALLAZIONE ESTRAMURALE
356	CIRCONVALLAZIONE INTERNA
357	CIRCONVALLAZIONE SINISTRA
358	CLAUSTRO
359	CLIVO
360	COMUNALE
361	CONTRA'
362	CORO
363	CORSIA
364	CORSIA DESTRA
365	CORSIA SINISTRA
366	CORSO PARALLELO
367	CORTINA
368	COSTA
369	COSTARELLA
370	CROSA
371	CROSINO
372	DARSENA
373	DIRAMAZIONE DEL CORSO
374	DIRAMAZIONE DEL VIALE
375	DIRAMAZIONE DI VIA
377	DIRUPO
378	DISTACCO
379	DORSO
380	EMICICLO
381	ERTA
382	FORTE
383	FOSSA
384	FOSSATO
385	FOSSO
386	GALLERIA DI CORSO
387	GRADINATA
388	GRADINATA DESTRA
389	GRADINATA SINISTRA
390	GRADINATA SUPERIORE
391	GRADINATE
392	GRADINATE SUPERIORI
393	GRANVIALE
394	LARGHETTO
395	LATERALE DI CORSO
396	LATERALE DI VIA
397	LATERALE DI VIALE
398	LIDO
399	LOGGIA
400	LUNGADIGE DESTRO
401	LUNGADIGE SINISTRO
402	LUNGARGINE DESTRO
403	LUNGARGINE SINISTRO
404	LUNGARNO DESTRO
405	LUNGARNO SINISTRO
406	LUNGOBISAGNO
407	LUNGOBISAGNO DESTRO
408	LUNGOBISAGNO SINISTRO
409	LUNGOCRATI
410	LUNGOCRATI DESTRO
411	LUNGOCRATI SINISTRO
412	LUNGODORA DESTRO
413	LUNGODORA SINISTRO
414	LUNGOFRIGIDO
415	LUNGOFRIGIDO DESTRO
416	LUNGOFRIGIDO SINISTRO
417	LUNGOGESSO
418	LUNGOGESSO DESTRO
419	LUNGOGESSO SINISTRO
420	LUNGOISARCO
421	LUNGOISARCO DESTRO
422	LUNGOISARCO SINISTRO
423	LUNGOLAGO
424	LUNGOLAGO DESTRO
425	LUNGOLAGO SINISTRO
426	LUNGOLARIO
427	LUNGOLARIO DESTRO
428	LUNGOLARIO SINISTRO
429	LUNGOMALLERO
430	LUNGOMALLERO DESTRO
431	LUNGOPARCO
432	LUNGOPO DESTRO
433	LUNGOPO SINISTRO
434	LUNGOSTURA DESTRO
435	LUNGOSTURA SINISTRO
436	LUNGOTALVERE
437	LUNGOTALVERE DESTRO
438	LUNGOTALVERE SINISTRO
439	LUNGOTEVERE DESTRO
440	LUNGOTEVERE SINISTRO
441	LUNGOTICINO
442	LUNGOTICINO DESTRO
443	LUNGOTICINO SINISTRO
444	LUNGOTORRENTE
445	LUNGOTORRENTE DESTRO
446	LUNGOTORRENTE SINISTRO
447	LUNGOTRONTO
448	LUNGOTRONTO DESTRO
449	LUNGOTRONTO SINISTRO
450	MARZARIA
451	MASSERIA VECCHIA
452	MERCERIA
453	MOLO ANTICO
454	MURAZZI
455	MURE
456	PARALLELA DESTRA
457	PARALLELA SINISTRA
458	PASSEGGIO
459	PENDICE
460	PENDIO
461	PENNINATO
462	PIAGGIA
463	PIANO
464	PIATTAFORMA
465	PIAZZA BELVEDERE
466	PIAZZA CHIUSA
467	PIAZZA COMUNALE
468	PIAZZA INFERIORE
469	PIAZZOLA
470	PLACE
471	POGGIO
472	PORTELLA
473	PORTICATO
474	PORTICCIOLO
475	PORTICHETTI
476	PORTICI
477	PRATO
478	PROLUNGAMENTO DI CORSO
479	PROLUNGAMENTO DEL VIALE
480	PROLUNGAMENTO DELLA VIA
481	PROVINCIALE
482	QUADRATO
483	RAMPA DEL CORSO
484	RAMPA DEL VIALE
485	RAMPA PIAZZA
486	RAMPA VIA
487	RAMPA DESTRA
488	RAMPA SINISTRA
489	RAMPA STRADA
490	RIALTO
491	RIGASTE
492	RIO
493	RIO TERRA'
494	RIPARTO
495	RIVETTA
496	RONCO
497	RONDO
498	ROUTE
499	RUE
500	RUGA
501	RUGA DESTRA
502	RUGA SINISTRA
503	RUGHETTA
504	RUGHETTA DESTRA
505	RUGHETTA SINISTRA
506	SALITA DESTRA
507	SALITA PER CORSO
508	SALITA PER PIAZZA
509	SALITA PER VIA
510	SALITA PER VIALE
511	SALITA SINISTRA
512	SALITA SUPERIORE
513	SALIZZATA DESTRA
514	SALIZADA SINISTRA
515	SBARCATOIO
516	SCALA DESTRA
517	SCALA SINISTRA
518	SCALEO
519	SCALETTA DESTRA
520	SCALETTA SINISTRA
521	SCALINATA DESTRA
522	SCALINATA SINISTRA
523	SCALO
524	SCESA
525	SCESE
526	SELCIATO
527	SENTIERO PANORAMICO
528	SESTIERE
529	SOTTOPASSAGGI
530	SOTTOPASSAGGIO
531	SOTTOPASSO
532	SPALTO
533	SPIAGGIA
534	SPIAZZO
535	STATALE
536	STAZZO
537	STRADA ACCORCIATOIA
538	STRADA ALTA
539	STRADA ANTICA
540	STRADA ARGINALE
541	STRADA BASSA
542	STRADA CANTONIERA
543	STRADA CHIUSA
544	STRADA CIECA
545	STRADA CIRCOLARE
546	STRADA COMUNALE
547	STRADA CONSORZIALE
548	STRADA DESTRA
549	STRADA DI LEVANTE
550	STRADA DI PONENTE
551	STRADA ESTERNA
552	STRADA EXTRAMURALE
553	STRADA INFERIORE
554	STRADA INTERCOMUNALE
555	STRADA INTERNA
556	STRADA INTERPODERALE
557	STRADA LARGA
558	STRADA LATERALE
559	STRADA LITORANEA
560	STRADA MULATTIERA
561	STRADA NUOVA
562	STRADA PANORAMICA
563	STRADA PARALLELA
564	STRADA PEDEMONTANA
565	STRADA PRIVATA
566	STRADA PROVINCIALE
567	STRADA ROMANA
568	STRADA ROTABILE
569	STRADA RURALE
570	STRADA SINISTRA
571	STRADA STATALE
572	STRADA STORTA
573	STRADA STRETTA
574	STRADA SUPERIORE
575	STRADA TANGENZIALE
576	STRADA TRASVERSALE
577	STRADA TRAVERSA
578	STRADA VECCHIA
579	STRADA VICINALE
580	STRADELLA DESTRA
581	STRADELLA SINISTRA
582	STRETTO
583	STRETTOIA
584	STRETTOIA DESTRA
585	STRETTOIA SINISTRA
586	STRETTOLA
587	STURA
588	SUPERSTRADA
589	TANGENZIALE
590	TERRAZZA
591	TRASVERSALE DEL CORSO
592	TRASVERSALE DI VIALE
593	TRASVERSALE VIA
594	TRAVERSALE PRIVATA
595	TRASVERSALE PROVINCIALE
596	TRAVERSALE STRADA
597	TRATTURO
598	TRAVERSA CORSO
599	TRAVERSA DEL VIALE
600	TRAVERSA DEL VILLAGGIO
601	TRAVERSA DELLA LOCALITA'
602	TRAVERSA DI VIA
603	TRAVERSA PRIVATA
604	TRAVERSA STRADA
605	VALCO
606	VALICO
607	VALLE
608	VIA ACCORCIATOIA
609	VIA ALTA
610	VIA ANTICA
611	VIA ARGINALE
612	VIA BASSA
613	VIA BELVEDERE
614	VIA CANTONIERA
615	VIA CHIUSA
616	VIA CIECA
617	VIA CIRCOLARE
618	VIA CIRCUMVALLAZIONE
619	VIA COMUNALE
620	VIA CONSORZIALE
621	VIA DESTRA
622	VIA DI LEVANTE
623	VIA DI PONENTE
624	VIA ESTERNA
625	VIA ESTRAMURALE
626	VIA INFERIORE
627	VIA INTERCOMUNALE
628	VIA INTERNA
629	VIA INTERPODERALE
630	VIA LARGA
631	VIA LATERALE
632	VIA LITORANEA
633	VIA LUNGOMARE
634	VIA MULATTIERA
635	VIA NUOVA
636	VIA PANORAMICA
637	VIA PARALLELA
638	VIA PEDEMONTANA
639	VIA PRIVATA
640	VIA PROVINCIALE
641	VIA ROMANA
642	VIA ROTABILE
643	VIA RURALE
644	VIA SINISTRA
645	VIA STATALE
646	VIA STORTA
647	VIA STRETTA
648	VIA SUPERIORE
649	VIA TANGENZIALE
650	VIA TRASVERSALE
651	VIA TRAVERSA
652	VIA VECCHIA
653	VIA VICINALE
654	VIALE BELVEDERE
655	VIALE LITORANEO
656	VIALE LUNGOMARE
657	VIALONE
658	VICO ALTO
659	VICO BASSO
660	VICO BELVEDERE
661	VICO CHIUSO
662	VICO CIECO
663	VICO DRITTO
664	VICO INFERIORE
665	VICO LUNGO
666	VICO NUOVO
667	VICO PRIVATO
668	VICO STORTO
669	VICO STRETTO
670	VICO VECCHIO
671	VICOLETTO CHIUSO
672	VICOLETTO CIECO
673	VICOLETTO DRITTO
674	VICOLETTO INFERIORE
675	VICOLETTO LUNGO
676	VICOLETTO NUOVO
677	VICOLETTO PRIVATO
678	VICOLETTO STORTO
679	VICOLETTO STRETTO
680	VICOLETTO VECCHIO
681	VICOLO ALTO
682	VICOLO BASSO
683	VICOLO BELVEDERE
684	VICOLO CHIUSO
685	VICOLO CIECO
686	VICOLO DRITTO
687	VICOLO INFERIORE
688	VICOLO LUNGO
689	VICOLO NUOVO
690	VICOLO PRIVATO
691	VICOLO STORTO
692	VICOLO STRETTO
693	VICOLO VECCHIO
694	VIELLA
695	VIETTA
696	VIOTTOLA
697	VIUZZA
698	VO'
699	VOCABOLO
700	VOLTE
701	VOLTO
702	VOLTONE
703	ZIPA
704	COLLE
705	ZONA
706	REGIONE
707	PODERE
708	PASSO PRIVATO
709	SALITA INFERIORE
710	CUPA VICINALE
711	CUPA VECCHIA
712	GALLERIA PRIVATA
713	LARGO PRIVATO
714	PENDINO
715	PENNINATA
716	TONDO
717	VANELLA
718	VIALE PRIVATO
719	VICO ROTTO
\.


--
-- TOC entry 5695 (class 0 OID 35076)
-- Dependencies: 287
-- Data for Name: ct_decode_destinazioni; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY ct_decode_destinazioni (codice, descrizione) FROM stdin;
1	seminativo
354	androne
3	semin arboreo
4	sem arb irr
5	sem irr arb
6	sem pez fos
7	sem arb p f
8	prato
9	prato irriguo
10	prato arboreo
11	prato ir ar
12	prato marc
13	prato mar ar
14	marcita
15	risaia
16	risaia stab
17	orto
18	orto irriguo
19	orto arboreo
20	orto ar irr
355	area
22	orto pez fos
23	orto fiori
24	orto ir fi
25	ort viv flo
26	vivaio
27	viv orn fl
28	giardini
29	vigneto
30	vigneto arb
31	vigneto irr
32	vig uva tav
33	vign frutt
34	vign ulivet
35	vign mandor
36	uliveto
37	uliv agrum
38	uliv fichet
39	ul fich man
40	uliv frass
41	uliv frutt
42	uliv sommac
43	uliv vignet
44	uliv sugher
45	uliv mandor
46	ul man pist
47	frutteto
48	frutt irrig
49	agrumeto
50	agrum aranc
51	agrum irrig
52	agrum uliv
53	alpe
54	aranceto
55	canneto
56	cappereto
57	carrubeto
58	castagneto
59	cast frutto
60	cast frass
61	chiusa
62	eucalipteto
63	ficheto
64	fico india
65	fico mandor
66	frassineto
67	gelseto
68	limoneto
69	mandorleto
70	mandor fich
71	mandor fico
72	mandarineto
73	noceto
74	noccioleto
75	nocc vignet
76	palmeto
77	pescheto
78	pioppeto
79	pistacch
80	pometo
81	querceto
82	querc ghian
83	roseto
84	saliceto
85	salceto
86	sommaccheto
87	sommac arb
88	somm mandor
89	sommac uliv
90	sughereto
91	pascolo
92	pascolo arb
93	pasc cespug
94	pascolo bc
95	pascolo bm
96	pascolo ba
97	bosco ceduo
98	bosco misto
99	bosco alto
100	palud spart
101	incolt prod
102	orto irr ar
103	nocciol irr
104	sem car irr
105	pereto
106	sem irr prot
107	bosco rap ac
126	serra
127	funghicoltur
130	arativi
131	seminativi
132	prati
133	orti
134	vigneti
135	pascoli
136	alpi
137	lag pal st
138	boschi
150	incolt ster
151	lago pubbl
152	laguna
153	stagno
180	cava
181	lago pesca
182	miniera
183	salina
184	stagn pesca
185	tonnara
186	torbiera
187	valle pesca
188	acque priv
200	aeroporto d
201	aer fort d
202	autovia sp
203	area dem pp
204	banchina
205	cimitero
206	ferrovia sp
207	fortificaz
208	giard pub
209	giard dem
210	giard com
211	giard prov
212	molo
213	parco pubb
214	parco deman
215	parco comun
216	parco prov
217	p v rimembr
218	pza d armi
219	porto
220	somm arg 2
221	somm arg 3
222	tranvia sp
223	somm arg 1
250	canale bon
251	canale irr
252	gora
270	antichita
271	area fab dm
272	area promis
273	area rurale
274	area urbana
275	corte urban
276	costr no ab
277	fa div sub
278	fabb promis
279	fabb rurale
280	fabb diruto
281	fr div sub
282	ente urbano
283	fu d accert
284	porz acc fr
285	porz acc fu
286	porz di fa
287	porz di fr
288	porz rur fp
290	porz di fu
300	acque esent
301	piazza pubb
302	strade pubb
350	accesso
351	accessorio
352	aia
353	andito
356	ascensore
357	autorimessa
358	ballatoio
359	bindolo
360	bottino
361	bucataio
362	canale priv
363	cantina
364	capanna
365	cappella
366	carbonile
367	casello
368	casotto
369	cisterna
370	concimaia
371	conigliera
372	corridoio
373	corte
374	fontana
375	fontanile
376	forno
377	frantoio
378	garage
379	garitta
380	grotta
381	ingresso
382	latrina
383	lavanderia
384	lavatoio
385	legnaia
386	locale dep
387	loggia
388	luogo dep
389	macero
390	montacarichi
391	muro
392	noria
393	oratorio
394	palmeto
395	passaggio
396	passo
397	piazza
398	piazzale
399	pollaio
400	pompa
401	porcile
402	portico
403	portineria
404	portone
405	pozzo
406	resede
407	rifugio ant
408	rimessa
409	ripostiglio
410	scala
411	scolo acqua
412	seccatoio
413	sedime
414	sentina
415	sorgiva
416	sottoscala
417	sottopassag
418	spazio
419	stalla
420	strada priv
421	terrazzo
422	tettoia
423	tinaia
424	vano
425	vasca
450	rel ente ur
451	rel acc com
452	rel f d sub
453	rel acq es
454	relit strad
455	terr n form
500	casa e corte
501	fabb e corte
504	incolto
505	improdutt
506	sentiero
507	ponte
508	cavalcavia
509	casa stalla
510	chiesa
511	edificabile
512	cortile
513	magazzino
514	fosso
515	casa
516	edificio
517	fabbricato
602	lag pal sta
993	modello 26
997	sop var ter
998	soppresso
2	semin irriguo
21	orto frutteto
\.


--
-- TOC entry 5696 (class 0 OID 35079)
-- Dependencies: 288
-- Data for Name: ct_decode_flag; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY ct_decode_flag (codice, descrizione) FROM stdin;
0	non calcolabile
1	calcolabile
\.


--
-- TOC entry 5697 (class 0 OID 35111)
-- Dependencies: 298
-- Data for Name: cu_decode_comune; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cu_decode_comune (codice, descrizione) FROM stdin;
A074	Agliè
A109	Airasca
A117	Ala di Stura
A157	Albiano d'Ivrea
A199	Alice Superiore
A218	Almese
A221	Alpette
A222	Alpignano
A275	Andezeno
A282	Andrate
A295	Angrogna
A405	Arignano
A518	Avigliana
A525	Azeglio
A584	Bairo
A587	Balangero
A590	Baldissero Canavese
A591	Baldissero Torinese
A599	Balme
A607	Banchette
A625	Barbania
A651	Bardonecchia
A673	Barone Canavese
A734	Beinasco
A853	Bibiana
A910	Bobbio Pellice
A941	Bollengo
A990	Borgaro Torinese
B003	Borgiallo
B015	Borgofranco d'Ivrea
B021	Borgomasino
B024	Borgone Susa
B075	Bosconero
B121	Brandizzo
B171	Bricherasio
B205	Brosso
B209	Brozolo
B216	Bruino
B225	Brusasco
B232	Bruzolo
B278	Buriasco
B279	Burolo
B284	Busano
B297	Bussoleno
B305	Buttigliera Alta
B350	Cafasse
B435	Caluso
B462	Cambiano
B512	Campiglione Fenile
B588	Candia Canavese
B592	Candiolo
B605	Canischio
B628	Cantalupa
B637	Cantoira
B705	Caprie
B733	Caravino
B762	Carema
B777	Carignano
B791	Carmagnola
B867	Casalborgone
B953	Cascinette d'Ivrea
B955	Caselette
B960	Caselle Torinese
C045	Castagneto Po
C048	Castagnole Piemonte
C133	Castellamonte
C241	Castelnuovo Nigra
C307	Castiglione Torinese
C369	Cavagnolo
C404	Cavour
C487	Cercenasco
C497	Ceres
C505	Ceresole Reale
C564	Cesana Torinese
C604	Chialamberto
C610	Chianocco
C624	Chiaverano
C627	Chieri
C629	Chiesanuova
C639	Chiomonte
C655	Chiusa di San Michele
C665	Chivasso
C679	Ciconio
C711	Cintano
C715	Cinzano
C722	Ciriè
C793	Claviere
C801	Coassolo Torinese
C803	Coazze
C860	Collegno
C867	Colleretto Castelnuovo
C868	Colleretto Giacosa
C955	Condove
D008	Corio
D092	Cossano Canavese
D197	Cuceglio
D202	Cumiana
D208	Cuorgnè
D373	Druento
D433	Exilles
D520	Favria
D524	Feletto
D532	Fenestrelle
D562	Fiano
D608	Fiorano Canavese
D646	Foglizzo
D725	Forno Canavese
D781	Frassinetto
D805	Front
D812	Frossasco
D931	Garzigliana
D933	Gassino Torinese
D983	Germagnano
E009	Giaglione
E020	Giaveno
E067	Givoletto
E154	Gravere
E199	Groscavallo
E203	Grosso
E216	Grugliasco
E301	Ingria
E311	Inverso Pinasca
E345	Isolabella
E368	Issiglio
E379	Ivrea
E394	La Cassa
E423	La Loggia
E445	Lanzo Torinese
E484	Lauriano
E518	Leini
E520	Lemie
E551	Lessolo
E566	Levone
E635	Locana
E660	Lombardore
E661	Lombriasco
E683	Loranzè
E727	Lugnacco
E758	Luserna San Giovanni
E759	Lusernetta
E763	Lusigliè
E782	Macello
E817	Maglione
E941	Marentino
F041	Massello
F053	Mathi
F058	Mattie
F067	Mazzè
F074	Meana di Susa
F140	Mercenasco
F164	Meugliano
F182	Mezzenile
F315	Mombello di Torino
F318	Mompantero
F327	Monastero di Lanzo
F335	Moncalieri
D553	Moncenisio
F407	Montaldo Torinese
F411	Montalenghe
F420	Montalto Dora
F422	Montanaro
F651	Monteu da Po
F733	Moriondo Torinese
F889	Nichelino
F906	Noasca
F925	Nole
F927	Nomaglio
F931	None
F948	Novalesa
G010	Oglianico
G087	Orbassano
G109	Orio Canavese
G151	Osasco
G152	Osasio
G196	Oulx
G202	Ozegna
G262	Palazzo Canavese
G303	Pancalieri
G330	Parella
G387	Pavarolo
G392	Pavone Canavese
G396	Pecco
G398	Pecetto Torinese
G463	Perosa Argentina
G462	Perosa Canavese
G465	Perrero
G477	Pertusio
G505	Pessinetto
G559	Pianezza
G672	Pinasca
G674	Pinerolo
G678	Pino Torinese
G684	Piobesi Torinese
G691	Piossasco
G705	Piscina
G719	Piverone
G777	Poirino
G805	Pomaretto
G826	Pont-Canavese
G900	Porte
G973	Pragelato
G978	Prali
G979	Pralormo
G982	Pramollo
G986	Prarostino
G988	Prascorsano
G997	Pratiglione
H100	Quagliuzzo
H120	Quassolo
H127	Quincinetto
H207	Reano
H270	Ribordone
H333	Rivalba
H335	Rivalta di Torino
H337	Riva presso Chieri
H338	Rivara
H340	Rivarolo Canavese
H344	Rivarossa
H355	Rivoli
H367	Robassomero
H386	Rocca Canavese
H498	Roletto
H511	Romano Canavese
H539	Ronco Canavese
H547	Rondissone
H554	Rorà
H555	Roure
H583	Rosta
H627	Rubiana
H631	Rueglio
H691	Salassa
H684	Salbertrand
H702	Salerano Canavese
H734	Salza di Pinerolo
H753	Samone
H775	San Benigno Canavese
H789	San Carlo Canavese
H804	San Colombano Belmonte
H820	San Didero
H847	San Francesco al Campo
H855	Sangano
H862	San Germano Chisone
H873	San Gillio
H890	San Giorgio Canavese
H900	San Giorio di Susa
H936	San Giusto Canavese
H997	San Martino Canavese
I024	San Maurizio Canavese
I030	San Mauro Torinese
I090	San Pietro Val Lemina
I126	San Ponso
I137	San Raffaele Cimena
I152	San Sebastiano da Po
I154	San Secondo di Pinerolo
I258	Sant'Ambrogio di Torino
I296	Sant'Antonino di Susa
I327	Santena
I465	Sauze di Cesana
I466	Sauze d'Oulx
I490	Scalenghe
I511	Scarmagno
I539	Sciolze
I692	Sestriere
I701	Settimo Rottaro
I703	Settimo Torinese
I702	Settimo Vittone
I886	Sparone
I969	Strambinello
I970	Strambino
L013	Susa
L066	Tavagnasco
L219	Torino
L238	Torrazza Piemonte
L247	Torre Canavese
L277	Torre Pellice
L327	Trana
L338	Trausella
L345	Traversella
L340	Traves
L445	Trofarello
L515	Usseaux
L516	Usseglio
L538	Vaie
L555	Val della Torre
L578	Valgioie
L629	Vallo Torinese
L644	Valperga
B510	Valprato Soana
L685	Varisella
L698	Vauda Canavese
L726	Venaus
L727	Venaria Reale
L779	Verolengo
L787	Verrua Savoia
L811	Vestignè
L830	Vialfrè
L548	Vico Canavese
L857	Vidracco
L898	Vigone
L948	Villafranca Piemonte
L982	Villanova Canavese
M002	Villarbasse
L999	Villar Dora
M004	Villareggia
M007	Villar Focchiardo
M013	Villar Pellice
M014	Villar Perosa
M027	Villastellone
M060	Vinovo
M069	Virle Piemonte
M071	Vische
M080	Vistrorio
M094	Viù
M122	Volpiano
M133	Volvera
M316	Mappano
A119	Alagna Valsesia
A130	Albano Vercellese
A198	Alice Castello
A358	Arborio
A466	Asigliano Vercellese
A600	Balmuccia
A601	Balocco
A847	Bianzè
A914	Boccioleto
B009	Borgo d'Ale
B041	Borgosesia
B046	Borgo Vercelli
B136	Breia
B280	Buronzo
B505	Campertogno
B752	Carcoforo
B767	Caresana
B768	Caresanablot
B782	Carisio
B928	Casanova Elvo
B952	San Giacomo Vercellese
C450	Cellio
C548	Cervatto
C680	Cigliano
C757	Civiasco
C884	Collobiano
D113	Costanzana
D132	Cravagliana
D154	Crescentino
D187	Crova
D281	Desana
D641	Fobello
D676	Fontanetto Po
D712	Formigliana
D938	Gattinara
E007	Ghislarengo
E163	Greggio
E237	Guardabosone
E433	Lamporo
E528	Lenta
E583	Lignana
E626	Livorno Ferraris
E711	Lozzolo
F297	Mollia
F342	Moncrivello
F774	Motta de' Conti
G016	Olcenengo
G018	Oldenico
G266	Palazzolo Vercellese
G471	Pertengo
G528	Pezzana
G666	Pila
G685	Piode
G940	Postua
G985	Prarolo
H108	Quarona
H132	Quinto Vercellese
H188	Rassa
H291	Rima San Giuseppe
H292	Rimasco
H293	Rimella
H329	Riva Valdobbia
H346	Rive
H365	Roasio
H549	Ronsecco
H577	Rossa
H364	Rovasenda
H648	Sabbia
H690	Salasco
H707	Sali Vercellese
H725	Saluggia
H861	San Germano Vercellese
I337	Santhià
I544	Scopa
I545	Scopello
I663	Serravalle Sesia
I984	Stroppiana
L420	Tricerro
L429	Trino
L451	Tronzano Vercellese
L566	Valduggia
L669	Varallo
L750	Vercelli
M003	Villarboit
M028	Villata
M106	Vocca
A088	Agrate Conturbia
A264	Ameno
A414	Armeno
A429	Arona
A653	Barengo
A752	Bellinzago Novarese
A844	Biandrate
A911	Boca
A929	Bogogno
A953	Bolzano Novarese
B016	Borgolavezzaro
B019	Borgomanero
B043	Borgo Ticino
B176	Briga Novarese
B183	Briona
B431	Caltignaga
B473	Cameri
B823	Carpignano Sesia
B864	Casalbeltrame
B883	Casaleggio Novara
B897	Casalino
B920	Casalvolone
C149	Castellazzo Novarese
C166	Castelletto sopra Ticino
C364	Cavaglietto
C365	Cavaglio d'Agogna
C378	Cavallirio
C483	Cerano
C829	Colazza
C926	Comignago
D162	Cressa
D216	Cureggio
D309	Divignano
D347	Dormelletto
D492	Fara Novarese
D675	Fontaneto d'Agogna
D872	Galliate
D911	Garbagna Novarese
D921	Gargallo
D937	Gattico
E001	Ghemme
E120	Gozzano
E143	Granozzo con Monticello
E177	Grignasco
E314	Invorio
E436	Landiona
E544	Lesa
E803	Maggiora
E880	Mandello Vitta
E907	Marano Ticino
F047	Massino Visconti
F093	Meina
F188	Mezzomerico
F191	Miasino
F317	Momo
F859	Nebbiuno
F886	Nibbiola
F952	Novara
G019	Oleggio
G020	Oleggio Castello
G134	Orta San Giulio
G349	Paruzzaro
G421	Pella
G520	Pettenasco
G703	Pisano
G775	Pogno
G809	Pombia
H001	Prato Sesia
H213	Recetto
H502	Romagnano Sesia
H518	Romentino
I025	San Maurizio d'Opaglio
I052	San Nazzaro Sesia
I116	San Pietro Mosezzo
I736	Sillavengo
I767	Sizzano
I857	Soriso
I880	Sozzago
L007	Suno
L104	Terdobbiate
L223	Tornaco
L356	Trecate
L668	Vaprio d'Agogna
L670	Varallo Pombia
L798	Veruno
L808	Vespolate
L847	Vicolungo
M062	Vinzaglio
A016	Acceglio
A113	Aisone
A124	Alba
A139	Albaretto della Torre
A238	Alto
A394	Argentera
A396	Arguello
A555	Bagnasco
A571	Bagnolo Piemonte
A589	Baldissero d'Alba
A629	Barbaresco
A660	Barge
A671	Barolo
A709	Bastia Mondovì
A716	Battifollo
A735	Beinette
A750	Bellino
A774	Belvedere Langhe
A779	Bene Vagienna
A782	Benevello
A798	Bergolo
A805	Bernezzo
A979	Bonvicino
B018	Borgomale
B033	Borgo San Dalmazzo
B079	Bosia
B084	Bossolasco
B101	Boves
B111	Bra
B167	Briaglia
B175	Briga Alta
B200	Brondello
B204	Brossasco
B285	Busca
B467	Camerana
B489	Camo
B573	Canale
B621	Canosio
B692	Caprauna
B719	Caraglio
B720	Caramagna Piemonte
B755	Cardè
B841	Carrù
B845	Cartignano
B894	Casalgrasso
C046	Castagnito
C081	Casteldelfino
C140	Castellar
C165	Castelletto Stura
C167	Castelletto Uzzone
C173	Castellinaldo
C176	Castellino Tanaro
C205	Castelmagno
C214	Castelnuovo di Ceva
C314	Castiglione Falletto
C317	Castiglione Tinella
C323	Castino
C375	Cavallerleone
C376	Cavallermaggiore
C441	Celle di Macra
C466	Centallo
C504	Ceresole Alba
C530	Cerretto Langhe
C547	Cervasca
C550	Cervere
C589	Ceva
C599	Cherasco
C653	Chiusa di Pesio
C681	Cigliè
C738	Cissone
C792	Clavesana
D022	Corneliano d'Alba
D062	Cortemilia
D093	Cossano Belbo
D120	Costigliole Saluzzo
D133	Cravanzana
D172	Crissolo
D205	Cuneo
D271	Demonte
D291	Diano d'Alba
D314	Dogliani
D372	Dronero
D401	Elva
D410	Entracque
D412	Envie
D499	Farigliano
D511	Faule
D523	Feisoglio
D742	Fossano
D751	Frabosa Soprana
D752	Frabosa Sottana
D782	Frassino
D856	Gaiola
D894	Gambasca
D920	Garessio
D967	Genola
E111	Gorzegno
E115	Gottasecca
E118	Govone
E182	Grinzane Cavour
E251	Guarene
E282	Igliano
E327	Isasca
E406	Lagnasco
E430	La Morra
E540	Lequio Berria
E539	Lequio Tanaro
E546	Lesegno
E564	Levice
E597	Limone Piemonte
E615	Lisio
E789	Macra
E809	Magliano Alfieri
E808	Magliano Alpi
E887	Mango
E894	Manta
E939	Marene
E945	Margarita
E963	Marmora
E973	Marsaglia
E988	Martiniana Po
F114	Melle
F279	Moiola
F309	Mombarcaro
F312	Mombasiglio
F326	Monastero di Vasco
F329	Monasterolo Casotto
F330	Monasterolo di Savigliano
F338	Monchiero
F351	Mondovì
F355	Monesiglio
F358	Monforte d'Alba
F385	Montà
F405	Montaldo di Mondovì
F408	Montaldo Roero
F424	Montanera
F550	Montelupo Albese
F558	Montemale di Cuneo
F608	Monterosso Grana
F654	Monteu Roero
F666	Montezemolo
F669	Monticello d'Alba
F723	Moretta
F743	Morozzo
F809	Murazzano
F811	Murello
F846	Narzole
F863	Neive
F883	Neviglie
F894	Niella Belbo
F895	Niella Tanaro
F961	Novello
F972	Nucetto
G066	Oncino
G114	Ormea
G183	Ostana
G228	Paesana
G240	Pagno
G302	Pamparato
G339	Paroldo
G457	Perletto
G458	Perlo
G526	Peveragno
G532	Pezzolo Valle Uzzone
G561	Pianfei
G575	Piasco
G625	Pietraporzio
G683	Piobesi d'Alba
G697	Piozzo
G742	Pocapaglia
G800	Polonghera
G837	Pontechianale
G970	Pradleves
H011	Prazzo
H059	Priero
H068	Priocca
H069	Priola
H085	Prunetto
H150	Racconigi
H247	Revello
H285	Rifreddo
H326	Rittana
H362	Roaschia
H363	Roascio
H377	Robilante
H378	Roburent
H385	Roccabruna
H391	Rocca Cigliè
H395	Rocca de' Baldi
H407	Roccaforte Mondovì
H447	Roccasparvera
H453	Roccavione
H462	Rocchetta Belbo
H472	Roddi
H473	Roddino
H474	Rodello
H578	Rossana
H633	Ruffia
H695	Sale delle Langhe
H704	Sale San Giovanni
H710	Saliceto
H716	Salmour
H727	Saluzzo
H746	Sambuco
H755	Sampeyre
H770	San Benedetto Belbo
H812	San Damiano Macra
H851	Sanfrè
H852	Sanfront
I037	San Michele Mondovì
I210	Sant'Albano Stura
I316	Santa Vittoria d'Alba
I367	Santo Stefano Belbo
I372	Santo Stefano Roero
I470	Savigliano
I484	Scagnello
I512	Scarnafigi
I646	Serralunga d'Alba
I659	Serravalle Langhe
I750	Sinio
I817	Somano
I822	Sommariva del Bosco
I823	Sommariva Perno
I985	Stroppo
L048	Tarantasca
L252	Torre Bormida
L241	Torre Mondovì
L278	Torre San Giorgio
L281	Torresina
L367	Treiso
L410	Trezzo Tinella
L427	Trinità
L558	Valdieri
L580	Valgrana
L631	Valloriate
L636	Valmala
L729	Venasca
L758	Verduno
L771	Vernante
L804	Verzuolo
L817	Vezza d'Alba
L841	Vicoforte
L888	Vignolo
L942	Villafalletto
L974	Villanova Mondovì
L990	Villanova Solaro
M015	Villar San Costanzo
M055	Vinadio
M063	Viola
M136	Vottignasco
A072	Agliano Terme
A173	Albugnano
A312	Antignano
A352	Aramengo
A479	Asti
A527	Azzano d'Asti
A588	Baldichieri d'Asti
A770	Belveglio
A812	Berzano di San Pietro
B221	Bruno
B236	Bubbio
B306	Buttigliera d'Asti
B376	Calamandrana
B418	Calliano
B425	Calosso
B469	Camerano Casasco
B594	Canelli
B633	Cantarana
B707	Capriglio
B991	Casorzo
C022	Cassinasco
C049	Castagnole delle Lanze
C047	Castagnole Monferrato
C064	Castel Boglione
C127	Castell'Alfero
C154	Castellero
C161	Castelletto Molina
A300	Castello di Annone
C226	Castelnuovo Belbo
C230	Castelnuovo Calcea
C232	Castelnuovo Don Bosco
C253	Castel Rocchero
C438	Cellarengo
C440	Celle Enomondo
C528	Cerreto d'Asti
C533	Cerro Tanaro
C583	Cessole
C658	Chiusano d'Asti
C701	Cinaglio
C739	Cisterna d'Asti
C804	Coazzolo
C807	Cocconato
D046	Corsione
D050	Cortandone
D051	Cortanze
D052	Cortazzone
D072	Cortiglione
D101	Cossombrato
D119	Costigliole d'Asti
D207	Cunico
D388	Dusino San Michele
D554	Ferrere
D678	Fontanile
D802	Frinco
E134	Grana
E159	Grazzano Badoglio
E295	Incisa Scapaccino
E338	Isola d'Asti
E633	Loazzolo
E917	Maranzana
E944	Maretto
F254	Moasca
F308	Mombaldone
F311	Mombaruzzo
F316	Mombercelli
F323	Monale
F325	Monastero Bormida
F336	Moncalvo
F343	Moncucco Torinese
F361	Mongardino
F386	Montabone
F390	Montafia
F409	Montaldo Scarampi
F468	Montechiaro d'Asti
F527	Montegrosso d'Asti
F556	Montemagno
F709	Moransengo
F902	Nizza Monferrato
G048	Olmo Gentile
G358	Passerano Marmorito
G430	Penango
G593	Piea
G676	Pino d'Asti
G692	Piovà Massaia
G894	Portacomaro
H102	Quaranti
H219	Refrancore
H250	Revigliasco d'Asti
H366	Roatto
H376	Robella
H392	Rocca d'Arazzo
H451	Roccaverano
H466	Rocchetta Palafea
H468	Rocchetta Tanaro
H811	San Damiano d'Asti
H899	San Giorgio Scarampi
H987	San Martino Alfieri
I017	San Marzano Oliveto
I076	San Paolo Solbrito
I555	Scurzolengo
I637	Serole
I678	Sessame
I698	Settime
I781	Soglio
L168	Tigliole
L203	Tonco
L204	Tonengo
L531	Vaglio Serra
L574	Valfenera
L807	Vesime
L829	Viale
L834	Viarigi
L879	Vigliano d'Asti
L945	Villafranca d'Asti
L984	Villanova d'Asti
M019	Villa San Secondo
M058	Vinchio
M302	Montiglio Monferrato
A052	Acqui Terme
A146	Albera Ligure
A182	Alessandria
A189	Alfiano Natta
A197	Alice Bel Colle
A211	Alluvioni Cambiò
A227	Altavilla Monferrato
A245	Alzano Scrivia
A436	Arquata Scrivia
A523	Avolasca
A605	Balzola
A689	Basaluzzo
A708	Bassignana
A738	Belforte Monferrato
A793	Bergamasco
A813	Berzano di Tortona
A889	Bistagno
A998	Borghetto di Borbera
B029	Borgoratto Alessandrino
B037	Borgo San Martino
B071	Bosco Marengo
B080	Bosio
B109	Bozzole
B179	Brignano-Frascata
B311	Cabella Ligure
B453	Camagna Monferrato
B482	Camino
B629	Cantalupo Ligure
B701	Capriata d'Orba
B736	Carbonara Scrivia
B765	Carentino
B769	Carezzano
B818	Carpeneto
B836	Carrega Ligure
B840	Carrosio
B847	Cartosio
B870	Casal Cermelli
B882	Casaleggio Boiro
B885	Casale Monferrato
B902	Casalnoceto
B941	Casasco
C005	Cassano Spinola
C027	Cassine
C030	Cassinelle
C137	Castellania
C142	Castellar Guidobono
C148	Castellazzo Bormida
C156	Castelletto d'Erro
C158	Castelletto d'Orba
C160	Castelletto Merli
C162	Castelletto Monferrato
C229	Castelnuovo Bormida
C243	Castelnuovo Scrivia
C274	Castelspina
C387	Cavatore
C432	Cella Monte
C503	Cereseto
C507	Cerreto Grue
C531	Cerrina Monferrato
C962	Coniolo
C977	Conzano
D102	Costa Vescovato
D149	Cremolino
D194	Cuccaro Monferrato
D272	Denice
D277	Dernice
D447	Fabbrica Curone
D528	Felizzano
D559	Fraconalto
D759	Francavilla Bisio
D770	Frascaro
D777	Frassinello Monferrato
D780	Frassineto Po
D797	Fresonara
D813	Frugarolo
D814	Fubine
D835	Gabiano
D890	Gamalero
D910	Garbagna
D941	Gavazzana
D944	Gavi
E015	Giarole
E164	Gremiasco
E188	Grognardo
E191	Grondona
E255	Guazzora
E360	Isola Sant'Antonio
E543	Lerma
E712	Lu
E870	Malvicino
F015	Masio
F096	Melazzo
F131	Merana
F232	Mirabello Monferrato
F281	Molare
F293	Molino dei Torti
F313	Mombello Monferrato
F320	Momperone
F337	Moncestino
F365	Mongiardino Ligure
F374	Monleale
F387	Montacuto
F403	Montaldeo
F404	Montaldo Bormida
F455	Montecastello
F469	Montechiaro d'Acqui
F518	Montegioco
F562	Montemarzino
F707	Morano sul Po
F713	Morbello
F737	Mornese
F751	Morsasco
F814	Murisengo
F965	Novi Ligure
F995	Occimiano
F997	Odalengo Grande
F998	Odalengo Piccolo
G042	Olivola
G124	Orsara Bormida
G193	Ottiglio
G197	Ovada
G199	Oviglio
G204	Ozzano Monferrato
G215	Paderna
G334	Pareto
G338	Parodi Ligure
G367	Pasturana
G397	Pecetto di Valenza
G619	Pietra Marazzi
G695	Piovera
G807	Pomaro Monferrato
G839	Pontecurone
G858	Pontestura
G861	Ponti
G872	Ponzano Monferrato
G877	Ponzone
G960	Pozzol Groppo
G961	Pozzolo Formigaro
G987	Prasco
H021	Predosa
H104	Quargnento
H121	Quattordio
H272	Ricaldone
H334	Rivalta Bormida
H343	Rivarone
H406	Roccaforte Ligure
H414	Rocca Grimalda
H465	Rocchetta Ligure
H569	Rosignano Monferrato
H677	Sala Monferrato
H694	Sale
H810	San Cristoforo
H878	San Giorgio Monferrato
I144	San Salvatore Monferrato
I150	San Sebastiano Curone
I190	Sant'Agata Fossili
I429	Sardigliano
I432	Sarezzano
I645	Serralunga di Crea
I657	Serravalle Scrivia
I711	Sezzadio
I738	Silvano d'Orba
I798	Solero
I808	Solonghello
I901	Spigno Monferrato
I911	Spineto Scrivia
I941	Stazzano
I977	Strevi
L027	Tagliolo Monferrato
L059	Tassarolo
L139	Terruggia
L143	Terzo
L165	Ticineto
L304	Tortona
L403	Treville
L432	Trisobbio
L570	Valenza
L633	Valmacca
L881	Vignale Monferrato
L887	Vignole Borbera
L904	Viguzzolo
L931	Villadeati
L963	Villalvernia
L970	Villamiroglio
L972	Villanova Monferrato
M009	Villaromagnano
M077	Visone
M120	Volpedo
M121	Volpeglino
M123	Voltaggio
A205	Allein
A305	Antey-Saint-André
A326	Aosta
A424	Arnad
A452	Arvier
A521	Avise
A094	Ayas
A108	Aymavilles
A643	Bard
A877	Bionaz
B192	Brissogne
B230	Brusson
C593	Challand-Saint-Anselme
C594	Challand-Saint-Victor
C595	Chambave
B491	Chamois
C596	Champdepraz
B540	Champorcher
C598	Charvensod
C294	Châtillon
C821	Cogne
D012	Courmayeur
D338	Donnas
D356	Doues
D402	Emarèse
D444	Etroubles
D537	Fénis
D666	Fontainemore
D839	Gaby
E029	Gignod
E165	Gressan
E167	Gressoney-La-Trinité
E168	Gressoney-Saint-Jean
E273	Hône
E306	Introd
E369	Issime
E371	Issogne
E391	Jovençan
A308	La Magdeleine
E458	La Salle
E470	La Thuile
E587	Lillianes
F367	Montjovet
F726	Morgex
F987	Nus
G045	Ollomont
G012	Oyace
G459	Perloz
G794	Pollein
G545	Pontboset
G860	Pontey
G854	Pont-Saint-Martin
H042	Pré-Saint-Didier
H110	Quart
H262	Rhêmes-Notre-Dame
H263	Rhêmes-Saint-Georges
H497	Roisan
H669	Saint-Christophe
H670	Saint-Denis
H671	Saint-Marcel
H672	Saint-Nicolas
H673	Saint-Oyen
H674	Saint-Pierre
H675	Saint-Rhémy-en-Bosses
H676	Saint-Vincent
I442	Sarre
L217	Torgnon
L582	Valgrisenche
L643	Valpelline
L647	Valsavarenche
L654	Valtournenche
L783	Verrayes
C282	Verrès
L981	Villeneuve
A111	Airole
A338	Apricale
A344	Aquila d'Arroscia
A418	Armo
A499	Aurigo
A536	Badalucco
A581	Bajardo
A984	Bordighera
A993	Borghetto d'Arroscia
B020	Borgomaro
B559	Camporosso
B734	Caravonica
B814	Carpasio
C143	Castellaro
C110	Castel Vittorio
C511	Ceriana
C559	Cervo
C578	Cesio
C657	Chiusanico
C660	Chiusavecchia
C718	Cipressa
C755	Civezza
D087	Cosio d'Arroscia
D114	Costarainera
D293	Diano Arentino
D296	Diano Castello
D297	Diano Marina
D298	Diano San Pietro
D318	Dolceacqua
D319	Dolcedo
E290	Imperia
E346	Isolabona
E719	Lucinasco
F123	Mendatica
F290	Molini di Triora
F406	Montalto Ligure
F528	Montegrosso Pian Latte
G041	Olivetta San Michele
G164	Ospedaletti
G454	Perinaldo
G607	Pietrabruna
G632	Pieve di Teco
G660	Pigna
G814	Pompeiana
G840	Pontedassio
G890	Pornassio
H027	Prelà
H180	Ranzo
H257	Rezzo
H328	Riva Ligure
H460	Rocchetta Nervina
H763	San Bartolomeo al Mare
H780	San Biagio della Cima
H957	San Lorenzo al Mare
I138	Sanremo
I365	Santo Stefano al Mare
I556	Seborga
I796	Soldano
L024	Taggia
L146	Terzorio
L430	Triora
L596	Vallebona
L599	Vallecrosia
L693	Vasia
L741	Ventimiglia
L809	Vessalico
L943	Villa Faraldi
A122	Alassio
A145	Albenga
A165	Albissola Marina
A166	Albisola Superiore
A226	Altare
A278	Andora
A422	Arnasco
A593	Balestrino
A647	Bardineto
A796	Bergeggi
A931	Boissano
A999	Borghetto Santo Spirito
B005	Borgio Verezzi
B048	Bormida
B369	Cairo Montenotte
B409	Calice Ligure
B416	Calizzano
B748	Carcare
B927	Casanova Lerrone
C063	Castelbianco
C276	Castelvecchio di Rocca Barbena
C443	Celle Ligure
C463	Cengio
C510	Ceriale
C729	Cisano sul Neva
D095	Cosseria
D264	Dego
D424	Erli
D600	Finale Ligure
D927	Garlenda
E064	Giustenice
E066	Giusvalla
E414	Laigueglia
E632	Loano
E816	Magliolo
E860	Mallare
F046	Massimino
F213	Millesimo
F226	Mioglia
F813	Murialdo
F847	Nasino
F926	Noli
G076	Onzo
D522	Orco Feglino
G144	Ortovero
G155	Osiglia
G281	Pallare
G542	Piana Crixia
G605	Pietra Ligure
G741	Plodio
G866	Pontinvrea
H126	Quiliano
H266	Rialto
H452	Roccavignale
I453	Sassello
I480	Savona
I926	Spotorno
I946	Stella
I947	Stellanello
L152	Testico
L190	Toirano
L315	Tovo San Giacomo
L499	Urbe
L528	Vado Ligure
L675	Varazze
L730	Vendone
L823	Vezzi Portio
L975	Villanova d'Albenga
M197	Zuccarello
A388	Arenzano
A506	Avegno
A658	Bargagli
A922	Bogliasco
B067	Borzonasca
B282	Busalla
B490	Camogli
B538	Campo Ligure
B551	Campomorone
B726	Carasco
B939	Casarza Ligure
B956	Casella
C302	Castiglione Chiavarese
C481	Ceranesi
C621	Chiavari
C673	Cicagna
C823	Cogoleto
C826	Cogorno
C995	Coreglia Ligure
D175	Crocefieschi
D255	Davagna
D509	Fascia
D512	Favale di Malvaro
D677	Fontanigorda
D969	Genova
E109	Gorreto
E341	Isola del Cantone
E488	Lavagna
E519	Leivi
E695	Lorsica
E737	Lumarzo
F020	Masone
F098	Mele
F173	Mezzanego
F202	Mignanego
F256	Moconesi
F354	Moneglia
F445	Montebruno
F682	Montoggio
F858	Ne
F862	Neirone
G093	Orero
G646	Pieve Ligure
G913	Portofino
H073	Propata
H183	Rapallo
H212	Recco
H258	Rezzoaglio
H536	Ronco Scrivia
H546	Rondanina
H581	Rossiglione
H599	Rovegno
H802	San Colombano Certenoli
I225	Santa Margherita Ligure
I346	Sant'Olcese
I368	Santo Stefano d'Aveto
I475	Savignone
I640	Serra Riccò
I693	Sestri Levante
I852	Sori
L167	Tiglieto
L298	Torriglia
L416	Tribogna
L507	Uscio
L546	Valbrevenna
M105	Vobbia
M182	Zoagli
A261	Ameglia
A373	Arcola
A836	Beverino
A932	Bolano
A961	Bonassola
A992	Borghetto di Vara
B214	Brugnato
B410	Calice al Cornoviglio
B838	Carro
B839	Carrodano
C240	Castelnuovo Magra
D265	Deiva Marina
D655	Follo
D758	Framura
E463	La Spezia
E542	Lerici
E560	Levanto
E842	Maissana
F609	Monterosso al Mare
G143	Ortonovo
G664	Pignone
G925	Portovenere
H275	Riccò del Golfo di Spezia
H304	Riomaggiore
H461	Rocchetta di Vara
I363	Santo Stefano di Magra
I449	Sarzana
E070	Sesta Godano
L681	Varese Ligure
L774	Vernazza
L819	Vezzano Ligure
M177	Zignago
A085	Agra
A167	Albizzate
A290	Angera
A371	Arcisate
A441	Arsago Seprio
A531	Azzate
A532	Azzio
A619	Barasso
A645	Bardello
A728	Bedero Valcuvia
A819	Besano
A825	Besnate
A826	Besozzo
A845	Biandronno
A891	Bisuschio
A918	Bodio Lomnago
B126	Brebbia
B131	Bregano
B150	Brenta
B166	Brezzo di Bedero
B182	Brinzio
B191	Brissago-Valtravaglia
B219	Brunello
B228	Brusimpiano
B258	Buguggiate
B300	Busto Arsizio
B326	Cadegliano-Viconago
B347	Cadrezzate
B368	Cairate
B634	Cantello
B732	Caravate
B754	Cardano al Campo
B796	Carnago
B805	Caronno Pertusella
B807	Caronno Varesino
B875	Casale Litta
B921	Casalzuigno
B949	Casciago
B987	Casorate Sempione
C004	Cassano Magnago
B999	Cassano Valcuvia
C139	Castellanza
B312	Castello Cabiaglio
C273	Castelseprio
C181	Castelveccana
C300	Castiglione Olona
C343	Castronno
C382	Cavaria con Premezzo
C409	Cazzago Brabbia
C732	Cislago
C751	Cittiglio
C796	Clivio
C810	Cocquio-Trevisago
C911	Comabbio
C922	Comerio
D144	Cremenaga
D185	Crosio della Valle
D192	Cuasso al Monte
D199	Cugliate-Fabiasco
D204	Cunardo
D217	Curiglia con Monteviasco
D238	Cuveglio
D239	Cuvio
D256	Daverio
D384	Dumenza
D385	Duno
D467	Fagnano Olona
D543	Ferno
D551	Ferrera di Varese
D869	Gallarate
D871	Galliate Lombardo
D946	Gavirate
D951	Gazzada Schianno
D963	Gemonio
D981	Gerenzano
D987	Germignaga
E079	Golasecca
E101	Gorla Maggiore
E102	Gorla Minore
E104	Gornate Olona
E144	Grantola
E292	Inarzo
E299	Induno Olona
E367	Ispra
E386	Jerago con Orago
E494	Lavena Ponte Tresa
E496	Laveno-Mombello
E510	Leggiuno
E665	Lonate Ceppino
E666	Lonate Pozzolo
E707	Lozza
E734	Luino
E769	Luvinate
E775	Maccagno
E856	Malgesso
E863	Malnate
E929	Marchirolo
E965	Marnate
F002	Marzio
F007	Masciago Primo
F134	Mercallo
F154	Mesenzana
F526	Montegrino Valtravaglia
F703	Monvalle
F711	Morazzone
F736	Mornago
G008	Oggiona con Santo Stefano
G028	Olgiate Olona
G103	Origgio
G105	Orino
E529	Osmate
G677	Pino sulla Sponda del Lago Maggiore
G906	Porto Ceresio
G907	Porto Valtravaglia
H173	Rancio Valcuvia
H174	Ranco
H723	Saltrio
H736	Samarate
I441	Saronno
I688	Sesto Calende
I793	Solbiate Arno
I794	Solbiate Olona
I819	Somma Lombardo
L003	Sumirago
L032	Taino
L115	Ternate
L319	Tradate
L342	Travedona-Monate
A705	Tronzano Lago Maggiore
L480	Uboldo
L577	Valganna
L671	Varano Borghi
L682	Varese
L703	Vedano Olona
L705	Veddasca
L733	Venegono Inferiore
L734	Venegono Superiore
L765	Vergiate
L876	Viggiù
M101	Vizzola Ticino
H872	Sangiano
A143	Albavilla
A153	Albese con Cassano
A164	Albiolo
A224	Alserio
A249	Alzate Brianza
A319	Anzano del Parco
A333	Appiano Gentile
A391	Argegno
A430	Arosio
A476	Asso
A670	Barni
A744	Bellagio
A778	Bene Lario
A791	Beregazzo con Figliaro
A870	Binago
A898	Bizzarone
A904	Blessagno
A905	Blevio
B134	Bregnano
B144	Brenna
B172	Brienno
B218	Brunate
B262	Bulgarograsso
B313	Cabiate
B346	Cadorago
B355	Caglio
B359	Cagno
B513	Campione d'Italia
B639	Cantù
B641	Canzo
B653	Capiago Intimiano
B730	Carate Urio
B742	Carbonate
B778	Carimate
B785	Carlazzo
B851	Carugo
B942	Casasco d'Intelvi
B974	Caslino d'Erba
B977	Casnate con Bernate
C020	Cassina Rizzardi
C206	Castelmarte
C220	Castelnuovo Bozzente
C299	Castiglione d'Intelvi
C374	Cavallasca
C381	Cavargna
C482	Cerano d'Intelvi
C516	Cermenate
C520	Cernobbio
C724	Cirimido
C754	Civenna
C787	Claino con Osteno
C902	Colonno
C933	Como
D041	Corrido
D147	Cremia
D196	Cucciago
D232	Cusino
D310	Dizzasco
D329	Domaso
D341	Dongo
D355	Dosso del Liro
D369	Drezzo
D416	Erba
D445	Eupilio
D462	Faggeto Lario
D482	Faloppio
D531	Fenegrò
D579	Figino Serenza
D605	Fino Mornasco
D930	Garzeno
D974	Gera Lario
E051	Gironico
E139	Grandate
E141	Grandola ed Uniti
E172	Griante
E235	Guanzate
E309	Inverigo
E405	Laglio
E416	Laino
E428	Lambrugo
E444	Lanzo d'Intelvi
E462	Lasnigo
E525	Lenno
E569	Lezzeno
E593	Limido Comasco
E607	Lipomo
E623	Livo
E638	Locate Varesino
E659	Lomazzo
E679	Longone al Segrino
E735	Luisago
E749	Lurago d'Erba
E750	Lurago Marinone
E753	Lurate Caccivio
E830	Magreglio
E951	Mariano Comense
F017	Maslianico
F120	Menaggio
F151	Merone
F181	Mezzegra
F305	Moltrasio
F372	Monguzzo
F427	Montano Lucino
F564	Montemezzo
F688	Montorfano
F788	Mozzate
F828	Musso
F877	Nesso
F958	Novedrate
G025	Olgiate Comasco
G056	Oltrona di San Mamette
G126	Orsenigo
G182	Ossuccio
G329	Parè
G415	Peglio
G427	Pellio Intelvi
G556	Pianello del Lario
G665	Pigra
G737	Plesio
G773	Pognana Lario
G821	Ponna
G847	Ponte Lambro
G889	Porlezza
H074	Proserpio
H094	Pusiano
H171	Ramponio Verna
H255	Rezzago
H478	Rodero
H521	Ronago
H601	Rovellasca
H602	Rovello Porro
H679	Sala Comacina
H760	San Bartolomeo Val Cavargna
H830	San Fedele Intelvi
H840	San Fermo della Battaglia
I051	San Nazzaro Val Cavargna
I529	Schignano
I611	Senna Comasco
I792	Solbiate
I856	Sorico
I860	Sormano
I943	Stazzona
L071	Tavernerio
L228	Torno
L371	Tremezzo
L413	Trezzone
L470	Turate
L487	Uggiate-Trevano
L547	Valbrona
L640	Valmorea
H259	Val Rezzo
C936	Valsolda
L715	Veleso
L737	Veniano
L748	Vercana
L792	Vertemate con Minoprio
L956	Villa Guardia
M156	Zelbio
I162	San Siro
M315	Gravedona ed Uniti
A135	Albaredo per San Marco
A172	Albosaggia
A273	Andalo Valtellino
A337	Aprica
A382	Ardenno
A777	Bema
A787	Berbenno di Valtellina
A848	Bianzone
B049	Bormio
B255	Buglio in Monte
B366	Caiolo
B530	Campodolcino
B993	Caspoggio
C186	Castello dell'Acqua
C325	Castione Andevenno
C418	Cedrasco
C493	Cercino
C623	Chiavenna
C628	Chiesa in Valmalenco
C651	Chiuro
C709	Cino
C785	Civo
C903	Colorina
D088	Cosio Valtellino
D258	Dazio
D266	Delebio
D377	Dubino
D456	Faedo Valtellino
D694	Forcola
D830	Fusine
D990	Gerola Alta
E090	Gordona
E200	Grosio
E201	Grosotto
E342	Madesimo
E443	Lanzada
E621	Livigno
E705	Lovero
E896	Mantello
F070	Mazzo di Valtellina
F115	Mello
F121	Menarola
F153	Mese
F393	Montagna in Valtellina
F712	Morbegno
F956	Novate Mezzola
G410	Pedesina
G572	Piantedo
G576	Piateda
G718	Piuro
G431	Poggiridenti
G829	Ponte in Valtellina
G937	Postalesio
G993	Prata Camportaccio
H192	Rasura
H493	Rogolo
H752	Samolaco
H868	San Giacomo Filippo
I636	Sernio
I828	Sondalo
I829	Sondrio
I928	Spriana
L035	Talamona
L056	Tartano
L084	Teglio
L175	Tirano
L244	Torre di Santa Maria
L316	Tovo di Sant'Agata
L330	Traona
L392	Tresivio
L557	Valdidentro
L563	Valdisotto
L576	Valfurva
L638	Val Masino
L749	Verceia
L799	Vervio
L907	Villa di Chiavenna
L908	Villa di Tirano
A010	Abbiategrasso
A127	Albairate
A375	Arconate
A389	Arese
A413	Arluno
A473	Assago
A652	Bareggio
A697	Basiano
A699	Basiglio
A751	Bellinzago Lombardo
A804	Bernate Ticino
A820	Besate
A872	Binasco
A920	Boffalora sopra Ticino
A940	Bollate
B162	Bresso
B235	Bubbiano
B240	Buccinasco
B286	Buscate
B292	Bussero
B301	Busto Garolfo
B448	Calvignasco
B461	Cambiago
B593	Canegrate
B820	Carpiano
B850	Carugate
B938	Casarile
B989	Casorezzo
C003	Cassano d'Adda
C014	Cassina de' Pecchi
C033	Cassinetta di Lugagnano
C052	Castano Primo
C523	Cernusco sul Naviglio
C536	Cerro al Lambro
C537	Cerro Maggiore
C565	Cesano Boscone
C569	Cesate
C707	Cinisello Balsamo
C733	Cisliano
C895	Cologno Monzese
C908	Colturano
C986	Corbetta
D013	Cormano
D018	Cornaredo
D045	Corsico
D198	Cuggiono
D229	Cusago
D231	Cusano Milanino
D244	Dairago
D367	Dresano
D845	Gaggiano
D912	Garbagnate Milanese
D995	Gessate
E094	Gorgonzola
E170	Grezzago
E258	Gudo Visconti
E313	Inveruno
E317	Inzago
E395	Lacchiarella
E415	Lainate
E514	Legnano
E610	Liscate
E639	Locate di Triulzi
E801	Magenta
E819	Magnago
E921	Marcallo con Casone
F003	Masate
F084	Mediglia
F100	Melegnano
F119	Melzo
F155	Mesero
F205	Milano
D033	Morimondo
F783	Motta Visconti
F874	Nerviano
F939	Nosate
F955	Novate Milanese
F968	Noviglio
G078	Opera
G181	Ossona
G206	Ozzero
G220	Paderno Dugnano
G316	Pantigliate
G324	Parabiago
G385	Paullo
C013	Pero
G488	Peschiera Borromeo
G502	Pessano con Bornago
G634	Pieve Emanuele
G686	Pioltello
G772	Pogliano Milanese
G955	Pozzo d'Adda
G965	Pozzuolo Martesana
H026	Pregnana Milanese
H240	Rescaldina
H264	Rho
H371	Robecchetto con Induno
H373	Robecco sul Naviglio
H470	Rodano
H560	Rosate
H623	Rozzano
H803	San Colombano al Lambro
H827	San Donato Milanese
H884	San Giorgio su Legnano
H930	San Giuliano Milanese
I361	Santo Stefano Ticino
I409	San Vittore Olona
I415	San Zenone al Lambro
I566	Sedriano
I577	Segrate
I602	Senago
I690	Sesto San Giovanni
I696	Settala
I700	Settimo Milanese
I786	Solaro
L408	Trezzano Rosa
L409	Trezzano sul Naviglio
L411	Trezzo sull'Adda
L415	Tribiano
L454	Truccazzano
L471	Turbigo
L665	Vanzago
L667	Vaprio d'Adda
L768	Vermezzo
L773	Vernate
L883	Vignate
M053	Vimodrone
M091	Vittuone
M102	Vizzolo Predabissi
M160	Zelo Surrigone
M176	Zibido San Giacomo
L928	Villa Cortese
L664	Vanzaghello
A618	Baranzate
A057	Adrara San Martino
A058	Adrara San Rocco
A129	Albano Sant'Alessandro
A163	Albino
A214	Almè
A216	Almenno San Bartolomeo
A217	Almenno San Salvatore
A246	Alzano Lombardo
A259	Ambivere
A304	Antegnate
A365	Arcene
A383	Ardesio
A440	Arzago d'Adda
A511	Averara
A517	Aviatico
A528	Azzano San Paolo
A533	Azzone
A557	Bagnatica
A631	Barbata
A664	Bariano
A684	Barzana
A732	Bedulita
A786	Berbenno
A794	Bergamo
A815	Berzo San Fermo
A846	Bianzano
A903	Blello
A937	Bolgare
A950	Boltiere
A963	Bonate Sopra
A962	Bonate Sotto
B010	Borgo di Terzo
B083	Bossico
B088	Bottanuco
B112	Bracca
B123	Branzi
B137	Brembate
B138	Brembate di Sopra
B140	Brembilla
B178	Brignano Gera d'Adda
B217	Brumano
B223	Brusaporto
B393	Calcinate
B395	Calcio
B434	Calusco d'Adda
B442	Calvenzano
B471	Camerata Cornello
B618	Canonica d'Adda
B661	Capizzone
B703	Capriate San Gervasio
B710	Caprino Bergamasco
B731	Caravaggio
B801	Carobbio degli Angeli
B803	Carona
B854	Carvico
B947	Casazza
B971	Casirate d'Adda
B978	Casnigo
C007	Cassiglio
C079	Castelli Calepio
C255	Castel Rozzone
C324	Castione della Presolana
C337	Castro
C396	Cavernago
C410	Cazzano Sant'Andrea
C456	Cenate Sopra
C457	Cenate Sotto
C459	Cene
C506	Cerete
C635	Chignolo d'Isola
C649	Chiuduno
C728	Cisano Bergamasco
C730	Ciserano
C759	Cividate al Piano
C800	Clusone
C835	Colere
C894	Cologno al Serio
C910	Colzate
C937	Comun Nuovo
D015	Corna Imagna
D066	Cortenuova
D110	Costa di Mezzate
D103	Costa Valle Imagna
D117	Costa Volpino
D126	Covo
D139	Credaro
D221	Curno
D233	Cusio
D245	Dalmine
D352	Dossena
D406	Endine Gaiano
D411	Entratico
D490	Fara Gera d'Adda
D491	Fara Olivana con Sola
D588	Filago
D604	Fino del Monte
D606	Fiorano al Serio
D672	Fontanella
D684	Fonteno
D688	Foppolo
D697	Foresto Sparso
D727	Fornovo San Giovanni
D817	Fuipiano Valle Imagna
D903	Gandellino
D905	Gandino
D906	Gandosso
D943	Gaverina Terme
D952	Gazzaniga
D991	Gerosa
E006	Ghisalba
E100	Gorlago
E103	Gorle
E106	Gorno
E148	Grassobbio
E189	Gromo
E192	Grone
E219	Grumello del Monte
E353	Isola di Fondra
E370	Isso
E422	Lallio
E509	Leffe
E524	Lenna
E562	Levate
E640	Locatello
E704	Lovere
E751	Lurano
E770	Luzzana
E794	Madone
E901	Mapello
E987	Martinengo
F186	Mezzoldo
F243	Misano di Gera d'Adda
F276	Moio de' Calvi
F328	Monasterolo del Castello
F547	Montello
F720	Morengo
F738	Mornico al Serio
F786	Mozzanica
F791	Mozzo
F864	Nembro
G049	Olmo al Brembo
G050	Oltre il Colle
G054	Oltressenda Alta
G068	Oneta
G075	Onore
G108	Orio al Serio
G118	Ornica
G159	Osio Sopra
G160	Osio Sotto
G233	Pagazzano
G249	Paladina
G259	Palazzago
G295	Palosco
G346	Parre
G350	Parzanica
G412	Pedrengo
G418	Peia
G564	Pianico
G574	Piario
G579	Piazza Brembana
G583	Piazzatorre
G588	Piazzolo
G774	Pognano
F941	Ponte Nossa
G853	Ponteranica
G856	Ponte San Pietro
G864	Pontida
G867	Pontirolo Nuovo
G968	Pradalunga
H020	Predore
H036	Premolo
H046	Presezzo
H091	Pumenengo
H176	Ranica
H177	Ranzanico
H331	Riva di Solto
H492	Rogno
H509	Romano di Lombardia
H535	Roncobello
H544	Roncola
H584	Rota d'Imagna
H615	Rovetta
H910	San Giovanni Bianco
B310	San Paolo d'Argon
I079	San Pellegrino Terme
I168	Santa Brigida
I349	Sant'Omobono Terme
I437	Sarnico
I506	Scanzorosciate
I530	Schilpario
I567	Sedrina
I597	Selvino
I628	Seriate
I629	Serina
I812	Solto Collina
I830	Songavazzo
I858	Sorisole
I869	Sotto il Monte Giovanni XXIII
I873	Sovere
I916	Spinone al Lago
I919	Spirano
I951	Stezzano
I986	Strozza
I997	Suisio
L037	Taleggio
L073	Tavernola Bergamasca
L087	Telgate
L118	Terno d'Isola
L251	Torre Boldone
L265	Torre de' Roveri
L276	Torre Pallavicina
L388	Trescore Balneario
L400	Treviglio
L404	Treviolo
C789	Ubiale Clanezzo
L502	Urgnano
L544	Valbondione
L545	Valbrembo
L579	Valgoglio
L623	Valleve
L642	Valnegra
L649	Valsecca
L655	Valtorta
L707	Vedeseta
L752	Verdellino
L753	Verdello
L795	Vertova
L827	Viadanica
L865	Vigano San Martino
L894	Vigolo
L929	Villa d'Adda
A215	Villa d'Almè
L936	Villa di Serio
L938	Villa d'Ogna
M045	Villongo
M050	Vilminore di Scalve
M144	Zandobbio
M147	Zanica
M184	Zogno
D111	Costa Serina
A193	Algua
D016	Cornalba
F085	Medolago
I813	Solza
A034	Acquafredda
A060	Adro
A082	Agnosine
A188	Alfianello
A288	Anfo
A293	Angolo Terme
A451	Artogne
A529	Azzano Mella
A569	Bagnolo Mella
A578	Bagolino
A630	Barbariga
A661	Barghe
A702	Bassano Bresciano
A729	Bedizzole
A799	Berlingo
A816	Berzo Demo
A817	Berzo Inferiore
A861	Bienno
A878	Bione
B035	Borgo San Giacomo
B040	Borgosatollo
B054	Borno
B091	Botticino
B100	Bovegno
B102	Bovezzo
B120	Brandico
B124	Braone
B149	Breno
B157	Brescia
B184	Brione
B365	Caino
B394	Calcinato
B436	Calvagese della Riviera
B450	Calvisano
B664	Capo di Ponte
B676	Capovalle
B698	Capriano del Colle
B711	Capriolo
B817	Carpenedolo
C055	Castegnato
C072	Castelcovati
C208	Castel Mella
C293	Castenedolo
C330	Casto
C332	Castrezzato
C408	Cazzago San Martino
C417	Cedegolo
C439	Cellatica
C549	Cerveno
C585	Ceto
C591	Cevo
C618	Chiari
C685	Cigole
C691	Cimbergo
C760	Cividate Camuno
C806	Coccaglio
C850	Collebeato
C883	Collio
C893	Cologne
C925	Comezzano-Cizzago
C948	Concesio
D058	Corte Franca
D064	Corteno Golgi
D082	Corzano
D251	Darfo Boario Terme
D270	Dello
D284	Desenzano del Garda
D391	Edolo
D421	Erbusco
D434	Esine
D576	Fiesse
D634	Flero
D891	Gambara
D917	Gardone Riviera
D918	Gardone Val Trompia
D924	Gargnano
D940	Gavardo
D999	Ghedi
E010	Gianico
E116	Gottolengo
E271	Gussago
E280	Idro
E297	Incudine
E325	Irma
E333	Iseo
E364	Isorella
E497	Lavenone
E526	Leno
E596	Limone sul Garda
E652	Lodrino
E654	Lograto
M312	Lonato del Garda
E673	Longhena
E698	Losine
E706	Lozio
E738	Lumezzane
E787	Maclodio
E800	Magasa
E841	Mairano
E851	Malegno
E865	Malonno
E883	Manerba del Garda
E884	Manerbio
E928	Marcheno
E961	Marmentino
E967	Marone
F063	Mazzano
F216	Milzano
F373	Moniga del Garda
F375	Monno
F532	Monte Isola
F672	Monticelli Brusati
F471	Montichiari
F680	Montirone
F806	Mura
F820	Muscoline
F851	Nave
F884	Niardo
F989	Nuvolento
F990	Nuvolera
G001	Odolo
G006	Offlaga
G061	Ome
G074	Ono San Pietro
G149	Orzinuovi
G150	Orzivecchi
G170	Ospitaletto
G179	Ossimo
G213	Padenghe sul Garda
G217	Paderno Franciacorta
G247	Paisco Loveno
G248	Paitone
G264	Palazzolo sull'Oglio
G327	Paratico
G354	Paspardo
G361	Passirano
G391	Pavone del Mella
G407	San Paolo
G474	Pertica Alta
G475	Pertica Bassa
G529	Pezzaze
G546	Pian Camuno
G710	Pisogne
G779	Polaveno
G801	Polpenazze del Garda
G815	Pompiano
G818	Poncarale
G844	Ponte di Legno
G859	Pontevico
G869	Pontoglio
G959	Pozzolengo
G977	Pralboino
H043	Preseglie
H050	Prestine
H055	Prevalle
H078	Provaglio d'Iseo
H077	Provaglio Val Sabbia
H086	Puegnago sul Garda
H140	Quinzano d'Oglio
H230	Remedello
H256	Rezzato
H410	Roccafranca
H477	Rodengo Saiano
H484	Roè Volciano
H525	Roncadelle
H598	Rovato
H630	Rudiano
H650	Sabbio Chiese
H699	Sale Marasino
H717	Salò
H838	San Felice del Benaco
H865	San Gervasio Bresciano
I412	San Zeno Naviglio
I433	Sarezzo
I476	Saviore dell'Adamello
I588	Sellero
I607	Seniga
I631	Serle
I633	Sirmione
I782	Soiano del Lago
I831	Sonico
L002	Sulzano
C698	Tavernole sul Mella
L094	Temù
L169	Tignale
L210	Torbole Casaglia
L312	Toscolano-Maderno
L339	Travagliato
L372	Tremosine
L380	Trenzano
L406	Treviso Bresciano
L494	Urago d'Oglio
L626	Vallio Terme
L468	Valvestino
L777	Verolanuova
L778	Verolavecchia
L812	Vestone
L816	Vezza d'Oglio
L919	Villa Carcina
L923	Villachiara
L995	Villanuova sul Clisi
M065	Vione
M070	Visano
M104	Vobarno
M188	Zone
G549	Piancogno
A118	Alagna
A134	Albaredo Arnaboldi
A171	Albonese
A175	Albuzzano
A387	Arena Po
A538	Badia Pavese
A550	Bagnaria
A634	Barbianello
A690	Bascapè
A711	Bastida de' Dossi
A712	Bastida Pancarana
A718	Battuda
A741	Belgioioso
A792	Bereguardo
A989	Borgarello
B028	Borgo Priolo
B030	Borgoratto Mormorolo
B038	Borgo San Siro
B051	Bornasco
B082	Bosnasco
B117	Brallo di Pregola
B142	Breme
B159	Bressana Bottarone
B201	Broni
B447	Calvignano
B567	Campospinoso
B587	Candia Lomellina
B599	Canevino
B613	Canneto Pavese
B741	Carbonara al Ticino
B929	Casanova Lonati
B945	Casatisma
B954	Casei Gerola
B988	Casorate Primo
C038	Cassolnovo
C050	Castana
C053	Casteggio
C157	Castelletto di Branduzzo
C184	Castello d'Agogna
C213	Castelnovetto
C360	Cava Manara
C414	Cecima
C484	Ceranova
C508	Ceretto Lomellina
C509	Cergnago
C541	Certosa di Pavia
C551	Cervesina
C637	Chignolo Po
C684	Cigognola
C686	Cilavegna
C813	Codevilla
C958	Confienza
C979	Copiano
C982	Corana
D017	Cornale
D067	Corteolona
D081	Corvino San Quirico
D109	Costa de' Nobili
D127	Cozzo
B824	Cura Carpignano
D348	Dorno
D552	Ferrera Erbognone
D594	Filighera
D732	Fortunago
D771	Frascarolo
D873	Galliavola
D892	Gambarana
D901	Gambolò
D925	Garlasco
D973	Genzone
D980	Gerenzago
E062	Giussago
E072	Godiasco Salice Terme
E081	Golferenzo
E152	Gravellona Lomellina
E195	Gropello Cairoli
E464	Las Plassas
E310	Inverno e Monteleone
E437	Landriano
E439	Langosco
E454	Lardirago
E600	Linarolo
E608	Lirio
E662	Lomello
B387	Lungavilla
E804	Magherno
E934	Marcignago
E999	Marzano
F080	Mede
F122	Menconico
F170	Mezzana Bigli
F171	Mezzana Rabattone
F175	Mezzanino
F238	Miradolo Terme
F417	Montalto Pavese
F440	Montebello della Battaglia
F449	Montecalvo Versiggia
F638	Montescano
F644	Montesegale
F670	Monticelli Pavese
F701	Montù Beccaria
F739	Mornico Losana
F754	Mortara
F891	Nicorvo
G021	Olevano di Lomellina
G032	Oliva Gessi
G194	Ottobiano
G275	Palestro
G304	Pancarana
G342	Parona
G388	Pavia
G612	Pietra de' Giorgi
G635	Pieve Albignola
G639	Pieve del Cairo
G650	Pieve Porto Morone
G671	Pinarolo Po
G720	Pizzale
G851	Ponte Nizza
G895	Portalbera
H204	Rea
H216	Redavalle
H246	Retorbido
H336	Rivanazzano Terme
H369	Robbio
H375	Robecco Pavese
H396	Rocca de' Giorgi
H450	Rocca Susella
H491	Rognano
H505	Romagnese
H527	Roncaro
H559	Rosasco
H614	Rovescala
H637	Ruino
H799	San Cipriano Po
H814	San Damiano al Colle
H859	San Genesio ed Uniti
H885	San Giorgio di Lomellina
I014	San Martino Siccomario
I048	Sannazzaro de' Burgondi
I175	Santa Cristina e Bissone
I203	Santa Giuletta
I213	Sant'Alessio con Vialone
I230	Santa Margherita di Staffora
I237	Santa Maria della Versa
I276	Sant'Angelo Lomellina
I416	San Zenone al Po
I447	Sartirana Lomellina
I487	Scaldasole
I599	Semiana
I739	Silvano Pietra
E265	Siziano
I825	Sommo
I894	Spessa
I968	Stradella
B014	Suardi
L237	Torrazza Coste
L250	Torre Beretti e Castellaro
L256	Torre d'Arese
L262	Torre de' Negri
L269	Torre d'Isola
L285	Torrevecchia Pia
L292	Torricella Verzate
I236	Travacò Siccomario
L440	Trivolzio
L449	Tromello
L453	Trovo
L562	Val di Nizza
L568	Valeggio
L593	Valle Lomellina
L617	Valle Salimbene
L659	Valverde
L690	Varzi
L716	Velezzo Lomellina
L720	Vellezzo Bellini
L784	Verretto
L788	Verrua Po
L854	Vidigulfo
L872	Vigevano
L917	Villa Biscossi
L983	Villanova d'Ardenghi
L994	Villanterio
M079	Vistarino
M109	Voghera
M119	Volpara
M150	Zavattarello
M152	Zeccone
M161	Zeme
M162	Zenevredo
M166	Zerbo
M167	Zerbolò
M180	Zinasco
A039	Acquanegra Cremonese
A076	Agnadello
A299	Annicco
A526	Azzanello
A570	Bagnolo Cremasco
A972	Bonemerse
A986	Bordolano
B320	Ca' d'Andrea
B439	Calvatone
B484	Camisano
B498	Campagnola Cremasca
B650	Capergnanica
B679	Cappella Cantone
B680	Cappella de' Picenardi
B686	Capralba
B869	Casalbuttano ed Uniti
B881	Casale Cremasco-Vidolasco
B889	Casaletto Ceredano
B890	Casaletto di Sopra
B891	Casaletto Vaprio
B898	Casalmaggiore
B900	Casalmorano
C089	Casteldidone
C115	Castel Gabbiano
C153	Castelleone
B129	Castelverde
C290	Castelvisconti
C435	Cella Dati
C634	Chieve
C678	Cicognolo
C703	Cingia de' Botti
D056	Corte de' Cortesi con Cignone
D057	Corte de' Frati
D141	Credera Rubbiano
D142	Crema
D150	Cremona
D151	Cremosano
D186	Crotta d'Adda
D203	Cumignano sul Naviglio
D278	Derovere
D358	Dovera
D370	Drizzona
D574	Fiesco
D710	Formigara
D834	Gabbioneta-Binanuova
D841	Gadesco-Pieve Delmona
D966	Genivolta
D993	Gerre de' Caprioli
E082	Gombito
E193	Grontardo
E742	Lunamatrona
E217	Grumello Cremonese ed Uniti
E272	Gussola
E356	Isola Dovarese
E380	Izano
E793	Madignano
E843	Malagnino
E983	Martignana di Po
F434	Monte Cremasco
F681	Montodine
F761	Moscazzano
F771	Motta Baluffi
G004	Offanengo
G047	Olmeneta
G185	Ostiano
G222	Paderno Ponchielli
G260	Palazzo Pignano
G306	Pandino
G469	Persico Dosimo
G483	Pescarolo ed Uniti
G504	Pessina Cremonese
G536	Piadena
G558	Pianengo
G603	Pieranica
G647	Pieve d'Olmi
G651	Pieve San Giacomo
G721	Pizzighettone
B914	Pozzaglio ed Uniti
H130	Quintano
H276	Ricengo
H314	Ripalta Arpina
H315	Ripalta Cremasca
H316	Ripalta Guerina
H341	Rivarolo del Re ed Uniti
H357	Rivolta d'Adda
H372	Robecco d'Oglio
H508	Romanengo
H731	Salvirola
H767	San Bassano
H815	San Daniele Po
H918	San Giovanni in Croce
I007	San Martino del Lago
I497	Scandolara Ravara
I498	Scandolara Ripa d'Oglio
I627	Sergnano
I683	Sesto ed Uniti
I790	Solarolo Rainerio
I827	Soncino
I849	Soresina
I865	Sospiro
I906	Spinadesco
I909	Spineda
I914	Spino d'Adda
I935	Stagno Lombardo
L164	Ticengo
L221	Torlino Vimercati
L225	Tornata
L258	Torre de' Picenardi
L296	Torricella del Pizzo
L389	Trescore Cremasco
L426	Trigolo
L535	Vaiano Cremasco
L539	Vailate
L806	Vescovato
M116	Volongo
M127	Voltido
A038	Acquanegra sul Chiese
A470	Asola
A575	Bagnolo San Vito
A866	Bigarello
B011	Borgoforte
B013	Borgofranco sul Po
B110	Bozzolo
B612	Canneto sull'Oglio
B739	Carbonara di Po
B901	Casalmoro
B907	Casaloldo
B911	Casalromano
C059	Castelbelforte
C076	Castel d'Ario
C118	Castel Goffredo
C195	Castellucchio
C312	Castiglione delle Stiviere
C406	Cavriana
C502	Ceresara
C930	Commessaggio
D227	Curtatone
D351	Dosolo
D529	Felonica
D949	Gazoldo degli Ippoliti
D959	Gazzuolo
E078	Goito
E089	Gonzaga
E261	Guidizzolo
E818	Magnacavallo
E897	Mantova
E922	Marcaria
E949	Mariana Mantovana
E962	Marmirolo
F086	Medole
F267	Moglia
F705	Monzambano
B012	Motteggiana
G186	Ostiglia
G417	Pegognaga
G633	Pieve di Coriano
G717	Piubega
G753	Poggio Rusco
G816	Pomponesco
G862	Ponti sul Mincio
G917	Porto Mantovano
H129	Quingentole
H143	Quistello
H218	Redondesco
H248	Revere
H342	Rivarolo Mantovano
H481	Rodigo
H541	Roncoferraro
H604	Roverbella
H652	Sabbioneta
H771	San Benedetto Po
H870	San Giacomo delle Segnate
H883	San Giorgio di Mantova
H912	San Giovanni del Dosso
I005	San Martino dall'Argine
I532	Schivenoglia
I632	Sermide
I662	Serravalle a Po
I801	Solferino
L015	Sustinente
L020	Suzzara
L826	Viadana
F804	Villa Poma
M044	Villimpenta
H123	Virgilio
M125	Volta Mantovana
A179	Aldino
A286	Andriano
A306	Anterivo
A332	Appiano sulla strada del vino
A507	Avelengo
A537	Badia
A635	Barbiano
A952	Bolzano
B116	Braies
B145	Brennero
B160	Bressanone
B203	Bronzolo
B220	Brunico
B364	Caines
B397	Caldaro sulla strada del vino
B529	Campo di Trens
B570	Campo Tures
C062	Castelbello-Ciardes
C254	Castelrotto
A022	Cermes
C625	Chienes
C652	Chiusa
B799	Cornedo all'Isarco
D048	Cortaccia sulla strada del vino
D075	Cortina sulla strada del vino
D079	Corvara in Badia
D222	Curon Venosta
D311	Dobbiaco
D392	Egna
D484	Falzes
D571	Fiè allo Sciliar
D731	Fortezza
D821	Funes
D860	Gais
D923	Gargazzone
E069	Glorenza
E398	Laces
E412	Lagundo
E420	Laion
E421	Laives
E434	Lana
E457	Lasa
E481	Lauregno
E764	Luson
E829	Magrè sulla strada del vino
E862	Malles Venosta
E938	Marebbe
E959	Marlengo
E981	Martello
F118	Meltina
F132	Merano
F371	Monguelfo-Tesido
F392	Montagna
F766	Moso in Passiria
F836	Nalles
F849	Naturno
F856	Naz-Sciaves
F949	Nova Levante
F950	Nova Ponente
G083	Ora
G140	Ortisei
G328	Parcines
G443	Perca
G299	Plaus
G830	Ponte Gardena
G936	Postal
H004	Prato allo Stelvio
H019	Predoi
H081	Proves
H152	Racines
H189	Rasun-Anterselva
H236	Renon
H284	Rifiano
H299	Rio di Pusteria
H475	Rodengo
H719	Salorno
H786	San Candido
H858	San Genesio Atesino
H952	San Leonardo in Passiria
H956	San Lorenzo di Sebato
H988	San Martino in Badia
H989	San Martino in Passiria
I065	San Pancrazio
I173	Santa Cristina Valgardena
I431	Sarentino
I519	Scena
I593	Selva dei Molini
I591	Selva di Val Gardena
I604	Senales
I687	Sesto
I729	Silandro
I771	Sluderno
I948	Stelvio
L106	Terento
L108	Terlano
L111	Termeno sulla strada del vino
L149	Tesimo
L176	Tires
L178	Tirolo
L444	Trodena nel parco naturale
L455	Tubre
L490	Ultimo
L527	Vadena
L552	Valdaora
L564	Val di Vizze
L595	Valle Aurina
L601	Valle di Casies
L660	Vandoies
L687	Varna
L745	Verano
L915	Villabassa
L971	Villandro
M067	Vipiteno
L724	Velturno
E491	La Valle
I603	Senale-San Felice
A116	Ala
A158	Albiano
A178	Aldeno
A260	Amblar
A274	Andalo
A372	Arco
A520	Avio
A694	Baselga di Pinè
A730	Bedollo
A808	Bersone
A821	Besenello
A863	Bieno
A902	Bleggio Superiore
A916	Bocenago
A933	Bolbeno
A967	Bondo
A968	Bondone
B006	Borgo Valsugana
B078	Bosentino
B135	Breguzzo
B153	Brentonico
B158	Bresimo
B165	Brez
B185	Brione
B335	Caderzone Terme
B360	Cagnò
B386	Calavino
B389	Calceranica al Lago
B400	Caldes
B404	Caldonazzo
B419	Calliano
B514	Campitello di Fassa
B525	Campodenno
B577	Canal San Bovo
B579	Canazei
B697	Capriana
B723	Carano
B783	Carisolo
B856	Carzano
C183	Castel Condino
C103	Castelfondo
C189	Castello-Molina di Fiemme
C194	Castello Tesino
C216	Castelnuovo
C372	Cavalese
C380	Cavareno
C392	Cavedago
C393	Cavedine
C400	Cavizzana
C452	Cembra
C467	Centa San Nicolò
C694	Cimego
C700	Cimone
C712	Cinte Tesino
C727	Cis
C756	Civezzano
C794	Cles
C797	Cloz
C931	Commezzadura
C953	Condino
C994	Coredo
D188	Croviana
D206	Cunevo
D243	Daiano
D246	Dambel
D248	Daone
D250	Darè
D273	Denno
D302	Dimaro
D336	Don
D349	Dorsino
D365	Drena
D371	Dro
D457	Faedo
D468	Fai della Paganella
D516	Faver
D565	Fiavè
D572	Fiera di Primiero
D573	Fierozzo
D631	Flavon
D651	Folgaria
D663	Fondo
D714	Fornace
D775	Frassilongo
D928	Garniga Terme
E048	Giovo
E065	Giustino
E150	Grauno
E178	Grigno
E222	Grumes
E288	Imer
E334	Isera
E378	Ivano-Fracena
E452	Lardaro
E461	Lasino
E492	Lavarone
E500	Lavis
E565	Levico Terme
E614	Lisignago
E624	Livo
E664	Lona-Lases
E757	Luserna
E850	Malè
E866	Malosco
F045	Massimeno
F068	Mazzin
F168	Mezzana
F176	Mezzano
F183	Mezzocorona
F187	Mezzolombardo
F263	Moena
F307	Molveno
F341	Monclassico
F396	Montagne
F728	Mori
F835	Nago-Torbole
F837	Nanno
F853	Nave San Rocco
F920	Nogaredo
F929	Nomi
F947	Novaledo
G168	Ospedaletto
G173	Ossana
G214	Padergnone
G296	Palù del Fersina
G305	Panchià
M303	Ronzo-Chienis
G419	Peio
G428	Pellizzano
G429	Pelugo
G452	Pergine Valsugana
G641	Pieve di Bono
G656	Pieve Tesino
G681	Pinzolo
G808	Pomarolo
G950	Pozza di Fassa
G989	Praso
H018	Predazzo
H039	Preore
H057	Prezzo
H146	Rabbi
H162	Ragoli
H254	Revò
H330	Riva del Garda
H506	Romallo
H517	Romeno
H528	Roncegno Terme
H532	Ronchi Valsugana
H545	Roncone
H552	Ronzone
H607	Roverè della Luna
H612	Rovereto
H634	Ruffrè-Mendola
H639	Rumo
H666	Sagron Mis
H754	Samone
H966	San Lorenzo in Banale
I042	San Michele all'Adige
I354	Sant'Orsola Terme
I411	Sanzeno
I439	Sarnonico
I554	Scurelle
I576	Segonzano
I714	Sfruz
I760	Siror
I772	Smarano
I839	Soraga
I871	Sover
I889	Spera
I899	Spiazzo
I924	Spormaggiore
I925	Sporminore
I949	Stenico
I964	Storo
I975	Strembo
I979	Strigno
L033	Taio
L060	Tassullo
L089	Telve
L090	Telve di Sopra
L096	Tenna
L097	Tenno
L107	Terlago
L121	Terragnolo
L137	Terres
L145	Terzolas
L147	Tesero
L174	Tione di Trento
L200	Ton
L201	Tonadico
L211	Torcegno
L322	Trambileno
L329	Transacqua
L378	Trento
L385	Tres
L457	Tuenno
L550	Valda
L575	Valfloriana
L588	Vallarsa
L678	Varena
L697	Vattaro
L769	Vermiglio
L800	Vervò
L821	Vezzano
L886	Vignola-Falesina
L893	Vigo di Fassa
L896	Vigolo Vattaro
L903	Vigo Rendena
L910	Villa Agnedo
L957	Villa Lagarina
M006	Villa Rendena
M113	Volano
M142	Zambana
M173	Ziano di Fiemme
M198	Zuclo
M314	Comano Terme
M313	Ledro
A061	Affi
A137	Albaredo d'Adige
A292	Angiari
A374	Arcole
A540	Badia Calavena
A650	Bardolino
A737	Belfiore
A837	Bevilacqua
A964	Bonavigo
B070	Boschi Sant'Anna
B073	Bosco Chiesanuova
B107	Bovolone
B152	Brentino Belluno
B154	Brenzone
B296	Bussolengo
B304	Buttapietra
B402	Caldiero
B709	Caprino Veronese
B886	Casaleone
C041	Castagnaro
C078	Castel d'Azzano
C225	Castelnuovo del Garda
C370	Cavaion Veronese
C412	Cazzano di Tramigna
C498	Cerea
C538	Cerro Veronese
C890	Cologna Veneta
C897	Colognola ai Colli
C943	Concamarise
D118	Costermano
D317	Dolcè
D419	Erbè
D420	Erbezzo
D549	Ferrara di Monte Baldo
D818	Fumane
D915	Garda
D957	Gazzo Veronese
E171	Grezzana
E284	Illasi
E349	Isola della Scala
E358	Isola Rizza
E489	Lavagno
E502	Lazise
E512	Legnago
E848	Malcesine
E911	Marano di Valpolicella
F172	Mezzane di Sotto
F218	Minerbe
F461	Montecchia di Crosara
F508	Monteforte d'Alpone
F789	Mozzecane
F861	Negrar
F918	Nogara
F921	Nogarole Rocca
G080	Oppeano
G297	Palù
G365	Pastrengo
G481	Pescantina
G489	Peschiera del Garda
G945	Povegliano Veronese
H048	Pressana
H356	Rivoli Veronese
H522	Roncà
H540	Ronco all'Adige
H606	Roverchiara
H610	Roveredo di Guà
H608	Roverè Veronese
H714	Salizzole
H783	San Bonifacio
H916	San Giovanni Ilarione
H924	San Giovanni Lupatoto
H944	Sanguinetto
I003	San Martino Buon Albergo
H712	San Mauro di Saline
I105	San Pietro di Morubio
I109	San Pietro in Cariano
I259	Sant'Ambrogio di Valpolicella
I292	Sant'Anna d'Alfaedo
I414	San Zeno di Montagna
I594	Selva di Progno
I775	Soave
I821	Sommacampagna
I826	Sona
I850	Sorgà
L136	Terrazzo
L287	Torri del Benaco
L364	Tregnago
L396	Trevenzuolo
L567	Valeggio sul Mincio
L722	Velo Veronese
L781	Verona
D193	Veronella
L810	Vestenanova
L869	Vigasio
L912	Villa Bartolomea
L949	Villafranca di Verona
M172	Zevio
M178	Zimella
A093	Agugliaro
A154	Albettone
A220	Alonte
A231	Altavilla Vicentina
A236	Altissimo
A377	Arcugnano
A444	Arsiero
A459	Arzignano
A465	Asiago
A467	Asigliano Veneto
A627	Barbarano Vicentino
A703	Bassano del Grappa
A954	Bolzano Vicentino
B132	Breganze
B143	Brendola
B161	Bressanvido
B196	Brogliano
B403	Caldogno
B433	Caltrano
B441	Calvene
B485	Camisano Vicentino
B511	Campiglia dei Berici
B547	Campolongo sul Brenta
B835	Carrè
B844	Cartigliano
C037	Cassola
C056	Castegnero
C119	Castelgomberto
C605	Chiampo
C650	Chiuppano
C734	Cismon del Grappa
C824	Cogollo del Cengio
C949	Conco
D020	Cornedo Vicentino
D107	Costabissara
D136	Creazzo
D156	Crespadoro
D379	Dueville
D407	Enego
D496	Fara Vicentino
D750	Foza
D882	Gallio
D897	Gambellara
D902	Gambugliano
E138	Grancona
E184	Grisignano di Zocco
E226	Grumolo delle Abbadesse
E354	Isola Vicentina
E403	Laghi
E465	Lastebasse
E671	Longare
E682	Lonigo
E731	Lugo di Vicenza
E762	Lusiana
E864	Malo
E912	Marano Vicentino
E970	Marostica
F019	Mason Vicentino
F306	Molvena
F442	Montebello Vicentino
F464	Montecchio Maggiore
F465	Montecchio Precalcino
F486	Monte di Malo
F514	Montegalda
F515	Montegaldella
F662	Monteviale
F675	Monticello Conte Otto
F696	Montorso Vicentino
F768	Mossano
F829	Mussolente
F838	Nanto
F922	Nogarole Vicentino
F957	Nove
F964	Noventa Vicentina
G095	Orgiano
G406	Pedemonte
G560	Pianezze
G694	Piovene Rocchette
G776	Pojana Maggiore
G931	Posina
G943	Pove del Grappa
G957	Pozzoleone
H134	Quinto Vicentino
H214	Recoaro Terme
H361	Roana
H512	Romano d'Ezzelino
H556	Rosà
H580	Rossano Veneto
H594	Rotzo
F810	Salcedo
H829	Sandrigo
H863	San Germano dei Berici
I047	San Nazario
I117	San Pietro Mussolino
I353	Santorso
I401	San Vito di Leguzzano
I425	Sarcedo
I430	Sarego
I527	Schiavon
I531	Schio
I783	Solagna
I867	Sossano
I879	Sovizzo
L156	Tezze sul Brenta
L157	Thiene
D717	Tonezza del Cimone
L248	Torrebelvicino
L297	Torri di Quartesolo
L433	Trissino
L551	Valdagno
L554	Valdastico
L624	Valli del Pasubio
L650	Valstagna
L723	Velo d'Astico
L840	Vicenza
L952	Villaga
M032	Villaverla
M145	Zanè
M170	Zermeghedo
M194	Zovencedo
M199	Zugliano
A083	Agordo
A121	Alano di Piave
A206	Alleghe
A443	Arsiè
A501	Auronzo di Cadore
A757	Belluno
A982	Borca di Cadore
B375	Calalzo di Cadore
C146	Castellavazzo
C458	Cencenighe Agordino
C577	Cesiomaggiore
C630	Chies d'Alpago
C672	Cibiana di Cadore
C872	Colle Santa Lucia
C920	Comelico Superiore
A266	Cortina d'Ampezzo
D247	Danta di Cadore
D330	Domegge di Cadore
D470	Falcade
D506	Farra d'Alpago
D530	Feltre
D686	Fonzaso
B574	Canale d'Agordo
D726	Forno di Zoldo
E113	Gosaldo
E429	Lamon
E490	La Valle Agordina
C562	Lentiai
E588	Limana
E622	Livinallongo del Col di Lana
E672	Longarone
E687	Lorenzago di Cadore
E708	Lozzo di Cadore
F094	Mel
G169	Ospitale di Cadore
G404	Pedavena
G442	Perarolo di Cadore
G638	Pieve d'Alpago
G642	Pieve di Cadore
B662	Ponte nelle Alpi
H092	Puos d'Alpago
H124	Quero
H327	Rivamonte Agordino
H379	Rocca Pietore
H938	San Gregorio nelle Alpi
I063	San Nicolò di Comelico
I088	San Pietro di Cadore
I206	Santa Giustina
I347	San Tomaso Agordino
C919	Santo Stefano di Cadore
I392	San Vito di Cadore
I421	Sappada
I563	Sedico
I592	Selva di Cadore
I626	Seren del Grappa
I866	Sospirolo
I876	Soverzene
I673	Sovramonte
L030	Taibon Agordino
L040	Tambre
L422	Trichiana
L584	Vallada Agordina
L590	Valle di Cadore
L692	Vas
L890	Vigo di Cadore
M108	Vodo Cadore
M124	Voltago Agordino
I345	Zoldo Alto
M189	Zoppè di Cadore
A237	Altivole
A360	Arcade
A471	Asolo
B061	Borso del Grappa
B128	Breda di Piave
B349	Caerano di San Marco
B678	Cappella Maggiore
B744	Carbonera
B879	Casale sul Sile
B965	Casier
C073	Castelcucco
C111	Castelfranco Veneto
C190	Castello di Godego
C384	Cavaso del Tomba
C580	Cessalto
C614	Chiarano
C689	Cimadolmo
C735	Cison di Valmarino
C815	Codognè
C848	Colle Umberto
C957	Conegliano
C992	Cordignano
D030	Cornuda
D157	Crespano del Grappa
C670	Crocetta del Montello
D505	Farra di Soligo
D654	Follina
D674	Fontanelle
D680	Fonte
D794	Fregona
D854	Gaiarine
E021	Giavera del Montello
E071	Godega di Sant'Urbano
E092	Gorgo al Monticano
E373	Istrana
E692	Loria
E893	Mansuè
E940	Mareno di Piave
F009	Maser
F012	Maserada sul Piave
F088	Meduna di Livenza
F190	Miane
F269	Mogliano Veneto
F332	Monastier di Treviso
F360	Monfumo
F443	Montebelluna
F725	Morgano
F729	Moriago della Battaglia
F770	Motta di Livenza
F872	Nervesa della Battaglia
F999	Oderzo
G115	Ormelle
G123	Orsago
G221	Paderno del Grappa
G229	Paese
G408	Pederobba
G645	Pieve di Soligo
G846	Ponte di Piave
G875	Ponzano Veneto
G909	Portobuffolè
G933	Possagno
G944	Povegliano
H022	Preganziol
H131	Quinto di Treviso
H220	Refrontolo
H238	Resana
H253	Revine Lago
H280	Riese Pio X
H523	Roncade
H706	Salgareda
H781	San Biagio di Callalta
H843	San Fior
I103	San Pietro di Feletto
I124	San Polo di Piave
I221	Santa Lucia di Piave
I382	San Vendemiano
I417	San Zenone degli Ezzelini
I435	Sarmede
I578	Segusino
I635	Sernaglia della Battaglia
F116	Silea
I927	Spresiano
L014	Susegana
L058	Tarzo
L402	Trevignano
L407	Treviso
L565	Valdobbiadene
L700	Vazzola
L706	Vedelago
L856	Vidor
M048	Villorba
M089	Vittorio Veneto
M118	Volpago del Montello
M163	Zenson di Piave
M171	Zero Branco
A302	Annone Veneto
B493	Campagna Lupia
B546	Campolongo Maggiore
B554	Camponogara
B642	Caorle
C383	Cavarzere
C422	Ceggia
C638	Chioggia
C714	Cinto Caomaggiore
C938	Cona
C950	Concordia Sagittaria
D325	Dolo
D415	Eraclea
D578	Fiesso d'Artico
D740	Fossalta di Piave
D741	Fossalta di Portogruaro
D748	Fossò
E215	Gruaro
C388	Jesolo
E936	Marcon
E980	Martellago
F130	Meolo
F229	Mira
F241	Mirano
F826	Musile di Piave
F904	Noale
F963	Noventa di Piave
G565	Pianiga
G914	Portogruaro
G981	Pramaggiore
H117	Quarto d'Altino
H735	Salzano
H823	San Donà di Piave
I040	San Michele al Tagliamento
I242	Santa Maria di Sala
I373	San Stino di Livenza
I551	Scorzè
I908	Spinea
I965	Stra
L085	Teglio Veneto
L267	Torre di Mosto
L736	Venezia
L899	Vigonovo
M308	Cavallino-Treporti
A001	Abano Terme
A075	Agna
A161	Albignasego
A296	Anguillara Veneta
A434	Arquà Petrarca
A438	Arre
A458	Arzergrande
A568	Bagnoli di Sopra
A613	Baone
A637	Barbona
A714	Battaglia Terme
A906	Boara Pisani
B031	Borgoricco
B106	Bovolenta
B213	Brugine
B345	Cadoneghe
B524	Campodarsego
B531	Campodoro
B563	Camposampiero
B564	Campo San Martino
B589	Candiana
B749	Carceri
B795	Carmignano di Brenta
B848	Cartura
B877	Casale di Scodosia
B912	Casalserugo
C057	Castelbaldo
C544	Cervarese Santa Croce
C713	Cinto Euganeo
C743	Cittadella
C812	Codevigo
C964	Conselve
D040	Correzzola
D226	Curtarolo
D442	Este
D679	Fontaniva
D879	Galliera Veneta
D889	Galzignano Terme
D956	Gazzo
E145	Grantorto
E146	Granze
E515	Legnaro
E592	Limena
E684	Loreggia
E709	Lozzo Atestino
F011	Maserà di Padova
F013	Masi
F033	Massanzago
F091	Megliadino San Fidenzio
F092	Megliadino San Vitale
F148	Merlara
F161	Mestrino
F382	Monselice
F394	Montagnana
F529	Montegrotto Terme
F962	Noventa Padovana
G167	Ospedaletto Euganeo
G224	Padova
G461	Pernumia
G534	Piacenza d'Adige
G587	Piazzola sul Brenta
G688	Piombino Dese
G693	Piove di Sacco
G802	Polverara
G823	Ponso
G850	Pontelongo
G855	Ponte San Nicolò
G963	Pozzonovo
H622	Rovolon
H625	Rubano
H655	Saccolongo
H705	Saletto
H893	San Giorgio delle Pertiche
H897	San Giorgio in Bosco
I008	San Martino di Lupari
I107	San Pietro in Gu
I120	San Pietro Viminario
I207	Santa Giustina in Colle
I226	Santa Margherita d'Adige
I275	Sant'Angelo di Piove di Sacco
I319	Sant'Elena
I375	Sant'Urbano
I418	Saonara
I595	Selvazzano Dentro
I799	Solesino
I938	Stanghella
L100	Teolo
L132	Terrassa Padovana
L199	Tombolo
L270	Torreglia
L349	Trebaseleghe
L414	Tribano
L497	Urbana
L710	Veggiano
L805	Vescovana
L878	Vighizzolo d'Este
L892	Vigodarzere
L900	Vigonza
L934	Villa del Conte
L937	Villa Estense
L947	Villafranca Padovana
L979	Villanova di Camposampiero
M103	Vo'
M300	Due Carrare
A059	Adria
A400	Ariano nel Polesine
A435	Arquà Polesine
A539	Badia Polesine
A574	Bagnolo di Po
A795	Bergantino
B069	Bosaro
B432	Calto
B578	Canaro
B582	Canda
C122	Castelguglielmo
C207	Castelmassa
C215	Castelnovo Bariano
C461	Ceneselli
C500	Ceregnano
C987	Corbola
D105	Costa di Rovigo
D161	Crespino
D568	Ficarolo
D577	Fiesso Umbertiano
D776	Frassinelle Polesine
D788	Fratta Polesine
D855	Gaiba
D942	Gavello
E008	Giacciano con Baruchella
E240	Guarda Veneta
E522	Lendinara
E689	Loreo
E761	Lusia
F095	Melara
F994	Occhiobello
G323	Papozze
G525	Pettorazza Grimani
G673	Pincara
G782	Polesella
G836	Pontecchio Polesine
G923	Porto Tolle
H573	Rosolina
H620	Rovigo
H689	Salara
H768	San Bellino
H996	San Martino di Venezze
I953	Stienta
L026	Taglio di Po
L359	Trecenta
L939	Villadose
L967	Villamarzana
L985	Villanova del Ghebbo
L988	Villanova Marchesana
G926	Porto Viro
A103	Aiello del Friuli
A254	Amaro
A267	Ampezzo
A346	Aquileia
A447	Arta Terme
A448	Artegna
A491	Attimis
A553	Bagnaria Arsa
A700	Basiliano
A810	Bertiolo
A855	Bicinicco
A983	Bordano
B259	Buja
B309	Buttrio
B483	Camino al Tagliamento
B536	Campoformido
B788	Carlino
B994	Cassacco
C327	Castions di Strada
C389	Cavazzo Carnico
C494	Cercivento
C556	Cervignano del Friuli
C641	Chiopris-Viscone
C656	Chiusaforte
C758	Cividale del Friuli
C817	Codroipo
C885	Colloredo di Monte Albano
C918	Comeglians
D027	Corno di Rosazzo
D085	Coseano
D300	Dignano
D316	Dogna
D366	Drenchia
D408	Enemonzo
D455	Faedis
D461	Fagagna
D627	Fiumicello
D630	Flaibano
D718	Forni Avoltri
D719	Forni di Sopra
D720	Forni di Sotto
D962	Gemona del Friuli
E083	Gonars
E179	Grimacco
E473	Latisana
E476	Lauco
E553	Lestizza
E584	Lignano Sabbiadoro
E586	Ligosullo
E760	Lusevera
E820	Magnano in Riviera
E833	Majano
E847	Malborghetto Valbruna
E899	Manzano
E910	Marano Lagunare
E982	Martignacco
F144	Mereto di Tomba
F266	Moggio Udinese
F275	Moimacco
F574	Montenars
F756	Mortegliano
F760	Moruzzo
F832	Muzzana del Turgnano
F898	Nimis
G163	Osoppo
G198	Ovaro
G238	Pagnacco
G268	Palazzolo dello Stella
G284	Palmanova
G300	Paluzza
G352	Pasian di Prato
G381	Paularo
G389	Pavia di Udine
G743	Pocenia
G831	Pontebba
G891	Porpetto
G949	Povoletto
G966	Pozzuolo del Friuli
G969	Pradamano
H002	Prato Carnico
H014	Precenicco
H029	Premariacco
H038	Preone
H040	Prepotto
H089	Pulfero
H161	Ragogna
H196	Ravascletto
H200	Raveo
H206	Reana del Rojale
H229	Remanzacco
H242	Resia
H244	Resiutta
H289	Rigolato
H347	Rive d'Arcano
H352	Rivignano
H533	Ronchis
H629	Ruda
H816	San Daniele del Friuli
H895	San Giorgio di Nogaro
H906	San Giovanni al Natisone
H951	San Leonardo
I092	San Pietro al Natisone
I248	Santa Maria la Longa
I404	San Vito al Torre
I405	San Vito di Fagagna
I464	Sauris
I478	Savogna
I562	Sedegliano
I777	Socchieve
I974	Stregna
L018	Sutrio
G736	Taipana
L039	Talmassons
L050	Tarcento
L057	Tarvisio
L065	Tavagnacco
L101	Teor
L144	Terzo d'Aquileia
L195	Tolmezzo
L246	Torreano
L309	Torviscosa
L335	Trasaghis
L381	Treppo Carnico
L382	Treppo Grande
L421	Tricesimo
L438	Trivignano Udinese
L483	Udine
L686	Varmo
L743	Venzone
L801	Verzegnis
L909	Villa Santina
M034	Villa Vicentina
M073	Visco
M200	Zuglio
D700	Forgaria nel Friuli
M311	Campolongo Tapogliano
B712	Capriva del Friuli
D014	Cormons
D312	Doberdò del Lago
D321	Dolegna del Collio
D504	Farra d'Isonzo
D645	Fogliano Redipuglia
E098	Gorizia
E124	Gradisca d'Isonzo
E125	Grado
E952	Mariano del Friuli
F081	Medea
F356	Monfalcone
F710	Moraro
F767	Mossa
H514	Romans d'Isonzo
H531	Ronchi dei Legionari
H665	Sagrado
H787	San Canzian d'Isonzo
H845	San Floriano del Collio
H964	San Lorenzo Isontino
I082	San Pier d'Isonzo
I479	Savogna d'Isonzo
I939	Staranzano
L474	Turriaco
M043	Villesse
D383	Duino-Aurisina
F378	Monrupino
F795	Muggia
D324	San Dorligo della Valle-Dolina
I715	Sgonico
L424	Trieste
A067	Agazzano
A223	Alseno
A823	Besenzone
A831	Bettola
A909	Bobbio
B025	Borgonovo Val Tidone
B332	Cadeo
B405	Calendasco
B479	Caminata
B643	Caorso
B812	Carpaneto Piacentino
C145	Castell'Arquato
C261	Castel San Giovanni
C288	Castelvetro Piacentino
C513	Cerignale
C838	Coli
D054	Corte Brugnatella
D061	Cortemaggiore
D502	Farini
D555	Ferriere
D611	Fiorenzuola d'Arda
D958	Gazzola
E114	Gossolengo
E132	Gragnano Trebbiense
E196	Gropparello
E726	Lugagnano Val d'Arda
F671	Monticelli d'Ongina
F724	Morfasso
F885	Nibbiano
G195	Ottone
G399	Pecorara
G535	Piacenza
G557	Pianello Val Tidone
G696	Piozzano
G747	Podenzano
G842	Ponte dell'Olio
G852	Pontenure
H350	Rivergaro
H593	Rottofreno
H887	San Giorgio Piacentino
G788	San Pietro in Cerro
I434	Sarmato
L348	Travo
L772	Vernasca
L897	Vigolzone
L980	Villanova sull'Arda
M165	Zerba
L848	Ziano Piacentino
A138	Albareto
A646	Bardi
A731	Bedonia
A788	Berceto
A987	Bore
B042	Borgo Val di Taro
B293	Busseto
B408	Calestano
C852	Collecchio
C904	Colorno
C934	Compiano
D026	Corniglio
D526	Felino
B034	Fidenza
D673	Fontanellato
D685	Fontevivo
D728	Fornovo di Taro
E438	Langhirano
E547	Lesignano de' Bagni
F082	Medesano
F174	Mezzani
F340	Monchio delle Corti
F473	Montechiarugolo
F882	Neviano degli Arduini
F914	Noceto
G255	Palanzano
G337	Parma
G424	Pellegrino Parmense
G783	Polesine Parmense
H384	Roccabianca
H682	Sala Baganza
H720	Salsomaggiore Terme
I153	San Secondo Parmense
I763	Sissa
I803	Solignano
I840	Soragna
I845	Sorbolo
E548	Terenzo
L183	Tizzano Val Parma
L229	Tornolo
L299	Torrile
L346	Traversetolo
L354	Trecasali
L641	Valmozzola
L672	Varano de' Melegari
L689	Varsi
M174	Zibello
A162	Albinea
A573	Bagnolo in Piano
A586	Baiso
A850	Bibbiano
A988	Boretto
B156	Brescello
B283	Busana
B328	Cadelbosco di Sopra
B499	Campagnola Emilia
B502	Campegine
B825	Carpineti
B893	Casalgrande
B967	Casina
C141	Castellarano
C218	Castelnovo di Sotto
C219	Castelnovo ne' Monti
C405	Cavriago
C669	Canossa
C840	Collagna
D037	Correggio
D450	Fabbrico
D934	Gattatico
E232	Gualtieri
E253	Guastalla
E585	Ligonchio
E772	Luzzara
F463	Montecchio Emilia
F960	Novellara
G947	Poviglio
H122	Quattro Castella
G654	Ramiseto
H225	Reggiolo
H223	Reggio nell'Emilia
H298	Rio Saliceto
H500	Rolo
H628	Rubiera
I011	San Martino in Rio
I123	San Polo d'Enza
I342	Sant'Ilario d'Enza
I496	Scandiano
L184	Toano
L815	Vetto
L820	Vezzano sul Crostolo
L831	Viano
L969	Villa Minozzo
A713	Bastiglia
A959	Bomporto
B539	Campogalliano
B566	Camposanto
B819	Carpi
C107	Castelfranco Emilia
C242	Castelnuovo Rangone
C287	Castelvetro di Modena
C398	Cavezzo
C951	Concordia sulla Secchia
D486	Fanano
D599	Finale Emilia
D607	Fiorano Modenese
D617	Fiumalbo
D711	Formigine
D783	Frassinoro
E264	Guiglia
E426	Lama Mocogno
E904	Maranello
E905	Marano sul Panaro
F087	Medolla
F240	Mirandola
F257	Modena
F484	Montecreto
F503	Montefiorino
F642	Montese
F930	Nonantola
F966	Novi di Modena
G250	Palagano
G393	Pavullo nel Frignano
G649	Pievepelago
G789	Polinago
H061	Prignano sulla Secchia
H195	Ravarino
H303	Riolunato
H794	San Cesario sul Panaro
H835	San Felice sul Panaro
I128	San Possidonio
I133	San Prospero
I462	Sassuolo
I473	Savignano sul Panaro
F357	Serramazzoni
I689	Sestola
I802	Soliera
I903	Spilamberto
L885	Vignola
M183	Zocca
A324	Anzola dell'Emilia
A392	Argelato
A665	Baricella
A726	Bazzano
A785	Bentivoglio
A944	Bologna
B044	Borgo Tossignano
B249	Budrio
B399	Calderara di Reno
B572	Camugnano
B880	Casalecchio di Reno
B892	Casalfiumanese
C075	Castel d'Aiano
C086	Castel del Rio
B969	Castel di Casio
C121	Castel Guelfo di Bologna
C185	Castello d'Argile
C191	Castello di Serravalle
C204	Castel Maggiore
C265	Castel San Pietro Terme
C292	Castenaso
C296	Castiglione dei Pepoli
D158	Crespellano
D166	Crevalcore
D360	Dozza
D668	Fontanelice
D847	Gaggio Montano
D878	Galliera
E135	Granaglione
E136	Granarolo dell'Emilia
E187	Grizzana Morandi
E289	Imola
A771	Lizzano in Belvedere
E655	Loiano
E844	Malalbergo
B689	Marzabotto
F083	Medicina
F219	Minerbio
F288	Molinella
F363	Monghidoro
F597	Monterenzio
F627	Monte San Pietro
F659	Monteveglio
F706	Monzuno
F718	Mordano
G205	Ozzano dell'Emilia
G570	Pianoro
G643	Pieve di Cento
A558	Porretta Terme
H678	Sala Bolognese
G566	San Benedetto Val di Sambro
H896	San Giorgio di Piano
G467	San Giovanni in Persiceto
H945	San Lazzaro di Savena
I110	San Pietro in Casale
I191	Sant'Agata Bolognese
G972	Sasso Marconi
I474	Savigno
L762	Vergato
M185	Zola Predosa
A393	Argenta
A806	Berra
A965	Bondeno
C469	Cento
C814	Codigoro
C912	Comacchio
C980	Copparo
D548	Ferrara
D713	Formignana
E320	Jolanda di Savoia
E410	Lagosanto
F016	Masi Torello
F026	Massa Fiscaglia
F156	Mesola
F198	Migliarino
F235	Mirabello
G184	Ostellato
G768	Poggio Renatico
G916	Portomaggiore
H360	Ro
I209	Sant'Agostino
L868	Vigarano Mainarda
M110	Voghiera
L390	Tresigallo
E107	Goro
F199	Migliaro
A191	Alfonsine
A547	Bagnacavallo
A551	Bagnara di Romagna
B188	Brisighella
B982	Casola Valsenio
C065	Castel Bolognese
C553	Cervia
C963	Conselice
D121	Cotignola
D458	Faenza
D829	Fusignano
E730	Lugo
F029	Massa Lombarda
H199	Ravenna
H302	Riolo Terme
H642	Russi
I196	Sant'Agata sul Santerno
I787	Solarolo
A565	Bagno di Romagna
A809	Bertinoro
B001	Borghi
C339	Castrocaro Terme e Terra del Sole
C573	Cesena
C574	Cesenatico
C777	Civitella di Romagna
D357	Dovadola
D704	Forlì
D705	Forlimpopoli
D867	Galeata
D899	Gambettola
D935	Gatteo
E675	Longiano
F097	Meldola
F139	Mercato Saraceno
F259	Modigliana
F668	Montiano
G904	Portico e San Benedetto
H017	Predappio
H034	Premilcuore
H437	Rocca San Casciano
H542	Roncofreddo
I027	San Mauro Pascoli
I310	Santa Sofia
I444	Sarsina
I472	Savignano sul Rubicone
I779	Sogliano al Rubicone
L361	Tredozio
L764	Verghereto
A035	Acqualagna
A327	Apecchio
A493	Auditore
A639	Barchi
A740	Belforte all'Isauro
B026	Borgo Pace
B352	Cagli
B636	Cantiano
B816	Carpegna
B846	Cartoceto
C830	Colbordolo
D488	Fano
D541	Fermignano
D749	Fossombrone
D791	Fratte Rosa
D807	Frontino
D808	Frontone
D836	Gabicce Mare
E122	Gradara
E351	Isola del Piano
E743	Lunano
E785	Macerata Feltria
F135	Mercatello sul Metauro
F136	Mercatino Conca
F310	Mombaroccio
F347	Mondavio
F348	Mondolfo
F450	Montecalvo in Foglia
F467	Monte Cerignone
F474	Monteciccardo
F478	Montecopiolo
F497	Montefelcino
F524	Monte Grimano Terme
F533	Montelabbate
F555	Montemaggiore al Metauro
F589	Monte Porzio
G089	Orciano di Pesaro
G416	Peglio
G453	Pergola
G479	Pesaro
G514	Petriano
G537	Piagge
G551	Piandimeleto
G627	Pietrarubbia
G682	Piobbico
H721	Saltara
H809	San Costanzo
H886	San Giorgio di Pesaro
H958	San Lorenzo in Campo
I285	Sant'Angelo in Lizzola
I287	Sant'Angelo in Vado
I344	Sant'Ippolito
I459	Sassocorvaro
I460	Sassofeltrio
I654	Serra Sant'Abbondio
I670	Serrungarina
L078	Tavoleto
L081	Tavullia
L498	Urbania
L500	Urbino
A092	Agugliano
A271	Ancona
A366	Arcevia
A626	Barbara
A769	Belvedere Ostrense
B468	Camerano
B470	Camerata Picena
C060	Castelbellino
C071	Castel Colonna
C100	Castelfidardo
C152	Castelleone di Suasa
C248	Castelplanio
C524	Cerreto d'Esi
C615	Chiaravalle
D007	Corinaldo
D211	Cupramontana
D451	Fabriano
D472	Falconara Marittima
D597	Filottrano
D965	Genga
E388	Jesi
E690	Loreto
E837	Maiolati Spontini
F145	Mergo
F381	Monsano
F453	Montecarotto
F560	Montemarciano
F593	Monterado
F600	Monte Roberto
F634	Monte San Vito
F745	Morro d'Alba
F978	Numana
G003	Offagna
G157	Osimo
F401	Ostra
F581	Ostra Vetere
G771	Poggio San Marcello
G803	Polverigi
H322	Ripe
H575	Rosora
H979	San Marcello
I071	San Paolo di Jesi
I251	Santa Maria Nuova
I461	Sassoferrato
I608	Senigallia
I643	Serra de' Conti
I653	Serra San Quirico
I758	Sirolo
I932	Staffolo
A031	Acquacanina
A329	Apiro
A334	Appignano
A739	Belforte del Chienti
A947	Bolognola
B398	Caldarola
B474	Camerino
B562	Camporotondo di Fiastrone
C251	Castelraimondo
C267	Castelsantangelo sul Nera
C582	Cessapalombo
C704	Cingoli
C770	Civitanova Marche
C886	Colmurano
D042	Corridonia
D429	Esanatoglia
D564	Fiastra
D609	Fiordimonte
D628	Fiuminata
D853	Gagliole
E228	Gualdo
E694	Loro Piceno
E783	Macerata
F051	Matelica
F268	Mogliano
F454	Montecassiano
F460	Monte Cavallo
F482	Montecosaro
F496	Montefano
F552	Montelupone
F621	Monte San Giusto
F622	Monte San Martino
F749	Morrovalle
F793	Muccia
G436	Penna San Giovanni
G515	Petriolo
G637	Pievebovigliana
G657	Pieve Torina
G690	Pioraco
D566	Poggio San Vicino
F567	Pollenza
G919	Porto Recanati
F632	Potenza Picena
H211	Recanati
H323	Ripe San Ginesio
H876	San Ginesio
I156	San Severino Marche
I286	Sant'Angelo in Pontano
I436	Sarnano
I569	Sefro
I651	Serrapetrona
I661	Serravalle di Chienti
L191	Tolentino
L366	Treia
L501	Urbisaglia
L517	Ussita
M078	Visso
A044	Acquasanta Terme
A047	Acquaviva Picena
A335	Appignano del Tronto
A437	Arquata del Tronto
A462	Ascoli Piceno
B727	Carassai
C093	Castel di Lama
C321	Castignano
C331	Castorano
C877	Colli del Tronto
C935	Comunanza
D096	Cossignano
D210	Cupra Marittima
D652	Folignano
D691	Force
E207	Grottammare
E868	Maltignano
F044	Massignano
F380	Monsampolo del Tronto
F415	Montalto delle Marche
F487	Montedinove
F501	Montefiore dell'Aso
F516	Montegallo
F570	Montemonaco
F591	Monteprandone
G005	Offida
G289	Palmiano
H321	Ripatransone
H390	Roccafluvione
H588	Rotella
H769	San Benedetto del Tronto
I912	Spinetoli
L728	Venarotta
A496	Aulla
A576	Bagnone
B832	Carrara
B979	Casola in Lunigiana
C914	Comano
D590	Filattiera
D629	Fivizzano
D735	Fosdinovo
E574	Licciana Nardi
F023	Massa
F679	Montignoso
F802	Mulazzo
G746	Podenzana
G870	Pontremoli
L386	Tresana
L946	Villafranca in Lunigiana
M169	Zeri
A241	Altopascio
A560	Bagni di Lucca
A657	Barga
B007	Borgo a Mozzano
B455	Camaiore
B557	Camporgiano
B648	Capannori
B760	Careggine
C236	Castelnuovo di Garfagnana
C303	Castiglione di Garfagnana
C996	Coreglia Antelminelli
D449	Fabbriche di Vallico
D730	Forte dei Marmi
D734	Fosciandora
D874	Gallicano
E059	Giuncugnano
E715	Lucca
F035	Massarosa
F225	Minucciano
F283	Molazzana
F452	Montecarlo
G480	Pescaglia
G582	Piazza al Serchio
G628	Pietrasanta
G648	Pieve Fosciana
G882	Porcari
I142	San Romano in Garfagnana
I622	Seravezza
I737	Sillano
I942	Stazzema
L533	Vagli Sotto
L763	Vergemoli
L833	Viareggio
L913	Villa Basilica
L926	Villa Collemandina
A012	Abetone
A071	Agliana
B251	Buggiano
D235	Cutigliano
E432	Lamporecchio
E451	Larciano
E960	Marliana
F025	Massa e Cozzile
F384	Monsummano Terme
F410	Montale
A561	Montecatini-Terme
G491	Pescia
G636	Pieve a Nievole
G713	Pistoia
G715	Piteglio
G833	Ponte Buggianese
H109	Quarrata
H744	Sambuca Pistoiese
H980	San Marcello Pistoiese
I660	Serravalle Pistoiese
L522	Uzzano
C631	Chiesina Uzzanese
A564	Bagno a Ripoli
A632	Barberino di Mugello
A633	Barberino Val d'Elsa
B036	Borgo San Lorenzo
B406	Calenzano
B507	Campi Bisenzio
B684	Capraia e Limite
C101	Castelfiorentino
C529	Cerreto Guidi
C540	Certaldo
D299	Dicomano
D403	Empoli
D575	Fiesole
D583	Figline Valdarno
D612	Firenze
D613	Firenzuola
D815	Fucecchio
D895	Gambassi Terme
E169	Greve in Chianti
E291	Impruneta
E296	Incisa in Val d'Arno
E466	Lastra a Signa
E668	Londa
E971	Marradi
F398	Montaione
F551	Montelupo Fiorentino
F648	Montespertoli
G270	Palazzuolo sul Senio
G420	Pelago
G825	Pontassieve
H222	Reggello
H286	Rignano sull'Arno
H635	Rufina
H791	San Casciano in Val di Pesa
H937	San Godenzo
I085	San Piero a Sieve
B962	Scandicci
I514	Scarperia
I684	Sesto Fiorentino
I728	Signa
L067	Tavarnelle Val di Pesa
L529	Vaglia
L838	Vicchio
M059	Vinci
A852	Bibbona
B509	Campiglia Marittima
B553	Campo nell'Elba
B669	Capoliveri
B685	Capraia Isola
C044	Castagneto Carducci
C415	Cecina
C869	Collesalvetti
E625	Livorno
E930	Marciana
E931	Marciana Marina
G687	Piombino
E680	Porto Azzurro
G912	Portoferraio
H305	Rio Marina
H297	Rio nell'Elba
H570	Rosignano Marittimo
I390	San Vincenzo
I454	Sassetta
L019	Suvereto
A864	Bientina
B303	Buti
B390	Calci
B392	Calcinaia
B647	Capannoli
B878	Casale Marittimo
A559	Casciana Terme
B950	Cascina
C113	Castelfranco di Sotto
C174	Castellina Marittima
C244	Castelnuovo di Val di Cecina
C609	Chianni
D160	Crespina
D510	Fauglia
E250	Guardistallo
E413	Lajatico
E455	Lari
E688	Lorenzana
F458	Montecatini Val di Cecina
F640	Montescudaio
F661	Monteverdi Marittimo
F686	Montopoli in Val d'Arno
G090	Orciano Pisano
G254	Palaia
G395	Peccioli
G702	Pisa
G804	Pomarance
G822	Ponsacco
G843	Pontedera
H319	Riparbella
A562	San Giuliano Terme
I046	San Miniato
I177	Santa Croce sull'Arno
I217	Santa Luce
I232	Santa Maria a Monte
L138	Terricciola
L702	Vecchiano
L850	Vicopisano
M126	Volterra
A291	Anghiari
A390	Arezzo
A541	Badia Tedalda
A851	Bibbiena
B243	Bucine
B670	Capolona
B693	Caprese Michelangelo
C102	Castel Focognano
C112	Castelfranco di Sopra
C263	Castel San Niccolò
C318	Castiglion Fibocchi
C319	Castiglion Fiorentino
C407	Cavriglia
C648	Chitignano
C663	Chiusi della Verna
C774	Civitella in Val di Chiana
D077	Cortona
D649	Foiano della Chiana
E468	Laterina
E693	Loro Ciuffenna
E718	Lucignano
E933	Marciano della Chiana
F565	Montemignaio
F594	Monterchi
F628	Monte San Savino
F656	Montevarchi
G139	Ortignano Raggiolo
G451	Pergine Valdarno
G552	Pian di Sco
G653	Pieve Santo Stefano
G879	Poppi
H008	Pratovecchio
H901	San Giovanni Valdarno
I155	Sansepolcro
I681	Sestino
I952	Stia
I991	Subbiano
L038	Talla
L123	Terranuova Bracciolini
A006	Abbadia San Salvatore
A461	Asciano
B269	Buonconvento
B984	Casole d'Elsa
C172	Castellina in Chianti
C227	Castelnuovo Berardenga
C313	Castiglione d'Orcia
C587	Cetona
C608	Chianciano Terme
C661	Chiusdino
C662	Chiusi
C847	Colle di Val d'Elsa
D858	Gaiole in Chianti
F402	Montalcino
F592	Montepulciano
F598	Monteriggioni
F605	Monteroni d'Arbia
F676	Monticiano
F815	Murlo
G547	Piancastagnaio
G602	Pienza
G752	Poggibonsi
H153	Radda in Chianti
H156	Radicofani
H157	Radicondoli
H185	Rapolano Terme
H790	San Casciano dei Bagni
H875	San Gimignano
H911	San Giovanni d'Asso
I135	San Quirico d'Orcia
I445	Sarteano
I726	Siena
A468	Sinalunga
I877	Sovicille
L303	Torrita di Siena
L384	Trequanda
A369	Arcidosso
B497	Campagnatico
B646	Capalbio
C085	Castel del Piano
C147	Castell'Azzara
C310	Castiglione della Pescaia
C705	Cinigiano
C782	Civitella Paganico
D656	Follonica
D948	Gavorrano
E202	Grosseto
E348	Isola del Giglio
E810	Magliano in Toscana
E875	Manciano
F032	Massa Marittima
F437	Monte Argentario
F677	Montieri
G088	Orbetello
G716	Pitigliano
H417	Roccalbegna
H449	Roccastrada
I187	Santa Fiora
I504	Scansano
I510	Scarlino
I571	Seggiano
I841	Sorano
F612	Monterotondo Marittimo
I601	Semproniano
A475	Assisi
A710	Bastia Umbra
A832	Bettona
A835	Bevagna
B504	Campello sul Clitunno
B609	Cannara
B948	Cascia
C252	Castel Ritaldi
C309	Castiglione del Lago
C527	Cerreto di Spoleto
C742	Citerna
C744	Città della Pieve
C745	Città di Castello
C845	Collazzone
C990	Corciano
D108	Costacciaro
D279	Deruta
D653	Foligno
D745	Fossato di Vico
D787	Fratta Todina
E012	Giano dell'Umbria
E229	Gualdo Cattaneo
E230	Gualdo Tadino
E256	Gubbio
E613	Lisciano Niccone
E805	Magione
E975	Marsciano
F024	Massa Martana
F456	Monte Castello di Vibio
F492	Montefalco
F540	Monteleone di Spoleto
F629	Monte Santa Maria Tiberina
F685	Montone
F911	Nocera Umbra
F935	Norcia
G212	Paciano
G308	Panicale
G359	Passignano sul Trasimeno
G478	Perugia
G601	Piegaro
G618	Pietralunga
G758	Poggiodomo
H015	Preci
H935	San Giustino
I263	Sant'Anatolia di Narco
I522	Scheggia e Pascelupo
I523	Scheggino
I585	Sellano
I727	Sigillo
I888	Spello
I921	Spoleto
L188	Todi
L216	Torgiano
L397	Trevi
L466	Tuoro sul Trasimeno
D786	Umbertide
L573	Valfabbrica
L627	Vallo di Nera
L653	Valtopina
A045	Acquasparta
A207	Allerona
A242	Alviano
A262	Amelia
A439	Arrone
A490	Attigliano
A691	Baschi
B446	Calvi dell'Umbria
C117	Castel Giorgio
C289	Castel Viscardo
D454	Fabro
D538	Ferentillo
D570	Ficulle
E045	Giove
E241	Guardea
E729	Lugnano in Teverina
F457	Montecastrilli
F462	Montecchio
F510	Montefranco
F513	Montegabbione
F543	Monteleone d'Orvieto
F844	Narni
G148	Orvieto
G189	Otricoli
G344	Parrano
G432	Penna in Teverina
G790	Polino
G881	Porano
H857	San Gemini
I381	San Venanzo
I981	Stroncone
L117	Terni
M258	Avigliano Umbro
A040	Acquapendente
A412	Arlena di Castro
A577	Bagnoregio
A628	Barbarano Romano
A704	Bassano Romano
A706	Bassano in Teverina
A857	Blera
A949	Bolsena
A955	Bomarzo
B388	Calcata
B597	Canepina
B604	Canino
B663	Capodimonte
B688	Capranica
B691	Caprarola
B735	Carbognano
C269	Castel Sant'Elia
C315	Castiglione in Teverina
C446	Celleno
C447	Cellere
C765	Civita Castellana
C780	Civitella d'Agliano
C988	Corchiano
D452	Fabrica di Roma
D475	Faleria
D503	Farnese
D870	Gallese
E126	Gradoli
E128	Graffignano
E210	Grotte di Castro
E330	Ischia di Castro
E467	Latera
E713	Lubriano
E978	Marta
F419	Montalto di Castro
F499	Montefiascone
F603	Monte Romano
F606	Monterosi
F868	Nepi
G065	Onano
G111	Oriolo Romano
G135	Orte
G571	Piansano
H071	Proceno
H534	Ronciglione
H913	Villa San Giovanni in Tuscia
H969	San Lorenzo Nuovo
I855	Soriano nel Cimino
L017	Sutri
D024	Tarquinia
L150	Tessennano
L310	Tuscania
L569	Valentano
L612	Vallerano
A701	Vasanello
L713	Vejano
L814	Vetralla
L882	Vignanello
M082	Viterbo
M086	Vitorchiano
A019	Accumoli
A258	Amatrice
A315	Antrodoco
A464	Ascrea
A765	Belmonte in Sabina
A981	Borbona
B008	Borgorose
A996	Borgo Velino
B627	Cantalice
B631	Cantalupo in Sabina
B934	Casaprota
A472	Casperia
C098	Castel di Tora
C224	Castelnuovo di Farfa
C268	Castel Sant'Angelo
C746	Cittaducale
C749	Cittareale
C841	Collalto Sabino
C857	Colle di Tora
C859	Collegiove
C876	Collevecchio
C880	Colli sul Velino
C946	Concerviano
C959	Configni
C969	Contigliano
D124	Cottanello
D493	Fara in Sabina
D560	Fiamignano
D689	Forano
D785	Frasso Sabino
E160	Greccio
E393	Labro
E535	Leonessa
E681	Longone Sabino
E812	Magliano Sabina
E927	Marcetelli
F193	Micigliano
F319	Mompeo
F430	Montasola
F446	Montebuono
F541	Monteleone Sabino
F579	Montenero Sabino
F619	Monte San Giovanni in Sabina
F687	Montopoli di Sabina
F746	Morro Reatino
F876	Nespolo
B595	Orvinio
G232	Paganico Sabino
G498	Pescorocchiano
G513	Petrella Salto
G756	Poggio Bustone
G757	Poggio Catino
G763	Poggio Mirteto
G764	Poggio Moiano
G765	Poggio Nativo
G770	Poggio San Lorenzo
G934	Posta
G951	Pozzaglia Sabina
H282	Rieti
H354	Rivodutri
H427	Roccantica
H446	Rocca Sinibalda
H713	Salisano
I499	Scandriglia
I581	Selci
I959	Stimigliano
L046	Tarano
L189	Toffia
L293	Torricella in Sabina
L286	Torri in Sabina
G507	Turania
L525	Vacone
L676	Varco Sabino
A062	Affile
A084	Agosta
A132	Albano Laziale
A210	Allumiere
A297	Anguillara Sabazia
A309	Anticoli Corrado
A323	Anzio
A370	Arcinazzo Romano
A401	Ariccia
A446	Arsoli
A449	Artena
A749	Bellegra
B114	Bracciano
B472	Camerata Nuova
B496	Campagnano di Roma
B576	Canale Monterano
B635	Canterano
B649	Capena
B687	Capranica Prenestina
B828	Carpineto Romano
B932	Casape
C116	Castel Gandolfo
C203	Castel Madama
C237	Castelnuovo di Porto
C266	Castel San Pietro Romano
C390	Cave
C518	Cerreto Laziale
C543	Cervara di Roma
C552	Cerveteri
C677	Ciciliano
C702	Cineto Romano
C773	Civitavecchia
C784	Civitella San Paolo
C858	Colleferro
C900	Colonna
D561	Fiano Romano
D586	Filacciano
D707	Formello
D773	Frascati
D875	Gallicano nel Lazio
D945	Gavignano
D964	Genazzano
D972	Genzano di Roma
D978	Gerano
E091	Gorga
E204	Grottaferrata
E263	Guidonia Montecelio
E382	Jenne
E392	Labico
C767	Lanuvio
E576	Licenza
E813	Magliano Romano
B632	Mandela
E900	Manziana
E908	Marano Equo
E924	Marcellina
E958	Marino
F064	Mazzano Romano
F127	Mentana
F477	Monte Compatri
F504	Monteflavio
F534	Montelanico
F545	Montelibretti
F590	Monte Porzio Catone
F611	Monterotondo
F692	Montorio Romano
F730	Moricone
F734	Morlupo
F857	Nazzano
F865	Nemi
F871	Nerola
F880	Nettuno
G022	Olevano Romano
G274	Palestrina
G293	Palombara Sabina
G444	Percile
G704	Pisoniano
G784	Poli
G811	Pomezia
G874	Ponzano Romano
H267	Riano
H288	Rignano Flaminio
H300	Riofreddo
H387	Rocca Canterano
H401	Rocca di Cave
H404	Rocca di Papa
H411	Roccagiovine
H432	Rocca Priora
H441	Rocca Santo Stefano
H494	Roiate
H501	Roma
H618	Roviano
H658	Sacrofano
H745	Sambuci
H942	San Gregorio da Sassola
I125	San Polo dei Cavalieri
I255	Santa Marinella
I284	Sant'Angelo Romano
I352	Sant'Oreste
I400	San Vito Romano
I424	Saracinesco
I573	Segni
I992	Subiaco
L182	Tivoli
L192	Tolfa
L302	Torrita Tiberina
L401	Trevignano Romano
L611	Vallepietra
L625	Vallinfreda
L639	Valmontone
L719	Velletri
L851	Vicovaro
M095	Vivaro Romano
M141	Zagarolo
M207	Lariano
M212	Ladispoli
M213	Ardea
M272	Ciampino
M295	San Cesareo
M297	Fiumicino
M309	Fonte Nuova
A341	Aprilia
A707	Bassiano
B527	Campodimele
C104	Castelforte
C740	Cisterna di Latina
D003	Cori
D662	Fondi
D708	Formia
D843	Gaeta
E375	Itri
E472	Latina
E527	Lenola
E798	Maenza
F224	Minturno
F616	Monte San Biagio
F937	Norma
G865	Pontinia
G871	Ponza
G698	Priverno
H076	Prossedi
H413	Roccagorga
H421	Rocca Massima
H444	Roccasecca dei Volsci
H647	Sabaudia
H836	San Felice Circeo
I339	Santi Cosma e Damiano
I634	Sermoneta
I712	Sezze
I832	Sonnino
I892	Sperlonga
I902	Spigno Saturnia
L120	Terracina
L742	Ventotene
A032	Acquafondata
A054	Acuto
A123	Alatri
A244	Alvito
A256	Amaseno
A269	Anagni
A348	Aquino
A363	Arce
A421	Arnara
A433	Arpino
A486	Atina
A502	Ausonia
A763	Belmonte Castello
A720	Boville Ernica
B195	Broccostella
B543	Campoli Appennino
B862	Casalattico
B919	Casalvieri
C034	Cassino
C177	Castelliri
C223	Castelnuovo Parano
C340	Castrocielo
C338	Castro dei Volsci
C413	Ceccano
C479	Ceprano
C545	Cervaro
C836	Colfelice
C864	Collepardo
C870	Colle San Magno
C998	Coreno Ausonio
D440	Esperia
D483	Falvaterra
D539	Ferentino
D591	Filettino
A310	Fiuggi
D667	Fontana Liri
D682	Fontechiari
D810	Frosinone
D819	Fumone
D881	Gallinaro
E057	Giuliano di Roma
E236	Guarcino
E340	Isola del Liri
F620	Monte San Giovanni Campano
F740	Morolo
G276	Paliano
G362	Pastena
G374	Patrica
G500	Pescosolido
G591	Picinisco
G592	Pico
G598	Piedimonte San Germano
G659	Piglio
G662	Pignataro Interamna
G749	Pofi
G838	Pontecorvo
G935	Posta Fibreno
H324	Ripi
H393	Rocca d'Arce
H443	Roccasecca
H779	San Biagio Saracinisco
H824	San Donato Val di Comino
H880	San Giorgio a Liri
H917	San Giovanni Incarico
I256	Sant'Ambrogio sul Garigliano
I265	Sant'Andrea del Garigliano
I302	Sant'Apollinare
I321	Sant'Elia Fiumerapido
I351	Santopadre
I408	San Vittore del Lazio
I669	Serrone
I697	Settefrati
I716	Sgurgola
I838	Sora
I973	Strangolagalli
L009	Supino
L105	Terelle
L243	Torre Cajetani
L290	Torrice
L398	Trevi nel Lazio
L437	Trivigliano
L598	Vallecorsa
L605	Vallemaio
L614	Vallerotonda
L780	Veroli
L836	Vicalvi
L843	Vico nel Lazio
A081	Villa Latina
L905	Villa Santa Lucia
I364	Villa Santo Stefano
M083	Viticuso
A106	Ailano
A200	Alife
A243	Alvignano
A403	Arienzo
A512	Aversa
A579	Baia e Latina
A755	Bellona
B361	Caianello
B362	Caiazzo
B445	Calvi Risorta
B477	Camigliano
B581	Cancello ed Arnone
B667	Capodrise
B704	Capriati a Volturno
B715	Capua
B779	Carinaro
B781	Carinola
B860	Casagiove
B872	Casal di Principe
B916	Casaluce
B935	Casapulla
B963	Caserta
B494	Castel Campagnano
C097	Castel di Sasso
C178	Castello del Matese
C211	Castel Morrone
C291	Castel Volturno
C558	Cervino
C561	Cesa
C716	Ciorlano
C939	Conca della Campania
D228	Curti
D361	Dragoni
D683	Fontegreca
D709	Formicola
D769	Francolise
D799	Frignano
D884	Gallo Matese
D886	Galluccio
E011	Giano Vetusto
E039	Gioia Sannitica
E158	Grazzanise
E173	Gricignano di Aversa
E554	Letino
E570	Liberi
E754	Lusciano
E784	Macerata Campania
E791	Maddaloni
E932	Marcianise
E998	Marzano Appio
F203	Mignano Monte Lungo
F352	Mondragone
G130	Orta di Atella
G333	Parete
G364	Pastorano
G541	Piana di Monte Verna
G596	Piedimonte Matese
G620	Pietramelara
G630	Pietravairano
G661	Pignataro Maggiore
G849	Pontelatone
G903	Portico di Caserta
G991	Prata Sannita
G995	Pratella
H045	Presenzano
H202	Raviscanina
H210	Recale
H268	Riardo
H398	Rocca d'Evandro
H423	Roccamonfina
H436	Roccaromana
H459	Rocchetta e Croce
H165	Ruviano
H798	San Cipriano d'Aversa
H834	San Felice a Cancello
H939	San Gregorio Matese
H978	San Marcellino
I056	San Nicola la Strada
I113	San Pietro Infine
I130	San Potito Sannitico
I131	San Prisco
I233	Santa Maria a Vico
I234	Santa Maria Capua Vetere
I247	Santa Maria la Fossa
I261	San Tammaro
I273	Sant'Angelo d'Alife
I306	Sant'Arpino
I676	Sessa Aurunca
I885	Sparanise
I993	Succivo
L083	Teano
L155	Teverola
L205	Tora e Piccilli
L379	Trentola-Ducenta
L540	Vairano Patenora
L594	Valle Agricola
L591	Valle di Maddaloni
D801	Villa di Briano
L844	Villa Literno
M092	Vitulazio
D471	Falciano del Massico
M262	Cellole
M260	Casapesenna
F043	San Marco Evangelista
A110	Airola
A265	Amorosi
A328	Apice
A330	Apollosa
A431	Arpaia
A432	Arpaise
A696	Baselice
A783	Benevento
A970	Bonea
B239	Bucciano
B267	Buonalbergo
B444	Calvi
B541	Campolattaro
B542	Campoli del Monte Taburno
B873	Casalduni
C106	Castelfranco in Miscano
C245	Castelpagano
C250	Castelpoto
C280	Castelvenere
C284	Castelvetere in Val Fortore
C359	Cautano
C476	Ceppaloni
C525	Cerreto Sannita
C719	Circello
C846	Colle Sannita
D230	Cusano Mutri
D380	Dugenta
D386	Durazzano
D469	Faicchio
D644	Foglianise
D650	Foiano di Val Fortore
D693	Forchia
D755	Fragneto l'Abate
D756	Fragneto Monforte
D784	Frasso Telesino
E034	Ginestra degli Schiavoni
E249	Guardia Sanframondi
E589	Limatola
F113	Melizzano
F274	Moiano
F287	Molinara
F494	Montefalcone di Val Fortore
F636	Montesarchio
F717	Morcone
G227	Paduli
G243	Pago Veiano
G311	Pannarano
G318	Paolisi
G386	Paupisi
G494	Pesco Sannita
G626	Pietraroja
G631	Pietrelcina
G827	Ponte
G848	Pontelandolfo
H087	Puglianello
H227	Reino
H764	San Bartolomeo in Galdo
H894	San Giorgio del Sannio
H898	San Giorgio La Molara
H953	San Leucio del Sannio
H955	San Lorenzello
H967	San Lorenzo Maggiore
H973	San Lupo
H984	San Marco dei Cavoti
I002	San Martino Sannita
I049	San Nazzaro
I062	San Nicola Manfredi
I145	San Salvatore Telesino
I179	Santa Croce del Sannio
I197	Sant'Agata de' Goti
I277	Sant'Angelo a Cupolo
I455	Sassinoro
I809	Solopaca
L086	Telese Terme
L185	Tocco Caudio
L254	Torrecuso
M093	Vitulano
F557	Sant'Arcangelo Trimonte
A024	Acerra
A064	Afragola
A068	Agerola
A268	Anacapri
A455	Arzano
A535	Bacoli
A617	Barano d'Ischia
B076	Boscoreale
B077	Boscotrecase
B227	Brusciano
B371	Caivano
B452	Calvizzano
B565	Camposano
B696	Capri
B740	Carbonara di Nola
B759	Cardito
B905	Casalnuovo di Napoli
B922	Casamarciano
B924	Casamicciola Terme
B925	Casandrino
B946	Casavatore
B980	Casola di Napoli
B990	Casoria
C129	Castellammare di Stabia
C188	Castello di Cisterna
C495	Cercola
C675	Cicciano
C697	Cimitile
C929	Comiziano
D170	Crispano
D702	Forio
D789	Frattamaggiore
D790	Frattaminore
E054	Giugliano in Campania
E131	Gragnano
E224	Grumo Nevano
E329	Ischia
E396	Lacco Ameno
E557	Lettere
E620	Liveri
E906	Marano di Napoli
E954	Mariglianella
E955	Marigliano
F030	Massa Lubrense
F111	Melito di Napoli
F162	Meta
F488	Monte di Procida
F799	Mugnano di Napoli
F839	Napoli
F924	Nola
G190	Ottaviano
G283	Palma Campania
G568	Piano di Sorrento
G670	Pimonte
G762	Poggiomarino
G795	Pollena Trocchia
G812	Pomigliano d'Arco
G813	Pompei
G902	Portici
G964	Pozzuoli
H072	Procida
H101	Qualiano
H114	Quarto
H243	Ercolano
H433	Roccarainola
H860	San Gennaro Vesuviano
H892	San Giorgio a Cremano
H931	San Giuseppe Vesuviano
I073	San Paolo Bel Sito
I151	San Sebastiano al Vesuvio
I208	Sant'Agnello
I262	Sant'Anastasia
I293	Sant'Antimo
I300	Sant'Antonio Abate
I391	San Vitaliano
I469	Saviano
I540	Scisciano
I652	Serrara Fontana
I820	Somma Vesuviana
I862	Sorrento
I978	Striano
L142	Terzigno
L245	Torre Annunziata
L259	Torre del Greco
L460	Tufino
L845	Vico Equense
G309	Villaricca
M072	Visciano
M115	Volla
M273	Santa Maria la Carità
M280	Trecase
M289	Massa di Somma
A101	Aiello del Sabato
A228	Altavilla Irpina
A284	Andretta
A347	Aquilonia
A399	Ariano Irpino
A489	Atripalda
A508	Avella
A509	Avellino
A566	Bagnoli Irpino
A580	Baiano
A881	Bisaccia
A975	Bonito
B367	Cairano
B374	Calabritto
B415	Calitri
B590	Candida
B674	Caposele
B706	Capriglia Irpina
B776	Carife
B866	Casalbore
B997	Cassano Irpino
C058	Castel Baronia
C105	Castelfranci
C283	Castelvetere sul Calore
C557	Cervinara
C576	Cesinali
C606	Chianche
C659	Chiusano di San Domenico
C971	Contrada
C976	Conza della Campania
D331	Domicella
D638	Flumeri
D671	Fontanarosa
D701	Forino
D798	Frigento
D998	Gesualdo
E161	Greci
E206	Grottaminarda
E214	Grottolella
E245	Guardia Lombardi
E397	Lacedonia
E448	Lapio
E487	Lauro
E605	Lioni
E746	Luogosano
E891	Manocalzati
E997	Marzano di Nola
F110	Melito Irpino
F141	Mercogliano
F230	Mirabella Eclano
F397	Montaguto
F448	Montecalvo Irpino
F491	Montefalcione
F506	Monteforte Irpino
F511	Montefredane
F512	Montefusco
F546	Montella
F559	Montemarano
F566	Montemiletto
F660	Monteverde
F693	Montoro Inferiore
F694	Montoro Superiore
F744	Morra De Sanctis
F762	Moschiano
F798	Mugnano del Cardinale
F988	Nusco
G165	Ospedaletto d'Alpinolo
G242	Pago del Vallo di Lauro
G340	Parolise
G370	Paternopoli
G519	Petruro Irpino
G611	Pietradefusi
G629	Pietrastornina
G990	Prata di Principato Ultra
H006	Pratola Serra
H097	Quadrelle
H128	Quindici
H382	Roccabascerana
H438	Rocca San Felice
H592	Rotondi
H733	Salza Irpina
H975	San Mango sul Calore
I016	San Martino Valle Caudina
I034	San Michele di Serino
I061	San Nicola Baronia
I129	San Potito Ultra
I163	San Sossio Baronia
I219	Santa Lucia di Serino
I264	Sant'Andrea di Conza
I279	Sant'Angelo all'Esca
I280	Sant'Angelo a Scala
I281	Sant'Angelo dei Lombardi
I301	Santa Paolina
I357	Santo Stefano del Sole
I471	Savignano Irpino
I493	Scampitella
I606	Senerchia
I630	Serino
I756	Sirignano
I805	Solofra
I843	Sorbo Serpico
I893	Sperone
I990	Sturno
L004	Summonte
L061	Taurano
L062	Taurasi
L102	Teora
L214	Torella dei Lombardi
L272	Torre Le Nocelle
L301	Torrioni
L399	Trevico
L461	Tufo
L589	Vallata
L616	Vallesaccarda
L739	Venticano
L965	Villamaina
L973	Villanova del Battista
M130	Volturara Irpina
M203	Zungoli
A023	Acerno
A091	Agropoli
A128	Albanella
A186	Alfano
A230	Altavilla Silentina
A251	Amalfi
A294	Angri
A343	Aquara
A460	Ascea
A484	Atena Lucana
A487	Atrani
A495	Auletta
A674	Baronissi
A717	Battipaglia
A756	Bellosguardo
B115	Bracigliano
B242	Buccino
B266	Buonabitacolo
B351	Caggiano
B437	Calvanico
B476	Camerota
B492	Campagna
B555	Campora
B608	Cannalonga
B644	Capaccio
B868	Casalbuono
B888	Casaletto Spartano
B895	Casal Velino
B959	Caselle in Pittari
C069	Castelcivita
C125	Castellabate
C231	Castelnuovo Cilento
C235	Castelnuovo di Conza
C259	Castel San Giorgio
C262	Castel San Lorenzo
C306	Castiglione del Genovesi
C361	Cava de' Tirreni
C444	Celle di Bulgheria
C470	Centola
C485	Ceraso
C584	Cetara
C676	Cicerale
C879	Colliano
C940	Conca dei Marini
C973	Controne
C974	Contursi Terme
C984	Corbara
D011	Corleto Monforte
D195	Cuccaro Vetere
D390	Eboli
D527	Felitto
D615	Fisciano
D826	Furore
D832	Futani
E026	Giffoni Sei Casali
E027	Giffoni Valle Piana
E037	Gioi
E060	Giungano
E365	Ispani
E480	Laureana Cilento
E485	Laurino
E486	Laurito
E498	Laviano
E767	Lustra
E814	Magliano Vetere
E839	Maiori
F138	Mercato San Severino
F223	Minori
F278	Moio della Civitella
F426	Montano Antilia
F479	Montecorice
F480	Montecorvino Pugliano
F481	Montecorvino Rovella
F507	Monteforte Cilento
F618	Monte San Giacomo
F625	Montesano sulla Marcellana
F731	Morigerati
F912	Nocera Inferiore
F913	Nocera Superiore
F967	Novi Velia
G011	Ogliastro Cilento
G023	Olevano sul Tusciano
G039	Oliveto Citra
G063	Omignano
G121	Orria
G192	Ottati
G226	Padula
G230	Pagani
G292	Palomonte
G426	Pellezzano
G447	Perdifumo
G455	Perito
G476	Pertosa
G509	Petina
G538	Piaggine
G707	Pisciotta
G793	Polla
G796	Pollica
G834	Pontecagnano Faiano
G932	Positano
G939	Postiglione
G976	Praiano
H062	Prignano Cilento
H198	Ravello
H277	Ricigliano
H394	Roccadaspide
H412	Roccagloriosa
H431	Roccapiemonte
H485	Rofrano
H503	Romagnano al Monte
H564	Roscigno
H644	Rutino
H654	Sacco
H683	Sala Consilina
H686	Salento
H703	Salerno
H732	Salvitelle
H800	San Cipriano Picentino
H907	San Giovanni a Piro
H943	San Gregorio Magno
H977	San Mango Piemonte
I019	San Marzano sul Sarno
I031	San Mauro Cilento
I032	San Mauro la Bruca
I089	San Pietro al Tanagro
I143	San Rufo
I253	Santa Marina
I278	Sant'Angelo a Fasanella
I307	Sant'Arsenio
I317	Sant'Egidio del Monte Albino
I260	Santomenna
I377	San Valentino Torio
I410	Sanza
I422	Sapri
I438	Sarno
I451	Sassano
I483	Scafati
I486	Scala
I648	Serramezzana
I666	Serre
I677	Sessa Cilento
I720	Siano
M253	Sicignano degli Alburni
G887	Stella Cilento
I960	Stio
D292	Teggiano
L212	Torchiara
L233	Torraca
L274	Torre Orsaia
L306	Tortorella
L323	Tramonti
L377	Trentinara
G540	Valle dell'Angelo
L628	Vallo della Lucania
L656	Valva
L835	Vibonati
L860	Vietri sul Mare
M294	Bellizzi
A018	Acciano
A100	Aielli
A187	Alfedena
A318	Anversa degli Abruzzi
A481	Ateleta
A515	Avezzano
A603	Balsorano
A656	Barete
A667	Barisciano
A678	Barrea
A884	Bisegna
B256	Bugnara
B358	Cagnano Amiterno
B382	Calascio
B526	Campo di Giove
B569	Campotosto
B606	Canistro
B624	Cansano
B651	Capestrano
B656	Capistrello
B658	Capitignano
B672	Caporciano
B677	Cappadocia
B725	Carapelle Calvisio
B842	Carsoli
C083	Castel del Monte
C090	Castel di Ieri
C096	Castel di Sangro
C126	Castellafiume
C278	Castelvecchio Calvisio
C279	Castelvecchio Subequo
C426	Celano
C492	Cerchio
C766	Civita d'Antino
C778	Civitella Alfedena
C783	Civitella Roveto
C811	Cocullo
C844	Collarmele
C862	Collelongo
C866	Collepietro
C999	Corfinio
D465	Fagnano Alto
D681	Fontecchio
D736	Fossa
D850	Gagliano Aterno
E040	Gioia dei Marsi
E096	Goriano Sicoli
E307	Introdacqua
A345	L'Aquila
E505	Lecce nei Marsi
E723	Luco dei Marsi
E724	Lucoli
E811	Magliano de' Marsi
F022	Massa d'Albe
M255	Molina Aterno
F595	Montereale
F732	Morino
F852	Navelli
F996	Ocre
G002	Ofena
G079	Opi
G102	Oricola
G142	Ortona dei Marsi
G145	Ortucchio
G200	Ovindoli
G210	Pacentro
G449	Pereto
G484	Pescasseroli
G492	Pescina
G493	Pescocostanzo
G524	Pettorano sul Gizio
G726	Pizzoli
G766	Poggio Picenze
G992	Prata d'Ansidonia
H007	Pratola Peligna
H056	Prezza
H166	Raiano
H353	Rivisondoli
H389	Roccacasale
H399	Rocca di Botte
H400	Rocca di Cambio
H402	Rocca di Mezzo
H429	Rocca Pia
H434	Roccaraso
H772	San Benedetto dei Marsi
H773	San Benedetto in Perillis
H819	San Demetrio ne' Vestini
I121	San Pio delle Camere
I326	Sante Marie
I336	Sant'Eusanio Forconese
I360	Santo Stefano di Sessanio
I389	San Vincenzo Valle Roveto
I501	Scanno
I543	Scontrone
I546	Scoppito
I553	Scurcola Marsicana
I558	Secinaro
I804	Sulmona
L025	Tagliacozzo
L173	Tione degli Abruzzi
L227	Tornimparte
L334	Trasacco
L958	Villalago
M021	Villa Santa Lucia degli Abruzzi
M023	Villa Sant'Angelo
M031	Villavallelonga
M041	Villetta Barrea
M090	Vittorito
A125	Alba Adriatica
A270	Ancarano
A445	Arsita
A488	Atri
A692	Basciano
A746	Bellante
A885	Bisenti
B515	Campli
B640	Canzano
C040	Castel Castagna
C128	Castellalto
C169	Castelli
C316	Castiglione Messer Raimondo
C322	Castilenti
C449	Cellino Attanasio
C517	Cermignano
C781	Civitella del Tronto
C311	Colledara
C901	Colonnella
C972	Controguerra
D043	Corropoli
D076	Cortino
D179	Crognaleto
D489	Fano Adriano
E058	Giulianova
E343	Isola del Gran Sasso d'Italia
F500	Montefino
F690	Montorio al Vomano
F747	Morro d'Oro
F764	Mosciano Sant'Angelo
F870	Nereto
F942	Notaresco
G437	Penna Sant'Andrea
G608	Pietracamela
F831	Pineto
H440	Rocca Santa Maria
F585	Roseto degli Abruzzi
I318	Sant'Egidio alla Vibrata
I348	Sant'Omero
I741	Silvi
L103	Teramo
L207	Torano Nuovo
L295	Torricella Sicura
L307	Tortoreto
L314	Tossicia
L597	Valle Castellana
E989	Martinsicuro
A008	Abbateggio
A120	Alanno
A945	Bolognano
B193	Brittoli
B294	Bussi sul Tirino
B681	Cappelle sul Tavo
B722	Caramanico Terme
B827	Carpineto della Nora
C308	Castiglione a Casauria
C354	Catignano
C474	Cepagatti
C750	Città Sant'Angelo
C771	Civitaquana
C779	Civitella Casanova
C853	Collecorvino
D078	Corvara
D201	Cugnoli
D394	Elice
D501	Farindola
E558	Lettomanoppello
E691	Loreto Aprutino
E892	Manoppello
F441	Montebello di Bertona
F646	Montesilvano
F765	Moscufo
F908	Nocciano
G438	Penne
G482	Pescara
G499	Pescosansonesco
G555	Pianella
G589	Picciano
G621	Pietranico
G878	Popoli
H425	Roccamorice
H562	Rosciano
H715	Salle
I332	Sant'Eufemia a Maiella
I376	San Valentino in Abruzzo Citeriore
I482	Scafa
I649	Serramonacesca
I922	Spoltore
L186	Tocco da Casauria
L263	Torre de' Passeri
L475	Turrivalignani
L846	Vicoli
L922	Villa Celiera
A235	Altino
A367	Archi
A398	Ari
A402	Arielli
A485	Atessa
A956	Bomba
B057	Borrello
B238	Bucchianico
B268	Montebello sul Sangro
B620	Canosa Sannita
B826	Carpineto Sinello
B853	Carunchio
B859	Casacanditella
B861	Casalanguida
B865	Casalbordino
B896	Casalincontrada
B985	Casoli
C114	Castel Frentano
C123	Castelguidone
C298	Castiglione Messer Marino
C428	Celenza sul Trigno
C632	Chieti
C768	Civitaluparella
C776	Civitella Messer Raimondo
C855	Colledimacine
C856	Colledimezzo
D137	Crecchio
D209	Cupello
D315	Dogliola
D494	Fara Filiorum Petri
D495	Fara San Martino
D592	Filetto
D738	Fossacesia
D757	Fraine
D763	Francavilla al Mare
D796	Fresagrandinaria
D803	Frisa
D823	Furci
D898	Gamberale
D996	Gessopalena
E052	Gissi
E056	Giuliano Teatino
E243	Guardiagrele
E266	Guilmi
E424	Lama dei Peligni
E435	Lanciano
E531	Lentella
E559	Lettopalena
E611	Liscia
F196	Miglianico
F433	Montazzoli
F498	Monteferrante
F535	Montelapiano
F578	Montenerodomo
F582	Monteodorisio
F785	Mozzagrogna
G128	Orsogna
G141	Ortona
G237	Paglieta
G271	Palena
G290	Palmoli
G294	Palombaro
G434	Pennadomo
G435	Pennapiedimonte
G441	Perano
G724	Pizzoferrato
G760	Poggiofiorito
G799	Pollutri
H052	Pretoro
H098	Quadri
H184	Rapino
H320	Ripa Teatina
H424	Roccamontepiano
H439	Rocca San Giovanni
H442	Roccascalegna
H448	Roccaspinalveti
H495	Roio del Sangro
H566	Rosello
H784	San Buono
H923	San Giovanni Lipioni
D690	San Giovanni Teatino
H991	San Martino sulla Marrucina
I148	San Salvo
I244	Santa Maria Imbaro
I335	Sant'Eusanio del Sangro
I394	San Vito Chietino
I520	Scerni
I526	Schiavi di Abruzzo
L047	Taranta Peligna
L194	Tollo
L218	Torino di Sangro
L224	Tornareccio
L253	Torrebruna
L284	Torrevecchia Teatina
L291	Torricella Peligna
L363	Treglio
L459	Tufillo
L526	Vacri
E372	Vasto
L961	Villalfonsina
L964	Villamagna
M022	Villa Santa Maria
G613	Pietraferrazzana
D480	Fallo
A050	Acquaviva Collecroce
A616	Baranello
A930	Bojano
A971	Bonefro
B295	Busso
B519	Campobasso
B522	Campochiaro
B528	Campodipietra
B544	Campolieto
B550	Campomarino
B858	Casacalenda
B871	Casalciprano
C066	Castelbottaccio
C175	Castellino del Biferno
C197	Castelmauro
C346	Castropignano
C486	Cercemaggiore
C488	Cercepiccola
C764	Civitacampomarano
C854	Colle d'Anchise
C875	Colletorto
C772	Duronia
D550	Ferrazzano
D737	Fossalto
D896	Gambatesa
E030	Gildone
E244	Guardialfiera
E248	Guardiaregia
E259	Guglionesi
E381	Jelsi
E456	Larino
E599	Limosano
E722	Lucito
E748	Lupara
E780	Macchia Valfortore
E799	Mafalda
F055	Matrice
F233	Mirabello Sannitico
F294	Molise
F322	Monacilioni
F391	Montagano
F475	Montecilfone
F495	Montefalcone nel Sannio
F548	Montelongo
F569	Montemitro
F576	Montenero di Bisaccia
F689	Montorio nei Frentani
F748	Morrone del Sannio
G086	Oratino
G257	Palata
G506	Petacciato
G512	Petrella Tifernina
G609	Pietracatella
G610	Pietracupa
G910	Portocannone
H083	Provvidenti
H273	Riccia
H311	Ripabottoni
H313	Ripalimosani
H454	Roccavivara
H589	Rotello
H693	Salcito
H782	San Biase
H833	San Felice del Molise
H867	San Giacomo degli Schiavoni
H920	San Giovanni in Galdo
H928	San Giuliano del Sannio
H929	San Giuliano di Puglia
H990	San Martino in Pensilis
I023	San Massimo
I122	San Polo Matese
I181	Santa Croce di Magliano
I289	Sant'Angelo Limosano
I320	Sant'Elia a Pianisi
I618	Sepino
I910	Spinete
L069	Tavenna
L113	Termoli
L215	Torella del Sannio
L230	Toro
L435	Trivento
L458	Tufara
L505	Ururi
M057	Vinchiaturo
A015	Accadia
A150	Alberona
A320	Anzano di Puglia
A339	Apricena
A463	Ascoli Satriano
A854	Biccari
B104	Bovino
B357	Cagnano Varano
B584	Candela
B724	Carapelle
B784	Carlantino
B829	Carpino
B904	Casalnuovo Monterotaro
B917	Casalvecchio di Puglia
C198	Castelluccio dei Sauri
C202	Castelluccio Valmaggiore
C222	Castelnuovo della Daunia
C429	Celenza Valfortore
C442	Celle di San Vito
C514	Cerignola
C633	Chieuti
D269	Deliceto
D459	Faeto
D643	Foggia
E332	Ischitella
E363	Isole Tremiti
E549	Lesina
E716	Lucera
E885	Manfredonia
F059	Mattinata
F538	Monteleone di Puglia
F631	Monte Sant'Angelo
F777	Motta Montecorvino
G125	Orsara di Puglia
G131	Orta Nova
G312	Panni
G487	Peschici
G604	Pietramontecorvino
G761	Poggio Imperiale
H287	Rignano Garganico
H467	Rocchetta Sant'Antonio
H480	Rodi Garganico
H568	Roseto Valfortore
H926	San Giovanni Rotondo
H985	San Marco in Lamis
H986	San Marco la Catola
I054	San Nicandro Garganico
I072	San Paolo di Civitate
I158	San Severo
I193	Sant'Agata di Puglia
I641	Serracapriola
I962	Stornara
I963	Stornarella
L273	Torremaggiore
L447	Troia
L842	Vico del Gargano
L858	Vieste
M131	Volturara Appula
M132	Volturino
M266	Ordona
M267	Zapponeta
A048	Acquaviva delle Fonti
A055	Adelfia
A149	Alberobello
A225	Altamura
A662	Bari
A874	Binetto
A892	Bitetto
A893	Bitonto
A894	Bitritto
B716	Capurso
B923	Casamassima
B998	Cassano delle Murge
C134	Castellana Grotte
C436	Cellamare
C975	Conversano
C983	Corato
E038	Gioia del Colle
E047	Giovinazzo
E155	Gravina in Puglia
E223	Grumo Appula
E645	Locorotondo
F262	Modugno
F280	Mola di Bari
F284	Molfetta
F376	Monopoli
F915	Noci
F923	Noicattaro
G291	Palo del Colle
G769	Poggiorsini
G787	Polignano a Mare
H096	Putignano
H643	Rutigliano
H645	Ruvo di Puglia
H749	Sammichele di Bari
I053	Sannicandro di Bari
I330	Santeramo in Colle
L109	Terlizzi
L220	Toritto
L425	Triggiano
L472	Turi
L571	Valenzano
A514	Avetrana
B808	Carosino
C136	Castellaneta
D171	Crispiano
D463	Faggiano
D754	Fragagnano
E036	Ginosa
E205	Grottaglie
E469	Laterza
E537	Leporano
E630	Lizzano
E882	Manduria
E986	Martina Franca
E995	Maruggio
F027	Massafra
F531	Monteiasi
F563	Montemesola
F587	Monteparano
F784	Mottola
G251	Palagianello
G252	Palagiano
H090	Pulsano
H409	Roccaforzata
H882	San Giorgio Ionico
I018	San Marzano di San Giuseppe
I467	Sava
L049	Taranto
L294	Torricella
M298	Statte
B180	Brindisi
B809	Carovigno
C424	Ceglie Messapica
C448	Cellino San Marco
C741	Cisternino
D422	Erchie
D508	Fasano
D761	Francavilla Fontana
E471	Latiano
F152	Mesagne
G098	Oria
G187	Ostuni
H822	San Donaci
I045	San Michele Salentino
I066	San Pancrazio Salentino
I119	San Pietro Vernotico
I396	San Vito dei Normanni
L213	Torchiarolo
L280	Torre Santa Susanna
L920	Villa Castelli
A042	Acquarica del Capo
A184	Alessano
A185	Alezio
A208	Alliste
A281	Andrano
A350	Aradeo
A425	Arnesano
A572	Bagnolo del Salento
B086	Botrugno
B413	Calimera
B506	Campi Salentina
B616	Cannole
B690	Caprarica di Lecce
B792	Carmiano
B822	Carpignano Salentino
B936	Casarano
C334	Castri di Lecce
C335	Castrignano de' Greci
C336	Castrignano del Capo
C377	Cavallino
C865	Collepasso
C978	Copertino
D006	Corigliano d'Otranto
D044	Corsano
D223	Cursi
D237	Cutrofiano
D305	Diso
D851	Gagliano del Capo
D862	Galatina
D863	Galatone
D883	Gallipoli
E053	Giuggianello
E061	Giurdignano
E227	Guagnano
E506	Lecce
E538	Lequile
E563	Leverano
E629	Lizzanello
E815	Maglie
E979	Martano
E984	Martignano
F054	Matino
F101	Melendugno
F109	Melissano
F117	Melpignano
F194	Miggiano
F221	Minervino di Lecce
F604	Monteroni di Lecce
F623	Montesano Salentino
F716	Morciano di Leuca
F816	Muro Leccese
F842	Nardò
F881	Neviano
F916	Nociglia
F970	Novoli
G136	Ortelle
G188	Otranto
G285	Palmariggi
G325	Parabita
G378	Patù
G751	Poggiardo
H047	Presicce
H147	Racale
H632	Ruffano
H708	Salice Salentino
H729	Salve
H757	Sanarica
H793	San Cesario di Lecce
H826	San Donato di Lecce
I059	Sannicola
I115	San Pietro in Lama
I172	Santa Cesarea Terme
I549	Scorrano
I559	Seclì
I780	Sogliano Cavour
I800	Soleto
I887	Specchia
I923	Spongano
I930	Squinzano
I950	Sternatia
L008	Supersano
L010	Surano
L011	Surbo
L064	Taurisano
L074	Taviano
L166	Tiggiano
L383	Trepuzzi
L419	Tricase
L462	Tuglie
L484	Ugento
L485	Uggiano la Chiesa
L711	Veglie
L776	Vernole
M187	Zollino
M264	San Cassiano
M261	Castro
M263	Porto Cesareo
A013	Abriola
A020	Acerenza
A131	Albano di Lucania
A321	Anzi
A415	Armento
A482	Atella
A519	Avigliano
A604	Balvano
A612	Banzi
A615	Baragiano
A666	Barile
A743	Bella
B173	Brienza
B181	Brindisi Montagna
B440	Calvello
B443	Calvera
B549	Campomaggiore
B580	Cancellara
B743	Carbone
B906	San Paolo Albanese
C120	Castelgrande
C199	Castelluccio Inferiore
C201	Castelluccio Superiore
C209	Castelmezzano
C271	Castelsaraceno
C345	Castronuovo di Sant'Andrea
C539	Cersosimo
C619	Chiaromonte
D010	Corleto Perticara
D414	Episcopia
D497	Fardella
D593	Filiano
D696	Forenza
D766	Francavilla in Sinni
D876	Gallicchio
D971	Genzano di Lucania
E221	Grumento Nova
E246	Guardia Perticara
E409	Lagonegro
E474	Latronico
E482	Laurenzana
E483	Lauria
E493	Lavello
E919	Maratea
E976	Marsico Nuovo
E977	Marsicovetere
F006	Maschito
F104	Melfi
F249	Missanello
F295	Moliterno
F568	Montemilone
F573	Montemurro
F817	Muro Lucano
F866	Nemoli
F917	Noepoli
G081	Oppido Lucano
G261	Palazzo San Gervasio
G496	Pescopagano
G590	Picerno
G616	Pietragalla
G623	Pietrapertosa
G663	Pignola
G942	Potenza
H186	Rapolla
H187	Rapone
H307	Rionero in Vulture
H312	Ripacandida
H348	Rivello
H426	Roccanova
H590	Rotonda
H641	Ruoti
H646	Ruvo del Monte
H795	San Chirico Nuovo
H796	San Chirico Raparo
H808	San Costantino Albanese
H831	San Fele
H994	San Martino d'Agri
I157	San Severino Lucano
I288	Sant'Angelo Le Fratte
I305	Sant'Arcangelo
I426	Sarconi
I457	Sasso di Castalda
G614	Satriano di Lucania
H730	Savoia di Lucania
I610	Senise
I917	Spinoso
L082	Teana
L126	Terranova di Pollino
L181	Tito
L197	Tolve
L326	Tramutola
L357	Trecchina
L439	Trivigno
L532	Vaglio Basilicata
L738	Venosa
L859	Vietri di Potenza
L873	Viggianello
L874	Viggiano
E033	Ginestra
M269	Paterno
A017	Accettura
A196	Aliano
A801	Bernalda
B391	Calciano
C723	Cirigliano
C888	Colobraro
D128	Craco
D547	Ferrandina
D909	Garaguso
E093	Gorgoglione
E147	Grassano
E213	Grottole
E326	Irsina
F052	Matera
F201	Miglionico
F399	Montalbano Jonico
F637	Montescaglioso
A942	Nova Siri
G037	Oliveto Lucano
G712	Pisticci
G786	Policoro
G806	Pomarico
H591	Rotondella
H687	Salandra
H888	San Giorgio Lucano
I029	San Mauro Forte
I954	Stigliano
L418	Tricarico
L477	Tursi
D513	Valsinni
M256	Scanzano Jonico
A033	Acquaformosa
A041	Acquappesa
A053	Acri
A102	Aiello Calabro
A105	Aieta
A160	Albidona
A183	Alessandria del Carretto
A234	Altilia
A240	Altomonte
A253	Amantea
A263	Amendolara
A340	Aprigliano
A762	Belmonte Calabro
A768	Belsito
A773	Belvedere Marittimo
A842	Bianchi
A887	Bisignano
A912	Bocchigliero
A973	Bonifati
B270	Buonvicino
B424	Calopezzati
B426	Caloveto
B500	Campana
B607	Canna
B774	Cariati
B802	Carolei
B813	Carpanzano
B983	Casole Bruzio
C002	Cassano all'Ionio
C301	Castiglione Cosentino
C108	Castrolibero
C348	Castroregio
C349	Castrovillari
C430	Celico
C437	Cellara
C489	Cerchiara di Calabria
C515	Cerisano
C554	Cervicati
C560	Cerzeto
C588	Cetraro
C763	Civita
C795	Cleto
C905	Colosimi
D005	Corigliano Calabro
D086	Cosenza
D180	Cropalati
D184	Crosia
D289	Diamante
D304	Dipignano
D328	Domanico
D464	Fagnano Castello
D473	Falconara Albanese
D582	Figline Vegliaturo
D614	Firmo
D624	Fiumefreddo Bruzio
D764	Francavilla Marittima
D774	Frascineto
D828	Fuscaldo
E180	Grimaldi
E185	Grisolia
E242	Guardia Piemontese
E407	Lago
E417	Laino Borgo
E419	Laino Castello
E450	Lappano
E475	Lattarico
E677	Longobardi
E678	Longobucco
E745	Lungro
E773	Luzzi
E835	Maierà
E859	Malito
E872	Malvito
E878	Mandatoriccio
E888	Mangone
E914	Marano Marchesato
E915	Marano Principato
F001	Marzi
F125	Mendicino
F370	Mongrassano
F416	Montalto Uffugo
F519	Montegiordano
F708	Morano Calabro
F735	Mormanno
F775	Mottafollone
F907	Nocara
G110	Oriolo
G129	Orsomarso
G298	Paludi
G307	Panettieri
G317	Paola
G320	Papasidero
G331	Parenti
G372	Paterno Calabro
G400	Pedace
G411	Pedivigliano
G553	Piane Crati
G615	Pietrafitta
G622	Pietrapaola
G733	Plataci
G975	Praia a Mare
H235	Rende
H416	Rocca Imperiale
H488	Roggiano Gravina
H490	Rogliano
H565	Rose
H572	Roseto Capo Spulico
H579	Rossano
H585	Rota Greca
H621	Rovito
H765	San Basile
H774	San Benedetto Ullano
H806	San Cosmo Albanese
H818	San Demetrio Corone
H825	San Donato di Ninea
H841	San Fili
H877	Sangineto
H881	San Giorgio Albanese
H919	San Giovanni in Fiore
H961	San Lorenzo Bellizzi
H962	San Lorenzo del Vallo
H971	San Lucido
H981	San Marco Argentano
H992	San Martino di Finita
I060	San Nicola Arcella
I108	San Pietro in Amantea
I114	San Pietro in Guarano
I165	San Sosti
I171	Santa Caterina Albanese
I183	Santa Domenica Talao
I192	Sant'Agata di Esaro
C717	Santa Maria del Cedro
I309	Santa Sofia d'Epiro
I359	Santo Stefano di Rogliano
I388	San Vincenzo La Costa
I423	Saracena
I485	Scala Coeli
I489	Scalea
D290	Scigliano
I642	Serra d'Aiello
I650	Serra Pedace
I895	Spezzano Albanese
I896	Spezzano della Sila
I898	Spezzano Piccolo
L055	Tarsia
L124	Terranova da Sibari
L134	Terravecchia
L206	Torano Castello
L305	Tortora
L353	Trebisacce
L375	Trenta
L524	Vaccarizzo Albanese
L747	Verbicaro
B903	Villapiana
M202	Zumpano
A155	Albi
A255	Amaroni
A257	Amato
A272	Andali
A397	Argusto
A542	Badolato
A736	Belcastro
B002	Borgia
B085	Botricello
B717	Caraffa di Catanzaro
B758	Cardinale
B790	Carlopoli
C352	Catanzaro
C453	Cenadi
C472	Centrache
C542	Cerva
C616	Chiaravalle Centrale
C674	Cicala
C960	Conflenti
D049	Cortale
D181	Cropani
D218	Curinga
D257	Davoli
D261	Decollatura
D476	Falerna
D544	Feroleto Antico
D744	Fossato Serralta
D852	Gagliato
D932	Gasperina
E031	Gimigliano
E050	Girifalco
E068	Gizzeria
E239	Guardavalle
E328	Isca sullo Ionio
E274	Jacurso
E806	Magisano
E834	Maida
E923	Marcedusa
E925	Marcellinara
E990	Martirano
E991	Martirano Lombardo
F200	Miglierina
F432	Montauro
F586	Montepaone
F780	Motta Santa Lucia
F910	Nocera Terinese
G034	Olivadi
G272	Palermiti
G439	Pentone
G517	Petrizzi
G518	Petronà
D546	Pianopoli
G734	Platania
H846	San Floro
H976	San Mango d'Aquino
I093	San Pietro a Maida
I095	San Pietro Apostolo
I164	San Sostene
I170	Santa Caterina dello Ionio
I266	Sant'Andrea Apostolo dello Ionio
I393	San Vito sullo Ionio
I463	Satriano
I589	Sellia
I590	Sellia Marina
I655	Serrastretta
I671	Sersale
I704	Settingiano
I745	Simeri Crichi
I844	Sorbo San Basile
I872	Soverato
I874	Soveria Mannelli
I875	Soveria Simeri
I929	Squillace
I937	Stalettì
L070	Taverna
L177	Tiriolo
L240	Torre di Ruggiero
I322	Vallefiorita
M140	Zagarise
M208	Lamezia Terme
A065	Africo
A077	Agnana Calabra
A303	Anoia
A314	Antonimina
A385	Ardore
A544	Bagaladi
A552	Bagnara Calabra
A780	Benestare
A843	Bianco
A897	Bivongi
B097	Bova
B098	Bovalino
B099	Bova Marina
B118	Brancaleone
B234	Bruzzano Zeffirio
B379	Calanna
B481	Camini
B516	Campo Calabro
B591	Candidoni
B617	Canolo
B718	Caraffa del Bianco
B756	Cardeto
B766	Careri
B966	Casignana
C285	Caulonia
C695	Ciminà
C710	Cinquefrondi
C747	Cittanova
C954	Condofuri
D089	Cosoleto
D268	Delianuova
D545	Feroleto della Chiesa
D557	Ferruzzano
D619	Fiumara
D864	Galatro
D975	Gerace
E025	Giffone
E041	Gioia Tauro
E044	Gioiosa Ionica
E212	Grotteria
E402	Laganadi
E479	Laureana di Borrello
D976	Locri
E873	Mammola
E956	Marina di Gioiosa Ionica
E968	Maropati
E993	Martone
F105	Melicuccà
F106	Melicucco
F112	Melito di Porto Salvo
F301	Molochio
F324	Monasterace
D746	Montebello Ionico
F779	Motta San Giovanni
G082	Oppido Mamertina
G277	Palizzi
G288	Palmi
G394	Pazzano
G729	Placanica
G735	Platì
G791	Polistena
G905	Portigliola
H224	Reggio di Calabria
H265	Riace
H359	Rizziconi
H408	Roccaforte del Greco
H456	Roccella Ionica
H489	Roghudi
H558	Rosarno
H013	Samo
H889	San Giorgio Morgeto
H903	San Giovanni di Gerace
H959	San Lorenzo
H970	San Luca
I102	San Pietro di Caridà
I132	San Procopio
I139	San Roberto
I176	Santa Cristina d'Aspromonte
I198	Sant'Agata del Bianco
I214	Sant'Alessio in Aspromonte
I333	Sant'Eufemia d'Aspromonte
I341	Sant'Ilario dello Ionio
I371	Santo Stefano in Aspromonte
I536	Scido
I537	Scilla
I600	Seminara
I656	Serrata
I725	Siderno
I753	Sinopoli
I936	Staiti
I955	Stignano
I956	Stilo
L063	Taurianova
L127	Terranova Sappo Minulio
L673	Varapodio
M018	Villa San Giovanni
M277	San Ferdinando
A176	Alcamo
B288	Buseto Palizzolo
B385	Calatafimi-Segesta
B521	Campobello di Mazara
C130	Castellammare del Golfo
C286	Castelvetrano
D234	Custonaci
D423	Erice
D518	Favignana
E023	Gibellina
E974	Marsala
F061	Mazara del Vallo
G208	Paceco
G315	Pantelleria
G347	Partanna
G767	Poggioreale
H688	Salaparuta
H700	Salemi
I291	Santa Ninfa
I407	San Vito Lo Capo
L331	Trapani
G319	Valderice
M081	Vita
M281	Petrosino
A195	Alia
A202	Alimena
A203	Aliminusa
A229	Altavilla Milicia
A239	Altofonte
A546	Bagheria
A592	Balestrate
A719	Baucina
A764	Belmonte Mezzagno
A882	Bisacquino
A946	Bolognetta
A958	Bompietro
A991	Borgetto
B315	Caccamo
B430	Caltavuturo
B533	Campofelice di Fitalia
B532	Campofelice di Roccella
B535	Campofiorito
B556	Camporeale
B645	Capaci
B780	Carini
C067	Castelbuono
C074	Casteldaccia
C135	Castellana Sicula
C344	Castronovo di Sicilia
C420	Cefalà Diana
C421	Cefalù
C496	Cerda
C654	Chiusa Sclafani
C696	Ciminna
C708	Cinisi
C871	Collesano
C968	Contessa Entellina
D009	Corleone
D567	Ficarazzi
D907	Gangi
D977	Geraci Siculo
E013	Giardinello
E055	Giuliana
E074	Godrano
E149	Gratteri
E337	Isnello
E350	Isola delle Femmine
E459	Lascari
E541	Lercara Friddi
E957	Marineo
F184	Mezzojuso
F246	Misilmeri
F377	Monreale
F544	Montelepre
F553	Montemaggiore Belsito
G263	Palazzo Adriano
G273	Palermo
G348	Partinico
G510	Petralia Soprana
G511	Petralia Sottana
G543	Piana degli Albanesi
G792	Polizzi Generosa
G797	Pollina
H070	Prizzi
H422	Roccamena
H428	Roccapalumba
H797	San Cipirello
H933	San Giuseppe Jato
I028	San Mauro Castelverde
I174	Santa Cristina Gela
I188	Santa Flavia
I534	Sciara
I541	Sclafani Bagni
L112	Termini Imerese
L131	Terrasini
L282	Torretta
L317	Trabia
L332	Trappeto
L519	Ustica
L603	Valledolmo
L740	Ventimiglia di Sicilia
L837	Vicari
L916	Villabate
L951	Villafrati
I538	Scillato
M268	Blufi
A177	Alcara li Fusi
A194	Alì
A201	Alì Terme
A313	Antillo
A638	Barcellona Pozzo di Gotto
A698	Basicò
B198	Brolo
B660	Capizzi
B666	Capo d'Orlando
B695	Capri Leone
B804	Caronia
B918	Casalvecchio Siculo
C094	Castel di Lucio
C051	Castell'Umberto
C210	Castelmola
C347	Castroreale
C568	Cesarò
C956	Condrò
D474	Falcone
D569	Ficarra
D622	Fiumedinisi
D635	Floresta
D661	Fondachelli-Fantina
D733	Forza d'Agrò
D765	Francavilla di Sicilia
D793	Frazzanò
D824	Furci Siculo
D825	Furnari
D844	Gaggi
D861	Galati Mamertino
D885	Gallodoro
E014	Giardini-Naxos
E043	Gioiosa Marea
E142	Graniti
E233	Gualtieri Sicaminò
E374	Itala
E523	Leni
E555	Letojanni
E571	Librizzi
E594	Limina
E606	Lipari
E674	Longi
E855	Malfa
E869	Malvagna
E876	Mandanici
F066	Mazzarrà Sant'Andrea
F147	Merì
F158	Messina
F206	Milazzo
F210	Militello Rosmarino
F242	Mirto
F251	Mistretta
F277	Moio Alcantara
F359	Monforte San Giorgio
F368	Mongiuffi Melia
F395	Montagnareale
F400	Montalbano Elicona
F772	Motta Camastra
F773	Motta d'Affermo
F848	Naso
F901	Nizza di Sicilia
F951	Novara di Sicilia
G036	Oliveri
G209	Pace del Mela
G234	Pagliara
G377	Patti
G522	Pettineo
G699	Piraino
H151	Raccuja
H228	Reitano
H405	Roccafiorita
H418	Roccalumera
H380	Roccavaldina
H455	Roccella Valdemone
H479	Rodì Milici
H519	Rometta
H842	San Filippo del Mela
H850	San Fratello
H982	San Marco d'Alunzio
I084	San Pier Niceto
I086	San Piero Patti
I147	San Salvatore di Fitalia
I184	Santa Domenica Vittoria
I199	Sant'Agata di Militello
I215	Sant'Alessio Siculo
I220	Santa Lucia del Mela
I254	Santa Marina Salina
I283	Sant'Angelo di Brolo
I311	Santa Teresa di Riva
I328	San Teodoro
I370	Santo Stefano di Camastra
I420	Saponara
I477	Savoca
I492	Scaletta Zanclea
I747	Sinagra
I881	Spadafora
L042	Taormina
L271	Torregrotta
L308	Tortorici
L431	Tripi
L478	Tusa
L482	Ucria
L561	Valdina
L735	Venetico
L950	Villafranca Tirrena
M210	Terme Vigliatore
M211	Acquedolci
M286	Torrenova
A089	Agrigento
A181	Alessandria della Rocca
A351	Aragona
A896	Bivona
B275	Burgio
B377	Calamonaci
B427	Caltabellotta
B460	Camastra
B486	Cammarata
B520	Campobello di Licata
B602	Canicattì
C275	Casteltermini
C341	Castrofilippo
C356	Cattolica Eraclea
C668	Cianciana
C928	Comitini
D514	Favara
E209	Grotte
E390	Joppolo Giancaxio
E431	Lampedusa e Linosa
E573	Licata
E714	Lucca Sicula
F126	Menfi
F414	Montallegro
F655	Montevago
F845	Naro
G282	Palma di Montechiaro
F299	Porto Empedocle
H148	Racalmuto
H159	Raffadali
H194	Ravanusa
H205	Realmonte
H269	Ribera
H743	Sambuca di Sicilia
H778	San Biagio Platani
H914	San Giovanni Gemini
I185	Santa Elisabetta
I224	Santa Margherita di Belice
I290	Sant'Angelo Muxaro
I356	Santo Stefano Quisquina
I533	Sciacca
I723	Siculiana
L944	Villafranca Sicula
A049	Acquaviva Platani
A957	Bompensiere
B302	Butera
B429	Caltanissetta
B537	Campofranco
D267	Delia
D960	Gela
E953	Marianopoli
F065	Mazzarino
E618	Milena
F489	Montedoro
F830	Mussomeli
F899	Niscemi
H245	Resuttano
H281	Riesi
H792	San Cataldo
I169	Santa Caterina Villarmosa
I644	Serradifalco
I824	Sommatino
L016	Sutera
L609	Vallelunga Pratameno
L959	Villalba
A070	Agira
A098	Aidone
A478	Assoro
A676	Barrafranca
B381	Calascibetta
C353	Catenanuova
C471	Centuripe
C480	Cerami
C342	Enna
D849	Gagliano Castelferrato
E536	Leonforte
F892	Nicosia
F900	Nissoria
G580	Piazza Armerina
G624	Pietraperzia
H221	Regalbuto
I891	Sperlinga
L448	Troina
L583	Valguarnera Caropepe
M011	Villarosa
A025	Aci Bonaccorsi
A026	Aci Castello
A027	Aci Catena
A028	Acireale
A029	Aci Sant'Antonio
A056	Adrano
A766	Belpasso
A841	Biancavilla
B202	Bronte
B384	Calatabiano
B428	Caltagirone
B561	Camporotondo Etneo
C091	Castel di Iudica
C297	Castiglione di Sicilia
C351	Catania
D623	Fiumefreddo di Sicilia
E017	Giarre
E133	Grammichele
E156	Gravina di Catania
E578	Licodia Eubea
E602	Linguaglossa
E854	Maletto
F004	Mascali
F005	Mascalucia
F209	Militello in Val di Catania
F214	Milo
F217	Mineo
F231	Mirabella Imbaccari
F250	Misterbianco
F781	Motta Sant'Anastasia
F890	Nicolosi
G253	Palagonia
G371	Paternò
G402	Pedara
G597	Piedimonte Etneo
H154	Raddusa
H168	Ramacca
H175	Randazzo
H325	Riposto
H805	San Cono
H922	San Giovanni la Punta
H940	San Gregorio di Catania
I035	San Michele di Ganzaria
I098	San Pietro Clarenza
I202	Sant'Agata li Battiati
I216	Sant'Alfio
I240	Santa Maria di Licodia
I314	Santa Venerina
I548	Scordia
L355	Trecastagni
L369	Tremestieri Etneo
L658	Valverde
L828	Viagrande
M100	Vizzini
M139	Zafferana Etnea
M271	Mazzarrone
M283	Maniace
M287	Ragalna
A014	Acate
C612	Chiaramonte Gulfi
C927	Comiso
E016	Giarratana
E366	Ispica
F258	Modica
F610	Monterosso Almo
G953	Pozzallo
H163	Ragusa
I178	Santa Croce Camerina
I535	Scicli
M088	Vittoria
A494	Augusta
A522	Avola
B237	Buccheri
B287	Buscemi
B603	Canicattini Bagni
B787	Carlentini
C006	Cassaro
D540	Ferla
D636	Floridia
D768	Francofonte
E532	Lentini
F107	Melilli
F943	Noto
G211	Pachino
G267	Palazzolo Acreide
H574	Rosolini
I754	Siracusa
I785	Solarino
I864	Sortino
M257	Portopalo di Capo Passero
M279	Priolo Gargallo
A192	Alghero
A287	Anela
A379	Ardara
A606	Banari
A781	Benetutti
A827	Bessude
A976	Bonnanaro
A977	Bono
A978	Bonorva
B064	Borutta
B094	Bottidda
B264	Bultei
B265	Bulzi
B276	Burgos
B772	Cargeghe
C272	Castelsardo
C600	Cheremule
C613	Chiaramonti
C818	Codrongianos
D100	Cossoine
D441	Esporlatu
D637	Florinas
E019	Giave
E285	Illorai
E376	Ittireddu
E377	Ittiri
E401	Laerru
E902	Mara
E992	Martis
F542	Monteleone Rocca Doria
F721	Mores
F818	Muros
F975	Nughedu San Nicolò
F976	Nule
F977	Nulvi
G046	Olmedo
G156	Osilo
G178	Ossi
G203	Ozieri
G225	Padria
G376	Pattada
G450	Perfugas
G740	Ploaghe
G924	Porto Torres
G962	Pozzomaggiore
H095	Putifigari
H507	Romana
I452	Sassari
I565	Sedini
I598	Semestene
I614	Sennori
I732	Siligo
I863	Sorso
L158	Thiesi
L180	Tissi
L235	Torralba
L464	Tula
L503	Uri
L509	Usini
L989	Villanova Monteleone
L604	Valledoria
M259	Viddalba
M282	Tergu
M284	Santa Maria Coghinas
M292	Erula
M290	Stintino
A407	Aritzo
A492	Atzara
A503	Austis
A776	Belvì
A880	Birori
A895	Bitti
A948	Bolotana
B056	Borore
B062	Bortigali
D287	Desulo
D345	Dorgali
D376	Dualchi
D665	Fonni
D842	Gadoni
D888	Galtellì
D947	Gavoi
E323	Irgoli
E517	Lei
E646	Loculi
E647	Lodè
E736	Lula
E788	Macomer
E874	Mamoiada
F073	Meana Sardo
F933	Noragugume
F979	Nuoro
G031	Oliena
G044	Ollolai
G058	Olzai
G064	Onanì
G070	Onifai
G071	Oniferi
G084	Orani
G097	Orgosolo
G119	Orosei
G120	Orotelli
G146	Ortueri
G147	Orune
G154	Osidda
G191	Ottana
G201	Ovodda
G929	Posada
I448	Sarule
I730	Silanus
I748	Sindia
I751	Siniscola
I851	Sorgono
L153	Teti
L160	Tiana
L202	Tonara
L231	Torpè
E649	Lodine
A419	Armungia
A474	Assemini
A597	Ballao
A677	Barrali
B274	Burcei
B354	Cagliari
B675	Capoterra
D259	Decimomannu
D260	Decimoputzu
D323	Dolianova
D333	Domus de Maria
D344	Donori
D994	Gesico
E084	Goni
E234	Guamaggiore
E252	Guasila
E877	Mandas
E903	Maracalagonis
F333	Monastir
F808	Muravera
F983	Nuraminis
G133	Ortacesus
G669	Pimentel
H088	Pula
H118	Quartu Sant'Elena
H739	Samatzai
H766	San Basilio
G383	San Nicolò Gerrei
I166	San Sperate
I271	Sant'Andrea Frius
I402	San Vito
I443	Sarroch
I580	Selargius
I582	Selegas
I615	Senorbì
I624	Serdiana
I695	Sestu
I699	Settimo San Pietro
I734	Siliqua
I735	Silius
I752	Sinnai
I765	Siurgus Donigala
I797	Soleminis
I995	Suelli
L154	Teulada
L512	Ussana
L521	Uta
L613	Vallermosa
L998	Villaputzu
M016	Villasalto
I118	Villa San Pietro
B738	Villasimius
M025	Villasor
M026	Villaspeciosa
H119	Quartucciu
M288	Castiadas
D399	Elmas
F383	Monserrato
D430	Escalaplano
D431	Escolca
D443	Esterzili
D982	Gergei
E336	Isili
F981	Nuragus
F982	Nurallao
F986	Nurri
G122	Orroli
H659	Sadali
I668	Serri
I707	Seulo
L992	Villanova Tulo
A283	Andreis
A354	Arba
A456	Arzene
A516	Aviano
A530	Azzano Decimo
A640	Barcis
B215	Brugnera
B247	Budoia
B598	Caneva
B940	Casarsa della Delizia
C217	Castelnovo del Friuli
C385	Cavasso Nuovo
C640	Chions
C699	Cimolais
C790	Claut
C791	Clauzetto
C991	Cordenons
C993	Cordovado
D426	Erto e Casso
D487	Fanna
D621	Fiume Veneto
D670	Fontanafredda
D804	Frisanco
E889	Maniago
F089	Meduno
F596	Montereale Valcellina
F750	Morsano al Tagliamento
G353	Pasiano di Pordenone
G680	Pinzano al Tagliamento
G780	Polcenigo
G886	Porcia
G888	Pordenone
G994	Prata di Pordenone
H010	Pravisdomini
H609	Roveredo in Piano
H657	Sacile
H891	San Giorgio della Richinvelda
H999	San Martino al Tagliamento
I136	San Quirino
I403	San Vito al Tagliamento
I621	Sequals
I686	Sesto al Reghena
I904	Spilimbergo
L324	Tramonti di Sopra
L325	Tramonti di Sotto
L347	Travesio
L657	Valvasone
M085	Vito d'Asio
M096	Vivaro
M190	Zoppola
M265	Vajont
A051	Acquaviva d'Isernia
A080	Agnone
A567	Bagnoli del Trigno
A761	Belmonte del Sannio
B630	Cantalupo nel Sannio
B682	Capracotta
B810	Carovilli
B830	Carpinone
C082	Castel del Giudice
C246	Castelpetroso
C247	Castelpizzuto
C270	Castel San Vincenzo
C200	Castelverrino
C534	Cerro al Volturno
C620	Chiauci
C769	Civitanova del Sannio
C878	Colli a Volturno
C941	Conca Casale
D595	Filignano
D703	Forlì del Sannio
D715	Fornelli
D811	Frosolone
E335	Isernia
E669	Longano
E778	Macchia d'Isernia
E779	Macchiagodena
F239	Miranda
F429	Montaquila
F580	Montenero Val Cocchiara
F601	Monteroduni
G486	Pesche
G495	Pescolanciano
G497	Pescopennataro
G523	Pettoranello del Molise
G606	Pietrabbondante
G727	Pizzone
B317	Poggio Sannita
G954	Pozzilli
H308	Rionero Sannitico
H420	Roccamandolfi
H445	Roccasicura
H458	Rocchetta a Volturno
I096	San Pietro Avellana
I189	Sant'Agapito
I238	Santa Maria del Molise
I282	Sant'Angelo del Pesco
B466	Sant'Elena Sannita
I507	Scapoli
I679	Sessano del Molise
I682	Sesto Campano
L696	Vastogirardi
L725	Venafro
A007	Abbasanta
A097	Aidomaggiore
A126	Albagiara
A180	Ales
A204	Allai
A357	Arborea
A380	Ardauli
A477	Assolo
A480	Asuni
A614	Baradili
A621	Baratili San Pietro
A655	Baressa
A721	Bauladu
A856	Bidonì
A960	Bonarcado
B055	Boroneddu
B281	Busachi
B314	Cabras
D200	Cuglieri
D695	Fordongianus
E004	Ghilarza
E087	Gonnoscodina
D585	Gonnosnò
E088	Gonnostramatza
E972	Marrubiu
F050	Masullas
F208	Milis
F270	Mogorella
F272	Mogoro
F727	Morgongiori
F840	Narbolia
F867	Neoneli
F934	Norbello
F974	Nughedu Santa Vittoria
F980	Nurachi
F985	Nureci
G043	Ollastra
G113	Oristano
G286	Palmas Arborea
G379	Pau
G384	Paulilatino
G817	Pompu
H301	Riola Sardo
F271	Ruinas
H756	Samugheo
A368	San Nicolò d'Arcidano
I205	Santa Giusta
I298	Villa Sant'Antonio
I374	Santu Lussurgiu
I384	San Vero Milis
I503	Scano di Montiferro
I564	Sedilo
I605	Seneghe
I609	Senis
I613	Sennariolo
I717	Siamaggiore
I718	Siamanna
I742	Simala
I743	Simaxis
I749	Sini
I757	Siris
I791	Solarussa
I861	Sorradile
L023	Tadasuni
L122	Terralba
L321	Tramatza
L393	Tresnuraghes
L488	Ulà Tirso
L496	Uras
L508	Usellus
L991	Villanova Truschedu
M030	Villaurbana
A609	Villa Verde
M153	Zeddiani
M168	Zerfaliu
I721	Siapiccia
D214	Curcuris
I778	Soddì
B068	Bosa
D640	Flussio
D968	Genoni
E400	Laconi
E825	Magomadas
F261	Modolo
F698	Montresta
H661	Sagama
L006	Suni
L172	Tinnura
A107	Ailoche
A280	Andorno Micca
A784	Benna
A859	Biella
A876	Bioglio
B058	Borriana
B229	Brusnengo
B417	Callabiana
B457	Camandona
B465	Camburzano
B508	Campiglia Cervo
B586	Candelo
B708	Caprile
B933	Casapinta
C155	Castelletto Cervo
C363	Cavaglià
C526	Cerreto Castello
C532	Cerrione
C819	Coggiola
D094	Cossato
D165	Crevacuore
D182	Crosa
D219	Curino
D339	Donato
D350	Dorzano
D848	Gaglianico
E024	Gifflenga
E130	Graglia
E552	Lessona
E821	Magnano
F037	Massazza
F042	Masserano
F167	Mezzana Mortigliengo
F189	Miagliano
F369	Mongrando
F776	Mottalciata
F833	Muzzano
F878	Netro
F992	Occhieppo Inferiore
F993	Occhieppo Superiore
G521	Pettinengo
G577	Piatto
G594	Piedicavallo
G798	Pollone
G820	Ponderano
G927	Portula
G980	Pralungo
G974	Pray
H103	Quaregna
H145	Quittengo
H538	Ronco Biellese
H553	Roppolo
H561	Rosazza
H662	Sagliano Micca
H681	Sala Biellese
H726	Salussola
H821	Sandigliano
I074	San Paolo Cervo
I596	Selve Marcone
I835	Soprana
I847	Sordevolo
I868	Sostegno
I980	Strona
L075	Tavigliano
L116	Ternengo
L193	Tollegno
L239	Torrazzo
L436	Trivero
L556	Valdengo
L586	Vallanzengo
L606	Valle Mosso
L620	Valle San Nicolao
L712	Veglio
L785	Verrone
L880	Vigliano Biellese
L933	Villa del Bosco
L978	Villanova Biellese
M098	Viverone
M179	Zimone
M196	Zubiena
M201	Zumaglia
M304	Mosso
A005	Abbadia Lariana
A112	Airuno
A301	Annone di Brianza
A594	Ballabio
A683	Barzago
A686	Barzanò
A687	Barzio
A745	Bellano
B081	Bosisio Parini
B194	Brivio
B261	Bulciago
B396	Calco
B423	Calolziocorte
B763	Carenno
B937	Casargo
B943	Casatenovo
B996	Cassago Brianza
C024	Cassina Valsassina
C187	Castello di Brianza
C521	Cernusco Lombardone
C563	Cesana Brianza
C752	Civate
C839	Colico
C851	Colle Brianza
D065	Cortenova
D112	Costa Masnaga
D131	Crandola Valsassina
D143	Cremella
D145	Cremeno
D280	Dervio
D327	Dolzago
D346	Dorio
D398	Ello
D428	Erve
D436	Esino Lario
D865	Galbiate
D913	Garbagnate Monastero
D926	Garlate
E287	Imbersago
E305	Introbio
E308	Introzzo
E507	Lecco
E581	Lierna
E656	Lomagna
E858	Malgrate
E879	Mandello del Lario
E947	Margno
F133	Merate
F248	Missaglia
F265	Moggio
F304	Molteno
F561	Monte Marenzo
F657	Montevecchia
F674	Monticello Brianza
F758	Morterone
F887	Nibionno
G009	Oggiono
G026	Olgiate Molgora
G030	Olginate
G040	Oliveto Lario
G161	Osnago
G218	Paderno d'Adda
G241	Pagnona
G336	Parlasco
G368	Pasturo
G448	Perego
G456	Perledo
G485	Pescate
H028	Premana
H063	Primaluna
G223	Robbiate
H486	Rogeno
H596	Rovagnate
I243	Santa Maria Hoè
I759	Sirone
I761	Sirtori
I994	Sueglio
I996	Suello
L022	Taceno
L257	Torre de' Busi
L368	Tremenico
L581	Valgreghentino
L634	Valmadrera
L680	Varenna
L731	Vendrogno
L751	Vercurago
L755	Verderio Inferiore
L756	Verderio Superiore
L813	Vestreno
L866	Viganò
A004	Abbadia Cerreto
A811	Bertonico
A919	Boffalora d'Adda
A995	Borghetto Lodigiano
B017	Borgo San Giovanni
B141	Brembio
B456	Camairago
B887	Casaletto Lodigiano
B899	Casalmaiocco
B910	Casalpusterlengo
B961	Caselle Landi
B958	Caselle Lurani
C228	Castelnuovo Bocca d'Adda
C304	Castiglione d'Adda
C329	Castiraga Vidardo
C362	Cavacurta
C394	Cavenago d'Adda
C555	Cervignano d'Adda
C816	Codogno
C917	Comazzo
D021	Cornegliano Laudense
D028	Corno Giovine
D029	Cornovecchio
D068	Corte Palasio
D159	Crespiatica
D660	Fombio
D868	Galgagnano
E127	Graffignana
E238	Guardamiglio
E627	Livraga
E648	Lodi
E651	Lodi Vecchio
E777	Maccastorna
E840	Mairago
E852	Maleo
E994	Marudo
F028	Massalengo
F102	Meleti
F149	Merlino
F423	Montanaso Lombardo
F801	Mulazzano
G107	Orio Litta
G166	Ospedaletto Lodigiano
G171	Ossago Lodigiano
G096	Pieve Fissiraga
H701	Salerano sul Lambro
H844	San Fiorano
I012	San Martino in Strada
I140	San Rocco al Porto
I274	Sant'Angelo Lodigiano
I362	Santo Stefano Lodigiano
I561	Secugnago
I612	Senna Lodigiana
I815	Somaglia
I848	Sordio
F260	Tavazzano con Villavesco
L125	Terranova dei Passerini
L469	Turano Lodigiano
L572	Valera Fratta
L977	Villanova del Sillaro
M158	Zelo Buon Persico
A747	Bellaria-Igea Marina
C357	Cattolica
D004	Coriano
D961	Gemmano
F244	Misano Adriatico
F346	Mondaino
F476	Monte Colombo
F502	Montefiore Conca
F523	Montegridolfo
F641	Montescudo
F715	Morciano di Romagna
G755	Poggio Berni
H274	Riccione
H294	Rimini
H724	Saludecio
H801	San Clemente
H921	San Giovanni in Marignano
I304	Santarcangelo di Romagna
I550	Torriana
L797	Verucchio
C080	Casteldelci
E838	Maiolo
F137	Novafeltria
G433	Pennabilli
H949	San Leo
I201	Sant'Agata Feltria
L034	Talamello
B626	Cantagallo
B794	Carmignano
F572	Montemurlo
G754	Poggio a Caiano
G999	Prato
L537	Vaiano
L775	Vernio
A772	Belvedere di Spinello
B319	Caccuri
B771	Carfizzi
B857	Casabona
B968	Castelsilano
C501	Cerenzia
C725	Cirò
C726	Cirò Marina
D123	Cotronei
D122	Crotone
D189	Crucoli
D236	Cutro
E339	Isola di Capo Rizzuto
F108	Melissa
F157	Mesoraca
G278	Pallagorio
G508	Petilia Policastro
H383	Roccabernarda
H403	Rocca di Neto
I026	San Mauro Marchesato
I057	San Nicola dell'Alto
I308	Santa Severina
I468	Savelli
I494	Scandale
I982	Strongoli
L492	Umbriatico
L802	Verzino
A043	Acquaro
A386	Arena
B169	Briatico
B197	Brognaturo
B655	Capistrano
C581	Cessaniti
D253	Dasà
D303	Dinami
D364	Drapia
D453	Fabrizia
D587	Filadelfia
D589	Filandari
D596	Filogaso
D762	Francavilla Angitola
D767	Francica
D988	Gerocarne
E321	Ionadi
E389	Joppolo
E590	Limbadi
E836	Maierato
F207	Mileto
F364	Mongiana
F607	Monterosso Calabro
F843	Nardodipace
F893	Nicotera
G335	Parghelia
G722	Pizzo
G728	Pizzoni
G785	Polia
H271	Ricadi
H516	Rombiolo
H785	San Calogero
H807	San Costantino Calabro
H941	San Gregorio d'Ippona
I058	San Nicola da Crissa
I350	Sant'Onofrio
I639	Serra San Bruno
I744	Simbario
I853	Sorianello
I854	Soriano Calabro
I884	Spadola
I905	Spilinga
I945	Stefanaconi
L452	Tropea
L607	Vallelonga
L699	Vazzano
F537	Vibo Valentia
M138	Zaccanopoli
M143	Zambrone
M204	Zungri
A317	Antrona Schieranco
A325	Anzola d'Ossola
A409	Arizzano
A427	Arola
A497	Aurano
A534	Baceno
A610	Bannio Anzino
A725	Baveno
A733	Bee
A742	Belgirate
A834	Beura-Cardezza
A925	Bognanco
B207	Brovello-Carpugnino
B380	Calasca-Castiglione
B463	Cambiasca
B610	Cannero Riviera
B615	Cannobio
B694	Caprezzo
B876	Casale Corte Cerro
C367	Cavaglio-Spoccia
C478	Ceppo Morelli
C567	Cesara
D099	Cossogno
D134	Craveggia
D168	Crevoladossola
D177	Crodo
D225	Cursolo-Orasso
D332	Domodossola
D374	Druogno
D481	Falmenta
D706	Formazza
D984	Germagno
E003	Ghiffa
E028	Gignese
E153	Gravellona Toce
E269	Gurro
E304	Intragna
E685	Loreglia
E790	Macugnaga
E795	Madonna del Sasso
E853	Malesco
F010	Masera
F048	Massiola
F146	Mergozzo
F192	Miazzina
F483	Montecrestese
F639	Montescheno
F932	Nonio
G007	Oggebbio
G062	Omegna
G117	Ornavasso
G280	Pallanzeno
G600	Piedimulera
G658	Pieve Vergonte
H030	Premeno
H033	Premia
H037	Premosello-Chiovenda
H106	Quarna Sopra
H107	Quarna Sotto
H203	Re
H777	San Bernardino Verbano
I249	Santa Maria Maggiore
I619	Seppiana
I976	Stresa
L187	Toceno
L333	Trarego Viggiona
L336	Trasquera
L450	Trontano
L651	Valstrona
L666	Vanzone con San Carlo
L691	Varzo
L746	Verbania
L864	Viganella
L889	Vignone
L906	Villadossola
M042	Villette
M111	Vogogna
A069	Aggius
H848	Aglientu
A115	Alà dei Sardi
A453	Arzachena
M214	Badesi
A789	Berchidda
B063	Bortigiadas
B246	Buddusò
B248	Budoni
B378	Calangianus
M274	Golfo Aranci
E425	La Maddalena
M275	Loiri Porto San Paolo
E747	Luogosanto
E752	Luras
F667	Monti
G015	Olbia
G153	Oschiri
M301	Padru
G258	Palau
M276	Sant'Antonio di Gallura
I312	Santa Teresa Gallura
I329	San Teodoro
L088	Telti
L093	Tempio Pausania
L428	Trinità d'Agultu e Vignola
A454	Arzana
A663	Bari Sardo
A722	Baunei
M285	Cardedu
D395	Elini
D859	Gairo
E049	Girasole
E283	Ilbono
E387	Jerzu
E441	Lanusei
E644	Loceri
E700	Lotzorai
G158	Osini
G445	Perdasdefogu
I706	Seui
L036	Talana
L140	Tertenia
A355	Tortolì
L423	Triei
L489	Ulassai
L506	Urzulei
L514	Ussassai
L953	Villagrande Strisaili
A359	Arbus
A681	Barumini
C882	Collinas
D827	Furtei
D970	Genuri
D997	Gesturi
E085	Gonnosfanadiga
E270	Guspini
G207	Pabillonis
G382	Pauli Arbarei
H738	Samassi
H856	San Gavino Monreale
H974	Sanluri
I428	Sardara
I570	Segariu
I647	Serramanna
I667	Serrenti
I705	Setzu
I724	Siddi
L463	Tuili
L473	Turri
L513	Ussaramanna
L924	Villacidro
L966	Villamar
L986	Villanovaforru
L987	Villanovafranca
B250	Buggerru
B383	Calasetta
B745	Carbonia
B789	Carloforte
D334	Domusnovas
D639	Fluminimaggiore
E022	Giba
E086	Gonnesa
E281	Iglesias
M270	Masainas
F822	Musei
F841	Narcao
F991	Nuxis
G446	Perdaxius
M291	Piscinas
G922	Portoscuso
G287	San Giovanni Suergiu
I182	Santadi
M209	Sant'Anna Arresi
I294	Sant'Antioco
L337	Tratalias
L968	Villamassargia
M278	Villaperuccio
A087	Agrate Brianza
A096	Aicurzio
A159	Albiate
A376	Arcore
A668	Barlassina
A759	Bellusco
A802	Bernareggio
A818	Besana in Brianza
A849	Biassono
B105	Bovisio-Masciago
B187	Briosco
B212	Brugherio
B272	Burago di Molgora
B501	Camparada
B729	Carate Brianza
B798	Carnate
C395	Cavenago di Brianza
C512	Ceriano Laghetto
C566	Cesano Maderno
C820	Cogliate
C952	Concorezzo
D038	Correzzana
D286	Desio
E063	Giussano
E504	Lazzate
E550	Lesmo
E591	Limbiate
E617	Lissone
E786	Macherio
F078	Meda
F165	Mezzago
F247	Misinto
F704	Monza
F797	Muggiò
F944	Nova Milanese
G116	Ornago
H233	Renate
H537	Ronco Briantino
I625	Seregno
I709	Seveso
I878	Sovico
I998	Sulbiate
L434	Triuggio
L511	Usmate Velate
L677	Varedo
L704	Vedano al Lambro
L709	Veduggio con Colzano
L744	Verano Brianza
M017	Villasanta
M052	Vimercate
B289	Busnago
B671	Caponago
D019	Cornate d'Adda
E530	Lentate sul Seveso
H529	Roncello
A233	Altidona
A252	Amandola
A760	Belmonte Piceno
B534	Campofilone
D477	Falerone
D542	Fermo
D760	Francavilla d'Ete
E208	Grottazzolina
E447	Lapedona
E807	Magliano di Tenna
F021	Massa Fermana
F379	Monsampietro Morico
F428	Montappone
F493	Montefalcone Appennino
F509	Montefortino
F517	Monte Giberto
F520	Montegiorgio
F522	Montegranaro
F536	Monteleone di Fermo
F549	Montelparo
F599	Monte Rinaldo
F614	Monterubbiano
F626	Monte San Pietrangeli
F653	Monte Urano
F664	Monte Vidon Combatte
F665	Monte Vidon Corrado
F697	Montottone
F722	Moresco
G137	Ortezzano
G403	Pedaso
G516	Petritoli
G873	Ponzano di Fermo
G920	Porto San Giorgio
G921	Porto Sant'Elpidio
H182	Rapagnano
I315	Santa Vittoria in Matenano
I324	Sant'Elpidio a Mare
C070	Servigliano
I774	Smerillo
L279	Torre San Patrizio
A285	Andria
A669	Barletta
A883	Bisceglie
B619	Canosa di Puglia
E946	Margherita di Savoia
F220	Minervino Murge
H839	San Ferdinando di Puglia
I907	Spinazzola
L328	Trani
B915	Trinitapoli
\.


--
-- TOC entry 5698 (class 0 OID 35114)
-- Dependencies: 299
-- Data for Name: cu_decode_diritto; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cu_decode_diritto (codice, descrizione) FROM stdin;
0 	Assenza di titolo
10	Proprieta
100	Oneri
12 	Concedente in parte
14 	Livellario parziale per
15 	Usufruttuario parziale per
16 	Utilista della superficie
17 	Utilista della superficie per
1s	Proprietà superficiaria
1t	Proprietà per l area
20	Nuda proprietà
20 	Livellario
21 	Livellario per
22 	Livellario in parte
25 	Enfiteuta in parte
26 	Colono perpetuo
27 	Colono perpetuo per
28 	Colono perpetuo in parte
2s	Nuda proprieta superficiaria
3 	Comproprietario
30	Abitazione
30 	Usufruttuario parziale
33 	Cousufruttuario generale
35 	Beneficiario
36 	Usufruttuario generale di livello
37 	Usufruttuario parziale di livello
39 	Usufruttuario parziale di enfiteusi
3s	Abitazione su proprietà superficiaria
4 	Comproprietario per
40	Diritto del concedente
40 	Usufruttuario generale di colonia
41 	Usufruttuario parziale di colonia
42 	Usufruttuario generale di dominio diretto
43 	Usufruttuario parziale di dominio diretto
46 	Possessore
47 	Possessore per
48 	Compossessore
49 	Compossessore per
50	Enfiteusi
50 	Cousufruttuario per
52 	Usuario perpetuo
53 	Usuario a tempo determinato
54 	Beneficiario di dominio diretto
55 	Contestatario
56 	Contestatario per
57 	Contestatario per usufrutto
60	Superficie
60 	Cousufruttuario di livello
61 	Cousufruttuario generale di livello
62 	Usufruttuario di livello di
64 	Comproprietario per parte di
65 	Beneficiario per
7 	Comproprietario del fabbricato
70	Uso
70 	Usufruttuario di colonia per
71 	Usufruttuario di dominio diretto per
72 	Cousufruttuario generale con diritto di accrescimento
7s	Uso proprietà superficiaria
8 	Comproprietario per l area
80	Usufrutto
8a	Usufrutto con diritto di accrescimento
8e	Usufrutto su enfiteusi
8s	Usufrutto su proprietà superficiaria
90	Servitu
99 	Presenza di titolo non codificato
990	Presenza di titolo non codificato
\.


--
-- TOC entry 5699 (class 0 OID 35117)
-- Dependencies: 300
-- Data for Name: cu_decode_immobile; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cu_decode_immobile (codice, descrizione) FROM stdin;
F	fabbricato
T	terreno
\.


--
-- TOC entry 5700 (class 0 OID 35120)
-- Dependencies: 301
-- Data for Name: cu_decode_nota; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cu_decode_nota (codice, tipo_immobile, descrizione) FROM stdin;
A	F	Accatastamento
A	T	Voltura provenienti da tabelle di variazione o Nota di variazione
B	T	Nota di voltura o frazionamento proveniente da note di voltura
C	T	Voltura
D	F	Voltura
F	T	Frazionamento
I	F	Impianto
I	T	Impianto
M	T	Tipo mappale
N	T	Nota di voltura o variazione
R	F	Voltura automatica da Conservatorie
R	T	Voltura automatica da Conservatorie
T	T	Tabella di variazione
V	F	Variazione
V	T	Voltura
W	T	Voltura o variazione
\.


--
-- TOC entry 5701 (class 0 OID 35123)
-- Dependencies: 302
-- Data for Name: cu_decode_partite_speciali; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cu_decode_partite_speciali (tipo_immobile, codice, descrizione) FROM stdin;
T	1	aree di enti urbani e promiscui
T	2	accessori comuni ad enti rurali e ad enti rurali e urbani
T	3	aree di fabbricati rurali, o urbani da accertare, divisi in subalterni
T	4	acque esenti da estimo
T	5	strade pubbliche
T	0	particelle soppresse
F	0	beni comuni censibili
F	A	beni comuni non censibili
F	R	fabbricati rurali
F	C	unità immobiliari soppresse
\.


--
-- TOC entry 5702 (class 0 OID 35126)
-- Dependencies: 303
-- Data for Name: cu_decode_regime; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cu_decode_regime (codice, descrizione) FROM stdin;
C	comunione
D	in comunione
De	residuo
P	bene personale
S	in separazione
\.


--
-- TOC entry 5703 (class 0 OID 35129)
-- Dependencies: 304
-- Data for Name: cu_decode_riserva; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cu_decode_riserva (codice, descrizione) FROM stdin;
1	ris. atti pass. interm. non esist.
2	ris. errati elem. catast. in atto
3	ris. errate generalita in atto
4	ris. tipo frazionamento non presente
5	ris. rettifica uff. fraz. inidoneo
6	ris. stato di fatto non convalid.
7	connes. con partic. di diversa partita
\.


--
-- TOC entry 5704 (class 0 OID 35132)
-- Dependencies: 305
-- Data for Name: cu_decode_sesso; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cu_decode_sesso (codice, descrizione) FROM stdin;
1	maschio
2	femmina
\.


--
-- TOC entry 5705 (class 0 OID 35135)
-- Dependencies: 306
-- Data for Name: cu_decode_soggetto; Type: TABLE DATA; Schema: catasto; Owner: -
--

COPY cu_decode_soggetto (codice, descrizione) FROM stdin;
G	persona giuridica
P	persona fisica
\.


SET search_path = public, pg_catalog;

--
-- TOC entry 5706 (class 0 OID 35776)
-- Dependencies: 399
-- Data for Name: cat_cf_decode_consistenza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_cf_decode_consistenza (codice, descrizione) FROM stdin;
A	vani
B	metri cubi
C	metri quadrati
\.


--
-- TOC entry 5707 (class 0 OID 35779)
-- Dependencies: 400
-- Data for Name: cat_cf_decode_flag_classamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_cf_decode_flag_classamento (codice, descrizione) FROM stdin;
1	classamento proposto dalla parte
2	classamento proposto dalla parte e validato dall’ufficio
3	classamento automatico (attribuito in sostituzione del classamento proposto)
4	classamento rettificato (in sostituzione del classamento proposto)
5	classamento proposto divenuto definitivo per decorrenza termini
\.


--
-- TOC entry 5708 (class 0 OID 35782)
-- Dependencies: 401
-- Data for Name: cat_ct_decode_destinazioni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_ct_decode_destinazioni (codice, descrizione) FROM stdin;
1	seminativo
2	semin irrig
3	semin arbor
4	sem arb irr
5	sem irr arb
6	sem pez fos
7	sem arb p f
8	prato
9	prato irrig
10	prato arbor
11	prato ir ar
12	prato marc
13	prato mar ar
14	marcita
15	risaia
16	risaia stab
17	orto
18	orto irrig
19	orto arbor
20	orto ar irr
21	orto frutt
22	orto pez fos
23	orto fiori
24	orto ir fi
25	ort viv flo
26	vivaio
27	viv orn fl
28	giardini
29	vigneto
30	vigneto arb
31	vigneto irr
32	vig uva tav
33	vign frutt
34	vign ulivet
35	vign mandor
36	uliveto
37	uliv agrum
38	uliv fichet
39	ul fich man
40	uliv frass
41	uliv frutt
42	uliv sommac
43	uliv vignet
44	uliv sugher
45	uliv mandor
46	ul man pist
47	frutteto
48	frutt irrig
49	agrumeto
50	agrum aranc
51	agrum irrig
52	agrum uliv
53	alpe
54	aranceto
55	canneto
56	cappereto
57	carrubeto
58	castagneto
59	cast frutto
60	cast frass
61	chiusa
62	eucalipteto
63	ficheto
64	fico india
65	fico mandor
66	frassineto
67	gelseto
68	limoneto
69	mandorleto
70	mandor fich
71	mandor fico
72	mandarineto
73	noceto
74	noccioleto
75	nocc vignet
76	palmeto
77	pescheto
78	pioppeto
79	pistacch
80	pometo
81	querceto
82	querc ghian
83	roseto
84	saliceto
85	salceto
86	sommaccheto
87	sommac arb
88	somm mandor
89	sommac uliv
90	sughereto
91	pascolo
92	pascolo arb
93	pasc cespug
94	pascolo bc
95	pascolo bm
96	pascolo ba
97	bosco ceduo
98	bosco misto
99	bosco alto
100	palud spart
101	incolt prod
102	orto irr ar
103	nocciol irr
104	sem car irr
105	pereto
106	sem irr prot
107	bosco rap ac
126	serra
127	funghicoltur
130	arativi
131	seminativi
132	prati
133	orti
134	vigneti
135	pascoli
136	alpi
137	lag pal st
138	boschi
150	incolt ster
151	lago pubbl
152	laguna
153	stagno
180	cava
181	lago pesca
182	miniera
183	salina
184	stagn pesca
185	tonnara
186	torbiera
187	valle pesca
188	acque priv
200	aeroporto d
201	aer fort d
202	autovia sp
203	area dem pp
204	banchina
205	cimitero
206	ferrovia sp
207	fortificaz
208	giard pub
209	giard dem
210	giard com
211	giard prov
212	molo
213	parco pubb
214	parco deman
215	parco comun
216	parco prov
217	p v rimembr
218	pza d armi
219	porto
220	somm arg 2
221	somm arg 3
222	tranvia sp
223	somm arg 1
250	canale bon
251	canale irr
252	gora
270	antichita
271	area fab dm
272	area promis
273	area rurale
274	area urbana
275	corte urban
276	costr no ab
277	fa div sub
278	fabb promis
279	fabb rurale
280	fabb diruto
281	fr div sub
282	ente urbano
283	fu d accert
284	porz acc fr
285	porz acc fu
286	porz di fa
287	porz di fr
288	porz rur fp
290	porz di fu
300	acque esent
301	piazza pubb
302	strade pubb
350	accesso
351	accessorio
352	aia
353	andito
354	androne
355	area
356	ascensore
357	autorimessa
358	ballatoio
359	bindolo
360	bottino
361	bucataio
362	canale priv
363	cantina
364	capanna
365	cappella
366	carbonile
367	casello
368	casotto
369	cisterna
370	concimaia
371	conigliera
372	corridoio
373	corte
374	fontana
375	fontanile
376	forno
377	frantoio
378	garage
379	garitta
380	grotta
381	ingresso
382	latrina
383	lavanderia
384	lavatoio
385	legnaia
386	locale dep
387	loggia
388	luogo dep
389	macero
390	montacarichi
391	muro
392	noria
393	oratorio
394	palmeto
395	passaggio
396	passo
397	piazza
398	piazzale
399	pollaio
400	pompa
401	porcile
402	portico
403	portineria
404	portone
405	pozzo
406	resede
407	rifugio ant
408	rimessa
409	ripostiglio
410	scala
411	scolo acqua
412	seccatoio
413	sedime
414	sentina
415	sorgiva
416	sottoscala
417	sottopassag
418	spazio
419	stalla
420	strada priv
421	terrazzo
422	tettoia
423	tinaia
424	vano
425	vasca
450	rel ente ur
451	rel acc com
452	rel f d sub
453	rel acq es
454	relit strad
455	terr n form
500	casa e corte
501	fabb e corte
504	incolto
505	improdutt
506	sentiero
507	ponte
508	cavalcavia
509	casa stalla
510	chiesa
511	edificabile
512	cortile
513	magazzino
514	fosso
515	casa
516	edificio
517	fabbricato
602	lag pal sta
993	modello 26
997	sop var ter
998	soppresso
\.


--
-- TOC entry 5709 (class 0 OID 35785)
-- Dependencies: 402
-- Data for Name: cat_ct_decode_flag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_ct_decode_flag (codice, descrizione) FROM stdin;
0	non calcolabile
1	calcolabile
\.


--
-- TOC entry 5710 (class 0 OID 35788)
-- Dependencies: 403
-- Data for Name: cat_cu_decode_diritto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_cu_decode_diritto (codice, descrizione) FROM stdin;
0 	Assenza di titolo
10	Proprieta
100	Oneri
12 	Concedente in parte
14 	Livellario parziale per
15 	Usufruttuario parziale per
16 	Utilista della superficie
17 	Utilista della superficie per
1s	Proprietà superficiaria
1t	Proprietà per l area
20	Nuda proprietà
20 	Livellario
21 	Livellario per
22 	Livellario in parte
25 	Enfiteuta in parte
26 	Colono perpetuo
27 	Colono perpetuo per
28 	Colono perpetuo in parte
2s	Nuda proprieta superficiaria
3 	Comproprietario
30	Abitazione
30 	Usufruttuario parziale
33 	Cousufruttuario generale
35 	Beneficiario
36 	Usufruttuario generale di livello
37 	Usufruttuario parziale di livello
39 	Usufruttuario parziale di enfiteusi
3s	Abitazione su proprietà superficiaria
4 	Comproprietario per
40	Diritto del concedente
40 	Usufruttuario generale di colonia
41 	Usufruttuario parziale di colonia
42 	Usufruttuario generale di dominio diretto
43 	Usufruttuario parziale di dominio diretto
46 	Possessore
47 	Possessore per
48 	Compossessore
49 	Compossessore per
50	Enfiteusi
50 	Cousufruttuario per
52 	Usuario perpetuo
53 	Usuario a tempo determinato
54 	Beneficiario di dominio diretto
55 	Contestatario
56 	Contestatario per
57 	Contestatario per usufrutto
60	Superficie
60 	Cousufruttuario di livello
61 	Cousufruttuario generale di livello
62 	Usufruttuario di livello di
64 	Comproprietario per parte di
65 	Beneficiario per
7 	Comproprietario del fabbricato
70	Uso
70 	Usufruttuario di colonia per
71 	Usufruttuario di dominio diretto per
72 	Cousufruttuario generale con diritto di accrescimento
7s	Uso proprietà superficiaria
8 	Comproprietario per l area
80	Usufrutto
8a	Usufrutto con diritto di accrescimento
8e	Usufrutto su enfiteusi
8s	Usufrutto su proprietà superficiaria
90	Servitu
99 	Presenza di titolo non codificato
990	Presenza di titolo non codificato
\.


--
-- TOC entry 5711 (class 0 OID 35791)
-- Dependencies: 404
-- Data for Name: cat_cu_decode_immobile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_cu_decode_immobile (codice, descrizione) FROM stdin;
F	fabbricati
T	terreni
\.


--
-- TOC entry 5712 (class 0 OID 35794)
-- Dependencies: 405
-- Data for Name: cat_cu_decode_nota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_cu_decode_nota (codice, tipo_immobile, descrizione) FROM stdin;
A	F	Accatastamento
A	T	Voltura provenienti da tabelle di variazione o Nota di variazione
B	T	Nota di voltura o frazionamento proveniente da note di voltura
C	T	Voltura
D	F	Voltura
F	T	Frazionamento
I	F	Impianto
I	T	Impianto
M	T	Tipo mappale
N	T	Nota di voltura o variazione
R	F	Voltura automatica da Conservatorie
R	T	Voltura automatica da Conservatorie
T	T	Tabella di variazione
V	F	Variazione
V	T	Voltura
W	T	Voltura o variazione
\.


--
-- TOC entry 5713 (class 0 OID 35797)
-- Dependencies: 406
-- Data for Name: cat_cu_decode_partite_speciali; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_cu_decode_partite_speciali (tipo_immobile, codice, descrizione) FROM stdin;
T	1	aree di enti urbani e promiscui
T	2	accessori comuni ad enti rurali e ad enti rurali e urbani
T	3	aree di fabbricati rurali, o urbani da accertare, divisi in subalterni
T	4	acque esenti da estimo
T	5	strade pubbliche
T	0	particelle soppresse
F	0	beni comuni censibili
F	A	beni comuni non censibili
F	R	fabbricati rurali
F	C	unità immobiliari soppresse
\.


--
-- TOC entry 5714 (class 0 OID 35800)
-- Dependencies: 407
-- Data for Name: cat_cu_decode_regime; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_cu_decode_regime (codice, descrizione) FROM stdin;
C	comunione
D	in comunione
De	residuo
P	bene personale
S	in separazione
\.


--
-- TOC entry 5715 (class 0 OID 35803)
-- Dependencies: 408
-- Data for Name: cat_cu_decode_riserva; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_cu_decode_riserva (codice, descrizione) FROM stdin;
1	ris. atti pass. interm. non esist.
2	ris. errati elem. catast. in atto
3	ris. errate generalita in atto
4	ris. tipo frazionamento non presente
5	ris. rettifica uff. fraz. inidoneo
6	ris. stato di fatto non convalid.
7	connes. con partic. di diversa partita
\.


--
-- TOC entry 5716 (class 0 OID 35806)
-- Dependencies: 409
-- Data for Name: cat_cu_decode_sesso; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_cu_decode_sesso (codice, descrizione) FROM stdin;
1	maschio
2	femmina
\.


--
-- TOC entry 5717 (class 0 OID 35809)
-- Dependencies: 410
-- Data for Name: cat_cu_decode_soggetto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cat_cu_decode_soggetto (codice, descrizione) FROM stdin;
G	persona giuridica
P	persona fisica
\.


--
-- TOC entry 5718 (class 0 OID 35850)
-- Dependencies: 422
-- Data for Name: cf_decode_categoria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cf_decode_categoria (codice, descrizione) FROM stdin;
A01	Abitazione di tipo signorile
A02	Abitazione di tipo civile
A03	Abitazioni di tipo economico
A04	Abitazioni di tipo popolari
A05	Abitazioni di tipo ultrapopolare
A06	Abitazione di tipo rurale
A07	Abitazione in villini
A08	Abitazione in villa
A09	Castelli, palazzi di eminenti pregi artistici o storici
A10	Uffici e studi privati
A11	Abitazioni o alloggi tipici dei luoghi
B01	Collegi e convitti, educandati, ricoveri, orfanotrofi, ospizi, conventi, seminari, caserme
B02	Case di cura e ospedali senza fine di lucro
B03	Prigioni e riformatori
B04	Uffici Pubblici
B05	Scuole e laboratori scientifici
B06	Biblioteche, pinacoteche, musei, gallerie, accademie che non hanno sede in edifici della categoria A09. Circoli ricreativi e culturali, ed attivita similari se non hanno fine di lucro
B07	Cappelle ed oratori non destinati all esercizio pubblico del culto
B08	Magazzini sotterranei per depositi di derrate
C01	Negozi e Botteghe
C02	Magazzini e locali di Deposito
C03	Laboratori per arti e mestieri
C04	Fabbricati e locali per esercizi sportivi (senza fine di lucro)
C05	Stabilimenti balneari e di acque curative (senza fine di lucro)
C06	Stalle, scuderie, rimesse, autorimesse (senza fine di lucro)
C07	Tettoie chiuse od aperte
D01	Opifici
D02	Alberghi e pensioni (con fine di lucro)
D03	Teatri, cinematografi, sale per concerti e spettacoli e simili (con fine di lucro)
D04	Case di cura ed ospedali (con fine di lucro)
D05	Istituto di credito, cambio e assicurazione (con fine di lucro)
D06	Fabbricati e locali per esercizi sportivi (con fine di lucro)
D07	Fabbricati costruiti o adattati per le speciali esigenze di un attivita industriale e non suscettibili di destinazione diversa senza radicali trasformazioni
D08	Fabbricati costruiti o adattati per le speciali esigenze di un attivita commerciale e non suscettibili di destinazione diversa senza radicali trasformazioni
D09	Edifici galleggianti o sospesi assicurati a punti fissi del suolo, ponti privati soggetti a pedaggio
D10	Fabbricati per funzioni produttive connesse alle attivita agricole
E01	Stazioni per servizi di trasporto, terrestri, marittimi ed aerei
E02	Ponti comunali e provinciali soggetti a pedaggio
E03	Costruzioni e fabbricati per speciali esigenze pubbliche
E04	Recinti chiusi per speciali esigenze pubbliche
E05	Fabbricati costituenti fortificazioni e loro dipendenze
E06	Fari, semafori, torri per rendere d uso pubblico l orologio comunale
E07	Fabbricati destinati all esercizio pubblico dei culti
E08	Fabbricati e costruzioni nei cimiteri, esclusi i colombari, i sepolcri e le tombe di famiglia
E09	Edifici a destinazione particolare non compresi nelle categorie precedenti del gruppo E
F01	Area urbana
F02	Unita collabenti
F03	Unita in corso di costruzione
F04	Unita in corso di definizione
F05	Lastrico solare
\.


SET search_path = catasto, pg_catalog;

--
-- TOC entry 5491 (class 2606 OID 40604)
-- Name: cf_decode_categoria_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cf_decode_categoria
    ADD CONSTRAINT cf_decode_categoria_pkey PRIMARY KEY (codice);


--
-- TOC entry 5493 (class 2606 OID 40606)
-- Name: cf_decode_consistenza_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cf_decode_consistenza
    ADD CONSTRAINT cf_decode_consistenza_pkey PRIMARY KEY (codice);


--
-- TOC entry 5495 (class 2606 OID 40608)
-- Name: cf_decode_flag_classamento_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cf_decode_flag_classamento
    ADD CONSTRAINT cf_decode_flag_classamento_pkey PRIMARY KEY (codice);


--
-- TOC entry 5497 (class 2606 OID 40610)
-- Name: cf_decode_toponimo_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cf_decode_toponimo
    ADD CONSTRAINT cf_decode_toponimo_pkey PRIMARY KEY (codice);


--
-- TOC entry 5499 (class 2606 OID 40644)
-- Name: ct_decode_destinazioni_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ct_decode_destinazioni
    ADD CONSTRAINT ct_decode_destinazioni_pkey PRIMARY KEY (codice);


--
-- TOC entry 5501 (class 2606 OID 40646)
-- Name: ct_decode_flag_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ct_decode_flag
    ADD CONSTRAINT ct_decode_flag_pkey PRIMARY KEY (codice);


--
-- TOC entry 5503 (class 2606 OID 40664)
-- Name: cu_decode_comune_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cu_decode_comune
    ADD CONSTRAINT cu_decode_comune_pkey PRIMARY KEY (codice);


--
-- TOC entry 5505 (class 2606 OID 40666)
-- Name: cu_decode_diritto_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cu_decode_diritto
    ADD CONSTRAINT cu_decode_diritto_pkey PRIMARY KEY (codice);


--
-- TOC entry 5507 (class 2606 OID 40668)
-- Name: cu_decode_immobile_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cu_decode_immobile
    ADD CONSTRAINT cu_decode_immobile_pkey PRIMARY KEY (codice);


--
-- TOC entry 5509 (class 2606 OID 40670)
-- Name: cu_decode_nota_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cu_decode_nota
    ADD CONSTRAINT cu_decode_nota_pkey PRIMARY KEY (codice, tipo_immobile);


--
-- TOC entry 5511 (class 2606 OID 40672)
-- Name: cu_decode_partite_speciali_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cu_decode_partite_speciali
    ADD CONSTRAINT cu_decode_partite_speciali_pkey PRIMARY KEY (tipo_immobile, codice);


--
-- TOC entry 5513 (class 2606 OID 40674)
-- Name: cu_decode_regime_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cu_decode_regime
    ADD CONSTRAINT cu_decode_regime_pkey PRIMARY KEY (codice);


--
-- TOC entry 5515 (class 2606 OID 40676)
-- Name: cu_decode_riserva_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cu_decode_riserva
    ADD CONSTRAINT cu_decode_riserva_pkey PRIMARY KEY (codice);


--
-- TOC entry 5517 (class 2606 OID 40678)
-- Name: cu_decode_sesso_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cu_decode_sesso
    ADD CONSTRAINT cu_decode_sesso_pkey PRIMARY KEY (codice);


--
-- TOC entry 5519 (class 2606 OID 40680)
-- Name: cu_decode_soggetto_pkey; Type: CONSTRAINT; Schema: catasto; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cu_decode_soggetto
    ADD CONSTRAINT cu_decode_soggetto_pkey PRIMARY KEY (codice);


SET search_path = public, pg_catalog;

--
-- TOC entry 5531 (class 2606 OID 40812)
-- Name: cat_cu_decode_immobile_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_cu_decode_immobile
    ADD CONSTRAINT cat_cu_decode_immobile_pkey PRIMARY KEY (codice);


--
-- TOC entry 5545 (class 2606 OID 40826)
-- Name: cf_decode_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cf_decode_categoria
    ADD CONSTRAINT cf_decode_categoria_pkey PRIMARY KEY (codice);


--
-- TOC entry 5521 (class 2606 OID 40828)
-- Name: cf_decode_consistenza_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_cf_decode_consistenza
    ADD CONSTRAINT cf_decode_consistenza_pkey PRIMARY KEY (codice);


--
-- TOC entry 5523 (class 2606 OID 40830)
-- Name: cf_decode_flag_classamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_cf_decode_flag_classamento
    ADD CONSTRAINT cf_decode_flag_classamento_pkey PRIMARY KEY (codice);


--
-- TOC entry 5525 (class 2606 OID 40844)
-- Name: ct_decode_destinazioni_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_ct_decode_destinazioni
    ADD CONSTRAINT ct_decode_destinazioni_pkey PRIMARY KEY (codice);


--
-- TOC entry 5527 (class 2606 OID 40846)
-- Name: ct_decode_flag_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_ct_decode_flag
    ADD CONSTRAINT ct_decode_flag_pkey PRIMARY KEY (codice);


--
-- TOC entry 5529 (class 2606 OID 40856)
-- Name: cu_decode_diritto_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_cu_decode_diritto
    ADD CONSTRAINT cu_decode_diritto_pkey PRIMARY KEY (codice);


--
-- TOC entry 5533 (class 2606 OID 40858)
-- Name: cu_decode_nota_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_cu_decode_nota
    ADD CONSTRAINT cu_decode_nota_pkey PRIMARY KEY (codice, tipo_immobile);


--
-- TOC entry 5535 (class 2606 OID 40860)
-- Name: cu_decode_partite_speciali_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_cu_decode_partite_speciali
    ADD CONSTRAINT cu_decode_partite_speciali_pkey PRIMARY KEY (tipo_immobile, codice);


--
-- TOC entry 5537 (class 2606 OID 40862)
-- Name: cu_decode_regime_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_cu_decode_regime
    ADD CONSTRAINT cu_decode_regime_pkey PRIMARY KEY (codice);


--
-- TOC entry 5539 (class 2606 OID 40864)
-- Name: cu_decode_riserva_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_cu_decode_riserva
    ADD CONSTRAINT cu_decode_riserva_pkey PRIMARY KEY (codice);


--
-- TOC entry 5541 (class 2606 OID 40866)
-- Name: cu_decode_sesso_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_cu_decode_sesso
    ADD CONSTRAINT cu_decode_sesso_pkey PRIMARY KEY (codice);


--
-- TOC entry 5543 (class 2606 OID 40868)
-- Name: cu_decode_soggetto_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cat_cu_decode_soggetto
    ADD CONSTRAINT cu_decode_soggetto_pkey PRIMARY KEY (codice);


-- Completed on 2015-04-13 12:11:42

--
-- PostgreSQL database dump complete
--

