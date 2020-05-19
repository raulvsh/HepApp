import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'okuda_algorithm.dart';
import 'okuda_data.dart';

class OkudaFormBloc extends FormBloc<String, String> {
  final prefs = UserSettings();
  final units = Units();
  final debug = true;

  var bilirubinField = TextFieldBloc();
  var albuminField = TextFieldBloc();
  var ascitesField = SelectFieldBloc(
    items: ['none_fem', 'controlled', 'refractory'],
  );
  var tumourExtentField = SelectFieldBloc(
    items: ['<=50%', '>50%'],
  );
  String result = '-';

  OkudaData okudaData = OkudaData(
    bilirubin: 0,
    albumin: 0,
    ascites: '-',
    tumourExtent: '-',
  );

  @override
  List<FieldBloc> get fieldBlocs => [
        bilirubinField,
        albuminField,
        ascitesField,
        tumourExtentField,
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    okudaData = OkudaData(
      bilirubin: bilirubinField.valueToDouble,
      albumin: albuminField.valueToDouble,
      ascites: ascitesField.value,
      tumourExtent: tumourExtentField.value,
    );
    OkudaAlgorithm okudaAlgorithm = OkudaAlgorithm(okudaData);

    try {
      this.result = okudaAlgorithm.obtenerResultado();
      okudaData.result = this.result;
    } catch (e) {
      print("Excepción: $e");
    }

    await Future<void>.delayed(Duration(seconds: 1));
    yield currentState.toSuccess('Success');
    //yield toLoaded para poder hacer submit más de una vez
    yield currentState.toLoaded();
  }

  void showIU() {
    this.bilirubinField.updateValue(okudaData.bilirubin.toStringAsFixed(2));
    this.albuminField.updateValue(okudaData.albumin.toStringAsFixed(2));
  }

  showNotIU() {
    this.bilirubinField.updateValue(
        units.getNotIUBilirrubin(okudaData.bilirubin).toStringAsFixed(2));
    this.albuminField.updateValue(
        units.getNotIUAlbumin(okudaData.albumin).toStringAsFixed(2));
  }

  reset() {
    this.bilirubinField = TextFieldBloc();
    this.albuminField = TextFieldBloc();
    this.ascitesField.updateValue('-');
    this.tumourExtentField.updateValue('-');
    this.result = "-";
  }

  void previous() {
    this.bilirubinField.updateValue(okudaData.bilirubin.toString());
    this.albuminField.updateValue(okudaData.albumin.toString());
    this.ascitesField.updateValue(okudaData.ascites.toString());
    this.tumourExtentField.updateValue(okudaData.tumourExtent.toString());
    this.result = okudaData.result;

    if (debug) showObjectOkudaData();
  }

  void showObjectOkudaData() {
    print("\n\n *********OKUDA DATA");
    print("Campo bilirrubina:            ${okudaData.bilirubin}");
    print("Campo albumina:            ${okudaData.albumin}");
    print("Campo ascites:         ${okudaData.ascites}");
    print("Campo extension:       ${okudaData.tumourExtent}  ");
    print("Campo resultado  :${okudaData.result}");
  }
}
