import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/calculators/widgets_calc/calc_bottom_button.dart';
import 'package:hepapp/calculators/widgets_calc/calculator_button.dart';
import 'package:hepapp/calculators/widgets_calc/more_information.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/pop_up_dialog.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import 'file:///D:/GitHub/HepApp/lib/calculators/widgets_calc/boolean_select.dart';
import 'file:///D:/GitHub/HepApp/lib/calculators/widgets_calc/right_bottom_title.dart';

import '../widgets_calc/calc_group_field.dart';
import '../widgets_calc/calc_result_widget.dart';
import '../widgets_calc/calc_text_field.dart';
import 'meld_form_bloc.dart';

class MeldForm extends StatefulWidget with Observable {
  MeldForm({Key key}) : super(key: key);

  @override
  MeldFormState createState() => MeldFormState();
}

class MeldFormState extends State<MeldForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = UserSettings();
  final units = Units();
  bool _internationalUnits = true;

  Map<String, bool> _emptyFieldsErrorMap;
  StreamSubscription streamSubIUnits;
  StreamSubscription streamSubEmptyFieldsErrorMap;
  Map<String, bool> _parseErrorMap;
  StreamSubscription streamSubParseErrorMap;

  @override
  void initState() {
    streamSubIUnits = prefs.iUnitsUpdates.listen(
      (newVal) => setState(() {
        _internationalUnits = newVal;
      }),
    );
    prefs.setInternationalUnits(true);

    streamSubEmptyFieldsErrorMap =
        prefs.emptyFieldsErrorMapUpdates.listen((newVal) => setState(() {
              _emptyFieldsErrorMap = newVal;
            }));
    prefs.initEmptyFieldsErrorMap(
        ['bilirubin', 'inr', 'creatinine', 'albumin', 'sodium', 'dialysis']);

    streamSubParseErrorMap =
        prefs.parseErrorMapUpdates.listen((newVal) => setState(() {
              _parseErrorMap = newVal;
            }));
    prefs.initParseErrorMap(
        ['bilirubin', 'inr', 'creatinine', 'albumin', 'sodium']);
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
    streamSubIUnits.cancel();
    streamSubEmptyFieldsErrorMap.cancel();
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

    return BlocProvider<MeldFormBloc>(
      builder: (context) => MeldFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<MeldFormBloc>(context);
          return FormBlocListener<MeldFormBloc, String, String>(
            child: Scaffold(
              appBar: CustomAppBar(
                'calculators_meld',
                selScreenshot: true,
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
                        title: 'meld',
                        padding:
                        EdgeInsets.fromLTRB(10, 0, isTablet ? 45 : 20, 50),
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

  _buildDataFields(MeldFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;
    return Container(
      alignment: Alignment.topLeft,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          width: context.widthPct(isLandscape ? 0.63 : 1),
          padding: isTablet
              ? EdgeInsets.only(left: 20, top: 20, bottom: 20)
              : EdgeInsets.only(left: 10, top: 10, bottom: kToolbarHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildBilirrubinRow(formBloc),
              _buildInrRow(formBloc),
              _buildCreatinineRow(formBloc),
              _buildAlbuminRow(formBloc),
              _buildSodiumRow(formBloc),
              _buildDialysisRow(formBloc),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildCalcButton(formBloc),
                  IconButton(
                    icon: Icon(
                      Icons.help,
                      color: Theme
                          .of(context)
                          .primaryColor,
                    ),
                    onPressed: showMeldInfoDialog,
                  ),
                ],
              ),
              Text(prefs.getEmptyFieldsErrorMap().toString()),
              Text(prefs
                  .getEmptyFieldsErrorMap()
                  .values
                  .toString()),
              Text(prefs.isEmptyFieldsError().toString()),
              Text(prefs.getParseErrorMap().toString()),
              Text(prefs
                  .getParseErrorMap()
                  .values
                  .toString()),
              Text(prefs.isParseError().toString()),
            ],
          ),
        ),
      ),
    );
  }

  _buildBilirrubinRow(MeldFormBloc formBloc) {
    return CalcTextField(
      errorControl: true,
      textFieldBloc: formBloc.bilirubinField,
      title: 'bilirubin',
      uds: _internationalUnits ? units.bilirubinUds[0] : units.bilirubinUds[1],
    );
  }

  _buildInrRow(MeldFormBloc formBloc) {
    return CalcTextField(
      errorControl: true,
      textFieldBloc: formBloc.inrField,
      title: 'inr',
      //uds: '',
    );
  }

  _buildCreatinineRow(MeldFormBloc formBloc) {
    return CalcTextField(
      errorControl: true,
      textFieldBloc: formBloc.creatinineField,
      title: 'creatinine',
      uds:
      _internationalUnits ? units.creatinineUds[0] : units.creatinineUds[1],
    );
  }

  _buildAlbuminRow(MeldFormBloc formBloc) {
    return CalcTextField(
      errorControl: true,
      textFieldBloc: formBloc.albuminField,
      title: 'albumin',
      uds: _internationalUnits ? units.albuminUds[0] : units.albuminUds[1],
    );
  }

  _buildSodiumRow(MeldFormBloc formBloc) {
    return CalcTextField(
      errorControl: true,
      textFieldBloc: formBloc.sodiumField,
      title: 'sodium',
      uds: _internationalUnits ? units.sodiumUds[0] : units.sodiumUds[1],
    );
  }

  _buildDialysisRow(MeldFormBloc formBloc) {
    return CalcGroupField(
      errorControl: true,
      reset: reset,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.dialysisField,
      title: 'dialysis',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildCalcButton(MeldFormBloc formBloc) {
    return CalculatorButton(
      title: 'calculate_meld',
      onPressed: () async {
        await Future.delayed(Duration(milliseconds: 400));
        calculateMeld(formBloc);
      },
    );
  }

  _buildBottomSheet(MeldFormBloc formBloc) {
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
          CalcBottomButton(
              title: 'more_information',
              onPressed: () {
                showMoreInfo();
              }),
        ],
      ),
    );
  }

  Future showMoreInfo() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return MoreInformation(
          title: 'meld',
          pathList: [
            'assets/images/calc/M3C14S0d.png',
            'assets/images/calc/M3C14S0e.png'
          ],
        );
      },
    );
  }

  _buildResult(MeldFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;
    Map<String, String> resultMap = {
      'meld': formBloc.results['meld'],
      'meld_na': formBloc.results['meld_na'],
      '5v_meld': formBloc.results['5v_meld'],
    };

    return Expanded(
      child: Container(
        padding: isTablet
            ? EdgeInsets.fromLTRB(40, 0, 40, 0)
            : EdgeInsets.fromLTRB(20, 0, 20, 0),
        alignment: Alignment.topCenter,
        width: context.widthPct(isLandscape ? 0.4 : 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: isLandscape && !isTablet
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
          children: <Widget>[
            _buildInternationalUnitsRow(isLandscape, isTablet, formBloc),
            _buildCalcResultRow(isTablet, isLandscape, resultMap),
          ],
        ),
      ),
    );
  }

  _buildCalcResultRow(bool isTablet, bool isLandscape,
      Map<String, String> resultMap) {
    return FittedBox(
      child: Container(
        height: isTablet
            ? context.heightPct(isLandscape ? 0.5 : 0.3)
            : context.heightPct(0.45),
        padding: EdgeInsets.only(top: isTablet ? 50 : 15, bottom: 15),
        child: CalcResultWidget(
          resultMap: resultMap,
          textAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }

  _buildInternationalUnitsRow(bool isLandscape, bool isTablet,
      MeldFormBloc formBloc) {
    return Container(
      padding: isLandscape && !isTablet
          ? EdgeInsets.only(left: context.widthPct(0.14), top: 10)
          : EdgeInsets.only(top: 30),
      child: FittedBox(
        fit: BoxFit.contain,
        child: BooleanSelect(
          title: 'international_units',
          formBloc: formBloc,
        ),
      ),
    );
  }

  void calculateMeld(MeldFormBloc formBloc) {
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

  showMeldInfoDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PopUpDialog(
            title: 'meld_info_title',
            content: 'meld_info_content',
            height: context.heightPct(0.45),
          );
        });
  }

  void resetValues(MeldFormBloc formBloc) {
    reset = true;
    previous = true;
    formBloc.reset();
    setState(() {});
    reset = false;
  }

  void previousValues(MeldFormBloc formBloc) {
    reset = false;
    previous = true;
    formBloc.previous();
    setState(() {});
  }
}
