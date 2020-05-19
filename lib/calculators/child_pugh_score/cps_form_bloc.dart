import 'dart:async';

import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/calculators/child_pugh_score/cps_algorithm.dart';
import 'package:hepapp/calculators/child_pugh_score/cps_data.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

class CpsFormBloc extends FormBloc<String, String> {
  final prefs = UserSettings();
  final units = Units();
  final debug = false;

  var bilirubinField = TextFieldBloc();
  var inrField = TextFieldBloc();
  var albuminField = TextFieldBloc();
  var encephalopatyField = SelectFieldBloc(
    items: ['none_fem', 'grade_1_2', 'grade_3_4'],
  );
  var ascitesField = SelectFieldBloc(
    items: ['none_fem', 'controlled', 'refractory'],
  );
  String resultadoField = '-';

  CpsData cpsData = CpsData(
    bilirubin: 0,
    inr: 0,
    albumin: 0,
    encephalopaty: '-',
    ascites: '-',
    result: '-',
  );

  @override
  List<FieldBloc> get fieldBlocs => [
        bilirubinField,
        inrField,
        albuminField,
        encephalopatyField,
        ascitesField,
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {

    cpsData = CpsData(
      bilirubin: bilirubinField.valueToDouble,
      inr: inrField.valueToDouble,
      albumin: albuminField.valueToDouble,
      encephalopaty: encephalopatyField.value,
      ascites: ascitesField.value,
      result: resultadoField,
    );
    CpsAlgorithm cpsAlgorithm = CpsAlgorithm(cpsData);
    if (debug) showObjectCPSData();

    try {
      this.resultadoField = cpsAlgorithm.obtenerResultado();
      cpsData.result = this.resultadoField;
    } catch (e) {
      print("Excepción: $e");
    }

    await Future<void>.delayed(Duration(seconds: 1));
    yield currentState.toSuccess('Success');
    //yield toLoaded para poder hacer submit más de una vez
    yield currentState.toLoaded();
  }

  void showIU() {
    this.bilirubinField.updateValue(cpsData.bilirubin.toStringAsFixed(2));
    this.inrField.updateValue(cpsData.inr.toStringAsFixed(2));
    this.albuminField.updateValue(cpsData.albumin.toStringAsFixed(2));
  }

  showNotIU() {
    this.bilirubinField.updateValue(
        units.getNotIUBilirrubin(cpsData.bilirubin).toStringAsFixed(2));
    this.inrField.updateValue(cpsData.inr.toStringAsFixed(2));
    this
        .albuminField
        .updateValue(units.getNotIUAlbumin(cpsData.albumin).toStringAsFixed(2));
  }

  reset() {
    this.bilirubinField = TextFieldBloc();
    this.inrField = TextFieldBloc();
    this.albuminField = TextFieldBloc();
    this.encephalopatyField.updateValue('-');
    this.ascitesField.updateValue('-');
    this.resultadoField = "-";

    if (debug) showObjectCPSData();
  }

  void previous() {
    this.bilirubinField.updateValue(cpsData.bilirubin.toString());
    this.inrField.updateValue(cpsData.inr.toString());
    this.albuminField.updateValue(cpsData.albumin.toString());
    this.encephalopatyField.updateValue(cpsData.encephalopaty.toString());
    this.ascitesField.updateValue(cpsData.ascites.toString());
    this.resultadoField = cpsData.result;

    if (debug) showObjectCPSData();
  }

  void showObjectCPSData() {
    print("\n\n*****************OBJETO CPSDATA: ");
    print("Bilirrubina: ${cpsData.bilirubin}");
    print("Inr: ${cpsData.inr}");
    print("Albumina: ${cpsData.albumin}");
    print("Encefalopatía: ${cpsData.encephalopaty}");
    print("Ascitis: ${cpsData.ascites}");
    print("Resultado antes de operar: ${cpsData.result}");
  }
}
