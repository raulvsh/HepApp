import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

import 'clip_algorithm.dart';
import 'clip_data.dart';

class ClipFormBloc extends FormBloc<String, String> {
  final prefs = PreferenciasUsuario();
  final units = Units();

  ///Usadas por mi
  var afpField = TextFieldBloc();

  var cpsField = SelectFieldBloc(
    items: ['A', 'B', 'C'],
  );
  var tumourNumberField = SelectFieldBloc(
    items: [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6+',
    ],
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
    result: '-',
  );

  @override
  List<FieldBloc> get fieldBlocs => [
        afpField,
        cpsField,
        tumourNumberField,
        tumourExtentField,
        pvtField,
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    showFields();

    data = ClipData(
      afp: afpField.valueToDouble,
      cps: cpsField.value,
      tumourNumber: tumourNumberField.value,
      tumourExtent: tumourExtentField.value,
      pvt: pvtField.value,
    );

    ClipAlgorithm clipAlgorithm = ClipAlgorithm(data);

    try {
      this.result = clipAlgorithm.obtenerResultado();
      data.result = this.result;
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

  showNotIU() {
    //TODO mirar las unidades del afp, unico que cambia
    /*this.bilirubinField = TextFieldBloc(
      initialValue: units.getNotIUBilirrubin(data.bilirubin)
          .toStringAsPrecision(2),
    );
    this.creatinineField = TextFieldBloc(
      initialValue: units.getNotIUCreatinin(data.creatinine)
          .toStringAsPrecision(
          2),
    );
    this.albuminField = TextFieldBloc(
      initialValue: units.getNotIUBilirrubin(data.albumin).toStringAsPrecision(
          2),
    );
    this.sodiumField = TextFieldBloc(
      initialValue: units.getNotIUSodium(data.sodium).toStringAsPrecision(
          2),
    );*/
  }

  void showIU() {
    /*this.bilirubinField = TextFieldBloc(
      initialValue: data.bilirubin.toStringAsPrecision(2),
    );
    this.creatinineField = TextFieldBloc(
      initialValue: data.creatinine.toStringAsPrecision(2),
    );

    this.albuminField = TextFieldBloc(
      initialValue: data.albumin.toStringAsPrecision(2),
    );
    this.sodiumField = TextFieldBloc(
      initialValue: data.sodium.toStringAsPrecision(2),
    );
*/
  }

  reset() {
    this.afpField = TextFieldBloc();
    this.cpsField = SelectFieldBloc(
      items: ['A', 'B', 'C'],
    );
    this.tumourNumberField = SelectFieldBloc(
      items: [
        '0',
        '1',
        '2',
        '3',
        '4',
        '5',
        '6+',
      ],
    );
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
      items: [
        '0',
        '1',
        '2',
        '3',
        '4',
        '5',
        '6+',
      ],
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

    //this.ascitesField.updateValue('none_fem');
    //this.ascitesField.updateItems(['none_fem', 'controlled', 'refractory'],);
    //print("ascites dentro previo " + this.ascitesField.value.toString());
    //var radio = state.elementAt(0).toString();
    //print("radio" + radio);

    //encephalopatyField.updateValue(data.encephalopaty.toString(),);
    /* _initMap(state);

      radioValue = state.items
          .elementAt(index)
          .toString(); //radioValue es el elemento seleccionado

      */ /*Venían en la función onChange, quizás se necesiten
                      widget.isEnabled,
                      widget.nextFocusNode,*/ /*

      widget.selectFieldBloc
          .updateValue(radioValue); //Actualizo el valor
      isSelected[radioValue] = true;
      //print('Mapa actualizado $isSelected \n\n');*/

    print("\n*****AFTER PREVIOUS");
    showFields();
    /*print("afp: " + this.afpField.value);
    print("cps: " + this.cpsField.value);
    print("number: " + this.tumourNumberField.value);
    print("exte: " + this.tumourExtentField.value);
    print("pvt: " + this.pvtField.value);

    print("resultado: " + this.result);*/
  }
}
