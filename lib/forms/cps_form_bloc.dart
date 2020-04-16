import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/forms/cps_algorithm.dart';
import 'package:hepapp/forms/cps_data.dart';
import 'package:hepapp/forms/units.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

class CpsFormBloc extends FormBloc<String, String> {
  final prefs = PreferenciasUsuario();
  final units = Units();

  ///Usadas por mi
  var bilirubinField = TextFieldBloc();
  var inrField = TextFieldBloc();
  var albuminField = TextFieldBloc();
  var encephalopatyField = SelectFieldBloc(
    items: ['none_fem', 'grade_1_2', 'grade_3_4'],
    //initialValue: ['none_fem'],
  );
  var ascitesField = SelectFieldBloc(
    items: ['none_fem', 'controlled', 'refractory'],
  );
  bool iUnits = true;

  String resultadoField = 'CPS';
  var data = CpsData(
      bilirubin: 0,
      inr: 0,
      albumin: 0,
      encephalopaty: 'none_fem',
      ascites: 'none_fem',
      result: '-');

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
  List<FieldBloc> get fieldBlocs =>
      [
        bilirubinField,
        inrField,
        albuminField,
        encephalopatyField,
        ascitesField,
        /* booleanField,
    selectField1,
    selectField2,
    multiSelectField,*/
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    // Get the fields values:
    showFields();

    data = CpsData(
      bilirubin: bilirubinField.valueToDouble,
      inr: inrField.valueToDouble,
      albumin: albuminField.valueToDouble,
      encephalopaty: encephalopatyField.value,
      ascites: ascitesField.value,
      result: resultadoField,
    );
    CpsAlgorithm cpsAlgorithm = CpsAlgorithm(data);
    //showObjectCPSData();

    /*print(selectField1.value); //Dropdown menu
    print(multiSelectField.value);
    print(selectField2.value); //RadioButton
    print(booleanField.value);*/

    try {
      //data.result = obtenerResultado(data);
      this.resultadoField = cpsAlgorithm.obtenerResultado();
      data.result = this.resultadoField;
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

  /*void showObjectCPSData() {
    print("\n\n*****************OBJETO CPSDATA: "
        "\nbilirrubina : ${data.bilirubin}" +
        "\nalbumina : ${data.inr}" +
        "\ninr : ${data.albumin}" +
        "\nencefalopatia : ${data.encephalopaty}" +
        "\nascitis : ${data.ascites}" +
        "\nresultado: ${data.result}" +
        "\n**************");
  }*/

  void showFields() {
    print("\n\n *********FIELD VALUES");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo albumina: " + albuminField.value);
    print("Campo encefalopatía: " + encephalopatyField.value);
    print("Campo ascitis: " + ascitesField.value);
    print("Campo resultado antes de operar: " + resultadoField);
  }

  /*String obtenerResultado(CpsData data */ /*fieldBlocs*/ /*) {
    var ptsBilirubin;
    var ptsINR;
    var ptsAlbumin;
    var ptsEncephalopaty;
    var ptsAscites;

    */ /*if(antiguo.bilirubin<=34){
      print("yujuuu " + antiguo.bilirubin.toString());
    }*/ /*
    //TODO Aquí llamar a los métodos de convertir a unidades internacionales
    */ /*if(prefs.internationalUnits == false){
      antiguo.bilirubin = units.getConvertedBilirrubin(antiguo.bilirubin);
      antiguo.albumin = units.getConvertedAlbumin(antiguo.albumin);
    }*/ /*
    //pasar a método externo
    //compruebo que esté en unidades interanacionales, si no, convierto
    if (!prefs.getIunitsPrueba()) convertToIU();
    showObjectCPSData();

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

    if (data.encephalopaty == 'none_fem') {
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
    }

    //TODO añadir los valores de los campos a variable DatosCPS

    obtenerPuntos(
        ptsBilirubin, ptsINR, ptsAlbumin, ptsEncephalopaty, ptsAscites);


    int resultado =
        ptsBilirubin + ptsINR + ptsAlbumin + ptsEncephalopaty + ptsAscites;
    */ /*print('Resultado numérico: $resultado');*/ /*
    if (resultado == 5 || resultado == 6) {
      return 'A ($resultado)';
    } else if (resultado >= 7 && resultado <= 9) {
      return 'B ($resultado)';
    } else {
      return 'C ($resultado)';
    }
  }*/

  /*void obtenerPuntos(ptsBilirubin, ptsINR, ptsAlbumin, ptsEncephalopaty,
      ptsAscites) {
    print("\n\n**********PUNTOS\nPuntos bilirrubina: $ptsBilirubin");
    print("Puntos inr: $ptsINR");
    print("Puntos albúmina: $ptsAlbumin");
    print("Puntos encefalopatía: $ptsEncephalopaty");
    print("Puntos ascitis: $ptsAscites");
  }*/
/*
  void convertToIU() {
    //if (!prefs.getIunitsPrueba()) {
    data.bilirubin = units.getIUBilirrubin(data.bilirubin);
    data.albumin = units.getIUAlbumin(data.albumin);
    //}
  }*/

  showNotIU() {
    this.bilirubinField = TextFieldBloc(
      initialValue: units.getNotIUBilirrubin(data.bilirubin)
          .toStringAsPrecision(2),
    );
    this.albuminField = TextFieldBloc(
      initialValue: units.getNotIUBilirrubin(data.albumin).toStringAsPrecision(
          2),
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
    this.resultadoField = "-";

    // this.ascitesField.clear(); //(value)
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
    this.encephalopatyField = SelectFieldBloc(
      items: ['none_fem', 'grade_1_2', 'grade_3_4'],
      initialValue: data.encephalopaty.toString(),

      //initialValue: data.encephalopaty.toString(),
    );
    this.ascitesField = SelectFieldBloc(
      items: ['none_fem', 'controlled', 'refractory'],
      initialValue: data.ascites.toString(),
    );
    this.resultadoField = data.result;

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
    print("albumina: " + this.albuminField.value);
    print("encefalopatia: " + this.encephalopatyField.value.toString());
    print("ascitis: " + this.ascitesField.value.toString());
    print("resultado: " + this.resultadoField);
  }
}
