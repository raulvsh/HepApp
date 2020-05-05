import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/calc_result_widget.dart';
import 'package:hepapp/forms/right_bottom_title.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
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

  Container _buildTreatmentsRow() {
    bool isLandscape = context.isLandscape;
    return Container(
      //color: Colors.red,
      height: context.heightPct(isLandscape ? 0.3 : 0.50),

      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildRecommendedTreatments(),
              SizedBox(width: 40),
              isLandscape
                  ? _buildMoreInfoButton()
                  : Container(
                  height: 0,
                  width: 0
              ),
              SizedBox(width: 40),
              isLandscape
                  ? _buildAlbertaButton()
                  : Container(
                  height: 0,
                  width: 0
              ),
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

  _buildHepaticColumn(CompleteFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;
    Map<String, String> resultMap = {
      'cirrhosis': formBloc.cirrhosisField.value != null
          ? aux.tr(formBloc.cirrhosisField.value)
          : '-',
      'apri': '-',
      'child_pugh_score_oneline': '-',
      'meld': '-',
      'meld_na': '-',
      '5v_meld': '-',
    };

    return FittedBox(
      child: Container(
        width: context.widthPct(0.5),
        //color: Colors.red,
        //padding: EdgeInsets.only(left: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                margin: isLandscape ? null : EdgeInsets.only(right: 10),
                width: isTablet ? 400 : 200,
                height: isTablet ? 30 : 20,
                color: Color.fromARGB(255, 210, 242, 245),
                child: Center(
                    child: Text(
                      aux.tr('liver_function').toUpperCase(),
                      style: TextStyle(
                          color: Colors.black, fontSize: isTablet ? 16 : 13),
                    ))),
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

  _buildBottomSheet(CompleteFormBloc formBloc) {
    return BottomAppBar(
      child: Stack(
        children: <Widget>[
          Row(
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
              //_buildMoreInfoButton(),
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

  Container _buildMoreInfoButton() {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      //width: 250,
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
      //margin: EdgeInsets.only(right: context.widthPct(0.25), left: 25),
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
        onPressed: () {
          //submitDiagnostic(formBloc);
        },
        child: Center(
          child: Text(
            aux.tr('more_information'),
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 15 : 12,
            ),
          ),
        ),
      ),
    );
  }

  Future showMoreInfo() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        /*return MoreInformation(
          //TODO cambiar titulo y path
          title: 'okuda',
          pathList: 'assets/images/calc/M3C14S0d.png',
        );*/
        return Text("por hacer");
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
          aux.tr('diagnostic_imaging'),
          style: TextStyle(
            fontSize: isTablet ? 14 : 12,
          ),
        ),
        color: Color.fromARGB(255, 210, 242, 245),
        onPressed: () {
          widget.controller.jumpToPage(0);

          //duration: Duration(seconds: 1), curve: Curves.easeInOut);
          //previousValues(formBloc);


        },
      ),
    );
  }

  Container _buildResetButton(CompleteFormBloc formBloc) {
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

  _buildAlgorithmsColumn(CompleteFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;
    Map<String, String> resultMap = {
      'okuda': formBloc.resultsField['okuda'],
      'clip': '-',
      'getch': '-',
      'tnm': '-',
      'cupi': '-',
      'bclc': '-',
    };

    return FittedBox(
      //padding: const EdgeInsets.all(8.0),
      child: Container(
        width: context.widthPct(0.5),
        // color: Colors.blue,
        //padding: EdgeInsets.only(left: 10, top: 20),
        child: Column(
          children: <Widget>[
            Container(
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
                )),
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

  Container _buildInitialBlueRectangle() {
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      color: Color.fromARGB(255, 210, 242, 245),
      width: 15.0,
      height: 90.0,
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
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          onPressed: () {
                            //prefs.setError(false);

                            Navigator.pop(context);
                            setState(() {});
                            //Navigator.pop(context);
                          }),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  _buildAlbertaButton() {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      //width: 250,
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
      //margin: EdgeInsets.only(right: context.widthPct(0.25), left: 25),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: BorderSide(
              color: Color.fromARGB(255, 45, 145, 155),
              width: 1.5,
            )),
        color: Theme
            .of(context)
            .primaryColor,
        splashColor: Color.fromARGB(255, 56, 183, 198),
        elevation: 3,
        onPressed: () {
          // submitDiagnostic(formBloc);
        },
        child: Center(
          child: Text(
            aux.tr('alberta_hcc_algorithm'),
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 15 : 12,
            ),
          ),
        ),
      ),
    );
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
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);

    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: FlatButton(
        child: Text(
          aux.tr('value_summary'),
          style: TextStyle(
            fontSize: isTablet ? 14 : 12,
          ),
        ),
        color: Color.fromARGB(255, 210, 242, 245),
        onPressed: () {
          submitDiagnostic(formBloc);
          widget.controller.nextPage(
              duration: Duration(seconds: 1), curve: Curves.easeInOut);

          // Navigator.pushNamed(context, '/CompletePage', arguments: 4);
        },
      ),
    );
  }
}
