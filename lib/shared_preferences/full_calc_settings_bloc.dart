import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

class FullCalcSettingsBloc extends FormBloc<String, String> {
  final prefs = UserSettings();
  final units = Units();

  var ageField = TextFieldBloc(initialValue: '0');
  var ltCriteriaField = SelectFieldBloc(
    items: ['milan_criteria', 'ttv_afp', 'ucfs', 'up_to_seven'],
    initialValue: '-',
  );

  @override
  List<FieldBloc> get fieldBlocs => [
        ageField,
        ltCriteriaField,
      ];

  @override
  Stream<FormBlocState<String, String>> onSubmitting() async* {
    prefs.setAgeCutoff(ageField.valueToDouble);
    prefs.setLtCriteria(ltCriteriaField.value);

    //showFinalValues();

    await Future<void>.delayed(Duration(seconds: 1));

    yield currentState.toSuccess('Success');
    //yield toLoaded para poder hacer submit más de una vez
    yield currentState.toLoaded();
  }

  void showIU() {}

  void showNotIU() {}

  void showFields() {
    print("\n\n *********FIELD VALUES");
    print("Campo age: " + ageField.valueToDouble.toString());
    print("Campo ltcriteria: " + ltCriteriaField.value.toString());
  }

  void showFinalValues() {
    print("\n\n *********FINAL VALUES EN PREFERENCIAS");
    print("International Units: " + prefs.getInternationalUnits().toString());
    print("Campo age: " + prefs.getAgeCutoff().toString());
    print("Campo ltcriteria: " + prefs.getLtCriteria().toString());
    print("Campo preclude mayor: " + prefs.getPrecludeSurgery().toString());
  }
}
