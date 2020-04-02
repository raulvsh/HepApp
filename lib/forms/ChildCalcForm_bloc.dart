
import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/forms/CPSdata.dart';

class ChildCalcFormBloc extends FormBloc<String, String> {
  ///Usadas por mi
  var bilirubinField = TextFieldBloc();
  var inrField = TextFieldBloc();
  var albuminField = TextFieldBloc();
  var encephalopatyField = SelectFieldBloc(
    items: ['none_fem', 'grade_1_2', 'grade_3_4'],
  );
  var ascitesField = SelectFieldBloc(
    items: ['none_fem', 'controlled', 'refractory'],
  );

  var pruebaField = "";

  String resultadoField = 'CPS';

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
    // Awesome logic...

    // Get the fields values:
    /*print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo albumina: " + albuminField.value);
    print("Campo encefalopatía: " + encephalopatyField.value);
    print("Campo ascitis: " + ascitesField.value);
    print("Campo resultado antes de operar: " + resultadoField);*/

    //print("*****Creo objeto datoscps");
    var antiguo = CPSdata(
      bilirubin: bilirubinField.valueToDouble,
      inr: inrField.valueToDouble,
      albumin: albuminField.valueToDouble,
      encephalopaty: encephalopatyField.value,
      ascites: ascitesField.value,
      result: resultadoField,
    );

    print("*****************\nObjeto CPSData completo: "
        "\nbilirrubina : ${antiguo.bilirubin}" +
        "\nalbumina : ${antiguo.inr}" +
        "\ninr : ${antiguo.albumin}" +
        "\nencefalopatia : ${antiguo.encephalopaty}" +
        "\nascitis : ${antiguo.ascites}" +
        "\nresultado: ${antiguo.result}" +
        "\n**************");

    /*print(selectField1.value); //Dropdown menu
    print(multiSelectField.value);
    print(selectField2.value); //RadioButton
    print(booleanField.value);*/

    //antiguo.result = obtenerResultado(antiguo);

    try {
      antiguo.result = obtenerResultado(antiguo);
      this.resultadoField = antiguo.result;
      //obtenerResultado(antiguo); //obtenerResultado(resultado);
      print("Campo resultado después de operar: " +
          resultadoField +
          " || " +
          antiguo.result);
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

  String obtenerResultado(CPSdata antiguo /*fieldBlocs*/) {
    var ptsBilirubin;
    var ptsINR;
    var ptsAlbumin;
    var ptsEncephalopaty;
    var ptsAscites;

    /*if(antiguo.bilirubin<=34){
      print("yujuuu " + antiguo.bilirubin.toString());
    }*/

    if (antiguo.bilirubin <= 34) {
      ptsBilirubin = 1;
    } else if (antiguo.bilirubin <= 50) {
      ptsBilirubin = 2;
    } else {
      ptsBilirubin = 3;
    }

    if (antiguo.inr <= 1.7) {
      ptsINR = 1;
    } else if (antiguo.inr <= 2.2) {
      ptsINR = 2;
    } else {
      ptsINR = 3;
    }

    if (antiguo.albumin <= 28) {
      ptsAlbumin = 3;
    } else if (antiguo.albumin <= 35) {
      ptsAlbumin = 2;
    } else {
      ptsAlbumin = 1;
    }

    if (antiguo.encephalopaty == 'none_fem') {
      ptsEncephalopaty = 1;
    } else if (antiguo.encephalopaty == 'grade_1_2') {
      ptsEncephalopaty = 2;
    } else if (antiguo.encephalopaty == 'grade_3_4') {
      ptsEncephalopaty = 3;
    }

    if (antiguo.ascites == 'none_fem') {
      ptsAscites = 1;
    } else if (antiguo.ascites == 'controlled') {
      ptsAscites = 2;
    } else if (antiguo.ascites == 'refractory') {
      ptsAscites = 3;
    }

    //TODO añadir los valores de los campos a variable DatosCPS

    print("Puntos bilirrubina: $ptsBilirubin");
    print("Puntos inr: $ptsINR");
    print("Puntos albúmina: $ptsAlbumin");
    print("Puntos encefalopatía: $ptsEncephalopaty");
    print("Puntos ascitis: $ptsAscites");
    int resultado =
        ptsBilirubin + ptsINR + ptsAlbumin + ptsEncephalopaty + ptsAscites;
    print('Resultado numérico: $resultado');
    if (resultado == 5 || resultado == 6) {
      return 'A ($resultado)';
    } else if (resultado >= 7 && resultado <= 9) {
      return 'B ($resultado)';
    } else {
      return 'C ($resultado)';
    }
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
      //initialValue: 'none_fem',
      //toStringName: 'none_fem',
    );
  }

  void setFieldBlocs() {
    this.bilirubinField = TextFieldBloc();
  }
}
