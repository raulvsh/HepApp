import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/meld/meld_algorithm.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

import 'meld_data.dart';

class MeldFormBloc extends FormBloc<String, String> {
  final prefs = PreferenciasUsuario();
  final units = Units();

  ///Usadas por mi
  var bilirubinField = TextFieldBloc();
  var inrField = TextFieldBloc();
  var creatinineField = TextFieldBloc();

  var albuminField = TextFieldBloc();
  var sodiumField = TextFieldBloc();
  var dialysisField = SelectFieldBloc(
    items: ['yes', 'no'],
  );

  Map<String, String> results = {
    'meld': '-',
    'meld_na': '-',
    '5v_meld': '-',

  };
  String meldResult = '-';
  String meldNaResult = '-';
  String meld5vResult = '-';


  var data = MeldData(
      bilirubin: 0,
      inr: 0,
      creatinine: 0,
      albumin: 0,
      sodium: 0,
      dialysis: 'no',
    results: {
      'meld': '-',
      'meld_na': '-',
      '5v_meld': '-',
    },
    /*meldResult: '-',
    meldNaResult: '-',
    meld5vResult: '-',*/
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
    showFields();

    data = MeldData(
      bilirubin: bilirubinField.valueToDouble,
      inr: inrField.valueToDouble,
      creatinine: creatinineField.valueToDouble,
      albumin: albuminField.valueToDouble,
      sodium: sodiumField.valueToDouble,
      dialysis: dialysisField.value,
    );

    MeldAlgorithm meldAlgorithm = MeldAlgorithm(data);

    try {
      this.results = meldAlgorithm.obtenerResultado();
      data.results = this.results;

      //print("resultados ${this.results}" );

      //TODO hacer algoritmo en 3 partes, meld normal, con eso + sodio, obtener Na, con dialisis, obtener 5v
      //data.meldResult = this.meldResult;
      //data.meldResult = this.meldResult;
      //data.meldResult = this.meldResult;
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
    print("\n\n*****************OBJETO MELDDATA: "
        "\nbilirrubina : ${data.bilirubin}" +
        "\ninr : ${data.inr}" +
        "\ncreatinina : ${data.creatinine}" +
        "\nalbumina : ${data.albumin}" +
        "\nsodio : ${data.sodium}" +
        "\ndialisis : ${data.dialysis}" +
        "\nresultados: ${data.results.toString()}" +
        //"\nresultado Na: ${data.meldNaResult}" +
        //"\nresultado 5v: ${data.meld5vResult}" +

        "\n**************");
  }

  void showFields() {
    print("\n\n *********FIELD VALUES");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo creatinina: " + creatinineField.value);
    print("Campo albumina: " + albuminField.value);
    print("Campo sodio: " + sodiumField.value);
    print("Campo dialisis: " + dialysisField.value);
    print("Campo resultado antes de operar: " + results.toString());
  }


  showNotIU() {
    this.bilirubinField = TextFieldBloc(
      initialValue: data.bilirubin.toStringAsPrecision(4),

      //initialValue: units.getNotIUBilirrubin(data.bilirubin)
      // .toStringAsPrecision(4),
    );
    this.creatinineField = TextFieldBloc(
      initialValue: data.creatinine.toStringAsPrecision(4),

      // initialValue: units.getNotIUCreatinin(data.creatinine)
      //   .toStringAsPrecision(
      //   4),
    );
    this.albuminField = TextFieldBloc(
      initialValue: data.albumin.toStringAsPrecision(4),

      //initialValue: units.getNotIUBilirrubin(data.albumin).toStringAsPrecision(
      //  4),
    );
    this.sodiumField = TextFieldBloc(
      initialValue: data.sodium.toStringAsPrecision(4),

      // initialValue: units.getNotIUSodium(data.sodium).toStringAsPrecision(
      //   4),
    );

  }

  showIU() {
    this.bilirubinField = TextFieldBloc(
      initialValue: units.getIUBilirrubin(data.bilirubin)
          .toStringAsPrecision(4),
      //initialValue: data.bilirubin.toStringAsPrecision(4),
    );
    this.creatinineField = TextFieldBloc(
      initialValue: units.getIUCreatinin(data.creatinine)
          .toStringAsPrecision(
          4),
      // initialValue: data.creatinine.toStringAsPrecision(4),
    );

    this.albuminField = TextFieldBloc(
      initialValue: units.getIUAlbumin(data.albumin).toStringAsPrecision(
          4),
      // initialValue: data.albumin.toStringAsPrecision(4),
    );
    this.sodiumField = TextFieldBloc(
      initialValue: units.getIUSodium(data.albumin).toStringAsPrecision(
          4),
      //initialValue: data.sodium.toStringAsPrecision(4),
    );

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
    this.results = {
      'meld': '-',
      'meld_na': '-',
      '5v_meld': '-',
    };

    /*this.meldResult = "-";
    this.meldNaResult = "-";
    this.meld5vResult = "-";*/

  }


  void previous() {
    this.bilirubinField = TextFieldBloc(
      initialValue: data.bilirubin.toString(),
    );
    this.inrField = TextFieldBloc(
      initialValue: data.inr.toString(),
    );
    this.creatinineField = TextFieldBloc(
      initialValue: data.creatinine.toString(),
    );
    this.albuminField = TextFieldBloc(
      initialValue: data.albumin.toString(),
    );
    this.sodiumField = TextFieldBloc(
      initialValue: data.sodium.toString(),
    );
    this.dialysisField = SelectFieldBloc(
      items: ['yes', 'no',],
      initialValue: data.dialysis.toString(),
    );
    //this.results=
    this.results = data.results;
    //this.meldResult = data.meldResult;
    //this.meldNaResult = data.meldNaResult;
    //this.meld5vResult = data.meld5vResult;


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
    print("bilirrubin: " + this.bilirubinField.value);
    print("INR: " + this.inrField.value);
    print("encefalopatia: " + this.creatinineField.value);
    print("albumina: " + this.albuminField.value);
    print("sodio: " + this.sodiumField.value);
    print("dialisis: " + this.dialysisField.value);
    print(data.results.toString());

    //print("resultado: " + this.meldResult);
    //print("resultado Na: " + this.meldNaResult);
    //print("resultado 5v: " + this.meld5vResult);

  }
}
