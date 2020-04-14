import 'dart:async';

import 'package:hepapp/forms/CPSdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  //Instancia singleton, solo una instancia de Preferencias usuario
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario() => _instancia;

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  bool _iUnitsPrueba;
  StreamController _streamController2 = new StreamController<bool>();

  Stream<bool> get iUnitsUpdates => _streamController2.stream;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  void switchInternationalUnits() {
    print("iunitsprueba " + _iUnitsPrueba.toString());
    _iUnitsPrueba = !_iUnitsPrueba;
    print("iunitsprueba despues" + _iUnitsPrueba.toString());
    _streamController2.add(_iUnitsPrueba);
  }

  void setIUnitsPrueba(bool value) {
    _iUnitsPrueba = value;
    _streamController2.add(_iUnitsPrueba);
  }

  bool getIunitsPrueba() {
    return _iUnitsPrueba;
  }

  ///GETS Y SETS DE HEPAPP

  //Get y set de las unidades internacionales
  /*get internationalUnits {
    return _prefs.getBool('internationalUnits'); // ?? false;
  }

  set internationalUnits(bool value) {
    _prefs.setBool('internationalUnits', value);
  }*/

  /// GETS Y SETS ANTERIORES
  ///

  get datosCPSantiguo {
    return _prefs.get(datosCPSantiguo);
  }

  set datosCPSantiguo(CPSdata antiguo) {
    _prefs.setDouble('bilirubin', antiguo.bilirubin);
  }

  get bilirubin {
    return _prefs.getDouble('bilirubin');
  }

  set bilirubin(double value) {
    _prefs.setDouble('bilirubin', value);
    /*_prefs.setDouble('bilirubin', mapaCPS['bilirubin']);
    _prefs.setDouble('inr', mapaCPS['bilirubin']);
    _prefs.setDouble('albumin', mapaCPS['albumin']);
    _prefs.setString('encephalopaty', mapaCPS['encephalopaty']);
    _prefs.setString('ascites', mapaCPS['ascites']);*/
  }

  // GET y SET del Genero
  get genero {
    return _prefs.getInt('genero') ?? 1; // ?? Validación: por defecto 1
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  // GET y SET del _colorSecundario
  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  // GET y SET del nombreUsuario
  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  // GET y SET de la última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? '/';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
