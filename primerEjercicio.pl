% Atractivos
atractivo(cusco, machu_picchu).
atractivo(cusco, plaza_de_armas_cusco).
atractivo(cusco, saksaywaman).
atractivo(cusco, valle_sagrado).
atractivo(cusco, qorikancha).
atractivo(cusco, mercado_artesanal).
atractivo(cusco, montania_de_siete_colores).
atractivo(cusco, mirador_de_san_cristobal).
atractivo(arequipa, monasterio_de_santa_catalina).
atractivo(arequipa, canion_del_colca).
atractivo(arequipa, plaza_de_armas_arequipa).
atractivo(arequipa, museo_santuarios_andinos).
atractivo(arequipa, mirador_yanahuara).
atractivo(arequipa, mercado_san_camilo).
atractivo(arequipa, mirador_de_la_colina).
atractivo(arequipa, volcan_misti).
atractivo(loreto, reserva_nacional_pacaya_samiria).
atractivo(loreto, mercado_de_belen).
atractivo(loreto, mirador_de_belen).
atractivo(loreto, laguna_el_dorado).
atractivo(loreto, rio_amazonas).
atractivo(loreto, catedral_de_iquitos).
atractivo(loreto, boulevard_iquitos).


% Preferencias
preferencia(naturaleza, canion_del_colca).
preferencia(naturaleza, reserva_nacional_pacaya_samiria).
preferencia(naturaleza, rio_amazonas).
preferencia(naturaleza, valle_sagrado).
preferencia(cultura, machu_picchu).
preferencia(cultura, plaza_de_armas_cusco).
preferencia(cultura, saksaywaman).
preferencia(cultura, qorikancha).
preferencia(cultura, monasterio_de_santa_catalina).
preferencia(cultura, plaza_de_armas_arequipa).
preferencia(cultura, museo_santuarios_andinos).
preferencia(cultura, mirador_yanahuara).
preferencia(cultura, catedral_de_iquitos).
preferencia(compras, mercado_de_belen).
preferencia(compras, mercado_artesanal).
preferencia(compras, mercado_san_camilo).
preferencia(compras, boulevard_iquitos).
preferencia(vistas, montania_de_siete_colores).
preferencia(vistas, mirador_de_la_colina).
preferencia(vistas, laguna_el_dorado).
preferencia(vistas, mirador_de_san_cristobal).
preferencia(vistas, volcan_misti).
preferencia(vistas, mirador_de_belen).


% Descripciones
descr(machu_picchu, 'Antigua ciudad inca en lo alto de los Andes, famosa por su arquitectura y paisajes impresionantes.').
descr(plaza_de_armas_cusco, 'Centro historico de la ciudad de Cusco, rodeada de edificaciones coloniales y vistas panoramicas.').
descr(saksaywaman, 'Antigua fortaleza inca en las afueras de Cusco, conocida por sus imponentes muros de piedra y vistas.').
descr(valle_sagrado, 'Hermoso valle en los Andes peruanos, conocido por sus paisajes naturales, pueblos pintorescos y sitios arqueologicos.').
descr(qorikancha, 'Templo inca dedicado al culto al sol, famoso por su impresionante arquitectura y jardines.').
descr(mercado_artesanal, 'Mercado local en Cusco donde se pueden encontrar una amplia variedad de artesanias y productos locales.').
descr(montania_de_siete_colores, 'Montaña conocida por sus impresionantes colores, resultado de diversos minerales presentes en la zona.').
descr(mirador_de_san_cristobal, 'Mirador con vistas panoramicas de la ciudad de Cusco y los alrededores, especialmente impresionante al atardecer.').
descr(monasterio_de_santa_catalina, 'Antiguo monasterio en Arequipa, conocido por su impresionante arquitectura y coloridos patios.').
descr(canion_del_colca, 'Uno de los cañones mas profundos del mundo, hogar de impresionantes paisajes y del majestuoso condor.').
descr(plaza_de_armas_arequipa, 'Centro historico de Arequipa, rodeado de edificaciones coloniales y vistas a la catedral.').
descr(museo_santuarios_andinos, 'Museo en Arequipa que alberga a la momia de Juanita, una niña inca sacrificada hace mas de 500 años.').
descr(mirador_yanahuara, 'Mirador en Yanahuara que ofrece vistas panoramicas de Arequipa y del Volcan Misti.').
descr(mercado_san_camilo, 'Mercado tradicional en Arequipa donde se pueden encontrar productos frescos y artesanías locales.').
descr(mirador_de_la_colina, 'Mirador en Arequipa que ofrece vistas panoramicas de la ciudad y de los volcanes circundantes.').
descr(volcan_misti, 'Volcan inactivo cerca de Arequipa, popular entre los excursionistas por sus impresionantes vistas desde la cumbre.').
descr(reserva_nacional_pacaya_samiria, 'La reserva natural mas grande de Peru, conocida por su diversidad de vida silvestre y ecosistemas acuaticos.').
descr(mercado_de_belen, 'Mercado en Iquitos que ofrece una amplia variedad de productos locales, incluyendo productos de la selva y artesanias.').
descr(mirador_de_belen, 'Mirador en Iquitos con vistas panoramicas del río Amazonas y la ciudad de Iquitos.').
descr(laguna_el_dorado, 'Hermosa laguna en la region de Loreto, rodeada de exuberante vegetacion y con oportunidades para observar aves y vida silvestre.').
descr(rio_amazonas, 'El rio mas largo y caudaloso del mundo, que atraviesa la region de Loreto y ofrece oportunidades para explorar la selva.').
descr(catedral_de_iquitos, 'Impresionante catedral en Iquitos, conocida por su arquitectura de estilo neogotico y detalles ornamentales.').
descr(boulevard_iquitos, 'Boulevard en Iquitos lleno de tiendas, restaurantes y actividad cultural, perfecto para pasear y disfrutar del ambiente.').


% Reglas de inferencia
recomendar_destino(Actividad) :-
    findall(Lugar, (preferencia(Actividad, Lugar), atractivo(_, Lugar)), Atractivos),
    random_member(Recomendacion, Atractivos),
    atractivo(Ciudad, Recomendacion),
    descr(Recomendacion, Descripcion),
    write('Recomiendo visitar el siguiente atractivo en '), write(Ciudad), write(': '), write(Recomendacion), nl,
    write('Descripcion: '), write(Descripcion), nl, nl.

% Consulta de usuario
preguntar_actividad :-
    write('¿Que tipo de actividad prefieres (cultura/naturaleza/compras/vistas)? '), 
    read(Actividad),
    recomendar_destino(Actividad),
    preguntar_continuar.

preguntar_continuar :-
    write('¿Deseas recibir otra recomendación? (si/no) '),
    read(Respuesta),
    (Respuesta = 'si' -> preguntar_actividad; true).

:- preguntar_actividad.
