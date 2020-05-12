import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/forms/boolean_select.dart';
import 'package:hepapp/forms/calc_group_field.dart';
import 'package:hepapp/forms/calc_text_field.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/full_calc_settings_bloc.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/calc_bottom_button.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

class FullCalcSettings extends StatefulWidget with Observable {
  FullCalcSettings({Key key}) : super(key: key);

  @override
  FullCalcSettingsState createState() => FullCalcSettingsState();
}

class FullCalcSettingsState extends State<FullCalcSettings> with Observable {
  final prefs = UserSettings();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations aux = AppLocalizations.of(context);

    return BlocProvider<FullCalcSettingsBloc>(
      builder: (context) => FullCalcSettingsBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<FullCalcSettingsBloc>(context);
          return FormBlocListener<FullCalcSettingsBloc, String, String>(
            child: AlertDialog(
              title: Center(child: Text(aux.tr('settings'))),
              content: Container(
                width: context.widthPct(0.7),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildInternationalUnitsRow(formBloc),
                    SizedBox(height: 15),
                    _buildAgeRow(formBloc),
                    _buildLtCriteriaRow(formBloc),
                    SizedBox(height: 10),
                    _buildPrecludeSurgeryRow(formBloc),
                    SizedBox(height: 20),
                    Center(
                      child: CalcBottomButton(
                          title: 'save_settings',
                          onPressed: () {
                            formBloc.submit();
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildInternationalUnitsRow(FullCalcSettingsBloc formBloc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 7),
        Container(
          color: Color.fromARGB(255, 210, 242, 245),
          width: 10.0,
          height: 20.0,
        ),
        SizedBox(width: 5),
        Container(
          height: 20,
          child:
          BooleanSelect(title: 'international_units', formBloc: formBloc),
        ),
      ],
    );
  }

  _buildAgeRow(FullCalcSettingsBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.ageField,
      title: 'age_cutoff',
      uds: '',
    );
  }

  _buildLtCriteriaRow(FullCalcSettingsBloc formBloc) {
    return CalcGroupField(
      initialValue: '-',
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.ltCriteriaField,
      title: 'lt_criteria',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildPrecludeSurgeryRow(FullCalcSettingsBloc formBloc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 7),
        Container(
          color: Color.fromARGB(255, 210, 242, 245),
          width: 10.0,
          height: 20.0,
        ),
        SizedBox(width: 5),
        Container(
          height: 20,
          child: BooleanSelect(
              title: 'preclude_major_surgery', formBloc: formBloc),
        ),
      ],
    );
  }
}
