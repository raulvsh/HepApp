import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/calculator_button.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import '../calc_group_field.dart';
import '../calc_result_widget.dart';
import '../calc_text_field.dart';
import '../right_bottom_title.dart';
import 'clip_form_bloc.dart';

class ClipForm extends StatefulWidget with Observable {
  ClipForm({Key key}) : super(key: key);

  @override
  ClipFormState createState() => ClipFormState();
}

class ClipFormState extends State<ClipForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = UserSettings();
  final units = Units();

  //bool _internationalUnits = true;
  //Map<String, bool> _errorMap;
  //StreamSubscription streamSubIUnits;
  //StreamSubscription streamSubErrorMap;
  String errorPrueba = "";

  @override
  void initState() {
    /* streamSubIUnits = prefs.iUnitsUpdates.listen(
      (newVal) => setState(() {
        _internationalUnits = newVal;
      }),
    );
    prefs.setInternationalUnits(true);*/

    /*streamSubErrorMap = prefs.errorMapUpdates.listen((newVal) => setState(() {
          _errorMap = newVal;
        }));*/
    prefs.initErrorMap([
      'afp',
      'child_pugh_score',
      'tumour_number',
      'tumour_extent',
      'pvt_complete',
    ]);

    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //streamSubIUnits.cancel();
    //streamSubErrorMap.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = context.isLandscape;

    bool isTablet = context.diagonalInches >= 7;
    !isTablet
        ? SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ])
        : null;
    return BlocProvider<ClipFormBloc>(
      builder: (context) => ClipFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<ClipFormBloc>(context);
          return FormBlocListener<ClipFormBloc, String, String>(
            child: Scaffold(
              appBar: CustomAppBar(
                context,
                'calculators_clip',
                selScreenshot: true,
                //selPartialSettings: true,
              ),
              drawer: MenuWidget(),
              body: Stack(
                children: <Widget>[
                  isLandscape
                      ? Row(children: <Widget>[
                    _buildDataFields(formBloc),
                    _buildResult(formBloc),
                  ])
                      : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildDataFields(formBloc),
                        _buildResult(formBloc),
                      ]),
                  Column(
                    children: <Widget>[
                      RightBottomTitle(
                        title: 'clip',
                        padding:
                        EdgeInsets.fromLTRB(10, 0, isTablet ? 30 : 15, 50),
                      ),
                    ],
                  ),
                ],
              ),
              bottomSheet: _buildBottomSheet(formBloc),
            ),
          );
        },
      ),
    );
  }

  _buildDataFields(ClipFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;
    return Container(
      alignment: Alignment.topLeft,
      //color: Colors.red,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          width: context.widthPct(isLandscape ? 0.72 : 1),
          padding: isTablet
              ? EdgeInsets.only(left: 20, top: 20, bottom: 20)
              : EdgeInsets.only(left: 10, top: 10, bottom: kToolbarHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildAFPRow(formBloc),
              _buildCPSRow(formBloc),
              _buildTumourNumberRow(formBloc),
              _buildTumourExtentRow(formBloc),
              _buildPVTRow(formBloc),
              SizedBox(height: 10),
              _buildCalcButton(formBloc),
              //Text(prefs.getErrorMap().toString()),
              //Text(prefs.getErrorMap().values.toString()),
              //Text(prefs.isMapError().toString()),
              //Text(errorPrueba),
            ],
          ),
        ),
      ),
    );
  }

  _buildAFPRow(ClipFormBloc formBloc) {
    return CalcTextField(
      errorControl: true,
      textFieldBloc: formBloc.afpField,
      title: 'afp',
      uds: 'ug/L',
    );
  }

  _buildCPSRow(ClipFormBloc formBloc) {
    return CalcGroupField(
      errorControl: true,
      reset: reset,
      previous: previous,
      initialValue: formBloc.cpsField.value.toString(),
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.cpsField,
      title: 'child_pugh_score',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildTumourNumberRow(ClipFormBloc formBloc) {
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
    return CalculatorButton(
        title: 'calculate_clip',
        onPressed: () async {
          await Future.delayed(Duration(milliseconds: 400));
          calculateClip(formBloc);
        });
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
        /*return MoreInformation(
          title: 'clip',
          pathList: 'assets/images/calc/M3C14S0d.png',
        );*/
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
  }

  void resetValues(ClipFormBloc formBloc) {
    reset = true;
    previous = true;
    formBloc.reset();
    setState(() {});
    reset = false;
  }

  void previousValues(ClipFormBloc formBloc) {
    reset = false;
    previous = true;
    formBloc.previous();
    setState(() {});
  }
}

