import 'dart:async';

import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/calculators/child_pugh_score/cps_algorithm.dart';
import 'package:hepapp/calculators/child_pugh_score/cps_data.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

class CpsFormBloc extends FormBloc<String, String> {
  final prefs = UserSettings();
  final units = Units();

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

  var data = CpsData(
    bilirubin: 0,
    inr: 0,
    albumin: 0,
    encephalopaty: 'none_fem',
    ascites: 'none_fem',
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
    showFields();

    data = CpsData(
      bilirubin: bilirubinField.valueToDouble,
      inr: inrField.valueToDouble,
      albumin: albuminField.valueToDouble,
      encephalopaty: encephalopatyField.value,
      ascites: ascitesField.value,
      result: resultadoField,
    );
    CpsAlgorithm cpsAlgorithm = CpsAlgorithm(data);
    showObjectCPSData();

    try {
      this.resultadoField = cpsAlgorithm.obtenerResultado();
      data.result = this.resultadoField;
    } catch (e) {
      print("Excepción: $e");
    }

    await Future<void>.delayed(Duration(seconds: 1));

    yield currentState.toSuccess('Success');
    //yield toLoaded para poder hacer submit más de una vez
    yield currentState.toLoaded();
  }

  void showIU() {
    this.bilirubinField = TextFieldBloc(
      initialValue: data.bilirubin.toStringAsFixed(2),
    );
    this.inrField = TextFieldBloc(
      initialValue: data.inr.toStringAsFixed(2),
    );
    this.albuminField = TextFieldBloc(
      initialValue: data.albumin.toStringAsFixed(2),
    );
  }

  showNotIU() {
    this.bilirubinField = TextFieldBloc(
      initialValue: units.getNotIUBilirrubin(data.bilirubin).toStringAsFixed(2),
    );
    this.inrField = TextFieldBloc(
      initialValue: data.inr.toStringAsFixed(2),
    );
    this.albuminField = TextFieldBloc(
      initialValue: units.getNotIUAlbumin(data.albumin).toStringAsFixed(2),
    );
  }

  reset() {
    this.bilirubinField = TextFieldBloc();
    this.inrField = TextFieldBloc();
    this.albuminField = TextFieldBloc();
    this.encephalopatyField = SelectFieldBloc(
      items: ['none_fem', 'grade_1_2', 'grade_3_4'],
    );
    this.ascitesField = SelectFieldBloc(
      items: ['none_fem', 'controlled', 'refractory'],
    );
    this.resultadoField = "-";

    //showFields();
    //showObjectCPSData();
  }

  void previous() {
    this.bilirubinField = TextFieldBloc(
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
        initialValue: data.ascites.toString());
    this.resultadoField = data.result;

    print("\n*****AFTER PREVIOUS");
    showFields();
  }

  void showObjectCPSData() {
    print("\n\n*****************OBJETO CPSDATA: "
        "\nbilirrubina : ${data.bilirubin}" +
        "\ninr : ${data.inr}" +
        "\nalbumina : ${data.albumin}" +
        "\nencefalopatia : ${data.encephalopaty}" +
        "\nascitis : ${data.ascites}" +
        "\nresultado: ${data.result}" +
        "\n**************");
  }

  void showFields() {
    print("\n\n *********FIELD VALUES");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo albumina: " + albuminField.value);
    print("Campo encefalopatía: " + encephalopatyField.value);
    print("Campo ascitis: " + ascitesField.value);
    print("Campo resultado antes de operar: " + resultadoField);
  }
}