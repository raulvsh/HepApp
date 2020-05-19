import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/calculators/child_pugh_score/cps_algorithm.dart';
import 'package:hepapp/calculators/child_pugh_score/cps_data.dart';
import 'package:hepapp/calculators/clip/clip_algorithm.dart';
import 'package:hepapp/calculators/clip/clip_data.dart';
import 'package:hepapp/calculators/complete/clinical_data.dart';
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

import 'diagnostic_data.dart';
import 'laboratory_data.dart';

class CompleteFormBloc extends FormBloc<String, String> {
  bool debug = true;
  final prefs = UserSettings();
  final units = Units();

  //Diagnostic
  var tumourNumberField = SelectFieldBloc(
    items: ['0', '1', '2', '3', '4', '5', '6+'],
    initialValue: '-',
  );
  var tumourSizeField = [
    TextFieldBloc(),
    TextFieldBloc(),
    TextFieldBloc(),
    TextFieldBloc(),
    TextFieldBloc(),
    TextFieldBloc(),
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
  var bilirubinField = TextFieldBloc();
  var inrField = TextFieldBloc();
  var creatinineField = TextFieldBloc();
  var albuminField = TextFieldBloc();
  var sodiumField = TextFieldBloc();
  var plateletsField = TextFieldBloc();
  var afpField = TextFieldBloc();
  var astField = [TextFieldBloc(), TextFieldBloc()];
  var alpField = [TextFieldBloc(), TextFieldBloc()];
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

  var laboratoryData = LaboratoryData(
    bilirubin: 0.0,
    inr: 0.0,
    creatinine: 0.0,
    albumin: 0.0,
    sodium: 0.0,
    platelets: 0.0,
    afp: 0.0,
    ast: [0.0, 0.0],
    alp: [0.0, 0.0],
    dialysis: '-',
  );

  var clinicalData = ClinicalData(
    cirrhosis: '-',
    encephalopaty: '-',
    ascites: '-',
    varices: '-',
    ecog: '-',
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

  showNotIU() {}

  void showIU() {}

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
    if (debug) printApri();
    ApriAlgorithm apriAlgorithm = ApriAlgorithm(apriData);
    return apriAlgorithm.obtenerResultado();
  }

  void printApri() {
    print("\n*****CALCULAR APRI");
    print("Campo AST: " + astField[0].value);
    print("Campo ast limite: " + astField[1].value);
    print("Campo plaquetas: " + plateletsField.value);
  }

  bool comprobarCPS() {
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
    if (debug) printCps();
    CpsAlgorithm cpsAlgorithm = CpsAlgorithm(cpsData);
    return cpsAlgorithm.obtenerResultado();
  }

  void printCps() {
    print("\n*****CALCULAR cps");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo albumina: " + albuminField.value);
    print("Campo ence: " + encephalopatyField.value);
    print("Campo ascites: " + ascitesField.value);
  }

  bool comprobarMeld() {
    if (bilirubinField.value != '0' &&
        inrField.value != '0' &&
        creatinineField.value != '0')
      return true;
    else
      return false;
  }

  bool comprobarNa() {
    if (sodiumField.value != '0')
      return true;
    else
      return false;
  }

  bool comprobarAlb() {
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
    if (debug) printMeld();
    MeldAlgorithm meldAlgorithm = MeldAlgorithm(meldData);
    return meldAlgorithm.obtenerResultado();
  }

  void printMeld() {
    print("\n*****CALCULAR meld");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo creat: " + creatinineField.value);
    print("campo sodio: " + sodiumField.value);
    print("campo albumina: " + albuminField.value);
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
    if (debug) printOkuda();
    OkudaAlgorithm okudaAlgorithm = OkudaAlgorithm(okudaData);
    return okudaAlgorithm.obtenerResultado();
  }

  void printOkuda() {
    print("\n*****CALCULAR OKUDA");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo albumina: " + albuminField.value);
    print("Campo ascites: " + ascitesField.value);
    print("Campo extension: " + tumourExtentField.value);
    print("Campo result: " + resultsField.toString());
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
    var clipData = ClipData(
      afp: afpField.valueToDouble,
      cps: calcularCPS()[0],
      tumourNumber: tumourNumberField.value,
      tumourExtent: tumourExtentField.value,
      pvt: pvtField.value,
    );
    if (debug) printClip();
    ClipAlgorithm clipAlgorithm = ClipAlgorithm(clipData);
    return clipAlgorithm.obtenerResultado();
  }

  void printClip() {
    print("\n*****CALCULAR CLIP");
    print("Campo AFP: " + afpField.value);
    print("Campo cps: " + calcularCPS());
    print("Campo numero: " + tumourNumberField.value);
    print("Campo extension: " + tumourExtentField.value);
    print("Campo pvt: " + pvtField.toString());
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
    if (debug) printCupi(tnm);
    CupiAlgorithm cupiAlgorithm = CupiAlgorithm(cupiData);
    return cupiAlgorithm.obtenerResultado();
  }

  void printCupi(String tnm) {
    print("\n*****CALCULAR CUPI");
    print("Campo TNM: " + tnm);
    print("Campo ascites: " + ascitesField.value);
    print("Campo afp: " + afpField.value);
    print("Campo bilirubin: " + bilirubinField.value);
    print("Campo alp: " + alpField[0].toString());
    print("Campo alp limit: " + alpField[1].toString());
    print("Campo ecog: " + ecogField.value);
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
    for (int i = 0; i < tN; i++) {
      if (tumourSizeField[i].value == '0') {
        print("tumor $i " + tumourSizeField[i].value.toString() + " falso");
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
      pvi: pviField.value,
      nodes: nodesField.value,
      metastasis: metastasisField.value,
      ecog: ecogField.value,
      cps: cps,
    );
    if (debug) printBclc(cps);
    BclcAlgorithm bclcAlgorithm = BclcAlgorithm(bclcData);
    return bclcAlgorithm.obtenerResultado();
  }

  void printBclc(cps) {
    print("\n*****CALCULAR bclc");
    print("Campo numero de tumores: ${tumourNumberField.value}");
    print("Campo tamaño de tumores: ${tumourSizeField.toString()}");
    print("Campo pvi: ${nodesField.toString()}");
    print("Campo metastasis: ${metastasisField.toString()}");
    print("Campo ecog: ${ecogField.toString()}");
    print("Campo cps: " + cps);
  }

  getTumourSize() {
    List<double> tumourSizeList = [];
    for (int i = 0;
    i < prefs.getTumourNumber() /*tumourSizeField.length*/;
    i++) {
      tumourSizeList.add(double.parse(tumourSizeField[i].value));
    }
    return tumourSizeList;
  }

  resetDiagnostic() {
    diagnosticData = DiagnosticData(
      tumourNumber: tumourNumberField.value,
      tumourSize: getTumourSize(),
      tumourExtent: tumourExtentField.value,
      pvi: pviField.value,
      nodes: nodesField.value,
      metastasis: metastasisField.value,
      portalHypertension: portalHypertensionField.value,
      pvt: pvtField.value,
    );

    this.tumourNumberField.updateValue('-1');
    this.tumourSizeField[0].updateValue('0');
    this.tumourSizeField[1].updateValue('0');
    this.tumourSizeField[2].updateValue('0');
    this.tumourSizeField[3].updateValue('0');
    this.tumourSizeField[4].updateValue('0');
    this.tumourSizeField[5].updateValue('0');
    this.tumourExtentField.updateValue('-');
    this.pviField.updateValue('-');
    this.nodesField.updateValue('-');
    this.metastasisField.updateValue('-');
    this.portalHypertensionField.updateValue('-');
    this.pvtField.updateValue('-');

    if (debug) {
      print("\nReset diagnostic");
      printDiagnosticData();
      printDiagnosticFields();
    }
  }

  void previousDiagnostic() {
    this.tumourNumberField.updateValue(diagnosticData.tumourNumber.toString());
    if (diagnosticData.tumourNumber == '6+') {
      prefs.setTumourNumber(6);
    } else if (diagnosticData.tumourNumber == '-') {
      prefs.setTumourNumber(0);
    } else {
      prefs.setTumourNumber(int.parse(diagnosticData.tumourNumber));
    }

    for (int i = 0; i < prefs.getTumourNumber(); i++) {
      this
          .tumourSizeField[i]
          .updateValue(diagnosticData.tumourSize[i].toString());
    }
    this.tumourExtentField.updateValue(diagnosticData.tumourExtent);
    this.pviField.updateValue(diagnosticData.pvi);
    this.nodesField.updateValue(diagnosticData.nodes);
    this.metastasisField.updateValue(diagnosticData.metastasis);
    this.portalHypertensionField.updateValue(diagnosticData.portalHypertension);
    this.pvtField.updateValue(diagnosticData.pvt);
    if (debug) {
      print("\nPrevious diagnostic");
      printDiagnosticData();
      printDiagnosticFields();
    }
  }

  void printDiagnosticData() {
    print("\nObjeto Diagnostic Data:");
    print(diagnosticData.tumourNumber);
    print(diagnosticData.tumourSize.toString());
    print(diagnosticData.tumourExtent);
    print(diagnosticData.pvi);
    print(diagnosticData.nodes);
    print(diagnosticData.metastasis);
    print(diagnosticData.portalHypertension);
    print(diagnosticData.pvt);
  }

  void printDiagnosticFields() {
    print("\nCampos Diagnósitco:");
    print(tumourNumberField.value);
    for (int i = 0; i < tumourSizeField.length; i++)
      print(tumourSizeField[i].value);
    print(tumourExtentField.value);
    print(pviField.value);
    print(nodesField.value);
    print(metastasisField.value);
    print(portalHypertensionField.value);
    print(pvtField.value);
  }

  resetLaboratory() {
    laboratoryData = LaboratoryData(
      bilirubin: bilirubinField.valueToDouble,
      inr: inrField.valueToDouble,
      creatinine: creatinineField.valueToDouble,
      albumin: albuminField.valueToDouble,
      sodium: sodiumField.valueToDouble,
      platelets: plateletsField.valueToDouble,
      afp: afpField.valueToDouble,
      ast: [astField[0].valueToDouble, astField[1].valueToDouble],
      alp: [alpField[0].valueToDouble, alpField[1].valueToDouble],
      dialysis: dialysisField.value,
    );
    this.bilirubinField.clear();
    this.inrField.clear();
    this.creatinineField.clear();
    this.albuminField.clear();
    this.sodiumField.clear();
    this.plateletsField.clear();
    this.afpField.clear();
    this.astField[0].clear();
    this.astField[1].clear();
    this.alpField[0].clear();
    this.alpField[1].clear();
    this.dialysisField.updateValue('-');

    if (debug) {
      print("\nReset laboratory");
      printLaboratoryData();
      printLaboratoryFields();
    }
  }

  void previousLaboratory() {
    this.bilirubinField.updateValue(laboratoryData.bilirubin.toString());
    this.inrField.updateValue(laboratoryData.inr.toString());
    this.creatinineField.updateValue(laboratoryData.creatinine.toString());
    this.albuminField.updateValue(laboratoryData.albumin.toString());
    this.sodiumField.updateValue(laboratoryData.sodium.toString());
    this.plateletsField.updateValue(laboratoryData.platelets.toString());
    this.afpField.updateValue(laboratoryData.afp.toString());
    this.astField[0].updateValue(laboratoryData.ast[0].toString());
    this.astField[1].updateValue(laboratoryData.ast[1].toString());
    this.alpField[0].updateValue(laboratoryData.alp[0].toString());
    this.alpField[1].updateValue(laboratoryData.alp[1].toString());
    this.dialysisField.updateValue(laboratoryData.dialysis.toString());

    if (debug) {
      print("\nPrevious laboratory");
      printLaboratoryData();
      printLaboratoryFields();
    }
  }

  void printLaboratoryData() {
    print("\nObjeto Laboratory Data:");
    print(laboratoryData.bilirubin);
    print(laboratoryData.inr);
    print(laboratoryData.creatinine);
    print(laboratoryData.albumin);
    print(laboratoryData.sodium);
    print(laboratoryData.platelets);
    print(laboratoryData.afp);
    print(laboratoryData.ast.toString());
    print(laboratoryData.alp.toString());
    print(laboratoryData.dialysis);
  }

  void printLaboratoryFields() {
    print("\nCampos Laboratory:");
    print(bilirubinField.value);
    print(inrField.value);
    print(creatinineField.value);
    print(albuminField.value);
    print(sodiumField.value);
    print(plateletsField.value);
    print(afpField.value);
    print(astField[0].value);
    print(astField[1].value);
    print(alpField[0].value);
    print(alpField[1].value);
    print(dialysisField.value);
  }

  resetClinical() {
    clinicalData = ClinicalData(
      cirrhosis: cirrhosisField.value,
      encephalopaty: encephalopatyField.value,
      ascites: ascitesField.value,
      varices: varicesField.value,
      ecog: ecogField.value,
    );

    this.cirrhosisField.updateValue('-');
    this.encephalopatyField.updateValue('-');
    this.ascitesField.updateValue('-');
    this.varicesField.updateValue('-');
    this.ecogField.updateValue('-');

    if (debug) {
      print("\nReset clinical");
      printClinicalData();
      printClinicalFields();
    }
  }

  void previousClinical() {
    this.cirrhosisField.updateValue(clinicalData.cirrhosis.toString());
    this.encephalopatyField.updateValue(clinicalData.encephalopaty.toString());
    this.ascitesField.updateValue(clinicalData.ascites.toString());
    this.varicesField.updateValue(clinicalData.varices.toString());
    this.ecogField.updateValue(clinicalData.ecog.toString());

    if (debug) {
      print("\nPrevious clinical");
      printClinicalData();
      printClinicalFields();
    }
  }

  void printClinicalData() {
    print("\nObjeto Clinical Data:");
    print(clinicalData.cirrhosis);
    print(clinicalData.encephalopaty);
    print(clinicalData.ascites);
    print(clinicalData.varices);
    print(clinicalData.ecog);
  }

  void printClinicalFields() {
    print("\nCampos Clinical:");
    print(cirrhosisField.value);
    print(encephalopatyField.value);
    print(ascitesField.value);
    print(varicesField.value);
    print(ecogField.value);
  }
}
