import 'dart:async';

import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/child_pugh_score/cps_algorithm.dart';
import 'package:hepapp/forms/child_pugh_score/cps_data.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

class CpsFormBloc extends FormBloc<String, String> {
  final prefs = UserSettings();
  final units = Units();

  //bool iUnits = true;

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
      result: '-');

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

    // yield `currentState.toLoaded()` because
    // you can't submit if the current state is `FormBlocSuccess`.
    // In most cases you don't need to do this,
    // because you only want to submit only once,
    // but in this case you want the user to submit more than once.
    // See: https://pub.dev/documentation/form_bloc/latest/form_bloc/FormBloc/onSubmitting.html
    yield currentState.toLoaded();
  }

  void showIU() {
    this.bilirubinField = TextFieldBloc(
      initialValue: data.bilirubin.toStringAsPrecision(4),
    );
    this.inrField = TextFieldBloc(
      initialValue: data.inr.toStringAsPrecision(4),
    );
    this.albuminField = TextFieldBloc(
      initialValue: data.albumin.toStringAsPrecision(4),
    );
  }

  showNotIU() {
    this.bilirubinField = TextFieldBloc(
      initialValue:
      units.getNotIUBilirrubin(data.bilirubin).toStringAsPrecision(4),
    );
    this.inrField = TextFieldBloc(
      initialValue: data.inr.toStringAsPrecision(4),
    );
    this.albuminField = TextFieldBloc(
      initialValue: units.getNotIUAlbumin(data.albumin).toStringAsPrecision(4),
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
      initialValue: data.encephalopaty.toString(),
    );
    this.ascitesField = SelectFieldBloc(
      items: ['none_fem', 'controlled', 'refractory'],
      initialValue: data.ascites.toString(),
    );
    this.resultadoField = data.result;

    print("\n*****AFTER PREVIOUS");
    showFields();
    /*print("bilirrubin: " + this.bilirubinField.value);
    print("INR: " + this.inrField.value);
    print("albumina: " + this.albuminField.value);
    print("encefalopatia: " + this.encephalopatyField.value.toString());
    print("ascitis: " + this.ascitesField.value.toString());
    print("resultado: " + this.resultadoField);*/
  }

  //Para debug
  void showObjectCPSData() {
    print("\n\n*****************OBJETO CPSDATA: "
        "\nbilirrubina : ${data.bilirubin}" +
        "\nalbumina : ${data.albumin}" +
        "\ninr : ${data.inr}" +
        "\nencefalopatia : ${data.encephalopaty}" +
        "\nascitis : ${data.ascites}" +
        "\nresultado: ${data.result}" +
        "\n**************");
  }

  //Para debug
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
