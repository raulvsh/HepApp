import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/forms/CPSdata.dart';
import 'package:hepapp/forms/units.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

class ChildCalcFormBloc extends FormBloc<String, String> {
  final prefs = PreferenciasUsuario();
  final units = Units();

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
  bool iUnits = true;

  /*var pruebaField = SelectFieldBloc(
    items: ['none_fem', 'controlled', 'refractory'],
  );*/

  String resultadoField = 'CPS';
  var antiguo = CPSdata(
      result: 'CPS',
      encephalopaty: 'none_fem',
      albumin: 0,
      inr: 0,
      bilirubin: 0,
      ascites: 'none_fem');

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
        //pruebaField,

        /* booleanField,
    selectField1,
    selectField2,
    multiSelectField,*/
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    // Awesome logic...

    // Get the fields values:
    /*print("\n\n *********FIELD VALUES");
    print("Campo bilirrubina: " + bilirubinField.value);
    print("Campo inr: " + inrField.value);
    print("Campo albumina: " + albuminField.value);
    print("Campo encefalopatía: " + encephalopatyField.value);
    print("Campo ascitis: " + ascitesField.value);
    print("Campo resultado antes de operar: " + resultadoField);
*/
    //print("*****Creo objeto datoscps");
    antiguo = CPSdata(
      bilirubin: bilirubinField.valueToDouble,
      inr: inrField.valueToDouble,
      albumin: albuminField.valueToDouble,
      encephalopaty: encephalopatyField.value,
      ascites: ascitesField.value,
      result: resultadoField,
    );

    /*print("\n\n*****************OBJETO CPSDATA: "
            "\nbilirrubina : ${antiguo.bilirubin}" +
        "\nalbumina : ${antiguo.inr}" +
        "\ninr : ${antiguo.albumin}" +
        "\nencefalopatia : ${antiguo.encephalopaty}" +
        "\nascitis : ${antiguo.ascites}" +
        "\nresultado: ${antiguo.result}" +
        "\n**************");*/

    /*print(selectField1.value); //Dropdown menu
    print(multiSelectField.value);
    print(selectField2.value); //RadioButton
    print(booleanField.value);*/

    //antiguo.result = obtenerResultado(antiguo);

    try {
      antiguo.result = obtenerResultado(antiguo);
      this.resultadoField = antiguo.result;
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

  String obtenerResultado(CPSdata antiguo /*fieldBlocs*/) {
    var ptsBilirubin;
    var ptsINR;
    var ptsAlbumin;
    var ptsEncephalopaty;
    var ptsAscites;

    /*if(antiguo.bilirubin<=34){
      print("yujuuu " + antiguo.bilirubin.toString());
    }*/
    //TODO Aquí llamar a los métodos de convertir a unidades internacionales
    /*if(prefs.internationalUnits == false){
      antiguo.bilirubin = units.getConvertedBilirrubin(antiguo.bilirubin);
      antiguo.albumin = units.getConvertedAlbumin(antiguo.albumin);
    }*/
    if (!prefs.internationalUnits) {
      antiguo.bilirubin = units.getIUBilirrubin(antiguo.bilirubin);
    }


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

    /*print("\n\n**********PUNTOS\nPuntos bilirrubina: $ptsBilirubin");
    print("Puntos inr: $ptsINR");
    print("Puntos albúmina: $ptsAlbumin");
    print("Puntos encefalopatía: $ptsEncephalopaty");
    print("Puntos ascitis: $ptsAscites");*/
    int resultado =
        ptsBilirubin + ptsINR + ptsAlbumin + ptsEncephalopaty + ptsAscites;
    /*print('Resultado numérico: $resultado');*/
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
    this.resultadoField = "CPS";

    //this.
  }

  void previous() {
    this.bilirubinField = TextFieldBloc(
      initialValue: antiguo.bilirubin.toString(),
    );
    this.inrField = TextFieldBloc(
      initialValue: antiguo.inr.toString(),
    );
    this.albuminField = TextFieldBloc(
      initialValue: antiguo.albumin.toString(),
    );
    this.encephalopatyField = SelectFieldBloc(
      items: ['none_fem', 'grade_1_2', 'grade_3_4'],
      initialValue: antiguo.encephalopaty.toString(),
    );
    this.ascitesField =
        SelectFieldBloc(
          items: ['none_fem', 'controlled', 'refractory'],
          initialValue: antiguo.ascites.toString(),

        );


    /*this.ascitesField = SelectFieldBloc(
      items: ['none_fem', 'controlled', 'refractory'],
      //initialValue: 'none_fem',
      //toStringName: 'none_fem',
    );*/
    //print("encefalopatia field " + antiguo.encephalopaty);
    /*this.encephalopatyField = SelectFieldBloc(
      toStringName: 'none_fem',
    );*/
    //this.encephalopatyField = 'none_fem';

    /*SelectFieldBloc(
        items: ['none_fem', 'controlled', 'refractory'],

    );*/
    //this.ascitesField = SelectFieldBloc(initialValue: antiguo.ascites);
    this.resultadoField = antiguo.result;

    print("\n*****AFTERPREVIOUS");
    print("bilirrubin: " + this.bilirubinField.value);
    print("INR: " + this.inrField.value);
    print("albumina: " + this.albuminField.value);
    //print("encefalopatia: " + this.encephalopatyField.value);
    //print("ascitis: " + this.ascitesField.value);
    print("resultado: " + this.resultadoField);
  }

/*void setFieldBlocs() {
    this.bilirubinField = TextFieldBloc();
  }*/
}
