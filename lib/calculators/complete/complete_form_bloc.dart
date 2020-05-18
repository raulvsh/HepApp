import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/calculators/child_pugh_score/cps_algorithm.dart';
import 'package:hepapp/calculators/child_pugh_score/cps_data.dart';
import 'package:hepapp/calculators/clip/clip_algorithm.dart';
import 'package:hepapp/calculators/clip/clip_data.dart';
import 'package:hepapp/calculators/complete/complete_data.dart';
import 'package:hepapp/calculators/meld/meld_algorithm.dart';
import 'package:hepapp/calculators/meld/meld_data.dart';
import 'package:hepapp/calculators/okuda/okuda_algorithm.dart';
import 'package:hepapp/calculators/okuda/okuda_data.dart';
import 'package:hepapp/calculators/other_algorithms/apri_algorithm.dart';
import 'package:hepapp/calculators/other_algorithms/apri_data.dart';
import 'package:hepapp/calculators/other_algorithms/bclc_algorithm.dart';
import 'package:hepapp/calculators/other_algorithms/bclc_data.dart';
import 'package:hepapp/calculators/other_algorithms/cupi_algorithm.dart';
import 'package:hepapp/calculators/other_algorithms/cupi_data.dart';
import 'package:hepapp/calculators/other_algorithms/getch_algorithm.dart';
import 'package:hepapp/calculators/other_algorithms/getch_data.dart';
import 'package:hepapp/calculators/other_algorithms/tnm_algorithm.dart';
import 'package:hepapp/calculators/other_algorithms/tnm_data.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

class CompleteFormBloc extends FormBloc<String, String> {
  final prefs = UserSettings();
  final units = Units();

  //Diagnostic
  var tumourNumberField = SelectFieldBloc(
    items: ['0', '1', '2', '3', '4', '5', '6+'],
    initialValue: '-1',
  );
  var tumourSizeField = [
    TextFieldBloc(initialValue: '0'),
    TextFieldBloc(initialValue: '0'),
    TextFieldBloc(initialValue: '0'),
    TextFieldBloc(initialValue: '0'),
    TextFieldBloc(initialValue: '0'),
    TextFieldBloc(initialValue: '0'),
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

  var diagnosticData = DiagnosticData(
    tumourNumber: '-',
    tumourSize: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0],
    tumourExtent: '-',
    pvi: '-',
    nodes: '-',
    metastasis: '-',
    portalHypertension: '-',
    pvt: '-',
  );

  Map<String, String> resultsField = initResultMap();

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

    this.resultsField['apri'] = comprobarApri() ? calcularApri() : '-';
    this.resultsField['child_pugh_score_oneline'] =
    comprobarCPS() ? calcularCPS() : '-';
    this.resultsField['meld'] = comprobarMeld() ? calcularMeld()['meld'] : '-';
    this.resultsField['meld_na'] =
    comprobarMeld() && comprobarNa() ? calcularMeld()['meld_na'] : '-';
    this.resultsField['5v_meld'] =
    comprobarMeld() && comprobarAlb() ? calcularMeld()['5v_meld'] : '-';

    this.resultsField['okuda'] = comprobarOkuda() ? calcularOkuda() : '-';
    this.resultsField['clip'] =
    comprobarCPS() && comprobarClip() ? calcularClip() : '-';
    this.resultsField['getch'] = comprobarGetch() ? calcularGetch() : '-';
    this.resultsField['tnm'] = comprobarTnm() ? calcularTnm() : '-';
    this.resultsField['cupi'] =
    comprobarTnm() && comprobarCupi() ? calcularCupi() : '-';
    this.resultsField['bclc'] =
    comprobarBclc() && comprobarCPS() ? calcularBclc() : '-';

    await Future<void>.delayed(Duration(seconds: 1));

    yield currentState.toSuccess('Success');
    //yield toLoaded para poder hacer submit más de una vez
    yield currentState.toLoaded();
  }

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

  showNotIU() {}

  void showIU() {}

  resetDiagnostic() {
    diagnosticData = DiagnosticData(
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
    );
    printObjectData();
    this.tumourNumberField.updateValue('-1');
    /*  this.tumourNumberField = SelectFieldBloc(
      items: ['0', '1', '2', '3', '4', '5', '6+'],
      initialValue: '-',
    );*/
    this.tumourSizeField[0].updateValue('0');
    this.tumourSizeField[1].updateValue('0');
    this.tumourSizeField[2].updateValue('0');
    this.tumourSizeField[3].updateValue('0');
    this.tumourSizeField[4].updateValue('0');
    this.tumourSizeField[5].updateValue('0');

    /*this.tumourSizeField = [
      TextFieldBloc(initialValue: '0'),
      TextFieldBloc(initialValue: '0'),
      TextFieldBloc(initialValue: '0'),
      TextFieldBloc(initialValue: '0'),
      TextFieldBloc(initialValue: '0'),
      TextFieldBloc(initialValue: '0'),
    ];*/
    this.tumourExtentField.updateValue('-');
    /* this.tumourExtentField = SelectFieldBloc(
      items: ['<=50%', '>50%'],
      initialValue: '-',
    );*/
    this.pviField.updateValue('-');
    /*this.pviField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: '-',
    );*/
    this.nodesField.updateValue('-');
    /*this.nodesField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: '-',
    );*/
    this.metastasisField.updateValue('-');
    /*this.metastasisField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: '-',
    );*/
    this.portalHypertensionField.updateValue('-');
    /*this.portalHypertensionField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: '-',
    );*/
    this.pvtField.updateValue('-');


    /*this.pvtField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: '-',
    );*/
  }

  void printObjectData() {
    print(diagnosticData.tumourNumber);
    print(diagnosticData.tumourSize.toString());
    print(diagnosticData.tumourExtent);
    print(diagnosticData.pvi);
    print(diagnosticData.nodes);
    print(diagnosticData.metastasis);
    print(diagnosticData.portalHypertension);
    print(diagnosticData.pvt);
  }

  void previousDiagnostic() {
    printObjectData();
    print("numero desde field " + tumourNumberField.value);
    //this.tumourNumberField.updateInitialValue(diagnosticData.tumourNumber.toString());
    this.tumourNumberField.updateValue(diagnosticData.tumourNumber.toString());
    if (diagnosticData.tumourNumber == '6+') {
      prefs.setTumourNumber(6);
    } else {
      prefs.setTumourNumber(int.parse(diagnosticData.tumourNumber));
    }

    /*this.tumourNumberField = SelectFieldBloc(
      items: ['0', '1', '2', '3', '4', '5', '6+'],
      initialValue: diagnosticData.tumourNumber,
    );*/
    print("numero despues " + tumourNumberField.value);
    print("numero data " + diagnosticData.tumourNumber);
    this.tumourSizeField[0].updateValue(
        diagnosticData.tumourSize[0].toString());
    this.tumourSizeField[1].updateValue(
        diagnosticData.tumourSize[1].toString());
    this.tumourSizeField[2].updateValue(
        diagnosticData.tumourSize[2].toString());
    this.tumourSizeField[3].updateValue(
        diagnosticData.tumourSize[3].toString());
    this.tumourSizeField[4].updateValue(
        diagnosticData.tumourSize[4].toString());
    this.tumourSizeField[5].updateValue(
        diagnosticData.tumourSize[5].toString());

    print("tamaño despues " + tumourSizeField[0].value.toString());
    print("tamaño despues " + tumourSizeField[1].value);
    print("tamaño despues " + tumourSizeField[2].value);


    /*this.tumourSizeField = [
      TextFieldBloc(initialValue: diagnosticData.tumourSize[0].toString()),
      TextFieldBloc(initialValue: diagnosticData.tumourSize[1].toString()),
      TextFieldBloc(initialValue: diagnosticData.tumourSize[2].toString()),
      TextFieldBloc(initialValue: diagnosticData.tumourSize[3].toString()),
      TextFieldBloc(initialValue: diagnosticData.tumourSize[4].toString()),
      TextFieldBloc(initialValue: diagnosticData.tumourSize[5].toString()),
    ];*/
    this.tumourExtentField.updateValue(diagnosticData.tumourExtent);
    /* this.tumourExtentField = SelectFieldBloc(
      items: ['<=50%', '>50%'],
      initialValue: diagnosticData.tumourExtent,
    );*/
    this.pviField.updateValue(diagnosticData.pvi);
    /* this.pviField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: diagnosticData.pvi,
    );*/
    this.nodesField.updateValue(diagnosticData.nodes);
    /*this.nodesField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: diagnosticData.nodes,
    );*/
    this.metastasisField.updateValue(diagnosticData.metastasis);
    /*this.metastasisField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: diagnosticData.metastasis,
    );*/
    this.portalHypertensionField.updateValue(diagnosticData.portalHypertension);
    /*this.portalHypertensionField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: diagnosticData.portalHypertension,
    );*/
    this.pvtField.updateValue(diagnosticData.pvt);
    /* this.pvtField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: diagnosticData.pvt,
    );*/
    print("after previous");
    printObjectData();

  }

  resetLaboratory() {
    diagnosticData = DiagnosticData(
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
    );
    printObjectData();

    this.tumourNumberField = SelectFieldBloc(
      items: ['0', '1', '2', '3', '4', '5', '6+'],
      initialValue: '-',
    );

    this.tumourSizeField = [
      TextFieldBloc(initialValue: '0'),
      TextFieldBloc(initialValue: '0'),
      TextFieldBloc(initialValue: '0'),
      TextFieldBloc(initialValue: '0'),
      TextFieldBloc(initialValue: '0'),
      TextFieldBloc(initialValue: '0'),
    ];
    this.tumourExtentField = SelectFieldBloc(
      items: ['<=50%', '>50%'],
      initialValue: '-',
    );
    this.pviField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: '-',
    );
    this.nodesField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: '-',
    );
    this.metastasisField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: '-',
    );
    this.portalHypertensionField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: '-',
    );
    this.pvtField = SelectFieldBloc(
      items: ['yes', 'no'],
      initialValue: '-',
    );
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

  bool comprobarApri() {
/*    print("\n*****COMPROBAR APRI");
    print("Campo AST: " + astField[0].value);
    print("Campo ast limite: " + astField[1].value);
    print("Campo plaquetas: " + plateletsField.value);*/

    if (astField[0].value != '0' &&
        astField[1].value != '0' &&
        plateletsField.value != '0')
      return true;
    else
      return false;
  }

  calcularApri() {
    var apriData = ApriData(
      ast: astField[0].valueToDouble,
      astUpperLimit: astField[1].valueToDouble,
      platelets: plateletsField.valueToDouble,
    );

    ApriAlgorithm apriAlgorithm = ApriAlgorithm(apriData);

    return apriAlgorithm.obtenerResultado();
  }

  bool comprobarCPS() {
    /*  print("\n*****COMPROBAR cps");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);

    print("Campo albumina: " + albuminField.value);
    print("Campo ence: " + encephalopatyField.value);
    print("Campo ascites: " + ascitesField.value);*/

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
    /* print("\n*****COMPROBAR meld");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo creat: " + creatinineField.value);
    print("campo sodio: " + sodiumField.value);
    print("campo albumina: " + albuminField.value);*/

    if (bilirubinField.value != '0' &&
        inrField.value != '0' &&
        creatinineField.value != '0')
      return true;
    else
      return false;
  }

  bool comprobarNa() {
/*    print("\n*****comprobar sodio");
    print("Campo sodio: " + sodiumField.value);*/
    if (sodiumField.value != '0')
      return true;
    else
      return false;
  }

  bool comprobarAlb() {
    /*print("\n****comprobar albumina");
    print("Campo albumina: " + albuminField.value);*/
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

  bool comprobarClip() {
    if (tumourNumberField.value != '0' &&
        pvtField.value != '0' &&
        afpField.value != '-' &&
        tumourExtentField.value != '-')
      return true;
    else
      return false;
  }

  calcularClip() {
    //String cps = calcularCPS();

    var clipData = ClipData(
      afp: afpField.valueToDouble,
      cps: calcularCPS()[0],
      tumourNumber: tumourNumberField.value,
      tumourExtent: tumourExtentField.value,
      pvt: pvtField.value,
    );
    /*print("\n*****CALCULAR CLIP");
    print("Campo AFP: " + afpField.value);
    print("Campo cps: " + cps);
    print("Campo numero: " + tumourNumberField.value);
    print("Campo extension: " + tumourExtentField.value);
    print("Campo pvt: " + pvtField.toString());*/
    ClipAlgorithm clipAlgorithm = ClipAlgorithm(clipData);
    //print("resultado " + clipAlgorithm.obtenerResultado());
    return clipAlgorithm.obtenerResultado();
  }

  bool comprobarGetch() {
    if (ecogField.value != '-' &&
        bilirubinField.value != '0' &&
        alpField[0].value != '0' &&
        alpField[1].value != '0' &&
        afpField.value != '0' &&
        pvtField.value != '0')
      return true;
    else
      return false;
  }

  calcularGetch() {
    var getchData = GetchData(
      ecog: ecogField.value,
      bilirubin: bilirubinField.valueToDouble,
      alp: alpField[0].valueToDouble,
      alpUpperLimit: alpField[1].valueToDouble,
      afp: afpField.valueToDouble,
      pvt: pvtField.value,
    );
    GetchAlgorithm getchAlgorithm = GetchAlgorithm(getchData);
    return getchAlgorithm.obtenerResultado();
  }

  bool comprobarTnm() {
    if (tumourNumberField.value != '-' &&
        pviField.value != '0' &&
        nodesField.value != '-' &&
        metastasisField.value != '-')
      return true;
    else
      return false;
  }

  calcularTnm() {
    var tnmData = TnmData(
      tumourNumber: ecogField.value,
      pvi: pviField.value,
      nodes: nodesField.value,
      metastasis: metastasisField.value,
    );
    TnmAlgorithm tnmAlgorithm = TnmAlgorithm(tnmData);
    return tnmAlgorithm.obtenerResultado();
  }

  bool comprobarCupi() {
    if (ascitesField.value != '-' &&
        afpField.value != '0' &&
        bilirubinField.value != '0' &&
        alpField[0].value != '0' &&
        ecogField.value != '0')
      return true;
    else
      return false;
  }

  calcularCupi() {
    String tnm = calcularTnm();

    var cupiData = CupiData(
      tnm: tnm,
      ascites: ascitesField.value,
      afp: afpField.valueToDouble,
      bilirubin: bilirubinField.valueToDouble,
      alp: alpField[0].valueToDouble,
      ecog: ecogField.value,
    );
    print("\n*****CALCULAR CUPI");
    print("Campo TNM: " + tnm);
    print("Campo ascites: " + ascitesField.value);
    print("Campo afp: " + afpField.value);
    print("Campo bilirubin: " + bilirubinField.value);
    print("Campo alp: " + alpField[0].toString());
    print("Campo alp limit: " + alpField[1].toString());

    print("Campo ecog: " + ecogField.value);

    CupiAlgorithm cupiAlgorithm = CupiAlgorithm(cupiData);
    //print("resultado " + cupiAlgorithm.obtenerResultado());
    return cupiAlgorithm.obtenerResultado();
  }

  bool comprobarBclc() {
    if (tumourNumberField.value != '-' &&
        pviField.value != '-' &&
        nodesField.value != '-' &&
        metastasisField.value != '-' &&
        ecogField.value != '-') {
      return comprobarTumourSize(tumourNumberField.value) ? true : false;
    }
    return false;
  }

  comprobarTumourSize(String tumourNumber) {
    int tN = int.parse(tumourNumber);
    //print("tumour number $tN");
    //print(tumourSizeField.toString());
    for (int i = 0; i < tN; i++) {
      if (tumourSizeField[i].value == '0') {
        print("tamaño tumor $i " +
            tumourSizeField[i].value.toString() +
            " salgo falso");
        return false;
      }
    }
    return true;
  }

  calcularBclc() {
    String cps = calcularCPS();

    var bclcData = BclcData(
      tumourNumber: tumourNumberField.value,
      tumourSize: getTumourSize(),
      //tumourSizeField.toList(),
      pvi: pviField.value,
      nodes: nodesField.value,
      metastasis: metastasisField.value,
      ecog: ecogField.value,
      cps: cps,
    );

    /*print("\n*****CALCULAR bclc");
    print("Campo numero de tumores: ${tumourNumberField.value}");
    print("Campo tamaño de tumores: ${tumourSizeField.toString()}");
    print("Campo pvi: ${nodesField.toString()}");
    print("Campo metastasis: ${metastasisField.toString()}");
    print("Campo ecog: ${ecogField.toString()}");
    print("Campo cps: " + cps);*/

    BclcAlgorithm bclcAlgorithm = BclcAlgorithm(bclcData);
    //print("resultado " + cupiAlgorithm.obtenerResultado());
    return bclcAlgorithm.obtenerResultado();
  }

  getTumourSize() {
    List<double> tumourSizeList = [];
    for (int i = 0; i < tumourSizeField.length; i++) {
      tumourSizeList.add(double.parse(tumourSizeField[i].value));
    }
    return tumourSizeList;
  }
}
