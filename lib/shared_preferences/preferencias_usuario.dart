import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  //Instancia singleton, solo una instancia de Preferencias usuario
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario() => _instancia;

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  bool _internationalUnits;
  StreamController _streamController = StreamController<bool>.broadcast();

  Stream<bool> get iUnitsUpdates =>
      _streamController.stream;

  //List<bool> errorList = [false, false, false, false, false, false, false, false];// = [];
  bool _error;
  StreamController _streamController2 = StreamController<bool>.broadcast();

  Stream<bool> get errorUpdates =>
      _streamController2.stream;

  List<bool> _errorList = [];
  StreamController _streamController4 = StreamController<
      List<bool>>.broadcast();

  Stream<List<bool>> get errorListUpdates =>
      _streamController4.stream;

  /*int _numErrors=0;
  StreamController _streamController3 = StreamController<int>.broadcast();

  Stream<int> get numErrorUpdates =>
  _streamController3.stream;*/

  //List<bool> errorList = [false, false, false, false, false, false, false, false];// = [];

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  void switchInternationalUnits() {
    print("iunitsprueba " + _internationalUnits.toString());
    _internationalUnits = !_internationalUnits;
    print("iunitsprueba despues" + _internationalUnits.toString());
    _streamController.add(_internationalUnits);
  }

  void setInternationalUnits(bool value) {
    _internationalUnits = value;
    _streamController.add(_internationalUnits);
  }

  bool getInternationalUnits() {
    return _internationalUnits;
  }

  void setError(bool value) {
    _error = value;
    _streamController2.add(_error);
  }

  bool getError() {
    return _error;
  }

  void setErrorList(int index, bool value) {
    _errorList[index] = value;
    _streamController4.add(_errorList);
  }

  List<bool> getErrorList() {
    return _errorList;
  }

  void initErrorList(int length) {
    _errorList = [];
    for (int i = 0; i < length; i++) {
      _errorList.add(true);
    }
  }

  bool isError() {
    for (int i = 0; i < _errorList.length; i++) {
      if (_errorList[i] == true) {
        return true;
      }
    }
    return false;
  }
/* void incrementNumErrors(){
    _numErrors++;
    _streamController3.add(_numErrors);
  }

  void decrementNumErrors(){
    _numErrors--;
    _streamController3.add(_numErrors);
  }

  int getNumErrors() {
    return _numErrors;
  }

  void setNumErrors(int i) {
    _numErrors = i;
    _streamController3.add(_numErrors);

  }*/
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

/*get datosCPSantiguo {
    return _prefs.get(datosCPSantiguo);
  }

  set datosCPSantiguo(CpsData antiguo) {
    _prefs.setDouble('bilirubin', antiguo.bilirubin);
  }

  get bilirubin {
    return _prefs.getDouble('bilirubin');
  }

  set bilirubin(double value) {
    _prefs.setDouble('bilirubin', value);
    */ /*_prefs.setDouble('bilirubin', mapaCPS['bilirubin']);
    _prefs.setDouble('inr', mapaCPS['bilirubin']);
    _prefs.setDouble('albumin', mapaCPS['albumin']);
    _prefs.setString('encephalopaty', mapaCPS['encephalopaty']);
    _prefs.setString('ascites', mapaCPS['ascites']);*/ /*
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
  }*/
}
