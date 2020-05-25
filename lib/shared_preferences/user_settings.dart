import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class UserSettings {
  //Instancia singleton, solo una instancia de Preferencias usuario
  static final UserSettings _instancia = UserSettings._internal();

  factory UserSettings() => _instancia;

  UserSettings._internal();

  SharedPreferences _prefs;

  bool _internationalUnits;
  StreamController _streamController = StreamController<bool>.broadcast();

  Stream<bool> get iUnitsUpdates => _streamController.stream;

  Map<String, bool> _emptyFieldsErrorMap = {};
  StreamController _streamController2 =
  StreamController<Map<String, bool>>.broadcast();

  Stream<Map<String, bool>> get emptyFieldsErrorMapUpdates =>
      _streamController2.stream;

  int _tumourNumber = 0;
  StreamController _streamController3 = StreamController<int>.broadcast();
  Stream<int> get tumourNumUpdates => _streamController3.stream;

  double _ageCutoff = 0.0;
  StreamController _streamController4 = StreamController<double>.broadcast();
  Stream<double> get ageUpdates => _streamController4.stream;

  String _ltCriteria = '';
  StreamController _streamController5 = StreamController<String>.broadcast();
  Stream<String> get ltCriteriaUpdates => _streamController5.stream;

  bool _precludeSurgery;
  StreamController _streamController6 = StreamController<bool>.broadcast();
  Stream<bool> get precludeSurgeryUpdates => _streamController6.stream;

  Map<String, bool> _parseErrorMap = {};
  StreamController _streamController7 =
      StreamController<Map<String, bool>>.broadcast();

  Stream<Map<String, bool>> get parseErrorMapUpdates =>
      _streamController7.stream;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  void switchInternationalUnits() {
    _internationalUnits = !_internationalUnits;
    _streamController.add(_internationalUnits);
  }

  void setInternationalUnits(bool value) {
    _internationalUnits = value;
    _streamController.add(_internationalUnits);
  }

  bool getInternationalUnits() {
    return _internationalUnits;
  }

  Map<String, bool> getEmptyFieldsErrorMap() {
    _streamController2.add(_emptyFieldsErrorMap);
    return _emptyFieldsErrorMap;
  }

  void initEmptyFieldsErrorMap(List<String> lista) {
    var length = lista.length;
    _emptyFieldsErrorMap = {};
    for (int i = 0; i < length; i++) {
      _emptyFieldsErrorMap.putIfAbsent(lista[i].toString(), () => true);
    }
  }

  bool isEmptyFieldsError() {
    return getEmptyFieldsErrorMap().values.contains(true);
  }

  void setTumourNumber(int value) {
    _tumourNumber = value;
    _streamController3.add(_tumourNumber);
  }

  int getTumourNumber() {
    return _tumourNumber;
  }

  void setAgeCutoff(double value) {
    _ageCutoff = value;
    _streamController4.add(_ageCutoff);
  }

  double getAgeCutoff() {
    return _ageCutoff;
  }

  String getLtCriteria() {
    return _ltCriteria;
  }

  void setLtCriteria(String value) {
    _ltCriteria = value;
    _streamController5.add(_ltCriteria);
  }

  bool getPrecludeSurgery() {
    return _precludeSurgery;
  }

  void setPrecludeSurgery(bool value) {
    _precludeSurgery = value;
    _streamController6.add(_precludeSurgery);
  }

  Map<String, bool> getParseErrorMap() {
    _streamController7.add(_parseErrorMap);
    return _parseErrorMap;
  }

  void initParseErrorMap(List<String> lista) {
    var length = lista.length;
    _parseErrorMap = {};
    for (int i = 0; i < length; i++) {
      _parseErrorMap.putIfAbsent(lista[i].toString(), () => false);
    }
  }

  bool isParseError() {
    return getParseErrorMap().values.contains(true);
  }

  void dispose() {
    _streamController.close();
    _streamController2.close();
    _streamController3.close();
    _streamController4.close();
    _streamController5.close();

    _streamController6.close();
    _streamController7.close();
  }
}
