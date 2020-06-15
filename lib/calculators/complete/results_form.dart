import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/calculators/alberta/alberta_algorithm.dart';
import 'package:hepapp/calculators/alberta/alberta_data.dart';
import 'package:hepapp/calculators/widgets_calc/calc_bottom_button.dart';
import 'package:hepapp/calculators/widgets_calc/calc_result_widget.dart';
import 'package:hepapp/calculators/widgets_calc/calculator_button.dart';
import 'package:hepapp/calculators/widgets_calc/right_bottom_title.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:observable/observable.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sized_context/sized_context.dart';

import 'complete_form_bloc.dart';

class ResultsForm extends StatefulWidget with Observable {
  final CompleteFormBloc formBloc;
  final PageController pageController;

  ResultsForm({Key key, this.formBloc, this.pageController}) : super(key: key);

  @override
  ResultsFormState createState() => ResultsFormState();
}

class ResultsFormState extends State<ResultsForm> with Observable {
  ScreenshotController screenShotController = ScreenshotController();
  var debug = false;
  var reset = false;
  var previous = false;
  final prefs = UserSettings();
  final units = Units();
  List<bool> coloredFields = [];
  AlbertaAlgorithm albertaAlgorithm = AlbertaAlgorithm();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenShotController,
      child: Scaffold(
        appBar: CustomAppBar(
          'calculators_all_algorithms_results',
          selScreenshot: true,
          pageController: widget.pageController,
          calcBack: true,
          screenshotController: screenShotController,
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
      ),
    );
  }

  Container _buildResultsRow(CompleteFormBloc formBloc) {
    bool isLandscape = context.isLandscape;
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      height: isLandscape
          ? context.heightPct(isTablet ? 0.52 : 0.45)
          : context.heightPct(0.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildHepaticColumn(formBloc),
          _buildAlgorithmsColumn(formBloc),
        ],
      ),
    );
  }

  _buildHepaticColumn(CompleteFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    Map<String, String> resultMap = {
      'cirrhosis': aux.tr(formBloc.cirrhosisField.value),
      'apri': formBloc.resultsField['apri'],
      'child_pugh_score_oneline':
      formBloc.resultsField['child_pugh_score_oneline'],
      'meld': formBloc.resultsField['meld'],
      'meld_na': formBloc.resultsField['meld_na'],
      '5v_meld': formBloc.resultsField['5v_meld'],
    };
    bool isTablet = context.diagonalInches >= 7;

    return FittedBox(
      child: Container(
        width: context.widthPct(0.5),
        padding: isTablet
            ? EdgeInsets.only(left: 20, top: 20)
            : EdgeInsets.only(left: 10, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildLiverFunctionHeader(),
            Container(
              margin: EdgeInsets.only(right: 10),
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
    return Container(
        margin: EdgeInsets.only(right: 10),
        width: isTablet ? 400 : 250,
        height: isTablet ? 30 : 20,
        color: Color.fromARGB(255, 210, 242, 245),
        child: Center(
            child: Text(
              aux.tr('liver_function').toUpperCase(),
              style: TextStyle(color: Colors.black, fontSize: isTablet ? 16 : 13),
            )));
  }

  Container _buildStagingAlgorithmsHeader(bool isLandscape, bool isTablet, AppLocalizations aux) {
    return Container(
        margin: EdgeInsets.only(right: 20),
        width: isTablet ? 400 : 250,
        height: isTablet ? 30 : 20,
        color: Color.fromARGB(255, 210, 242, 245),
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Center(
              child: Text(
                aux.tr('staging_algorithms').toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: isTablet ? 16 : 14,
                ),
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
      'bclc': aux.tr(formBloc.resultsField['bclc']),
    };

    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Container(
        width: context.widthPct(0.5),
        padding: EdgeInsets.only(left: 10, top: isTablet ? 20 : 10),
        child: Column(
          children: <Widget>[
            _buildStagingAlgorithmsHeader(isLandscape, isTablet, aux),
            Container(
              margin: EdgeInsets.only(right: 20),
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
        height: context.heightPct(isLandscape ? 0.255 : 0.50),
        width: context.widthPx,
        padding: isTablet
            ? EdgeInsets.only(left: isLandscape ? 50 : 20)
            : EdgeInsets.only(left: 10, top: 5, bottom: 10),
        child: isLandscape
            ? Row(
                crossAxisAlignment: isTablet
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: <Widget>[
                  _buildRecommendedTreatments(),
                  SizedBox(width: isTablet ? 20 : 0),
                  _buildMoreInfoButton(),
            SizedBox(width: isTablet ? 30 : 10),
            _buildAlbertaButton(widget.formBloc),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            _buildRecommendedTreatments(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildMoreInfoButton(),
                SizedBox(width: 40),
                _buildAlbertaButton(widget.formBloc),
              ],
            ),
          ],
        ));
  }

  _buildRecommendedTreatments() {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);
    var data = AlbertaData(
      bclc: widget.formBloc.resultsField['bclc'],
      cps: widget.formBloc.resultsField['child_pugh_score_oneline'],
      portalHypertension: widget.formBloc.portalHypertensionField.value,
      pvt: widget.formBloc.pvtField.value,
      platelets: widget.formBloc.plateletsField.value,
      varices: widget.formBloc.varicesField.value,
      bilirubin: widget.formBloc.bilirubinField.valueToDouble,
      encephalopaty: widget.formBloc.encephalopatyField.value,
      ascites: widget.formBloc.ascitesField.value,
      tumourSize: getTumourSize(),
      afp: widget.formBloc.afpField.valueToDouble,
      tumourNumber: widget.formBloc.tumourNumberField.value,
      ecog: widget.formBloc.ecogField.value,
      results: ['-', '-'],
    );
    if (debug) printAlbertaObject(data);

    for (int i = 0; i <= 46; i++) {
      coloredFields.add(false);
    }

    coloredFields = albertaAlgorithm.obtenerRecorrido(data);

    return FittedBox(
      child: Row(
        children: <Widget>[
          _initialBlueRectangle,
          SizedBox(width: 10),
          Container(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  aux.tr('recommended_treatment'),
                  style: TextStyle(
                      color: Colors.black, fontSize: isTablet ? 16 : 10),
                ),
                SizedBox(
                  height: isTablet ? 10 : 4,
                ),
                buildRecommendedTreatmentRow(
                    '1', albertaAlgorithm.treatments[0]),
                SizedBox(
                  height: isTablet ? 10 : 4,
                ),
                buildRecommendedTreatmentRow(
                    '2', albertaAlgorithm.treatments[1]),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _initialBlueRectangle =>
      Container(
        color: Color.fromARGB(255, 210, 242, 245),
        width: 15.0,
        height: 100.0,
      );

  Row buildRecommendedTreatmentRow(String position, String title) {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);

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
        SizedBox(width: 10),
        Text(aux.tr(title)),
      ],
    );
  }

  _buildMoreInfoButton() {
    bool isTablet = context.diagonalInches >= 7;

    return CalculatorButton(
      width: isTablet ? 250.0 : 175.0,
      title: 'more_information',
      onPressed: () =>
          Navigator.pushNamed(context, '/AlbertaInfoPage',
              arguments: getIndexPage()),
    );
  }

  _buildAlbertaButton(CompleteFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);
    return CalculatorButton(
        title: 'alberta_hcc_algorithm',
        width: isTablet ? 250.0 : 175.0,
        onPressed: () {
          if (formBloc.resultsField['bclc'] == '-' ||
              formBloc.resultsField['child_pugh_score_oneline'] == '-') {
            showDialog(
              context: context,
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  title: Text(aux.tr('error')),
                  content: Text(
                    aux.tr('error_alberta'),
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        aux.tr('continue'),
                        style: TextStyle(color: Theme
                            .of(context)
                            .primaryColor),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/AlbertaDiagram',
                            arguments: coloredFields);
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            Navigator.pushNamed(context, '/AlbertaDiagram',
                arguments: coloredFields);
          }
        });
  }

  void printAlbertaObject(AlbertaData data) {
    print("\n\n*****************OBJETO albertaDATA: ");
    print("Bclc : ${data.bclc}");
    print("Cps : ${data.cps}");
    print("Portal ht : ${data.portalHypertension}");
    print("Pvt : ${data.pvt}");
    print("Platelets : ${data.platelets}");
    print("Varices: ${data.varices}");
    print("Bilirrubina : ${data.bilirubin}");
    print("Encefalopatía: " + data.encephalopaty);
    print("Ascitis: " + data.ascites);
    print("Tamaño de tumor: " + data.tumourSize.toString());
    print("AFP: " + data.afp.toString());
    print("Resultados : ${data.results.toString()}");
  }

  _buildBottomSheet(CompleteFormBloc formBloc) {
    var diagnosticButton = CalcBottomButton(
      title: 'diagnostic_imaging',
      onPressed: () => widget.pageController.jumpToPage(0),
    );

    var laboratoryButton = CalcBottomButton(
      title: 'laboratory_values',
      onPressed: () => widget.pageController.jumpToPage(1),
    );

    var clinicalButton = CalcBottomButton(
        title: 'clinical_questions',
        onPressed: () => widget.pageController.jumpToPage(2));

    var summaryButton = CalcBottomButton(
      title: 'value_summary',
      onPressed: () =>
          widget.pageController
              .nextPage(
              duration: Duration(seconds: 1), curve: Curves.easeInOut),
    );
    bool isTablet = context.diagonalInches >= 7;

    return BottomAppBar(
      child: Container(
        width: context.widthPx,
        height: 45,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            children: <Widget>[
              SizedBox(width: 10),
              diagnosticButton,
              SizedBox(width: isTablet ? 15 : 10),
              laboratoryButton,
              SizedBox(width: isTablet ? 15 : 10),
              clinicalButton,
              SizedBox(width: isTablet ? 15 : 10),
              summaryButton,
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  getTumourSize() {
    List<double> tumourSizeList = [];
    for (int i = 0; i < prefs.getTumourNumber(); i++) {
      tumourSizeList
          .add(double.parse(widget.formBloc.tumourSizeField[i].value));
    }
    return tumourSizeList;
  }

  getIndexPage() {
    int index;
    switch (albertaAlgorithm.treatments[0]) {
      case 'resection':
        index = 0;
        break;
      case 'lt_long':
        index = 1;
        break;
      case 'rfa':
        index = 2;
        break;
      case 'tare':
        index = 3;
        break;
      case 'tace':
        index = 4;
        break;
      case 'sorafenib':
        index = 5;
        break;
      case 'lenvatinib':
        index = 6;
        break;
      case 'best_supportive_care_oneline':
        index = 11;
        break;
      default:
        index = 0;
        break;
    }
    return index;
  }
}
