import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/calculators/alberta/alberta_algorithm.dart';
import 'package:hepapp/calculators/alberta/alberta_data.dart';
import 'package:hepapp/calculators/calc_result_widget.dart';
import 'package:hepapp/calculators/right_bottom_title.dart';
import 'package:hepapp/data/units.dart';
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
          ? context.heightPct(isTablet ? 0.52 : 0.42)
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
    bool isTablet = context.diagonalInches >= 7;

    return FittedBox(
      child: Container(
        width: context.widthPct(0.5),
        padding: EdgeInsets.only(left: 20, top: isTablet ? 20 : 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildLiverFunctionHeader(),
            Container(
              margin: EdgeInsets.only(right: isLandscape ? 10 : 0),
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
        margin: EdgeInsets.only(right: isLandscape ? 10 : 0),
        width: isTablet ? 400 : 200,
        height: isTablet ? 30 : 20,
        color: Color.fromARGB(255, 210, 242, 245),
        child: Center(
            child: Text(
          aux.tr('liver_function').toUpperCase(),
          style: TextStyle(color: Colors.black, fontSize: isTablet ? 16 : 13),
        )));
  }

  Container _buildStagingAlgorithmsHeader(bool isLandscape, bool isTablet,
      AppLocalizations aux) {
    return Container(
        margin: EdgeInsets.only(right: isLandscape ? 20 : 0),
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
      'bclc': aux.tr(formBloc.resultsField['bclc']),
    };

    return FittedBox(
      child: Container(
        width: context.widthPct(0.5),
        padding: EdgeInsets.only(left: 10, top: isTablet ? 20 : 10),
        child: Column(
          children: <Widget>[
            _buildStagingAlgorithmsHeader(isLandscape, isTablet, aux),
            Container(
              margin: EdgeInsets.only(right: isLandscape ? 20 : 0),
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
        height: context.heightPct(isLandscape ? 0.255 : 0.50),
        width: context.widthPx,
        padding: isTablet
            ? EdgeInsets.only(left: isLandscape ? 50 : 20)
            : EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: isLandscape
            ? Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildRecommendedTreatments(),
            SizedBox(width: isTablet ? 40 : 20),
            _buildMoreInfoButton(),
            SizedBox(width: isTablet ? 30 : 20),
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
        )

      /*Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildRecommendedTreatments(),
              SizedBox(width: isTablet ? 40 : 20),
              isLandscape
                  ? _buildMoreInfoButton()
                  : Container(height: 0, width: 0),
              SizedBox(width: isTablet ? 40 : 20),
              isLandscape
                  ? _buildAlbertaButton(widget.formBloc)
                  : Container(height: 0, width: 0),
            ],
          ),
          !isLandscape
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildMoreInfoButton(),
                    SizedBox(width: 40),
                    _buildAlbertaButton(widget.formBloc),
                  ],
                )
              : Container(height: 0, width: 0),
        ],
      ),*/
    );
  }

  _buildRecommendedTreatments() {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);
    return FittedBox(
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _initialBlueRectangle,
          SizedBox(
            width: 10,
          ),
          Column(
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
              buildRecommendedTreatmentRow('1', 'recommended treatment 1'),
              SizedBox(
                height: isTablet ? 10 : 4,
              ),
              buildRecommendedTreatmentRow('2', 'recommended treatment 2'),
              SizedBox(height: 2)
            ],
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

  _buildAlbertaButton(CompleteFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;

    return CalculatorButton(
        title: 'alberta_hcc_algorithm',
        width: isTablet ? 250.0 : 175.0,
        onPressed: () {
          var data = AlbertaData(
            bclc: formBloc.resultsField['bclc'],
            cps: formBloc.resultsField['child_pugh_score_oneline'],
            portalHypertension: formBloc.portalHypertensionField.value,
            pvt: formBloc.pvtField.value,
            platelets: formBloc.plateletsField.value,
            varices: formBloc.varicesField.value,
            bilirubin: formBloc.bilirubinField.valueToDouble,
            results: formBloc.resultsField,
          );
          print("\n\n*****************OBJETO albertaDATA: "
              "\nbclc : ${data.bclc}" +
              "\ncps : ${data.cps}" +
              "\nportal ht : ${data.portalHypertension}" +
              "\npvt : ${data.pvt}" +
              "\nplatelets : ${data.platelets}" +
              "\nvarices: ${data.varices}" +
              "\nbilirrubina : ${data.bilirubin}" +
              "\nresultados : ${data.results}" +
              "\n**************");

          List<bool> coloredFields = [];
          for (int i = 0; i <= 46; i++) {
            coloredFields.add(false);
          }

          if (formBloc.resultsField['bclc'] == '-' ||
              formBloc.resultsField['cps'] == '-') {
            showDialog(
              context: context,
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  title: Text('error'),
                  content: Text('error alberta'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('continuar'),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/Alberta',
                            arguments: coloredFields);
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            AlbertaAlgorithm albertaAlgorithm = AlbertaAlgorithm(data);
            coloredFields = albertaAlgorithm.obtenerRecorrido();
            //print(albertaAlgorithm.obtenerRecorrido());
            Navigator.pushNamed(context, '/Alberta', arguments: coloredFields);
          }

          /*try {
          this.resultadoField = cpsAlgorithm.obtenerResultado();
          data.result = this.resultadoField;
        } catch (e) {
          print("Excepción: $e");
        }
          formBloc.*/
        } /*=>
            Navigator.pushNamed(context, '/Alberta',
            )
      },*/ /*() {
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
        }*/
    );
  }

  _buildBottomSheet(CompleteFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    var diagnosticButton = CalcBottomButton(
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
        });
    var laboratoryButton = CalcBottomButton(
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
        });
    var summaryButton = CalcBottomButton(
        title: 'value_summary',
        onPressed: () {
          widget.controller.nextPage(
              duration: Duration(seconds: 1), curve: Curves.easeInOut);
        });
    var isLandscape = context.isLandscape;
    bool isTablet = context.diagonalInches >= 7;

    return BottomAppBar(
      child: Container(
        width: context.widthPx,
        height: 45,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            /*mainAxisAlignment: isLandscape && !isTablet
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,*/
            children: <Widget>[
              SizedBox(width: 10),

              diagnosticButton,
              SizedBox(width: isTablet ? 15 : 10),
              laboratoryButton,
              SizedBox(width: isTablet ? 15 : 10),
              clinicalButton(aux),
              //SizedBox(width: double.infinity,),
              //Expanded(child: Container(),),
              SizedBox(width: isTablet ? 15 : 10),

              //isLandscape?Expanded():Container(),
              summaryButton,
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
      /*Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              summaryButton,
              SizedBox(width: 10),
              //_buildSummaryButton(formBloc),
            ],
          ),*/
    );
  }

  CalcBottomButton clinicalButton(AppLocalizations aux) {
    return CalcBottomButton(
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
        });
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
