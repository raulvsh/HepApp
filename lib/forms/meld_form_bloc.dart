import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/forms/meld_data.dart';
import 'package:hepapp/forms/units.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

class MeldFormBloc extends FormBloc<String, String> {
  final prefs = PreferenciasUsuario();
  final units = Units();

  ///Usadas por mi
  var bilirubinField = TextFieldBloc();
  var inrField = TextFieldBloc();
  var creatinineField = TextFieldBloc();

  var albuminField = TextFieldBloc();
  var sodiumField = TextFieldBloc();

  var encephalopatyField = SelectFieldBloc(
    items: ['none_fem', 'grade_1_2', 'grade_3_4'],
  );
  var ascitesField = SelectFieldBloc(
    items: ['none_fem', 'controlled', 'refractory'],
  );
  bool iUnits = true;
  var dialysisField = SelectFieldBloc(
    items: ['yes', 'no'],
  );
  String resultadoField = 'MELD';

  var data = MeldData(
      bilirubin: 0,
      inr: 0,
      creatinine: 0,
      albumin: 0,
      sodium: 0,
      dialysis: 'no',
      result: '-' //encephalopaty: 'none_fem',
      //ascites: 'none_fem',

      //result: 'CPS'
      );

  ///No usadas por mi (de momento) TODO LIMPIAR
  /* final tumourPercentageField = SelectFieldBloc(
    items: ['<=50%', '>50%'],
  );

  final booleanField = BooleanFieldBloc();


  final selectField1 = SelectFieldBloc(
    items: ['Option 1', 'Option 2', 'Option 3'],
  );

  final selectField2 = SelectFieldBloc(
    items: ['Option 1', 'Option 2'],
  );


  final multiSelectField = MultiSelectFieldBloc<String>(
    items: ['Option 1', 'Option 2', 'Option 3'],
  );*/

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

    showObjectMeldData();

    /*print(selectField1.value); //Dropdown menu
    print(multiSelectField.value);
    print(selectField2.value); //RadioButton
    print(booleanField.value);*/

    try {
      //data.result = obtenerResultado(data);
      this.resultadoField = obtenerResultado(data);
      //obtenerResultado(antiguo); //obtenerResultado(resultado);
      /*print("Campo resultado después de operar: " +
          resultadoField +
          " || " +
          antiguo.result);*/
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
    print("\n\n*****************OBJETO CPSDATA: "
            "\nbilirrubina : ${data.bilirubin}" +
        "\ninr : ${data.albumin}" +
        "\ncreatinina : ${data.creatinine}" +
        "\nalbumina : ${data.inr}" +
        "\nsodium : ${data.sodium}" +
        "\ndyalisis: ${data.dialysis}" +
        "\n**************");
  }

  void showFields() {
    print("\n\n *********FIELD VALUES");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo creatinina: " + creatinineField.value);
    print("Campo albumina: " + albuminField.value);
    print("Campo sodio: " + sodiumField.value);
    print("Campo dialysis: " + dialysisField.value);

    print("Campo resultado antes de operar: " + resultadoField);
  }

  String obtenerResultado(MeldData data /*fieldBlocs*/) {
    var ptsBilirubin;
    var ptsINR;
    var ptsCreatinine;
    var ptsAlbumin;
    var ptsSodium;
    var ptsDialysis;

    /*if(antiguo.bilirubin<=34){
      print("yujuuu " + antiguo.bilirubin.toString());
    }*/
    //TODO Aquí llamar a los métodos de convertir a unidades internacionales
    /*if(prefs.internationalUnits == false){
      antiguo.bilirubin = units.getConvertedBilirrubin(antiguo.bilirubin);
      antiguo.albumin = units.getConvertedAlbumin(antiguo.albumin);
    }*/
    //pasar a método externo
    //compruebo que esté en unidades interanacionales, si no, convierto
    if (!prefs.getInternationalUnits()) convertToIU();
    showObjectMeldData();

    if (data.bilirubin <= 34) {
      ptsBilirubin = 1;
    } else if (data.bilirubin <= 50) {
      ptsBilirubin = 2;
    } else {
      ptsBilirubin = 3;
    }

    if (data.inr <= 1.7) {
      ptsINR = 1;
    } else if (data.inr <= 2.2) {
      ptsINR = 2;
    } else {
      ptsINR = 3;
    }

    if (data.albumin <= 28) {
      ptsAlbumin = 3;
    } else if (data.albumin <= 35) {
      ptsAlbumin = 2;
    } else {
      ptsAlbumin = 1;
    }

    /*if (data.encephalopaty == 'none_fem') {
      ptsEncephalopaty = 1;
    } else if (data.encephalopaty == 'grade_1_2') {
      ptsEncephalopaty = 2;
    } else if (data.encephalopaty == 'grade_3_4') {
      ptsEncephalopaty = 3;
    }

    if (data.ascites == 'none_fem') {
      ptsAscites = 1;
    } else if (data.ascites == 'controlled') {
      ptsAscites = 2;
    } else if (data.ascites == 'refractory') {
      ptsAscites = 3;
    }*/

    obtenerPuntos(
      ptsBilirubin,
      ptsINR,
      ptsAlbumin,
    ); //ptsEncephalopaty, ptsAscites);

    int resultado =
        ptsBilirubin + ptsINR + ptsAlbumin; // + ptsEncephalopaty + ptsAscites;
    /*print('Resultado numérico: $resultado');*/
    if (resultado == 5 || resultado == 6) {
      return 'A ($resultado)';
    } else if (resultado >= 7 && resultado <= 9) {
      return 'B ($resultado)';
    } else {
      return 'C ($resultado)';
    }
  }

  void obtenerPuntos(
    ptsBilirubin,
    ptsINR,
    ptsAlbumin,
  ) {
    //}ptsEncephalopaty,
    //ptsAscites) {
    print("\n\n**********PUNTOS\nPuntos bilirrubina: $ptsBilirubin");
    print("Puntos inr: $ptsINR");
    print("Puntos albúmina: $ptsAlbumin");
    //print("Puntos encefalopatía: $ptsEncephalopaty");
    //print("Puntos ascitis: $ptsAscites");
  }

  void convertToIU() {
    //if (!prefs.getIunitsPrueba()) {
    data.bilirubin = units.getIUBilirrubin(data.bilirubin);
    data.albumin = units.getIUAlbumin(data.albumin);
    //}
  }

  showNotIU() {
    this.bilirubinField = TextFieldBloc(
      initialValue:
          units.getNotIUBilirrubin(data.bilirubin).toStringAsPrecision(2),
    );
    this.albuminField = TextFieldBloc(
      initialValue:
          units.getNotIUBilirrubin(data.albumin).toStringAsPrecision(2),
    );
    //data.bilirubin = 234234;
    //data.albumin = 123478;
  }

  void showIU() {
    this.bilirubinField = TextFieldBloc(
      initialValue: data.bilirubin.toStringAsPrecision(2),
    );
    this.albuminField = TextFieldBloc(
      initialValue: data.albumin.toStringAsPrecision(2),
    );
  }

  reset() {
    this.bilirubinField = TextFieldBloc();
    this.inrField = TextFieldBloc();
    this.albuminField = TextFieldBloc();
    this.encephalopatyField = SelectFieldBloc(
      items: ['none_fem', 'grade_1_2', 'grade_3_4'],
    );
    this.ascitesField = SelectFieldBloc(
      items: ['none_fem', 'controlled', 'refractory'],
    );
    this.resultadoField = "CPS";

    //showFields();
    //showObjectCPSData();
  }

  void previous() {
    this.bilirubinField = TextFieldBloc(
      initialValue: data.bilirubin.toString(),
    );
    this.inrField = TextFieldBloc(
      initialValue: data.inr.toString(),
    );
    this.albuminField = TextFieldBloc(
      initialValue: data.albumin.toString(),
    );
    /*this.encephalopatyField = SelectFieldBloc(
      items: ['none_fem', 'grade_1_2', 'grade_3_4'],
      initialValue: data.encephalopaty.toString(),
    );
    this.ascitesField = SelectFieldBloc(
      items: ['none_fem', 'controlled', 'refractory'],
      initialValue: data.ascites.toString(),
    );
*/
    this.resultadoField = data.result;

    print("\n*****AFTER PREVIOUS");
    print("bilirrubin: " + this.bilirubinField.value);
    print("INR: " + this.inrField.value);
    print("albumina: " + this.albuminField.value);
    //print("encefalopatia: " + this.encephalopatyField.value);
    //print("ascitis: " + this.ascitesField.value);
    print("resultado: " + this.resultadoField);
  }
}
