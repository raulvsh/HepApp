//TODO IMPORTAR COLORES, añadir desde ahi

/*
<resources>
<style name="AppTheme" parent="Theme.AppCompat.Light.NoActionBar">
<item name="colorPrimary">@color/colorPrimary</item>
<item name="colorPrimaryDark">@color/colorPrimaryDark</item>
<item name="colorAccent">@color/buttonDialogo</item>
<!--<item name="android:gravity">center_horizontal</item>-->
<item name="android:fontFamily">HelveticaNeue</item>
<item name="android:windowBackground">@color/colorBackground</item>

</style>

<style name="textHomeSmartphone" parent="@style/AppTheme">
<item name="android:textSize">@dimen/tamanoLetraTextoHomeSmartphone</item>
<item name="android:textColor">@color/colorButtons</item>
<item name="android:textStyle">normal|bold</item>

</style>

<style name="textTitleSmartphone" parent="@style/AppTheme">
<item name="android:textColor">@color/colorToolbar</item>
<item name="android:textSize">@dimen/tamanoLetraTextoTituloSmartphone</item>
<item name="android:textStyle">normal|bold</item>
</style>

<style name="InfoSmartphone" parent="@style/AppTheme">
<item name="android:textSize">8sp</item>
<item name="android:textColor">@color/colorInfo</item>
</style>

<style name="TextCalculatorsSmartphone" parent="@style/AppTheme">
<item name="android:textSize">@dimen/tamanoTextoCalculadoraSmartphone</item>
<item name="android:textColor">@color/colorInfo</item>
</style>

<style name="TextCalculatorsGreenSmartphone" parent="@style/AppTheme">
<item name="android:textSize">@dimen/tamanoTextoCalculadorasGreenSmartphone</item>
<item name="android:textColor">@color/colorButtons</item>
</style>

<style name="BackgroundCalculatorsSmartphone" parent="@style/AppTheme">
<item name="android:textSize">@dimen/tamanoTextoBackgroundCalculadoraSmartphone</item>
<item name="android:textStyle">bold</item>
<item name="android:textColor">@color/initCalculator</item>
<item name="android:gravity">right</item>
</style>

<style name="TextInfoCalculatorsSmartphone" parent="@style/AppTheme">
<item name="android:textSize">14sp</item>
<item name="android:textColor">@color/colorInfo</item>
<item name="android:gravity">left</item>
</style>


<style name="conjuntoModulo">
<item name="android:layout_width">@dimen/anchuraConjuntoModulo</item>
<item name="android:layout_height">@dimen/alturaConjuntoModulo</item>
</style>

<style name="conjuntoModuloHome">
<item name="android:layout_width">@dimen/anchuraConjuntoModuloHome</item>
<item name="android:layout_height">@dimen/alturaConjuntoModuloHome</item>
</style>

<style name="conjuntoRecursosImagen">
<item name="android:layout_width">@dimen/anchoConjuntoRecursosImagen</item>
<item name="android:layout_height">@dimen/altoConjuntoRecursosImagen</item>
</style>

<style name="separacionHorizontalElementoListado">
<item name="android:layout_width">@dimen/separacionHorizontalElementoListado</item>
</style>

<style name="separacionVerticalElementoListado">
<item name="android:layout_height">@dimen/separacionVerticalElementoListado</item>
</style>

<style name="imagenModulo" parent="conjuntoModulo">
<item name="android:adjustViewBounds">false</item>
<item name="android:cropToPadding">false</item>
<item name="android:padding">1dp</item>
<item name="android:scaleType">centerCrop</item>
<item name="android:layout_centerHorizontal">true</item>
</style>

<style name="imagenModuloHome" parent="conjuntoModuloHome">
<item name="android:adjustViewBounds">false</item>
<item name="android:cropToPadding">false</item>
<item name="android:padding">1dp</item>
<item name="android:scaleType">centerCrop</item>
</style>

<style name="imagenRecursoImagen">
<item name="android:layout_width">wrap_content</item>
<item name="android:layout_height">wrap_content</item>
<item name="android:maxHeight">@dimen/alturaMaximaImagenRecursoImagen</item>
<item name="android:adjustViewBounds">true</item>
<item name="android:layout_centerHorizontal">true</item>
<item name="android:layout_alignParentTop">true</item>
<item name="android:layout_marginBottom">0dp</item>
<item name="android:layout_margin">@dimen/grosorBordeRecursoImagen</item>
</style>

<style name="botonModulo" parent="imagenModulo">
<item name="android:background">@drawable/button_pressed</item>
</style>

<style name="botonModuloHome" parent="imagenModuloHome">
<item name="android:background">@drawable/button_pressed</item>
</style>

<style name="botonRecursoImagen">
<item name="android:layout_width">match_parent</item>
<item name="android:layout_height">match_parent</item>
<item name="android:layout_alignParentStart">true</item>
<item name="android:layout_alignParentTop">true</item>
<item name="android:background">@drawable/borde_cuadricula_recursos_imagen</item>
</style>

<style name="tituloModulo" parent="textHomeSmartphone">
<item name="android:layout_width">match_parent</item>
<item name="android:layout_height">wrap_content</item>
<item name="android:gravity">center_horizontal</item>
<item name="android:layout_marginLeft">3dp</item>
<item name="android:layout_marginRight">3dp</item>
<item name="android:layout_marginBottom">@dimen/margenInferiorTituloModulo</item>
</style>

<style name="tituloModuloHome" parent="tituloModulo">
<item name="android:layout_marginBottom">@dimen/margenInferiorTituloModuloHome</item>
</style>

<style name="tituloRecursoImagen" parent="TextInfoCalculatorsSmartphone">
<item name="android:layout_width">match_parent</item>
<item name="android:layout_height">wrap_content</item>
<item name="android:gravity">center_horizontal</item>
<item name="android:layout_alignParentBottom">true</item>
<item name="android:layout_centerHorizontal">true</item>
<item name="android:layout_margin">@dimen/margenTituloRecursoImagen</item>
<item name="android:layout_marginTop">0dp</item>
<item name="android:textSize">@dimen/tamanoTextoTituloRecursoImagen</item>
</style>

<style name="descripcionModulo" parent="InfoSmartphone">
<item name="android:layout_width">match_parent</item>
<item name="android:layout_height">wrap_content</item>
<item name="android:gravity">center_horizontal</item>
<item name="android:layout_marginLeft">3dp</item>
<item name="android:layout_marginRight">3dp</item>
<item name="android:layout_marginBottom">@dimen/margenInferiorDescripcionModulo</item>
</style>

<style name="vistaInteraccionPintar">
<item name="android:layout_width">wrap_content</item>
<item name="android:layout_height">wrap_content</item>
<item name="android:layout_centerHorizontal">true</item>
<item name="android:layout_centerVertical">true</item>
</style>

<style name="recursoImagenVisualizador">
<item name="android:layout_width">wrap_content</item>
<item name="android:layout_height">wrap_content</item>
<item name="android:maxHeight">@dimen/alturaMaximaRecursoImagenVisualizadorImagenes</item>
<item name="android:layout_centerInParent">true</item>
<item name="android:adjustViewBounds">true</item>
</style>




<style name="conjuntoBotonesInteraccionPintar">
<item name="android:layout_width">wrap_content</item>
<item name="android:layout_height">wrap_content</item>
<item name="android:layout_alignParentTop">true</item>
<item name="android:layout_alignParentRight">true</item>
<item name="android:layout_marginTop">@dimen/separacionBotonesInteraccionPintar</item>
<item name="android:layout_marginRight">@dimen/separacionBotonesInteraccionPintar</item>
<item name="android:orientation">vertical</item>
<item name="android:visibility">invisible</item>
</style>

<style name="botonInteraccionPintar">
<item name="android:layout_width">@dimen/botonInteraccionPintar</item>
<item name="android:layout_height">@dimen/botonInteraccionPintar</item>
</style>



<style name="conjuntoControlesSwitch">
<item name="android:layout_width">wrap_content</item>
<item name="android:layout_height">wrap_content</item>
<item name="android:orientation">horizontal</item>
<item name="android:layout_centerHorizontal">true</item>
<item name="android:layout_alignParentBottom">true</item>
<item name="android:visibility">invisible</item>
</style>

<style name="grupoControlesSwitch">
<item name="android:layout_width">wrap_content</item>
<item name="android:layout_height">wrap_content</item>
<item name="android:orientation">horizontal</item>
</style>

<style name="conjuntoControlSwitch">
<item name="android:layout_width">wrap_content</item>
<item name="android:layout_height">wrap_content</item>
</style>

<style name="controlInteraccionSwitch">
<item name="android:layout_width">wrap_content</item>
<item name="android:layout_height">wrap_content</item>
<item name="android:textSize">@dimen/tamanoTextoRadioButtonControlesInteractivos</item>
</style>

<style name="separacionHorizontalControlesSwitch">
<item name="android:layout_width">@dimen/separacionHorizontalControlesSwitch</item>
</style>




<style name="matchParent">
<item name="android:layout_width">match_parent</item>
<item name="android:layout_height">match_parent</item>
</style>

<style name="matchParentHorizontal" parent="matchParent">
<item name="android:orientation">horizontal</item>
</style>

<style name="marcaInicioEntradaDatosCalculadora">
<item name="android:layout_width">@dimen/anchuraMarcaInicioEntradaDatosCalculadora</item>
<item name="android:layout_height">@dimen/alturaMarcaInicioEntradaDatosCalculadora</item>
<item name="android:background">@color/initCalculator</item>
</style>




<style name="alineacionElementosEntradaDatosCalculadora" parent="TextCalculatorsSmartphone">
<item name="android:layout_marginTop">@dimen/marginTopTextoEntradaDatosCalculadora</item>
<item name="android:layout_marginStart">@dimen/marginLeftTextoEntradaDatosCalculadora</item>
<item name="android:layout_width">@dimen/anchoCamposTextoCalculadoras</item>
<item name="android:layout_height">@dimen/altoCamposTextoCalculadoras</item>
</style>

<style name="campoTextoEntradaDatosCalculadora" parent="alineacionElementosEntradaDatosCalculadora">
<item name="android:paddingStart">@dimen/paddingLateralCamposTextoCalculadoras</item>
<item name="android:paddingEnd">@dimen/paddingLateralCamposTextoCalculadoras</item>
<item name="android:background">@drawable/estilo_campo_texto_calculadora</item>
<item name="android:inputType">numberDecimal</item>

<item name="android:imeOptions">flagNoExtractUi|flagNavigateNext</item>
</style>


<style name="botonSeleccionAjustesCalculadora" parent="TextCalculatorsSmartphone">
<item name="android:layout_width">42dp</item>
<item name="android:layout_height">22dp</item>

<!-- Personalización botón -->
<item name="android:textColor">@color/botonradio_calculadora_selector_colortexto</item>
<item name="android:button">@android:color/transparent</item>
<item name="android:gravity">center</item>

<item name="android:padding">3dp</item>
</style>

<style name="botonSeleccionUnidadesCalculadoraIzq" parent="botonSeleccionAjustesCalculadora">
<!-- Personalización botón -->
<item name="android:background">@drawable/botonradio_izq_ajustes_calculadora_selector_aspecto</item>
</style>

<style name="botonSeleccionUnidadesCalculadoraDrch" parent="botonSeleccionAjustesCalculadora">
<!-- Personalización botón -->
<item name="android:background">@drawable/botonradio_drch_ajustes_calculadora_selector_aspecto</item>
</style>

<style name="botonCalcularCalculadora" parent="TextCalculatorsSmartphone">
<item name="android:padding">@dimen/paddingBotonCalcularCalculadora</item>
<item name="android:textColor">@color/colorToolbar</item>
<item name="android:background">@drawable/boton_calcular_calculadora</item>
</style>

<style name="botonBarraInferiorCalculadora" parent="TextCalculatorsSmartphone">
<item name="android:layout_width">wrap_content</item>
<item name="android:layout_height">@dimen/alturaBotonBarraInferiorCalculadora</item>
<item name="android:padding">@dimen/paddingBotonBarraInferiorCalculadora</item>
<item name="android:background">@drawable/boton_barra_inferior_calculadora</item>
<item name="android:textSize">@dimen/tamanoTextoBotonBarraInferiorCalculadora</item>
</style>

<style name="botonSeleccionDatosCalculadora" parent="TextCalculatorsGreenSmartphone">
<item name="android:layout_marginStart">@dimen/marginLeftTextoEntradaDatosCalculadora</item>

<!-- Personalización botón -->
<item name="android:background">@drawable/botonradio_calculadora_selector_aspecto</item>
<item name="android:textColor">@color/botonradio_calculadora_selector_colortexto</item>
<item name="android:button">@android:color/transparent</item>
<item name="android:gravity">center</item>

<item name="android:padding">3dp</item>
</style>

<style name="botonSeleccionCalculadora" parent="botonSeleccionDatosCalculadora">
<item name="android:layout_marginTop">@dimen/marginTopTextoEntradaDatosCalculadora</item>
<item name="android:textSize">@dimen/tamanoTextoBotonSeleccionSiNoCalculadora</item>
<item name="android:layout_width">@dimen/anchuraBotonCalculadora</item>
<item name="android:layout_height">@dimen/alturaBotonCalculadora</item>
</style>

<style name="barraLateralNavegacion" parent="@style/AppTheme">
<item name="android:background">@color/drawer</item>
<item name="android:textStyle">normal|bold</item>
<item name="android:dividerHeight">1dp</item>
<item name="android:divider">@color/colorToolbar</item>
</style>

<style name="textosResultadoCalculadora" parent="TextCalculatorsGreenSmartphone">
<item name="android:layout_width">wrap_content</item>
<item name="android:layout_height">wrap_content</item>
<item name="android:layout_marginStart">@dimen/margenIzquierdaTextoResultadoCalculadora</item>
</style>



<style name="marcaInicioResumenDatosCalculadora">
<item name="android:layout_width">@dimen/anchuraMarcaInicioResumenDatosCalculadora</item>
<item name="android:layout_height">@dimen/alturaMarcaInicioResumenDatosCalculadora</item>
<item name="android:background">@color/initCalculator</item>
</style>
<style name="alineacionElementosResumenDatosCalculadora" parent="TextCalculatorsSmartphone">
<item name="android:layout_marginTop">@dimen/marginTopTextoResumenDatosCalculadora</item>
<item name="android:layout_marginStart">@dimen/marginLeftTextoResumenDatosCalculadora</item>
<item name="android:textSize">@dimen/tamanoTextoEtiquetaResumenEntradaDatoCalculadora</item>
</style>

<style name="textosResumenCalculadora" parent="textosResultadoCalculadora">
<item name="android:layout_marginStart">@dimen/marginLeftTextoResumenDatosCalculadora</item>
<item name="android:textSize">@dimen/tamanoTextoValorResumenEntradaDatoCalculadora</item>
<item name="android:layout_marginTop">@dimen/marginTopTextoResumenDatosCalculadora</item>
</style>


<style name="imagenCalculadora" parent="imagenModulo">
<item name="android:src">@drawable/calc</item>
</style>
<style name="tituloCalculadora" parent="tituloModulo">
<item name="android:layout_marginBottom">13dp</item>
</style>

<style name="tituloSubseccion" parent="tituloModulo">
<item name="android:layout_marginBottom">@dimen/margenInferiorTituloSubseccion</item>
</style>

</resources>
*/
