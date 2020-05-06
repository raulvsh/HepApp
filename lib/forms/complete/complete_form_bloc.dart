import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/child_pugh_score/cps_algorithm.dart';
import 'package:hepapp/forms/child_pugh_score/cps_data.dart';
import 'package:hepapp/forms/meld/meld_algorithm.dart';
import 'package:hepapp/forms/meld/meld_data.dart';
import 'package:hepapp/forms/okuda/okuda_algorithm.dart';
import 'package:hepapp/forms/okuda/okuda_data.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

class CompleteFormBloc extends FormBloc<String, String> {
  final prefs = UserSettings();
  final units = Units();

  //Diagnostic
  var tumourNumberField = SelectFieldBloc(
    items: ['0', '1', '2', '3', '4', '5', '6+'],
    initialValue: '-',
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
    initialValue: '-',
  );
  var pviField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: '-',
  );
  var nodesField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: '-',
  );
  var metastasisField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: '-',
  );
  var portalHypertensionField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: '-',
  );
  var pvtField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: '-',
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
  var alpField = [
    TextFieldBloc(initialValue: '0'),
    TextFieldBloc(initialValue: '0'),
  ];
  var dialysisField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: '-',
  );

  //Clinical
  var cirrhosisField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: '-',
  );
  var encephalopatyField = SelectFieldBloc(
    items: ['none_fem', 'grade_1_2', 'grade_3_4'],
    initialValue: '-',
  );
  var ascitesField = SelectFieldBloc(
    items: ['none_fem', 'controlled', 'refractory'],
    initialValue: '-',
  );
  var varicesField = SelectFieldBloc(
    items: ['yes', 'no'],
    initialValue: '-',
  );
  var ecogField = SelectFieldBloc(
    items: ['0', '1', '2', '3', '4'],
    initialValue: '-',
  );
  bool preclude = false;

  Map<String, String> resultsField = initResultMap();

/*  var okudaData = OkudaData(
    bilirubin: 0,
    albumin: 0,
    ascites: 'none_fem',
    tumourExtent: '<=50%',
    result: '-',
  );
  */

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

    //this.resultsField['apri'] = comprobarApri() ? calcularApri() : '-';
    this.resultsField['child_pugh_score_oneline'] =
    comprobarCPS() ? calcularCPS() : '-';
    this.resultsField['meld'] = comprobarMeld() ? calcularMeld()['meld'] : '-';
    this.resultsField['meld_na'] =
    comprobarMeld() && comprobarNa() ? calcularMeld()['meld_na'] : '-';
    this.resultsField['5v_meld'] =
    comprobarMeld() && comprobarAlb() ? calcularMeld()['5v_meld'] : '-';

    this.resultsField['okuda'] = comprobarOkuda() ? calcularOkuda() : '-';
    /*this.resultsField['clip'] = comprobarClip() ? calcularClip() : '-';
    this.resultsField['getch'] = comprobarGetch() ? calcularGetch() : '-';
    this.resultsField['tnm'] = comprobarTnm() ? calcularTnm() : '-';
    this.resultsField['cupi'] = comprobarCupi() ? calcularCupi() : '-';
    this.resultsField['bclc'] = comprobarBclc() ? calcularBclc() : '-';*/

    //OKUDA
    /*print("comprobar " + comprobarOkuda().toString());
    print("calcular " + calcularOkuda().toString());
    print("resultado okuda " + this.resultsField['okuda']);*/

    //print("pvi field" + this.pviField.value);

    //showObjectCompleteData();
    //showFields();

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
      // this.resultsField['okuda'] = (2 + 18).toString();
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

  bool comprobarApri() {}

  calcularApri() {}

  bool comprobarCPS() {
    print("\n*****COMPROBAR cps");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);

    print("Campo albumina: " + albuminField.value);
    print("Campo ence: " + encephalopatyField.value);
    print("Campo ASCI: " + ascitesField.value);

    if (bilirubinField.value != '0' &&
        inrField.value != '0' &&
        albuminField.value != '0' &&
        encephalopatyField.value != '-' &&
        ascitesField.value != '-')
      return true;
    else
      return false;
  }

  calcularCPS() {
    var cpsData = CpsData(
      bilirubin: bilirubinField.valueToDouble,
      inr: inrField.valueToDouble,
      albumin: albuminField.valueToDouble,
      encephalopaty: encephalopatyField.value,
      ascites: ascitesField.value,
    );

    CpsAlgorithm cpsAlgorithm = CpsAlgorithm(cpsData);

    return cpsAlgorithm.obtenerResultado();

    // OkudaAlgorithm okudaAlgorithm = OkudaAlgorithm(okudaData);

    // return okudaAlgorithm.obtenerResultado();
  }

  bool comprobarMeld() {
    print("\n*****COMPROBAR meld");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo creat: " + creatinineField.value);
    print("campo sodio: " + sodiumField.value);
    print("campo albumina: " + albuminField.value);

    if (bilirubinField.value != '0' &&
        inrField.value != '0' &&
        creatinineField.value != '0')
      return true;
    else
      return false;
  }

  bool comprobarNa() {
    print("\n*****comprobar sodio");
    print("Campo sodio: " + sodiumField.value);
    if (sodiumField.value != '0')
      return true;
    else
      return false;
  }

  bool comprobarAlb() {
    print("\n****comprobar albumina");
    print("Campo albumina: " + albuminField.value);
    if (albuminField.value != '0')
      return true;
    else
      return false;
  }

  calcularMeld() {
    var meldData = MeldData(
      bilirubin: bilirubinField.valueToDouble,
      inr: inrField.valueToDouble,
      creatinine: creatinineField.valueToDouble,
      albumin: albuminField.valueToDouble,
      sodium: sodiumField.valueToDouble,

    );

    MeldAlgorithm meldAlgorithm = MeldAlgorithm(meldData);

    return meldAlgorithm.obtenerResultado();
  }

  bool comprobarOkuda() {
    if (bilirubinField.value != '0' &&
        albuminField.value != '0' &&
        ascitesField.value != '-' &&
        tumourExtentField.value != '-')
      return true;
    else
      return false;
  }

  calcularOkuda() {
    var okudaData = OkudaData(
      bilirubin: bilirubinField.valueToDouble,
      albumin: albuminField.valueToDouble,
      ascites: ascitesField.value,
      tumourExtent: tumourExtentField.value,
    );
    /*    print("\n*****CALCULAR OKUDA");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo albumina: " + albuminField.value);
    print("Campo ascites: " + ascitesField.value);
    print("Campo extension: " + tumourExtentField.value);
    print("Campo result: " + resultsField.toString());*/
    OkudaAlgorithm okudaAlgorithm = OkudaAlgorithm(okudaData);

    return okudaAlgorithm.obtenerResultado();
  }

  bool comprobarClip() {}

  calcularClip() {}

  bool comprobarGetch() {}

  calcularGetch() {}

  bool comprobarTnm() {}

  calcularTnm() {}

  bool comprobarCupi() {}

  calcularCupi() {}

  bool comprobarBclc() {}

  calcularBclc() {}
}
