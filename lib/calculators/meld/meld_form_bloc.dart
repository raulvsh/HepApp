import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/calculators/meld/meld_algorithm.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'meld_data.dart';

class MeldFormBloc extends FormBloc<String, String> {
  final prefs = UserSettings();
  final units = Units();
  final debug = true;

  var bilirubinField = TextFieldBloc();
  var inrField = TextFieldBloc();
  var creatinineField = TextFieldBloc();
  var albuminField = TextFieldBloc();
  var sodiumField = TextFieldBloc();
  var dialysisField = SelectFieldBloc(
    items: ['yes', 'no'],
  );
  Map<String, String> results = initResultMap();

  MeldData meldData = MeldData(
    bilirubin: 0,
    inr: 0,
    creatinine: 0,
    albumin: 0,
    sodium: 0,
    dialysis: '-',
    results: initResultMap(),
  );

  @override
  List<FieldBloc> get fieldBlocs => [
        bilirubinField,
        inrField,
        creatinineField,
        albuminField,
        sodiumField,
        dialysisField,
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    try {
      meldData = MeldData(
        bilirubin: bilirubinField.valueToDouble,
        inr: inrField.valueToDouble,
        creatinine: creatinineField.valueToDouble,
        albumin: albuminField.valueToDouble,
        sodium: sodiumField.valueToDouble,
        dialysis: dialysisField.value,
      );

      MeldAlgorithm meldAlgorithm = MeldAlgorithm(meldData);

      this.results = meldAlgorithm.obtenerResultado();
      meldData.results = this.results;
    } catch (e) {
      print("Excepción: $e");
    }

    await Future<void>.delayed(Duration(seconds: 1));

    yield currentState.toSuccess('Success');
    //yield toLoaded para poder hacer submit más de una vez
    yield currentState.toLoaded();
  }

  showIU() {
    this.bilirubinField.updateValue(meldData.bilirubin.toStringAsFixed(2));
    this.inrField.updateValue(meldData.inr.toStringAsFixed(2));
    this.creatinineField.updateValue(meldData.creatinine.toStringAsFixed(2));
    this.albuminField.updateValue(meldData.albumin.toStringAsFixed(2));
    this.sodiumField.updateValue(meldData.sodium.toStringAsFixed(2));
  }

  showNotIU() {
    this.bilirubinField.updateValue(
        units.getNotIUBilirrubin(meldData.bilirubin).toStringAsFixed(2));
    this.inrField.updateValue(meldData.inr.toStringAsFixed(2));
    this.creatinineField.updateValue(
        units.getNotIUCreatinin(meldData.creatinine).toStringAsFixed(2));
    this.albuminField.updateValue(
        units.getNotIUAlbumin(meldData.albumin).toStringAsFixed(2));
    this
        .sodiumField
        .updateValue(units.getNotIUSodium(meldData.sodium).toStringAsFixed(2));
  }

  reset() {
    this.bilirubinField = TextFieldBloc();
    this.inrField = TextFieldBloc();
    this.creatinineField = TextFieldBloc();
    this.albuminField = TextFieldBloc();
    this.sodiumField = TextFieldBloc();
    this.dialysisField = SelectFieldBloc(
      items: ['yes', 'no'],
    );
    this.results = initResultMap();
  }

  void previous() {
    this.bilirubinField.updateValue(meldData.bilirubin.toString());
    this.inrField.updateValue(meldData.inr.toString());
    this.creatinineField.updateValue(meldData.creatinine.toString());
    this.albuminField.updateValue(meldData.albumin.toString());
    this.sodiumField.updateValue(meldData.sodium.toString());
    this.dialysisField.updateValue(meldData.dialysis.toString());
    this.results = meldData.results;
  }

  static initResultMap() {
    return {
      'meld': '-',
      'meld_na': '-',
      '5v_meld': '-',
    };
  }

  void showMeldFields() {
    print("\n\n *********FIELD VALUES");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo creatinina: " + creatinineField.value);
    print("Campo albumina: " + albuminField.value);
    print("Campo sodio: " + sodiumField.value);
    print("Campo dialisis: " + dialysisField.value);
    print("Campo resultado antes de operar: " + results.toString());
  }
}
