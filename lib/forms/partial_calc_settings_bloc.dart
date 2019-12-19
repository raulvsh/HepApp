import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

class PartialCalcSettingsBloc extends FormBloc<String, String> {
  final prefs = new PreferenciasUsuario();

  bool _international_units;

  /*static BuildContext context;


  ChildCalcFormBloc(context){
    context = context;
  }

  final aux = AppLocalizations.of(context);*/

  final iuField = SelectFieldBloc(
    items: ['yes', 'no'],
  );

  @override
  List<FieldBloc> get fieldBlocs => [
        iuField,
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    // Awesome logic...

    // Get the fields values:

    print('iufield value ${iuField.value}');

    //TODO guardar en las preferencias como booleano
    if (iuField.value == 'yes')
      prefs.internationalUnits = true;
    else
      prefs.internationalUnits = false;

    //print(prefs.international_units.toString());

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
}
