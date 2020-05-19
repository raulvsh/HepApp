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
  List<FieldBloc> get fieldBlocs =>
      [
        bilirubinField,
        inrField,
        albuminField,
        encephalopatyField,
        ascitesField,
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    if (debug) showCpsFields();

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
    /*this.bilirubinField = TextFieldBloc(
      initialValue: data.bilirubin.toStringAsFixed(2),
    );
    this.inrField = TextFieldBloc(
      initialValue: cpsData.inr.toStringAsFixed(2),
    );
    this.albuminField = TextFieldBloc(
      initialValue: cpsData.albumin.toStringAsFixed(2),
    );*/
  }

  showNotIU() {
    this.bilirubinField.updateValue(
        units.getNotIUBilirrubin(cpsData.bilirubin).toStringAsFixed(2));
    this.inrField.updateValue(cpsData.inr.toStringAsFixed(2));
    this
        .albuminField
        .updateValue(units.getNotIUAlbumin(cpsData.albumin).toStringAsFixed(2));
    /*this.bilirubinField = TextFieldBloc(
      initialValue: units.getNotIUBilirrubin(cpsData.bilirubin).toStringAsFixed(2),
    );
    this.inrField = TextFieldBloc(
      initialValue: cpsData.inr.toStringAsFixed(2),
    );
    this.albuminField = TextFieldBloc(
      initialValue: units.getNotIUAlbumin(cpsData.albumin).toStringAsFixed(2),
    );*/
  }

  reset() {
    this.bilirubinField = TextFieldBloc();
    this.inrField = TextFieldBloc();
    this.albuminField = TextFieldBloc();
    this.encephalopatyField.updateValue('-');
    this.ascitesField.updateValue('-');

    /*this.encephalopatyField = SelectFieldBloc(
      items: ['none_fem', 'grade_1_2', 'grade_3_4'],
    );
    this.ascitesField = SelectFieldBloc(
      items: ['none_fem', 'controlled', 'refractory'],
    );*/
    this.resultadoField = "-";

    if (debug) {
      showCpsFields();
      showObjectCPSData();
    }
  }

  void previous() {
    this.bilirubinField.updateValue(cpsData.bilirubin.toString());
    this.inrField.updateValue(cpsData.inr.toString());
    this.albuminField.updateValue(cpsData.albumin.toString());
    this.encephalopatyField.updateValue(cpsData.encephalopaty.toString());
    this.ascitesField.updateValue(cpsData.ascites.toString());


    /*this.bilirubinField = TextFieldBloc(
      initialValue: data.bilirubin.toString(),
    );
    this.inrField = TextFieldBloc(
      initialValue: data.inr.toString(),
    );
    this.albuminField = TextFieldBloc(
      initialValue: data.albumin.toString(),
    );
    this.encephalopatyField = SelectFieldBloc(
        items: ['none_fem', 'grade_1_2', 'grade_3_4'],
        initialValue: data.encephalopaty.toString());
    this.ascitesField = SelectFieldBloc(
        items: ['none_fem', 'controlled', 'refractory'],
        initialValue: data.ascites.toString());*/
    this.resultadoField = cpsData.result;

    if (debug) {
      print("\n*****CPS AFTER PREVIOUS");
      showCpsFields();
      showObjectCPSData();
    }
  }

  void showObjectCPSData() {
    print("\n\n*****************OBJETO CPSDATA: "
        "\nbilirrubina : ${cpsData.bilirubin}" +
        "\ninr : ${cpsData.inr}" +
        "\nalbumina : ${cpsData.albumin}" +
        "\nencefalopatia : ${cpsData.encephalopaty}" +
        "\nascitis : ${cpsData.ascites}" +
        "\nresultado: ${cpsData.result}" +
        "\n**************");
  }

  void showCpsFields() {
    print("\n\n *********FIELD VALUES");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo albumina: " + albuminField.value);
    print("Campo encefalopatía: " + encephalopatyField.value);
    print("Campo ascitis: " + ascitesField.value);
    print("Campo resultado antes de operar: " + resultadoField);
  }
}
