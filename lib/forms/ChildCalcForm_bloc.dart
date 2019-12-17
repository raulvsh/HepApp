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

  var resultado = 'C(12)';


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
    albuminField,
    encephalopatyField,
    ascitesField,
    /* booleanField,
    selectField1,
    selectField2,
    multiSelectField,*/
  ];

  //static BuildContext get context => null;

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    // Awesome logic...

    // Get the fields values:
    print(bilirubinField.value);
    print(inrField.value);
    print(albuminField.value);
    print(encephalopatyField.value);
    print(ascitesField.value);

    print(resultado);
    /*print(selectField1.value); //Dropdown menu
    print(multiSelectField.value);
    print(selectField2.value); //RadioButton
    print(booleanField.value);*/

    this.resultado = obtenerResultado(resultado);
    print(resultado);

    await Future<void>.delayed(Duration(seconds: 2));

    yield currentState.toSuccess('Success');

    // yield `currentState.toLoaded()` because
    // you can't submit if the current state is `FormBlocSuccess`.
    // In most cases you don't need to do this,
    // because you only want to submit only once,
    // but in this case you want the user to submit more than once.
    // See: https://pub.dev/documentation/form_bloc/latest/form_bloc/FormBloc/onSubmitting.html
    yield currentState.toLoaded();
  }

  String obtenerResultado(String resultado) {
    return 'holiii';
  }
}
