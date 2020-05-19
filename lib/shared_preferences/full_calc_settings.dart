import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/calculators/widgets_calc/calc_bottom_button.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/full_calc_settings_bloc.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import 'file:///D:/GitHub/HepApp/lib/calculators/widgets_calc/boolean_select.dart';
import 'file:///D:/GitHub/HepApp/lib/calculators/widgets_calc/calc_group_field.dart';
import 'file:///D:/GitHub/HepApp/lib/calculators/widgets_calc/calc_text_field.dart';

class FullCalcSettings extends StatefulWidget with Observable {
  FullCalcSettings({Key key}) : super(key: key);

  @override
  FullCalcSettingsState createState() => FullCalcSettingsState();
}

class FullCalcSettingsState extends State<FullCalcSettings> with Observable {
  final prefs = UserSettings();
  var reset = false;
  var previous = false;
  StreamSubscription streamSubIUnits;
  bool _internationalUnits = true;

  StreamSubscription streamSubErrorMap;
  Map<String, bool> _errorMap;

  @override
  void initState() {
    streamSubIUnits = prefs.iUnitsUpdates.listen(
      (newVal) => setState(() {
        _internationalUnits = newVal;
      }),
    );
    prefs.setInternationalUnits(true);

    streamSubErrorMap = prefs.errorMapUpdates.listen((newVal) => setState(() {
          _errorMap = newVal;
        }));
    prefs.initErrorMap([
      'international_units',
      'age_cutoff',
      'lt_criteria',
      'preclude_surgery'
    ]);
    super.initState();
  }

  @override
  void dispose() {
    streamSubIUnits.cancel();

    streamSubErrorMap.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isLandscape = context.isLandscape;
    bool isTablet = context.diagonalInches >= 7;
    return BlocProvider<FullCalcSettingsBloc>(
      builder: (context) => FullCalcSettingsBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<FullCalcSettingsBloc>(context);
          return FormBlocListener<FullCalcSettingsBloc, String, String>(
            child: AlertDialog(
              contentPadding: EdgeInsets.fromLTRB(3, 5, 0, 10),
              title: Center(child: Text(aux.tr('settings'))),
              content: Container(
                width: context
                    .widthPct(isLandscape ? (isTablet ? 0.6 : 0.9) : 0.9),
                height: context
                    .heightPct(isLandscape ? (isTablet ? 0.45 : 0.8) : 0.25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
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
                            reset = false;

                            setState(() {

                            });
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
        initialBlueRectangle,
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
    //formBloc.ltCriteriaField.updateValue('ttv_afp');
    print(formBloc.ltCriteriaField.value);
    var ltCriteria = prefs.getLtCriteria();
    print("lt criteria de fuera " + ltCriteria);
    return Container(
      color: Colors.red,
      child: CalcGroupField(
        initialValue: ltCriteria,
        reset: reset,
        padding: EdgeInsets.only(left: 8),
        selectFieldBloc: formBloc.ltCriteriaField,
        title: 'lt_criteria',
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        itemBuilder: (context, item) => item,
      ),
    );
  }

  Container get initialBlueRectangle =>
      Container(
        color: Color.fromARGB(255, 210, 242, 245),
        width: 10.0,
        height: 20.0,
      );

  _buildPrecludeSurgeryRow(FullCalcSettingsBloc formBloc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 7),
        initialBlueRectangle,
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
