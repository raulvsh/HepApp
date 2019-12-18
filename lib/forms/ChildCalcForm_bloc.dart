import 'package:form_bloc/form_bloc.dart';

class ChildCalcFormBloc extends FormBloc<String, String> {
  /*static BuildContext context;


  ChildCalcFormBloc(context){
    context = context;
  }

  final aux = AppLocalizations.of(context);*/

  ///Usadas por mi
  final bilirubinField = TextFieldBloc();
  final inrField = TextFieldBloc();
  final albuminField = TextFieldBloc();
  final encephalopatyField = SelectFieldBloc(
    items: ['none_fem', 'grade_1_2', 'grade_3_4'],
  );
  final ascitesField = SelectFieldBloc(
    items: ['none_fem', 'controlled', 'refractory'],
  );

  var resultadoField = 'CPS';

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
    print(bilirubinField.value);
    print(inrField.value);
    print(albuminField.value);
    print(encephalopatyField.value);
    print(ascitesField.value);

    print(resultadoField);
    /*print(selectField1.value); //Dropdown menu
    print(multiSelectField.value);
    print(selectField2.value); //RadioButton
    print(booleanField.value);*/

    this.resultadoField =
        obtenerResultado(/*fieldBlocs*/); //obtenerResultado(resultado);
    print(resultadoField);

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

  String obtenerResultado(/*fieldBlocs*/) {
    var ptsBilirubin;
    var ptsINR;
    var ptsAlbumin;
    var ptsEncephalopaty;
    var ptsAscites;

    if (double.parse(bilirubinField.value) <= 34) {
      ptsBilirubin = 1;
    } else if (double.parse(bilirubinField.value) <= 50) {
      ptsBilirubin = 2;
    } else {
      ptsBilirubin = 3;
    }

    if (double.parse(inrField.value) <= 1.7) {
      ptsINR = 1;
    } else if (double.parse(inrField.value) <= 2.2) {
      ptsINR = 2;
    } else {
      ptsINR = 3;
    }

    if (double.parse(albuminField.value) <= 28) {
      ptsAlbumin = 3;
    } else if (double.parse(albuminField.value) <= 35) {
      ptsAlbumin = 2;
    } else {
      ptsAlbumin = 1;
    }

    if (encephalopatyField.value == 'none_fem') {
      ptsEncephalopaty = 1;
    } else if (encephalopatyField.value == 'grade_1_2') {
      ptsEncephalopaty = 2;
    } else if (encephalopatyField.value == 'grade_3_4') {
      ptsEncephalopaty = 3;
    }

    if (ascitesField.value == 'none_fem') {
      ptsAscites = 1;
    } else if (ascitesField.value == 'controlled') {
      ptsAscites = 2;
    } else if (ascitesField.value == 'refractory') {
      ptsAscites = 3;
    }

    print(ptsBilirubin);
    print(ptsINR);
    print(ptsAlbumin);
    print(ptsEncephalopaty);
    print(ptsAscites);

    var resultado = ptsBilirubin + ptsINR + ptsAlbumin + ptsEncephalopaty +
        ptsAscites;
    print('resultado $resultado');
    if (resultado == 5 || resultado == 6)
      return ('A ($resultado)');
    else if (resultado >= 7 && resultado <= 9)
      return ('B ($resultado)');
    else
      return ('C ($resultado)');

  }
}
