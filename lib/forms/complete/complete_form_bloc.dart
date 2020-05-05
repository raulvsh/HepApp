import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

class CompleteFormBloc extends FormBloc<String, String> {
  final prefs = UserSettings();
  final units = Units();

  //Diagnostic
  var tumourNumberField = SelectFieldBloc(
    items: ['0', '1', '2', '3', '4', '5', '6+'],
    initialValue: '0',
  );
  var tumourSizeField = [
    TextFieldBloc(initialValue: '-'),
    TextFieldBloc(initialValue: '-'),
    TextFieldBloc(initialValue: '-'),
    TextFieldBloc(initialValue: '-'),
    TextFieldBloc(initialValue: '-'),
    TextFieldBloc(initialValue: '-'),
  ];

  var tumourExtentField = SelectFieldBloc(
    items: ['<=50%', '>50%'],
    initialValue: '<=50%',
  );
  var pviField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: 'no',
  );
  var nodesField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: 'no',
  );
  var metastasisField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: 'no',
  );
  var portalHypertensionField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: 'no',
  );
  var pvtField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: 'no',
  );

  //Laboratory
  var bilirubinField = TextFieldBloc(initialValue: '0');
  var inrField = TextFieldBloc(initialValue: '0');
  var creatinineField = TextFieldBloc(initialValue: '0');
  var albuminField = TextFieldBloc(initialValue: '0');
  var sodiumField = TextFieldBloc(initialValue: '0');
  var plateletsField = TextFieldBloc(initialValue: '0');
  var afpField = TextFieldBloc(initialValue: '0');
  var astField = [
    TextFieldBloc(initialValue: '0'),
    TextFieldBloc(initialValue: '0'),
  ];

  //var astField = TextFieldBloc();
  //var astUpperLimitField = TextFieldBloc();
  var alpField = [
    TextFieldBloc(initialValue: '0'),
    TextFieldBloc(initialValue: '0'),
  ];

  //var alpField = TextFieldBloc();
  //var alpUpperLimitField = TextFieldBloc();
  var dialysisField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: 'no',
  );

  //Clinical
  var cirrhosisField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: 'no',
  );
  var encephalopatyField = SelectFieldBloc(
    items: ['none_fem', 'grade_1_2', 'grade_3_4'],
    initialValue: 'none_fem',

    //initialValue: ['none_fem'],
  );
  var ascitesField = SelectFieldBloc(
    items: ['none_fem', 'controlled', 'refractory'],
    initialValue: 'none_fem',
  );
  var varicesField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: 'no',
  );
  var ecogField = SelectFieldBloc(
    items: ['0', '1', '2', '3', '4'],
    initialValue: '0',
  );
  bool preclude = false;

  Map<String, String> resultsField = initResultMap();

  /*var data = CompleteData(
    tumourNumber: '0',
    tumourSize: [0, 0, 0, 0, 0, 0],
    tumourExtent: '<=50%',
    pvi: 'no',
    nodes: 'no',
    metastasis: 'no',
    portalHypertension: 'no',
    pvt: 'no',
    bilirubin: 0,
    inr: 0,
    creatinine: 0,
    albumin: 0,
    sodium: 0,
    platelets: 0,
    afp: 0,
    ast: [0, 0],
    alp: [0, 0],
    dialysis: 'no',
    cirrhosis: 'no',
    encephalopaty: 'none_fem',
    ascites: 'none_fem',
    varices: 'no',
    ecog: '0',
    results: initResultMap(),
  );*/

  @override
  List<FieldBloc> get fieldBlocs => [
    tumourNumberField,
    tumourSizeField[0],
    tumourSizeField[1],
    tumourSizeField[2],
    tumourSizeField[3],
    tumourSizeField[4],
    tumourSizeField[5],
    tumourExtentField,
    pviField,
    nodesField,
    metastasisField,
    portalHypertensionField,
    pvtField,
        bilirubinField,
    inrField,
    creatinineField,
        albuminField,
    sodiumField,
    plateletsField,
    afpField,
    astField[0],
    astField[1],
    alpField[0],
    alpField[1],
    dialysisField,
    cirrhosisField,
    encephalopatyField,
    ascitesField,
    varicesField,
    ecogField,
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    print("inicio submit");

    this.preclude = true;
    print(preclude.toString());
    this.resultsField['okuda'] = 'prueba';
    //showObjectCompleteData();
    showFields();

    /*data = CompleteData(
      tumourNumber: tumourNumberField.value,
      tumourSize: [
        tumourSizeField[0].valueToDouble,
        tumourSizeField[1].valueToDouble,
        tumourSizeField[2].valueToDouble,
        tumourSizeField[3].valueToDouble,
        tumourSizeField[4].valueToDouble,
        tumourSizeField[5].valueToDouble,
      ],
      tumourExtent: tumourExtentField.value,
      pvi: pviField.value,
      nodes: nodesField.value,
      metastasis: metastasisField.value,
      portalHypertension: portalHypertensionField.value,
      pvt: pvtField.value,
      bilirubin: bilirubinField.valueToDouble,
      inr: inrField.valueToDouble,
      creatinine: creatinineField.valueToDouble,
      albumin: albuminField.valueToDouble,
      sodium: sodiumField.valueToDouble,
      platelets: 0,
      afp: afpField.valueToDouble,
      ast: [
        astField[0].valueToDouble,
        astField[1].valueToDouble,
      ],
      alp: [
        alpField[0].valueToDouble,
        alpField[1].valueToDouble,
      ],
      dialysis: dialysisField.value,
      cirrhosis: cirrhosisField.value,
      encephalopaty: encephalopatyField.value,
      ascites: ascitesField.value,
      varices: varicesField.value,
      ecog: ecogField.value,
    );*/

    //CompleteAlgorithm completeAlgorithm = CompleteAlgorithm(data);

    try {
      this.resultsField['okuda'] = (2 + 18).toString();
      /*Comprobacion
      * Si todos los campos de okuda están
      * crear objeto data okuda
      * this.results['okuda']=obtenerResultado(dataOkuda)
      * así con todos
       */
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

  /* void showObjectCompleteData() {
    print("\n\n*****************OBJETO OkudaDATA: "
            "\nbili: ${data.bilirubin}" +
        "\nalbu: ${data.albumin}" +
        "\nascites : ${data.ascites}" +
        "\nextension : ${data.tumourExtent}" +
        "\nresultado: ${data.results.toString()}" +
        "\n**************");
  }*/

  void showFields() {
    print("\n\n *********FIELD VALUES COMPLETE");
    print("Campo numero: " + tumourNumberField.value);
    print("Campo tamaño: " + tumourSizeField[0].value);
    print("Campo extension: " + tumourExtentField.value);
    print("Campo pvi: " + pviField.value);
    print("Campo nodos: " + nodesField.value);
    print("Campo metastasis: " + metastasisField.value);
    print("Campo portal hipertension: " + portalHypertensionField.value);
    print("Campo pvt: " + pvtField.value);

    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo creatinina: " + creatinineField.value);
    print("Campo albumina: " + albuminField.value);
    print("Campo sodio: " + sodiumField.value);
    print("Campo plaquetas: " + plateletsField.value);
    print("Campo afp: " + afpField.value);
    print("Campo ast: " + astField[0].value);
    print("Campo ast limite: " + astField[1].value);
    print("Campo alp: " + alpField[0].value);
    print("Campo alp limite: " + alpField[1].value);
    print("Campo dialisis: " + dialysisField.value);
    print("Campo cirrosis: " + cirrhosisField.value);
    print("Campo encefalopatia: " + encephalopatyField.value);
    print("Campo ascites: " + ascitesField.value);
    print("Campo varices: " + varicesField.value);
    print("Campo ecog: " + ecogField.value);

    print("Campo resultado antes de operar: " + resultsField.toString());
  }

  showNotIU() {
    //hacer para página lab
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
    //hacer para pagina lab
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

    this.resultsField = initResultMap();
  }

  void previous() {
    /*this.bilirubinField = TextFieldBloc(
      initialValue: data.bilirubin.toString(),
    );
    this.albuminField = TextFieldBloc(
      initialValue: data.albumin.toString(),
    );
    this.ascitesField = SelectFieldBloc(
      items: ['none_fem', 'controlled', 'refractory'],
      initialValue: data.ascites.toString(),
    );

    this.tumourExtentField = SelectFieldBloc(
      items: ['<=50%', '>50%'],
      initialValue: data.tumourExtent.toString(),
    );*/

    //this.results = data.results;

    print("\n*****AFTER PREVIOUS");
    showFields();
    //showFields();
  }

  static initResultMap() {
    return {
      'apri': '-',
      'child_pugh_score_oneline': '-',
      'meld': '-',
      'meld_na': '-',
      '5v_meld': '-',
      'okuda': '-',
      'clip': '-',
      'getch': '-',
      'tnm': '-',
      'cupi': '-',
      'bclc': '-',
    };
  }
}
