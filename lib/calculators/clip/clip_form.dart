import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/calculators/widgets_calc/calc_bottom_button.dart';
import 'package:hepapp/calculators/widgets_calc/calculator_button.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/pop_up_dialog.dart';
import 'package:observable/observable.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sized_context/sized_context.dart';

import '../widgets_calc/calc_group_field.dart';
import '../widgets_calc/calc_result_widget.dart';
import '../widgets_calc/calc_text_field.dart';
import '../widgets_calc/right_bottom_title.dart';
import 'clip_form_bloc.dart';

final bool debug = false;

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
  ScreenshotController screenShotController = ScreenshotController();

  Map<String, bool> _emptyFieldsErrorMap;
  StreamSubscription streamSubEmptyFieldsErrorMap;
  Map<String, bool> _parseErrorMap;
  StreamSubscription streamSubParseErrorMap;

  @override
  void initState() {
    streamSubEmptyFieldsErrorMap =
        prefs.emptyFieldsErrorMapUpdates.listen((newVal) => setState(() {
              _emptyFieldsErrorMap = newVal;
            }));
    prefs.initEmptyFieldsErrorMap([
      'afp',
      'child_pugh_score',
      'tumour_number',
      'tumour_extent',
      'pvt_complete',
    ]);

    streamSubParseErrorMap =
        prefs.parseErrorMapUpdates.listen((newVal) => setState(() {
              _parseErrorMap = newVal;
            }));
    prefs.initParseErrorMap([
      'afp',
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
    streamSubEmptyFieldsErrorMap.cancel();
    streamSubParseErrorMap.cancel();
    streamSubParseErrorMap.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = context.isLandscape;

    bool isTablet = context.diagonalInches >= 7;
    if (!isTablet)
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    return BlocProvider<ClipFormBloc>(
      builder: (context) => ClipFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<ClipFormBloc>(context);
          return FormBlocListener<ClipFormBloc, String, String>(
            child: Screenshot(
              controller: screenShotController,
              child: Scaffold(
                appBar: CustomAppBar(
                  'calculators_clip',
                  selScreenshot: true,
                  screenshotController: screenShotController,
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
              debug
                  ? Text(prefs.getEmptyFieldsErrorMap().toString())
                  : Container(),
              debug
                  ? Text("Error empty fields: " +
                  prefs.isEmptyFieldsError().toString())
                  : Container(),
              debug ? Text(prefs.getParseErrorMap().toString()) : Container(),
              debug
                  ? Text("Error parseo: " + prefs.isParseError().toString())
                  : Container(),
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
          CalcBottomButton(
              title: 'reset_values',
              onPressed: () {
                resetValues(formBloc);
              }),
          SizedBox(width: 15),
          CalcBottomButton(
              title: 'previous_values',
              onPressed: () {
                previousValues(formBloc);
              }),
          SizedBox(width: 15),
        ],
      ),
    );
  }

  _buildResult(ClipFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;
    Map<String, String> resultMap = {'clip': formBloc.result};

    return Expanded(
      child: Container(
        alignment: isLandscape ? Alignment.topRight : Alignment.topCenter,
        padding: isTablet
            ? EdgeInsets.fromLTRB(0, 0, 30, 0)
            : EdgeInsets.fromLTRB(20, 10, 20, 0),
        width: context.widthPct(isLandscape ? 0.28 : 1),
        child: FittedBox(
          child: Container(
            height: isTablet
                ? context.heightPct(isLandscape ? 0.6 : 0.3)
                : context.heightPct(0.5),
            padding: EdgeInsets.only(top: isTablet ? 60 : 20, bottom: 15),
            child: CalcResultWidget(
              resultMap: resultMap,
              textAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }

  void calculateClip(ClipFormBloc formBloc) {
    if (prefs.isEmptyFieldsError()) {
      showErrorDialog('fill_empty_fields'); //print("error empty");
    } else if (prefs.isParseError()) {
      showErrorDialog('format_error'); //print("error parse");
    }

    formBloc.submit();

    reset = false;
    setState(() {});
  }

  showErrorDialog(String content) {
    bool isTablet = context.diagonalInches >= 7;

    bool isLandscape = context.isLandscape;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PopUpDialog(
            title: 'error',
            content: content,
            height: context
                .heightPct(isLandscape ? (isTablet ? 0.20 : 0.25) : 0.12),
            width: context.widthPct(isLandscape ? (isTablet ? 0.3 : 0.4) : 0.5),
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
