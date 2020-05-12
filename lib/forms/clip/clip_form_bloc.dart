import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'clip_algorithm.dart';
import 'clip_data.dart';

class ClipFormBloc extends FormBloc<String, String> {
  final prefs = UserSettings();
  final units = Units();

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

  var data = ClipData(
    afp: 0,
    cps: 'A',
    tumourNumber: '0',
    tumourExtent: '<=50%',
    pvt: 'no',
    result: '-',);

  @override
  List<FieldBloc> get fieldBlocs =>
      [afpField, cpsField, tumourNumberField, tumourExtentField, pvtField];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    showFields();
    data = ClipData(
      afp: afpField.valueToDouble,
      cps: cpsField.value,
      tumourNumber: tumourNumberField.value,
      tumourExtent: tumourExtentField.value,
      pvt: pvtField.value,);

    ClipAlgorithm clipAlgorithm = ClipAlgorithm(data);

    try {
      this.result = clipAlgorithm.obtenerResultado();
      data.result = this.result;
    } catch (e) {
      print("Excepción: $e");
    }

    await Future<void>.delayed(Duration(seconds: 1));

    yield currentState.toSuccess('Success');
    //yield toLoaded para poder hacer submit más de una vez
    yield currentState.toLoaded();
  }

  void showObjectMeldData() {
    print("\n\n*****************OBJETO clipDATA: "
            "\nafp : ${data.afp}" +
        "\ncps : ${data.cps}" +
        "\nnumero : ${data.tumourNumber}" +
        "\nextension : ${data.tumourExtent}" +
        "\pvt : ${data.pvt}" +
        "\nresultado: ${data.result}" +
        "\n**************");
  }

  void showFields() {
    print("\n\n *********FIELD VALUES");
    print("Campo afp: " + afpField.value);
    print("Campo cps: " + cpsField.value);
    print("Campo numero: " + tumourNumberField.value);
    print("Campo extension: " + tumourExtentField.value);
    print("Campo pvt: " + pvtField.value);
    print("Campo resultado antes : " + result);
  }

  showNotIU() {}

  showIU() {}

  reset() {
    this.afpField = TextFieldBloc();
    this.cpsField = SelectFieldBloc(items: ['A', 'B', 'C']);
    this.tumourNumberField =
        SelectFieldBloc(items: ['0', '1', '2', '3', '4', '5', '6+'],);
    this.tumourExtentField = SelectFieldBloc(
      items: ['<=50%', '>50%'],
    );
    this.pvtField = SelectFieldBloc(
      items: ['yes', 'no'],
    );

    this.result = "-";
  }

  void previous() {
    this.afpField = TextFieldBloc(
      initialValue: data.afp.toString(),
    );
    this.cpsField = SelectFieldBloc(
      items: ['A', 'B', 'C'],
      initialValue: data.cps.toString(),
    );
    this.tumourNumberField = SelectFieldBloc(
      items: ['0', '1', '2', '3', '4', '5', '6+'],
      initialValue: data.tumourNumber.toString(),
    );
    this.tumourExtentField = SelectFieldBloc(
      items: ['<=50%', '>50%'],
      initialValue: data.tumourExtent.toString(),
    );

    this.pvtField = SelectFieldBloc(
      items: [
        'yes',
        'no',
      ],
      initialValue: data.pvt.toString(),
    );
    this.result = data.result;
    //print("\n*****AFTER PREVIOUS");
    //showFields();
  }
}
