/* TODO IR BORRANDO LOS QUE NO SE NECESITEN, EN TEORÍA ARCHIVO VACÍO Y BORRAR, NO SE USAN LAS DIMENSIONES COMO EN ANDROID. SE GUARDA DE MOMENTO POR TENER LA REFERENCIA
<?xml version="1.0" encoding="utf-8"?>
<resources>
<!--
Nota importante:
El recurso dimens.xml del directorio values (por defecto) y el del directorio sw600dp debe ser el mismo.
Se podría intentar crear un alias del fichero (no de cada recurso dimen), pero quizás no pueda ser posible.
-->

<dimen name="bordeCampoTextoCalculadora">1dip</dimen>
<dimen name="redondeoCampoTextoCalculadora">6dp</dimen>

<dimen name="marginLeftBotonesSeleccionUnidadesCalculadora">4dp</dimen>


<dimen name="bordeBotonCalcularCalculadora">2dip</dimen>
<dimen name="redondeoBotonCalcularCalculadora">6dp</dimen>
<dimen name="paddingBotonCalcularCalculadora">5dp</dimen>


<dimen name="margenBotonCancelarCapaMasInformacionCalculadora">12dp</dimen>


<dimen name="separacionBotonesLTcriteria">8dp</dimen>





<dimen name="marginTopListaElementosPantallasCalculadoraResumen">5dp</dimen>

<dimen name="anchuraMarcaInicioResumenDatosCalculadora">10dp</dimen>
<dimen name="alturaMarcaInicioResumenDatosCalculadora">22dp</dimen>
<dimen name="marginTopTextoResumenDatosCalculadora">1dp</dimen>
<dimen name="marginLeftTextoResumenDatosCalculadora">5dp</dimen>

<!--
<dimen name="anchoMaximoCapamasInformacionCalculadoraFull">750dp</dimen>
<dimen name="altoMaximoCapamasInformacionCalculadoraFull">500dp</dimen>
-->

<dimen name="paddingCapaOcultaMasInformacion">15dp</dimen>


<dimen name="paddingHorizontalCuadroResultadoCalculadoraParcial">20dp</dimen>
<dimen name="paddingVerticalCuadroResultadoCalculadoraParcial">40dp</dimen>



<!-- activity_main.xml -->
<dimen name="alturaCabeceraPantallaPrincipal">100dp</dimen>
<dimen name="alturaTituloAppCabeceraPantallaPrincipal">30dp</dimen>
<dimen name="tamanoLetraTextoTituloSmartphone">18sp</dimen>
<dimen name="margenSuperiorTituloAppCabeceraPantallaPrincipal">4dp</dimen>
<dimen name="anchuraLogoAppPantallaPrincipal">60dp</dimen>
<dimen name="alturaLogoAppPantallaPrincipal">@dimen/anchuraLogoAppPantallaPrincipal</dimen>


<!-- disposicion_cuadrada_modulos_home.xml -->
<dimen name="anchuraConjuntoModuloHome">100dp</dimen>
<dimen name="alturaConjuntoModuloHome">@dimen/anchuraConjuntoModuloHome</dimen>
<dimen name="margenInferiorTituloModuloHome">13dp</dimen>
<dimen name="tamanoLetraTextoHomeSmartphone">14sp</dimen>
<dimen name="cuadriculaSeparacionHorizontalModulo">25dp</dimen>


<!-- activity_actividad_comun.xml -->
<dimen name="alturaToolbar">56dp</dimen>
<dimen name="anchuraIconoToolbar">30dp</dimen>
<dimen name="alturaIconoToolbar">@dimen/anchuraIconoToolbar</dimen>
<dimen name="tamanoTextoAtrasToolbar">16sp</dimen>
<dimen name="anchuraBotonAtrasToolbar">67dp</dimen>
<dimen name="tamanoLetraTextoTituloToolbar">18sp</dimen>
<dimen name="separacionIconosToolbar">20dp</dimen>
<dimen name="separacionBotonIconoToolbarIzquierda">18dp</dimen>
<dimen name="anchuraBotonHomeToolbar">35dp</dimen>
<dimen name="anchuraBotonDerechaToolbar">40dp</dimen>
<dimen name="anchuraMenuLateralDesplegable">240dp</dimen>


<!-- disposicion_cuadrada_modulos.xml -->
<dimen name="anchuraConjuntoModulo">145dp</dimen>
<dimen name="alturaConjuntoModulo">@dimen/anchuraConjuntoModulo</dimen>
<dimen name="margenInferiorTituloModulo">38dp</dimen>
<dimen name="margenInferiorDescripcionModulo">4dp</dimen>
<dimen name="tamanoTextoAnimacionListaVacia">36sp</dimen>


<!-- activity_visualizador_recursos.xml -->
<dimen name="alturaBarraInferiorVisualizador">40dp</dimen>
<dimen name="anchuraIconoBarraInferiorVisualizador">40dp</dimen>
<dimen name="alturaIconoBarraInferiorVisualizador">@dimen/anchuraIconoBarraInferiorVisualizador</dimen>
<dimen name="separacionIconosContiguosBarraInferiorVisualizador">20dp</dimen>
<dimen name="separacionConjuntoIconosContiguosBarraInferiorVisualizador">200dp</dimen>
<dimen name="anchoMaximoBotonListaRecursosModuloOtraSeccion">130dp</dimen>
<dimen name="altoMaximoBotonListaRecursosModuloOtraSeccion">28dp</dimen>
<!-- Pendiente !! Saber cual es el tamaño por defecto para ponerlo si no estuviera especificada esta propiedad en el botón -->
<dimen name="tamTextoBotonListaRecursosModuloOtraSeccion">13sp</dimen>
<dimen name="paddingLateralBotonCargarListaRecursosModuloOtraSeccion">8dp</dimen>




<!-- disposicion_cuadricula_recursos_imagen.xml -->
<dimen name="anchoConjuntoRecursosImagen">195dp</dimen>
<!-- 195dp / (227dp / 170dp) = 195 * 170 / 227 -->
<dimen name="alturaMaximaImagenRecursoImagen">146.035dp</dimen>
<!-- alturaMaximaImagenRecursoImagen + 30dp -->
<dimen name="altoConjuntoRecursosImagen">176.036dp</dimen>
<dimen name="tamanoTextoTituloRecursoImagen">12sp</dimen>
<dimen name="grosorBordeRecursoImagen">2dp</dimen>
<!-- 3dp del margen deseado + @dimen/grosorBordeRecursoImagen -->
<dimen name="margenTituloRecursoImagen">3dp</dimen>


<!-- simple_list_item_hepapp.xml -->
<dimen name="tamanoTextoBarraLateralNavegacion">18sp</dimen>


<!-- controles_switch_recurso.xml -->
<dimen name="separacionHorizontalControlesSwitch">35dp</dimen>
<dimen name="anchoMinimoBarraAlpha">60dp</dimen>
<dimen name="anchoMaximoBarraAlpha">100dp</dimen>
<dimen name="marginTopBarraAlpha">7dp</dimen>


<!-- botones_interaccion_pintar.xml -->
<dimen name="separacionBotonesInteraccionPintar">25dp</dimen>
<dimen name="botonInteraccionPintar">50dp</dimen>
<dimen name="botonCircularBorde">4dip</dimen>
<dimen name="botonCircularPadding">4dp</dimen>
<!-- botonInteraccionPintar - (botonCircularBorde + botonCircularPadding) -->
<dimen name="botonInteraccionPintarNoPadding">42dp</dimen>
<dimen name="iconoBotonInteraccionPintar">25dp</dimen>
<dimen name="desplazamientoSombra">4dp</dimen>
<dimen name="redondeoBotonCircular">1000dp</dimen>


<!-- activity_visualizador_imagenes.xml -->
<!-- La anchura máxima será 534.117dp si la imagen se encontrada con el ratio de dimensiones correcto. -->
<dimen name="alturaMaximaRecursoImagenVisualizadorImagenes">400dp</dimen>
<dimen name="tamanoTextoRadioButtonControlesInteractivos">14sp</dimen>


<!-- disposicion_cuadricula_modulos_figuras.xml -->
<dimen name="margenInferiorTituloSubseccion">26dp</dimen>


<!-- calculadora_barra_inferior.xml -->
<dimen name="redondeoBotonBarraInferiorCalculadora">3dp</dimen>
<dimen name="paddingBotonBarraInferiorCalculadora">8dp</dimen>
<dimen name="alturaBotonBarraInferiorCalculadora">35dp</dimen>
<dimen name="tamanoTextoBotonBarraInferiorCalculadora">14sp</dimen>
<dimen name="separacionBotonesBarraInferiorCalculadora">20dp</dimen>


<!-- activity_full_calculator.xml -->
<dimen name="margenSuperiorBarraInferiorCalculadora">15dp</dimen>
<dimen name="margenInferiorBarraInferiorCalculadora">10dp</dimen>


<!-- calculadora_full_diagnostic.xml -->
<dimen name="marginTopListaElementosPantallasCalculadora">14dp</dimen>
<dimen name="anchuraMarcaInicioEntradaDatosCalculadora">15dp</dimen>
<dimen name="alturaMarcaInicioEntradaDatosCalculadora">30dp</dimen>
<dimen name="marginTopTextoEntradaDatosCalculadora">5dp</dimen>
<dimen name="marginLeftTextoEntradaDatosCalculadora">10dp</dimen>
<dimen name="tamanoTextoCalculadoraSmartphone">12sp</dimen>
<dimen name="anchuraBotonCalculadora">60dp</dimen>
<dimen name="alturaBotonCalculadora">22dp</dimen>
<dimen name="tamanoTextoBotonSeleccionSiNoCalculadora">12sp</dimen>
<dimen name="anchoCamposTextoCalculadoras">45dp</dimen>
<dimen name="altoCamposTextoCalculadoras">22dp</dimen>
<dimen name="tamanoTextoBackgroundCalculadoraSmartphone">30sp</dimen>


<!-- calculadora_full_cuestionesclinicas.xml -->
<dimen name="anchuraBotonCalculadoraTexto">80dp</dimen>


<!-- calculadora_parcial_cps.xml -->
<dimen name="anchoBotonCalcularCalculadoraParcial">145dp</dimen>
<dimen name="altoBotonCalcularCalculadoraParcial">45dp</dimen>
<dimen name="margenIzquierdaBotonCalcularCalculadoraParcial">85dp</dimen>
<dimen name="margenAbajoCalcularCalculadoraParcial">50dp</dimen>


<!-- calculadora_full_ajustes.xml -->
<dimen name="paddingCapaMasInformacionCalculadora">40dp</dimen>


<!-- calculadora_full_resultados.xml -->
<dimen name="separacionLateralesTablasResultadosCalculadora">200dp</dimen>
<dimen name="anchoTablaResultadosCalculadora">220dp</dimen>
<dimen name="tamanoTextoCabeceraTablaResultadosCalculadora">14sp</dimen>
<dimen name="margenIzquierdaTextoEtiquetaResultadoCalculadora">15dp</dimen>
<dimen name="margenIzquierdaTextoResultadoCalculadora">5dp</dimen>
<dimen name="margenArribaConjuntoResultadoCalculadora">10dp</dimen>
<dimen name="alturaMarcaInicioTratamientosCalculadora">80dp</dimen>
<dimen name="margenArribaConjuntoTratamientosCalculadora">5dp</dimen>
<dimen name="tamanoTextoCirculoTratamientoCalculadora">12sp</dimen>
<dimen name="margenIzqConjuntoTratamientosCalculadora">10dp</dimen>
<dimen name="anchoBotonMasInfoResultadosCalculadora">130dp</dimen>
<dimen name="altoBotonMasInfoResultadosCalculadora">40dp</dimen>
<dimen name="margenBotonMasInfoResultadoscalculadora">60dp</dimen>
<dimen name="margenInferiorParteInferiorResultadosCalculadora">8dp</dimen>
<dimen name="margenSuperiorEtiquetaTipoPantallaResultadosCalculadora">50dp</dimen>
<dimen name="margenInferiorBotonEsquemaAlbertaCalculadora">55dp</dimen>
<dimen name="margenDerechoBotonEsquemaAlbertaCalculadora">220dp</dimen>
<dimen name="anchoBotonEsquemaAlbertaCalculadora">160dp</dimen>
<dimen name="altoBotonEsquemaAlbertaCalculadora">40dp</dimen>
<dimen name="tamanoTextoCalculadorasGreenSmartphone">12sp</dimen>


<!-- calculadora_full_resumen_resultados.xml -->
<dimen name="anchoColumnaDiagnosticoResumenResultadosCalculadora">320dp</dimen>
<dimen name="anchoColumnaLaboratorioResumenResultadosCalculadora">250dp</dimen>
<dimen name="anchoColumnaCuestionesResumenResultadosCalculadora">280dp</dimen>
<dimen name="tamanoTextoEtiquetaResumenEntradaDatoCalculadora">10sp</dimen>
<dimen name="tamanoTextoValorResumenEntradaDatoCalculadora">11sp</dimen>
<dimen name="margenIzquierdaSubcolumnaDiagnosticResumenCalculadora">40dp</dimen>
<dimen name="tamanoTextoCabeceraColumnaResumenCalculadora">14sp</dimen>
<dimen name="margenSupSeparadorColumnaResumenCalculadora">30dp</dimen>


<!-- Todos los layout de las calculadoras con campos de texto EditText -->
<dimen name="paddingLateralCamposTextoCalculadoras">3dp</dimen>


<!-- disposicion_cuadricula_modulos.xml y disposicion_cuadricula_recursos_imagen.xml -->
<dimen name="margenBordeInferiorControlesPaginaListado">17dp</dimen>
<dimen name="anchuraControlesPaginaListado">@dimen/anchuraIconoToolbar</dimen>
<dimen name="alturaControlesPaginaListado">@dimen/anchuraControlesPaginaListado</dimen>
<dimen name="separacionHorizontalElementoListado">25dp</dimen>
<dimen name="separacionVerticalElementoListado">20dp</dimen>

</resources>*/
