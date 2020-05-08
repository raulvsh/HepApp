import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/forms/calc_group_field.dart';
import 'package:hepapp/forms/calc_text_field.dart';
import 'package:hepapp/forms/international_units_select.dart';
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
    bool isLandscape = context.isLandscape;

    bool isTablet = context.diagonalInches >= 7;
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
          child: InternationalUnitsSelect(
              title: 'international_units', formBloc: formBloc),
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
          child: InternationalUnitsSelect(
              title: 'preclude_major_surgery', formBloc: formBloc),
        ),
      ],
    );
  }

/* _buildTumourNumberRow(ClipFormBloc formBloc) {
    return CalcGroupField(
      errorControl: true,
      reset: reset,
      previous: previous,
      initialValue: formBloc.tumourNumberField.value.toString(),
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.tumourNumberField,
      title: 'tumour_number',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildTumourExtentRow(ClipFormBloc formBloc) {
    return CalcGroupField(
      errorControl: true,
      reset: reset,
      previous: previous,
      initialValue: formBloc.tumourExtentField.value.toString(),
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.tumourExtentField,
      title: 'tumour_extent',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildPVTRow(ClipFormBloc formBloc) {
    return CalcGroupField(
      errorControl: true,
      reset: reset,
      previous: previous,
      initialValue: formBloc.pvtField.value.toString(),
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.pvtField,
      title: 'pvt_complete',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildCalcButton(ClipFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      width: 250,
      //padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(right: context.widthPct(0.25), left: 25),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: BorderSide(
              color: Color.fromARGB(255, 45, 145, 155),
              width: 1.5,
            )),
        color: Theme.of(context).primaryColor,
        splashColor: Color.fromARGB(255, 56, 183, 198),
        elevation: 3,
        onPressed: () async {
          await Future.delayed(Duration(milliseconds: 400));
          calculateClip(formBloc);
        },
        child: Center(
          child: Text(
            aux.tr('calculate_clip'),
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 15 : 12,
            ),
          ),
        ),
      ),
    );
  }

  _buildBottomSheet(ClipFormBloc formBloc) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildResetButton(formBloc),
          SizedBox(
            width: 15,
          ),
          _buildPreviousButton(formBloc),
          SizedBox(
            width: 15,
          ),
          _buildMoreInfoButton(),
        ],
      ),
    );
  }

  Container _buildMoreInfoButton() {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);

    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: FlatButton(
        child: Text(
          aux.tr('more_information'),
          style: TextStyle(
            fontSize: isTablet ? 14 : 12,
          ),
        ),
        color: Color.fromARGB(255, 210, 242, 245),
        onPressed: () {
          showMoreInfo();
        },
      ),
    );
  }

  Future showMoreInfo() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        */ /*return MoreInformation(
          title: 'clip',
          pathList: 'assets/images/calc/M3C14S0d.png',
        );*/ /*
        return AlertDialog(
          title: Text("por hacer"),
          content: Text("wip"),
        );
      },
    );
  }

  Container _buildPreviousButton(formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);

    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: FlatButton(
        child: Text(
          aux.tr('previous_values'),
          style: TextStyle(
            fontSize: isTablet ? 14 : 12,
          ),
        ),
        color: Color.fromARGB(255, 210, 242, 245),
        onPressed: () {
          previousValues(formBloc);
        },
      ),
    );
  }

  Container _buildResetButton(ClipFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);

    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: FlatButton(
        child: Text(
          aux.tr('reset'),
          style: TextStyle(
            fontSize: isTablet ? 14 : 12,
          ),
        ),
        color: Color.fromARGB(255, 210, 242, 245),
        onPressed: () {
          resetValues(formBloc);
        },
      ),
    );
  }

  _buildResult(ClipFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;
    Map<String, String> resultMap = {'clip': formBloc.result};

    return Expanded(
      child: Container(
        padding: isTablet
            ? EdgeInsets.fromLTRB(0, 20, 30, 0)
            : EdgeInsets.fromLTRB(20, 0, 20, 0),
        width: context.widthPct(isLandscape ? 0.28 : 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: isLandscape && !isTablet
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              child: Container(
                height: isTablet
                    ? context.heightPct(isLandscape ? 0.6 : 0.3)
                    : context.heightPct(0.5),
                padding: EdgeInsets.only(top: isTablet ? 50 : 20, bottom: 15),
                child: CalcResultWidget(
                  resultMap: resultMap,
                  textAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateClip(ClipFormBloc formBloc) {
    prefs.isMapError()
        ? errorPrueba = "hay al menos un error"
        : errorPrueba = "no hay errores";
    prefs.isMapError() ? showErrorDialog() : errorPrueba = "no hay errores";

    formBloc.submit();

    reset = false;
    setState(() {});
  }

  showErrorDialog() {
    AppLocalizations aux = AppLocalizations.of(context);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              aux.tr('error'),
              style: TextStyle(color: Colors.black),
            ),
            content: Container(
              height: context.heightPct(0.20),
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        aux.tr('fill_empty_fields'),
                        style: TextStyle(color: Colors.black),
                      )),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          aux.tr('accept'),
                          style:
                          TextStyle(color: Theme
                              .of(context)
                              .primaryColor),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }*/

}
