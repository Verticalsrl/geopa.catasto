
from math import sin, cos, pi, radians

from osgeo.osr import CoordinateTransformation, SpatialReference
from osgeo.ogr import wkbPoint, wkbPolygon, wkbLinearRing, wkbLineString, wkbPolygon25D, wkbLineString25D
from osgeo.ogr import GetDriverByName, Feature, Geometry, FieldDefn, Open
from osgeo.ogr import OFTString, OFTInteger, OFTReal
import unicodedata
import os

#Rimuovo lettere accentate o caratteri strani, convertendoli in "latin-1" per una corretta decodifica:
def remove_accents(input_str):
    nkfd_form = unicodedata.normalize('NFKD', unicode(input_str.decode('latin-1')))
    return u"".join([c for c in nkfd_form if not unicodedata.combining(c)]).encode('ascii','ignore')

#Rigo originale, punto di emanazione per la provincia di Campobasso:
#cassini_soldener = '+proj=cass +lat_0=41.650375 +lon_0=14.259775 +x_0=%f +y_0=%f +ellps=intl +units=m +no_defs'

#Per il comune di Orbassano, codice G087 - coordinate EPSG4326 ricordarsi di cambiare il codice anche al rigo 62!
#cassini_soldener = '+proj=cass +lat_0=45.007336 +lon_0=7.53725 +x_0=%f +y_0=%f +ellps=intl +units=m +no_defs'
#t_srs='4326'

#Compilare questi parametri nel caso in cui certi fogli di alcuni comuni siano shiftati: penso siano shift "manuali" e non "ufficiali" del catasto
comuni_shift = {
    ('E259', '49'): ((-0.192, 1.282), (-1., 1.5)),
    ('E259', '50'): ((0.931, 0.768), (-1., 1.5)),
    ('E259', '60'): ((0.455, 0.745), (-1., 1.5)),
    ('E259', '73'): ((2.681, 1.103), (-1., 1.5)),
    ('B550', '1'): ((-16.811, -18.794), (-1., 1.5)),
    ('B550', '3'): ((-6.979, -17.941), (-1., 1.5)),
    ('B550', '6'): ((3.432, -21.982), (-1., 1.5)),
    ('B550', '7'): ((9.567, -28.574), (-1., 1.5)),
    ('B550', '12'): ((29.741, -40.743), (-1., 1.5)),
    ('B550', '13'): ((29.741, -40.743), (-1., 1.5)),
    ('B550', '22'): ((28.845, -43.027), (-1., 1.5)),
    ('B550', '23'): ((37.601, -49.424), (-1., 1.5)),
    ('L113', '35'): ((21.5, 18.5), (-1., 1.5)),
    ('L113', '38'): ((26., 12.5), (-1., 1.5)),
    ('L113', '40'): ((33., 0.5), (-1., 1.5)),
    ('L113', '41'): ((32.5, 10.7), (-1., 1.5)),
    ('L113', '42'): ((34., 15.3), (-1., 1.5)),
    ('L113', '43'): ((39., 22.), (-1., 1.5)),
    ('L113', '45'): ((39.2, 2.7), (-1., 1.5)),
    ('L113', '46'): ((44.8, 6.6), (-1., 1.5)),
    ('L113', '47'): ((42.5, 17.5), (-1., 1.5)),
    ('L113', '48'): ((39., -7.), (-1., 1.5)),
    ('L113', '49'): ((42.6, 2.3), (-1., 1.5)),
    ('L113', '50'): ((53., 4.), (-1., 1.5)),
    ('L113', '51'): ((48., 2.3), (-1., 1.5)),
    ('L113', '52'): ((57., 3.4), (-1., 1.5)),
    ('L113', '53'): ((53.802, 9.656), (-1., 1.5)),
    ('L113', '54'): ((61., 0.), (-1., 1.5)),
    ('G910', '02'): ((0.249, 0.392), (-1., 1.5)),
}


def rototranslate(p, p0, rotationmatrix, delta):
    x1 = rotationmatrix[0][0] * (p[0] - p0[0]) + rotationmatrix[0][1] * (p[1] - p0[1]) + delta[0]
    y1 = rotationmatrix[1][0] * (p[0] - p0[0]) + rotationmatrix[1][1] * (p[1] - p0[1]) + delta[1]
    return x1 + p0[0], y1 + p0[1]

def make_rotationmatrix(alpha):
    rotationmatrix =  [[0.,0.], [0.,0.]]
    rotationmatrix[0][0] = cos(radians(alpha))
    rotationmatrix[0][1] = -sin(radians(alpha))
    rotationmatrix[1][0] = sin(radians(alpha))
    rotationmatrix[1][1] = cos(radians(alpha))
    return rotationmatrix


#def write_foglio(foglio, destination, point_borders=False, format_name='ESRI Shapefile', t_srs='4326'):
def write_foglio(foglio, destination, point_borders=False, format_name='ESRI Shapefile'):
    
    cassini_soldener = ''
    #Imposto alcune variabile a seconda del codice_comune:
    #ATTENZIONE: Prima di modificare qui lo SRID controllare che su Postgres le tavole siano impostate adeguatamente nella tavola geometry_columns!!!
    #ATTENZIONE: se nella definizione della cassini_soldener si inseriscono dei valori fissi di x_0 e y_0 ricordarsi di definire successivamente la local_cassini_soldener in maniera adeguata, cioe' togliendo il riferimento al vettore shift_cassini prima definito. In pratica aggiungere il codice_comune nell'array del primo "if" (verso rigo 103...)
    if foglio['CODICE COMUNE'] == 'G087':
        cassini_soldener = '+proj=cass +lat_0=45.007336 +lon_0=7.53725 +x_0=%f +y_0=%f +ellps=intl +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'G535':
        #cassini_soldener = '+proj=cass +lat_0=%f +lon_0=%f +x_0=572650 +y_0=4956597 +ellps=intl +units=m +no_defs'
        #A quanto pare non gli piace se specifico x_0-y_0. Proviamo a specificare l'offset in lat/lon:
        #cassini_soldener = '+proj=cass +lat_0=44.759075 +lon_0=9.917936 +x_0=%f +y_0=%f +ellps=intl +units=m +no_defs'
        cassini_soldener = '+proj=cass +lat_0=44.759075 +lon_0=9.917936 +x_0=-15.5 +y_0=10.5 +ellps=intl +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'G476':
        cassini_soldener = '+proj=cass +lat_0=40.535328 +lon_0=15.324016 +x_0=0 +y_0=0 +ellps=intl +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'L380':
        cassini_soldener = '+proj=tmerc +lat_0=0 +lon_0=9 +k=0.9996 +x_0=1500000 +y_0=0 +ellps=intl +towgs84=-104.1,-49.1,-9.9,0.971,-2.917,0.714,-11.68 +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'I258':
        cassini_soldener = '+proj=cass +lat_0=45.099116 +lon_0=7.356182 +x_0=-1.5 +y_0=0.5 +ellps=intl +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'C261':
        cassini_soldener = '+proj=cass +lat_0=45.31413 +lon_0=9.502994 +x_0=1 +y_0=1 +ellps=intl +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'A484':
        cassini_soldener = '+proj=cass +lat_0=40.535328 +lon_0=15.324016 +x_0=0 +y_0=0 +ellps=intl +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'G793':
        cassini_soldener = '+proj=cass +lat_0=40.535328 +lon_0=15.324016 +x_0=0 +y_0=0 +ellps=intl +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'I089':
        cassini_soldener = '+proj=cass +lat_0=40.535328 +lon_0=15.324016 +x_0=0 +y_0=0 +ellps=intl +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'I143':
        cassini_soldener = '+proj=cass +lat_0=40.535328 +lon_0=15.324016 +x_0=0 +y_0=0 +ellps=intl +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'I307':
        cassini_soldener = '+proj=cass +lat_0=40.535328 +lon_0=15.324016 +x_0=0 +y_0=0 +ellps=intl +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'G226':
        cassini_soldener = '+proj=cass +lat_0=40.283555 +lon_0=15.483897 +x_0=8.9958 +y_0=-8.3549 +ellps=bessel +towgs84=668.8,146.4,506.5,5.187,-2.54,5.256,0 +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'B266':
        cassini_soldener = '+proj=cass +lat_0=40.283555 +lon_0=15.483897 +x_0=8.9958 +y_0=-8.3549 +ellps=bessel +towgs84=668.8,146.4,506.5,5.187,-2.54,5.256,0 +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'B868':
        cassini_soldener = '+proj=cass +lat_0=40.283555 +lon_0=15.483897 +x_0=8.9958 +y_0=-8.3549 +ellps=bessel +towgs84=668.8,146.4,506.5,5.187,-2.54,5.256,0 +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'F618':
        cassini_soldener = '+proj=cass +lat_0=40.283555 +lon_0=15.483897 +x_0=8.9958 +y_0=-8.3549 +ellps=bessel +towgs84=668.8,146.4,506.5,5.187,-2.54,5.256,0 +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'F625':
        cassini_soldener = '+proj=cass +lat_0=40.283555 +lon_0=15.483897 +x_0=8.9958 +y_0=-8.3549 +ellps=bessel +towgs84=668.8,146.4,506.5,5.187,-2.54,5.256,0 +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'H683':
        cassini_soldener = '+proj=cass +lat_0=40.283555 +lon_0=15.483897 +x_0=8.9958 +y_0=-8.3549 +ellps=bessel +towgs84=668.8,146.4,506.5,5.187,-2.54,5.256,0 +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'I410':
        cassini_soldener = '+proj=cass +lat_0=40.283555 +lon_0=15.483897 +x_0=8.9958 +y_0=-8.3549 +ellps=bessel +towgs84=668.8,146.4,506.5,5.187,-2.54,5.256,0 +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'I451':
        cassini_soldener = '+proj=cass +lat_0=40.283555 +lon_0=15.483897 +x_0=8.9958 +y_0=-8.3549 +ellps=bessel +towgs84=668.8,146.4,506.5,5.187,-2.54,5.256,0 +units=m +no_defs'
        t_srs='4326'
    elif foglio['CODICE COMUNE'] == 'D292':
        cassini_soldener = '+proj=cass +lat_0=40.283555 +lon_0=15.483897 +x_0=8.9958 +y_0=-8.3549 +ellps=bessel +towgs84=668.8,146.4,506.5,5.187,-2.54,5.256,0 +units=m +no_defs'
        t_srs='4326'
    target_srs = SpatialReference()
    try:
        target_srs.ImportFromEPSG(int(t_srs))
    except TypeError:
        raise
        target_srs.ImportFromProj4(t_srs)

    shifts = ((0., 0.), (0., 0.))
    shifts = comuni_shift.get(foglio['CODICE COMUNE'], shifts)
    shifts = comuni_shift.get((foglio['CODICE COMUNE'], foglio['NUMERO FOGLIO']), shifts)

    shift_cassini, shift_gauss_boaga = shifts
    ##### Parte eventualmente da MODIFICARE:
    if foglio['CODICE COMUNE'] in ['G535', 'I258','L380','G476','C261','A484','B266','B868','F618','F625','G226','G793','I307','I410','I451','D292','I143','I089','H683']:
        local_cassini_soldener = cassini_soldener
    else:
        local_cassini_soldener = cassini_soldener % (-shift_cassini[0], -shift_cassini[1])

    source_srs = SpatialReference()
    source_srs.ImportFromProj4(local_cassini_soldener)

    trasformation = CoordinateTransformation(source_srs, target_srs)

    f_comune = FieldDefn('COMUNE', OFTString)
    f_comune.SetWidth(4)
    f_foglio = FieldDefn('FOGLIO', OFTString)
    f_foglio.SetWidth(11)
    f_tipo = FieldDefn('tipo', OFTString)
    f_tipo.SetWidth(11)
    f_part = FieldDefn('PARTICELLA', OFTString)
    f_part.SetWidth(8)
    f_numero = FieldDefn('NUMERO', OFTString)
    f_part.SetWidth(8)
    f_dimensione = FieldDefn('DIMENSIONE', OFTInteger)
    f_area = FieldDefn('AREA', OFTInteger)
    f_angolo = FieldDefn('ANGOLO', OFTReal)
    f_pos_x = FieldDefn('POSIZIONEX', OFTReal)
    f_pos_y = FieldDefn('POSIZIONEY', OFTReal)
    f_interno_x = FieldDefn('P_INTERNOX', OFTReal)
    f_interno_y = FieldDefn('P_INTERNOY', OFTReal)
    f_simbolo = FieldDefn('SIMBOLO', OFTInteger)
    f_etichetta = FieldDefn('etichetta', OFTString)
    f_etichetta.SetWidth(32)
    f_testo = FieldDefn('TESTO', OFTString)
    f_testo.SetWidth(256)
    
    create_options = []
    if format_name == 'PostgreSQL':
        #Per passare i parametri del driver nella forma "parametro=valore". Sfortunatamente NON POSSO PASSARE "-APPEND"!!!!
        #vedi anche: http://www.gdal.org/gdal_tutorial.html
        papszOptions = ['OVERWRITE=yes']
    elif format_name == 'SQLite': #IN SVILUPPO!
    #per maggiori info vedere: http://www.gdal.org/drv_sqlite.html
        create_options = ['SPATIALITE=YES', 'INIT_WITH_EPSG=YES','OGR_SQLITE_SYNCHRONOUS=OFF', 'OVERWRITE=yes']
    #l'opzione Overwrite sul DB non funziona: ho messo una IF oltre
        papszOptions = ['FORMAT=SPATIALITE', 'OVERWRITE=yes'] #default
    else:
        papszOptions = []
    
    if (format_name == 'SQLite') and ( os.path.exists(destination) ):
        ds = GetDriverByName(format_name).Open(destination, update=1)
    else:
        ds = GetDriverByName(format_name).CreateDataSource(destination, options=create_options)
    pedice = "%s_%s_%s" % (foglio['CODICE COMUNE'], foglio['NUMERO FOGLIO'], foglio['CODICE SVILUPPO'])
    
    # tipo BORDO
    #bordi = ds.CreateLayer('CATASTO_BORDI', target_srs, wkbPolygon)
    nome_layer = "CATASTO_BORDI_%s" % (pedice)
    bordi = ds.CreateLayer(nome_layer, target_srs, wkbPolygon25D, papszOptions)

    bordi.CreateField(f_comune)
    bordi.CreateField(f_foglio)
    bordi.CreateField(f_tipo)
    bordi.CreateField(f_part)
    bordi.CreateField(f_dimensione)
    bordi.CreateField(f_angolo)
    bordi.CreateField(f_pos_x)
    bordi.CreateField(f_pos_y)
    bordi.CreateField(f_interno_x)
    bordi.CreateField(f_interno_y)
    bordi.CreateField(f_area)
    bordi.CreateField(f_etichetta)

    for oggetto in foglio['oggetti']['BORDO']:
        poly = Geometry(wkbPolygon)
        tabisole = map(int, oggetto['TABISOLE'])

        # contorno esterno
        vertici_contorno = int(oggetto['NUMEROVERTICI']) - sum(tabisole)
        ring = Geometry(wkbLinearRing)
        for vertice in range(vertici_contorno):
            x, y = map(float, oggetto['VERTICI'][vertice])
            if True:
                x, y = trasformation.TransformPoint(x, y)[:2]
            ring.AddPoint(x + shift_gauss_boaga[0], y + shift_gauss_boaga[1])
        ring.CloseRings()
        poly.AddGeometry(ring)

        # isole
        for isola in range(int(oggetto['NUMEROISOLE'])):
            ring = Geometry(wkbLinearRing)
            for vertice in range(vertice + 1, vertice + 1 + tabisole[isola]):
                x, y = map(float, oggetto['VERTICI'][vertice])
                if True:
                    x, y = trasformation.TransformPoint(x, y)[:2]
                ring.AddPoint(x + shift_gauss_boaga[0], y + shift_gauss_boaga[1])
            ring.CloseRings()
            poly.AddGeometry(ring)

        etichetta = oggetto['CODICE IDENTIFICATIVO']
        if oggetto['CODICE IDENTIFICATIVO'][-1] == '+':
            etichetta = ''

        feat = Feature(bordi.GetLayerDefn())
        feat.SetField('COMUNE', foglio['CODICE COMUNE'])
        #feat.SetField('FOGLIO', foglio['CODICE FOGLIO']) #lo voglio nel formato numerico e non "G087_003600"
        codice_foglioXX = foglio['CODICE FOGLIO'][5:9] #cosi' dovrebbe essere "0036"
        feat.SetField('FOGLIO', codice_foglioXX.lstrip('0'))
        feat.SetField('tipo', oggetto['tipo'])
        #feat.SetField('PARTICELLA', oggetto['CODICE IDENTIFICATIVO']) #voglio togliere il "+"
        feat.SetField('PARTICELLA', oggetto['CODICE IDENTIFICATIVO'].rstrip('+'))
        feat.SetField('DIMENSIONE', int(oggetto['DIMENSIONE']))
        feat.SetField('ANGOLO', float(oggetto['ANGOLO']))
        pos_x, pos_y = map(float, (oggetto['POSIZIONEX'], oggetto['POSIZIONEY']))
        interno_x, interno_y = map(float, (oggetto['PUNTOINTERNOX'],oggetto['PUNTOINTERNOY']))
        if True:
            pos_x, pos_y = trasformation.TransformPoint(pos_x, pos_y)[:2]
            interno_x, interno_y = trasformation.TransformPoint(interno_x, interno_y)[:2]
        feat.SetField('POSIZIONEX', pos_x + shift_gauss_boaga[0])
        feat.SetField('POSIZIONEY', pos_y + shift_gauss_boaga[1])
        feat.SetField('P_INTERNOX', interno_x + shift_gauss_boaga[0])
        feat.SetField('P_INTERNOY', interno_y + shift_gauss_boaga[1])
        feat.SetField('AREA', oggetto.get('AREA', -1))
        feat.SetField('etichetta', etichetta)
        feat.SetGeometry(poly)
        bordi.CreateFeature(feat)
        feat.Destroy()

    if point_borders:
        # tipo BORDO_PUNTO
        #bordi = ds.CreateLayer('CATASTO_PARTICELLE', target_srs, wkbPoint)
        nome_layer = "CATASTO_PARTICELLE_%s" % (pedice)
        bordi = ds.CreateLayer(nome_layer, target_srs, wkbPoint, papszOptions)

        bordi.CreateField(f_comune)
        bordi.CreateField(f_foglio)
        bordi.CreateField(f_tipo)
        bordi.CreateField(f_part)
        bordi.CreateField(f_dimensione)
        bordi.CreateField(f_angolo)
        bordi.CreateField(f_area)
        bordi.CreateField(f_etichetta)

        for oggetto in foglio['oggetti']['BORDO']:
            etichetta = oggetto['CODICE IDENTIFICATIVO']
            if oggetto['CODICE IDENTIFICATIVO'][-1] == '+':
                etichetta = ''

            feat = Feature(bordi.GetLayerDefn())
            feat.SetField('COMUNE', foglio['CODICE COMUNE'])
            feat.SetField('FOGLIO', foglio['CODICE FOGLIO'])
            feat.SetField('tipo', oggetto['tipo'])
            feat.SetField('PARTICELLA', oggetto['CODICE IDENTIFICATIVO'])
            feat.SetField('DIMENSIONE', int(oggetto['DIMENSIONE']))
            feat.SetField('ANGOLO', float(oggetto['ANGOLO']))
            pos_x, pos_y = map(float, (oggetto['PUNTOINTERNOX'],oggetto['PUNTOINTERNOY']))
            if True:
                pos_x, pos_y = trasformation.TransformPoint(pos_x, pos_y)[:2]
            feat.SetField('AREA', oggetto.get('AREA', -1))
            feat.SetField('etichetta', etichetta)
            pt = Geometry(wkbPoint)
            pt.SetPoint_2D(0, pos_x + shift_gauss_boaga[0], pos_y + shift_gauss_boaga[1])
            feat.SetGeometry(pt)
            bordi.CreateFeature(feat)
            feat.Destroy()


    # tipo TESTO
    #testi = ds.CreateLayer('CATASTO_TESTI', target_srs, wkbPoint)
    nome_layer = "CATASTO_TESTI_%s" % (pedice)
    testi = ds.CreateLayer(nome_layer, target_srs, wkbPoint, papszOptions)

    testi.CreateField(f_comune)
    testi.CreateField(f_foglio)
    testi.CreateField(f_testo)
    testi.CreateField(f_dimensione)
    testi.CreateField(f_angolo)
    testi.CreateField(f_etichetta)

    for oggetto in foglio['oggetti']['TESTO']:
        x, y = map(float, (oggetto['POSIZIONEX'], oggetto['POSIZIONEY']))
        if True:
            x, y = trasformation.TransformPoint(x, y)[:2]
        # FIXME: many texts are useless, prun them from etichetta
        etichetta = remove_accents(oggetto['TESTO'])
        
        feat = Feature(testi.GetLayerDefn())
        feat.SetField('COMUNE', foglio['CODICE COMUNE'])
        feat.SetField('FOGLIO', foglio['CODICE FOGLIO'])
        #feat.SetField('TESTO', oggetto['TESTO'])
        feat.SetField('TESTO', etichetta)
        feat.SetField('DIMENSIONE', int(oggetto['DIMENSIONE']))
        feat.SetField('ANGOLO', float(oggetto['ANGOLO']))
        feat.SetField('etichetta', etichetta)
        pt = Geometry(wkbPoint)
        pt.SetPoint_2D(0, x + shift_gauss_boaga[0], y + shift_gauss_boaga[1])
        feat.SetGeometry(pt)
        testi.CreateFeature(feat)


    # tipo SIMBOLO
    #simboli = ds.CreateLayer('CATASTO_SIMBOLI', target_srs, wkbPoint)
    nome_layer = "CATASTO_SIMBOLI_%s" % (pedice)
    simboli = ds.CreateLayer(nome_layer, target_srs, wkbPoint, papszOptions)

    simboli.CreateField(f_comune)
    simboli.CreateField(f_foglio)
    simboli.CreateField(f_simbolo)
    simboli.CreateField(f_angolo)

    for oggetto in foglio['oggetti']['SIMBOLO']:
        x, y = map(float, (oggetto['POSIZIONEX'], oggetto['POSIZIONEY']))
        if True:
            x, y = trasformation.TransformPoint(x, y)[:2]
        
        feat = Feature(simboli.GetLayerDefn())
        feat.SetField('COMUNE', foglio['CODICE COMUNE'])
        feat.SetField('FOGLIO', foglio['CODICE FOGLIO'])
        feat.SetField('SIMBOLO', oggetto['CODICE SIMBOLO'])
        feat.SetField('ANGOLO', float(oggetto['ANGOLO']))
        pt = Geometry(wkbPoint)
        pt.SetPoint_2D(0, x + shift_gauss_boaga[0], y + shift_gauss_boaga[1])
        feat.SetGeometry(pt)
        simboli.CreateFeature(feat)


    # tipo FIDUCIALE
    #fiduciali = ds.CreateLayer('CATASTO_FIDUCIALI', target_srs, wkbPoint)
    nome_layer = "CATASTO_FIDUCIALI_%s" % (pedice)
    fiduciali = ds.CreateLayer(nome_layer, target_srs, wkbPoint, papszOptions)

    fiduciali.CreateField(f_comune)
    fiduciali.CreateField(f_foglio)
    fiduciali.CreateField(f_numero)
    fiduciali.CreateField(f_simbolo)
    fiduciali.CreateField(f_pos_x)
    fiduciali.CreateField(f_pos_y)
    fiduciali.CreateField(f_etichetta)

    print 'corrections', shift_cassini, shift_gauss_boaga
    for oggetto in foglio['oggetti']['FIDUCIALE']:
        x, y = map(float, (oggetto['POSIZIONEX'], oggetto['POSIZIONEY']))
        pos_x, pos_y = map(float, (oggetto['PUNTORAPPRESENTAZIONEX'], oggetto['PUNTORAPPRESENTAZIONEY']))
        if True:
            x, y = trasformation.TransformPoint(x, y)[:2]
            pos_x, pos_y = trasformation.TransformPoint(pos_x, pos_y)[:2]
        etichetta = 'PF%02d/%s%s/%s' % (int(oggetto['NUMERO IDENTIFICATIVO']),
            foglio['CODICE NUMERO FOGLIO'][1:], foglio['CODICE ALLEGATO'], foglio['CODICE COMUNE'])
        
        feat = Feature(fiduciali.GetLayerDefn())
        feat.SetField('COMUNE', foglio['CODICE COMUNE'])
        feat.SetField('FOGLIO', foglio['CODICE FOGLIO'])
        feat.SetField('NUMERO', oggetto['NUMERO IDENTIFICATIVO'])
        feat.SetField('SIMBOLO', oggetto['CODICE SIMBOLO'])
        feat.SetField('POSIZIONEX', pos_x + shift_gauss_boaga[0])
        feat.SetField('POSIZIONEY', pos_y + shift_gauss_boaga[1])
        feat.SetField('etichetta', etichetta)
        pt = Geometry(wkbPoint)
        pt.SetPoint_2D(0, x + shift_gauss_boaga[0], y + shift_gauss_boaga[1])
        feat.SetGeometry(pt)
        fiduciali.CreateFeature(feat)

        print etichetta, oggetto['CODICE SIMBOLO'], \
            float(oggetto['POSIZIONEX']) + shift_cassini[0], float(oggetto['POSIZIONEY']) + shift_cassini[1], \
            x + shift_gauss_boaga[0], y + shift_gauss_boaga[1]


    # tipo LINEA
    #linee = ds.CreateLayer('CATASTO_LINEE', target_srs, wkbLineString)
    nome_layer = "CATASTO_LINEE_%s" % (pedice)
    linee = ds.CreateLayer(nome_layer, target_srs, wkbLineString25D, papszOptions)

    linee.CreateField(f_comune)
    linee.CreateField(f_foglio)
    linee.CreateField(f_simbolo)

    for oggetto in foglio['oggetti']['LINEA']:
        # contorno esterno
        vertici = int(oggetto['NUMEROVERTICI'])
        linea = Geometry(wkbLineString)
        for vertice in range(vertici):
            x, y = map(float, oggetto['VERTICI'][vertice])
            if True:
                x, y = trasformation.TransformPoint(x, y)[:2]
            linea.AddPoint(x + shift_gauss_boaga[0], y + shift_gauss_boaga[1])

        feat = Feature(linee.GetLayerDefn())
        feat.SetField('COMUNE', foglio['CODICE COMUNE'])
        feat.SetField('FOGLIO', foglio['CODICE FOGLIO'])
        feat.SetField('SIMBOLO', oggetto['CODICE TIPO DI TRATTO'])
        feat.SetGeometry(linea)
        linee.CreateFeature(feat)
        feat.Destroy()
    
    ds.Destroy()
