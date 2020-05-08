import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/calc_result_widget.dart';
import 'package:hepapp/forms/right_bottom_title.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/calc_bottom_button.dart';
import 'package:hepapp/widgets/calculator_button.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import 'complete_form_bloc.dart';

class ResultsForm extends StatefulWidget with Observable {
  final formBloc;

  final PageController controller;

  ResultsForm({Key key, this.formBloc, this.controller}) : super(key: key);

  @override
  ResultsFormState createState() => ResultsFormState();
}

class ResultsFormState extends State<ResultsForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = UserSettings();
  final units = Units();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        'calculators_all_algorithms_results',
        selScreenshot: true,
        controller: widget.controller,
        calcBack: true,
      ),
      drawer: MenuWidget(),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildResultsRow(widget.formBloc),
              _buildTreatmentsRow()
            ],
          ),
          Column(
            children: <Widget>[
              RightBottomTitle(
                title: 'results',
                padding: EdgeInsets.fromLTRB(10, 0, 15, 45),
              )
            ],
          )
        ],
      ),
      bottomSheet: _buildBottomSheet(widget.formBloc),
    );
  }

  Container _buildResultsRow(CompleteFormBloc formBloc) {
    bool isLandscape = context.isLandscape;
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      height: isLandscape
          ? context.heightPct(isTablet ? 0.52 : 0.4)
          : context.heightPct(0.3),

      //color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHepaticColumn(formBloc),
          _buildAlgorithmsColumn(formBloc),
        ],
      ),
    );
  }

  _buildHepaticColumn(CompleteFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isLandscape = context.isLandscape;
    Map<String, String> resultMap = {
      'cirrhosis': aux.tr(formBloc.cirrhosisField.value),
      'apri': formBloc.resultsField['apri'],
      'child_pugh_score_oneline':
      formBloc.resultsField['child_pugh_score_oneline'],
      'meld': formBloc.resultsField['meld'],
      'meld_na': formBloc.resultsField['meld_na'],
      '5v_meld': formBloc.resultsField['5v_meld'],
    };

    return FittedBox(
      child: Container(
        width: context.widthPct(0.5),
        //color: Colors.red,
        padding: EdgeInsets.only(left: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildLiverFunctionHeader(),
            Container(
              margin: isLandscape ? null : EdgeInsets.only(right: 10),
              child: CalcResultWidget(
                resultMap: resultMap,
                textAlignment: MainAxisAlignment.start,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildLiverFunctionHeader() {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;
    return Container(
        margin: isLandscape ? null : EdgeInsets.only(right: 10),
        width: isTablet ? 400 : 200,
        height: isTablet ? 30 : 20,
        color: Color.fromARGB(255, 210, 242, 245),
        child: Center(
            child: Text(
              aux.tr('liver_function').toUpperCase(),
              style: TextStyle(
                  color: Colors.black, fontSize: isTablet ? 16 : 13),
            )));
  }

  Container _buildStagingAlgorithmsHeader(bool isLandscape, bool isTablet,
      AppLocalizations aux) {
    return Container(
        margin: isLandscape ? null : EdgeInsets.only(right: 20),
        width: isTablet ? 400 : 200,
        height: isTablet ? 30 : 20,
        color: Color.fromARGB(255, 210, 242, 245),
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Center(
              child: Text(
                aux.tr('staging_algorithms').toUpperCase(),
                style: TextStyle(
                    color: Colors.black, fontSize: isTablet ? 16 : 14),
              )),
        ));
  }

  _buildAlgorithmsColumn(CompleteFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;
    Map<String, String> resultMap = {
      'okuda': formBloc.resultsField['okuda'],
      'clip': formBloc.resultsField['clip'],
      'getch': formBloc.resultsField['getch'],
      'tnm': formBloc.resultsField['tnm'],
      'cupi': formBloc.resultsField['cupi'],
      'bclc': formBloc.resultsField['bclc'],
    };

    return FittedBox(
      child: Container(
        width: context.widthPct(0.5),
        // color: Colors.blue,
        padding: EdgeInsets.only(left: 10, top: 20),
        child: Column(
          children: <Widget>[
            _buildStagingAlgorithmsHeader(isLandscape, isTablet, aux),
            Container(
              margin: isLandscape ? null : EdgeInsets.only(right: 20),
              child: CalcResultWidget(
                resultMap: resultMap,
                textAlignment: MainAxisAlignment.start,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildTreatmentsRow() {
    bool isLandscape = context.isLandscape;
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      //color: Colors.red,
      height: context.heightPct(isLandscape ? 0.3 : 0.50),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildRecommendedTreatments(),
              SizedBox(width: isTablet ? 40 : 20),
              isLandscape
                  ? _buildMoreInfoButton()
                  : Container(height: 0, width: 0),
              SizedBox(width: isTablet ? 40 : 20),
              isLandscape
                  ? _buildAlbertaButton()
                  : Container(height: 0, width: 0),
            ],
          ),
          !isLandscape
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildMoreInfoButton(),
              SizedBox(width: 40),
              _buildAlbertaButton(),
            ],
          )
              : Container(
            height: 0,
            width: 0,
          ),
        ],
      ),
    );
  }

  _buildRecommendedTreatments() {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _buildInitialBlueRectangle(),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              aux.tr('recommended_treatment'),
              style:
              TextStyle(color: Colors.black, fontSize: isTablet ? 16 : 11),
            ),
            SizedBox(
              height: isTablet ? 10 : 4,
            ),

            buildRecommendedTreatmentRow('1', 'recommended treatment 1'),
            SizedBox(
              height: isTablet ? 10 : 4,
            ),
            buildRecommendedTreatmentRow('2', 'recommended treatment 2'),

            //ListTile(leading: CircleAvatar(child: Text("1"),), title: Text("Best Supportive Care"),),
            //ListTile(leading: CircleAvatar(child: Text("1"),), title: Text("Best Supportive Care"),),
          ],
        ),
      ],
    );
  }

  Container _buildInitialBlueRectangle() {
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      color: Color.fromARGB(255, 210, 242, 245),
      width: 15.0,
      height: 90.0,
    );
  }

  Row buildRecommendedTreatmentRow(String position, String title) {
    bool isTablet = context.diagonalInches >= 7;

    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 15,
          backgroundColor: Color.fromARGB(255, 210, 242, 245),
          child: CircleAvatar(
              radius: 13,
              backgroundColor: Colors.white,
              child: Text(
                position,
                style: TextStyle(
                    fontSize: isTablet ? 16 : 12, color: Colors.black),
              )),
        ),
        SizedBox(
          width: 10,
        ),
        Text(title),
      ],
    );
  }

  _buildMoreInfoButton() {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return CalculatorButton(
        width: isTablet ? 250.0 : 175.0,
        title: 'more_information',
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: Text(aux.tr('more_information')),
                content: Text('Contenido del more information, a añadir'),
                actions: <Widget>[
                  FlatButton(
                    child: Text(aux.tr('close')),
                    onPressed: () {
                      Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                    },
                  ),
                ],
              );
            },
          );
        });
  }

  _buildAlbertaButton() {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return CalculatorButton(
        title: 'alberta_hcc_algorithm',
        width: isTablet ? 250.0 : 175.0,

        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                title: Text(aux.tr('alberta_hcc_algorithm')),
                content:
                Text('Contenido del Alberta HCC, seguramenta widget nuevo'),
                actions: <Widget>[
                  FlatButton(
                    child: Text(aux.tr('close')),
                    onPressed: () {
                      Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                    },
                  ),
                ],
              );
            },
          );
        });
  }

  _buildBottomSheet(CompleteFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    return BottomAppBar(
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CalcBottomButton(
                  title: 'diagnostic_imaging',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Text(aux.tr('diagnostic_imaging')),
                          content: Text('dialogBody'),
                        );
                      },
                    );
                  }),
              SizedBox(width: 15),
              CalcBottomButton(
                  title: 'laboratory_values',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Text(aux.tr('laboratory_values')),
                          content: Text('dialogBody'),
                        );
                      },
                    );
                  }),
              SizedBox(width: 15),
              CalcBottomButton(
                  title: 'clinical_questions',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Text(aux.tr('clinical_questions')),
                          content: Text('dialogBody'),
                        );
                      },
                    );
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _buildSummaryButton(formBloc),
            ],
          ),
        ],
      ),
    );
  }

  void submitDiagnostic(CompleteFormBloc formBloc) {
    /*prefs.isMapError()
        ? errorPrueba = "hay al menos un error"
        : errorPrueba = "no hay errores";*/

    //prefs.isError()
    // prefs.isMapError() ? showErrorDialog() : errorPrueba = "no hay errores";

    formBloc.submit();

    reset = false;
    setState(() {});
  }

  void resetValues(CompleteFormBloc formBloc) {
    reset = true;
    formBloc.reset();
    //setState(() {});
  }

  void previousValues(CompleteFormBloc formBloc) {
    reset = false;
    previous = true;
    formBloc.previous();
    //setState(() {});
  }

  _buildSummaryButton(CompleteFormBloc formBloc) {
    return CalcBottomButton(
      title: 'value_summary',
      onPressed: () {
        //creo que no hará falta
        // submitDiagnostic(formBloc);
        widget.controller
            .nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
      },
    );
  }
}
