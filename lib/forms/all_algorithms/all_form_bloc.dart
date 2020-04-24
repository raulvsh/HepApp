import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

import 'all_algorithm.dart';
import 'all_data.dart';

class AllFormBloc extends FormBloc<String, String> {
  final prefs = PreferenciasUsuario();
  final units = Units();

  //Diagnostic
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
  var tumourSizeField = SelectFieldBloc(
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
  var pviField = SelectFieldBloc(
    items: ['yes', 'no'],
  );
  var nodesField = SelectFieldBloc(
    items: ['yes', 'no'],
  );
  var metastasisField = SelectFieldBloc(
    items: ['yes', 'no'],
  );
  var portalHypertensionField = SelectFieldBloc(
    items: ['yes', 'no'],
  );
  var pvtField = SelectFieldBloc(
    items: ['yes', 'no'],
  );

  //Laboratory
  var bilirubinField = TextFieldBloc();
  var inrField = TextFieldBloc();
  var creatinineField = TextFieldBloc();
  var albuminField = TextFieldBloc();
  var sodiumField = TextFieldBloc();
  var plateletsField = TextFieldBloc();
  var afpField = TextFieldBloc();
  var astField = TextFieldBloc();
  var astUpperLimitField = TextFieldBloc();
  var alpField = TextFieldBloc();
  var alpUpperLimitField = TextFieldBloc();
  var dialysisField = SelectFieldBloc(
    items: ['yes', 'no'],
  );

  //Clinical
  var cirrhosisField = SelectFieldBloc(
    items: ['yes', 'no'],
  );
  var encephalopatyField = SelectFieldBloc(
    items: ['none_fem', 'grade_1_2', 'grade_3_4'],
    //initialValue: ['none_fem'],
  );
  var ascitesField = SelectFieldBloc(
    items: ['none_fem', 'controlled', 'refractory'],
  );
  var varicesField = SelectFieldBloc(
    items: ['yes', 'no'],
  );
  var ecogField = SelectFieldBloc(
    items: ['0', '1', '2', '3', '4'],
  );

  List<String> results = ['-'];

  var data = AllData(
    bilirubin: 0,
    albumin: 0,
    ascites: 'none_fem',
    tumourExtent: '<=50%',
    results: ['-'],
  );

  @override
  List<FieldBloc> get fieldBlocs => [
        bilirubinField,
        albuminField,
        //ascitesField,
        tumourExtentField,
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    showFields();

    data = AllData(
      bilirubin: bilirubinField.valueToDouble,
      albumin: albuminField.valueToDouble,
      //ascites: ascitesField.value,
      tumourExtent: tumourExtentField.value,
    );

    AllAlgorithm okudaAlgorithm = AllAlgorithm(data);

    try {
      //this.result = okudaAlgorithm.obtenerResultado();
      //data.result = this.result;

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
    print("\n\n*****************OBJETO OkudaDATA: "
            "\nbili: ${data.bilirubin}" +
        "\nalbu: ${data.albumin}" +
        "\nascites : ${data.ascites}" +
        "\nextension : ${data.tumourExtent}" +
        "\nresultado: ${data.results.toString()}" +
        "\n**************");
  }

  void showFields() {
    print("\n\n *********FIELD VALUES");
    print("Campo bili: " + bilirubinField.value);
    print("Campo albu: " + albuminField.value);
    // print("Campo ascites: " + ascitesField.value);

    print("Campo extension: " + tumourExtentField.value);

    print("Campo resultado antes : " + results.toString());
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
    this.bilirubinField = TextFieldBloc();
    this.albuminField = TextFieldBloc();
    /*this.ascitesField = SelectFieldBloc(
      items: ['none_fem', 'controlled', 'refractory'],
    );*/
    this.tumourExtentField = SelectFieldBloc(
      items: ['<=50%', '>50%'],
    );

    this.results = ["-"];
  }

  void previous() {
    this.bilirubinField = TextFieldBloc(
      initialValue: data.bilirubin.toString(),
    );
    this.albuminField = TextFieldBloc(
      initialValue: data.albumin.toString(),
    );
    /*this.ascitesField = SelectFieldBloc(
      items: ['none_fem', 'controlled', 'refractory'],
      initialValue: data.ascites.toString(),
    );*/

    this.tumourExtentField = SelectFieldBloc(
      items: ['<=50%', '>50%'],
      initialValue: data.tumourExtent.toString(),
    );

    this.results = data.results;

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
    print("bili: " + this.bilirubinField.value);
    print("albu: " + this.albuminField.value);
    // print("ascites: " + this.ascitesField.value);
    print("extent: " + this.tumourExtentField.value);

    print("resultado: " + this.results.toString());
  }
}
