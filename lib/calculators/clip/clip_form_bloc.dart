import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'clip_algorithm.dart';
import 'clip_data.dart';

class ClipFormBloc extends FormBloc<String, String> {
  final prefs = UserSettings();
  final units = Units();
  final debug = true;

  var afpField = TextFieldBloc();
  var cpsField = SelectFieldBloc(
    items: ['A', 'B', 'C'],
  );
  var tumourNumberField = SelectFieldBloc(
    items: ['0', '1', '2', '3', '4', '5', '6+'],
  );
  var tumourExtentField = SelectFieldBloc(
    items: ['<=50%', '>50%'],
  );
  var pvtField = SelectFieldBloc(
    items: ['yes', 'no'],
  );

  String result = '-';

  ClipData clipData = ClipData(
    afp: 0,
    cps: '-',
    tumourNumber: '-',
    tumourExtent: '-',
    pvt: '-',
    result: '-',
  );

  @override
  List<FieldBloc> get fieldBlocs =>
      [afpField, cpsField, tumourNumberField, tumourExtentField, pvtField];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    clipData = ClipData(
      afp: afpField.valueToDouble,
      cps: cpsField.value,
      tumourNumber: tumourNumberField.value,
      tumourExtent: tumourExtentField.value,
      pvt: pvtField.value,
    );

    ClipAlgorithm clipAlgorithm = ClipAlgorithm(clipData);

    try {
      this.result = clipAlgorithm.obtenerResultado();
      clipData.result = this.result;
    } catch (e) {
      print("Excepción: $e");
    }

    await Future<void>.delayed(Duration(seconds: 1));
    yield currentState.toSuccess('Success');
    //yield toLoaded para poder hacer submit más de una vez
    yield currentState.toLoaded();
  }

  showIU() {}

  showNotIU() {}

  reset() {
    this.afpField = TextFieldBloc();
    this.cpsField.updateValue('-');
    this.tumourNumberField.updateValue('-');
    this.tumourExtentField.updateValue('-');
    this.pvtField.updateValue('-');
    this.result = "-";
  }

  void previous() {
    this.afpField.updateValue(clipData.afp.toString());
    this.cpsField.updateValue(clipData.cps.toString());
    this.tumourNumberField.updateValue(clipData.tumourNumber.toString());
    this.tumourExtentField.updateValue(clipData.tumourExtent.toString());
    this.pvtField.updateValue(clipData.pvt.toString());
    this.result = clipData.result;
    if (debug) showObjectClipData();
  }

  void showObjectClipData() {
    print("\n\n *********FIELD VALUES");
    print("Campo afp: ${clipData.afp}");
    print("Campo cps: ${clipData.cps}");
    print("Campo numero: ${clipData.tumourNumber}");
    print("Campo extension: ${clipData.tumourExtent}");
    print("Campo pvt: ${clipData.pvt}");
    print("Campo resultado: ${clipData.result}");
  }
}
