import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/calc_result_widget.dart';
import 'package:hepapp/forms/right_bottom_title.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:hepapp/widgets/more_information.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import 'all_form_bloc.dart';

class AllResultsForm extends StatefulWidget with Observable {
  AllResultsForm({Key key, this.formBloc}) : super(key: key);
  final formBloc;

  @override
  AllResultsFormState createState() => AllResultsFormState();
}

class AllResultsFormState extends State<AllResultsForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = PreferenciasUsuario();
  final units = Units();

  //bool _internationalUnits = true;

  //Map<String, bool> _errorMap;

  //StreamSubscription streamSubIUnits;

  //StreamSubscription streamSubErrorList;
  //StreamSubscription streamSubErrorMap;

  //String errorPrueba = "";

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    /*streamSubIUnits = prefs.iUnitsUpdates.listen(
          (newVal) =>
          setState(() {
            _internationalUnits = newVal;
          }),
    );
    prefs.setInternationalUnits(true);

    streamSubErrorMap = prefs.errorMapUpdates.listen((newVal) =>
        setState(() {
          _errorMap = newVal;
        }));
    prefs.initErrorMap(
        ['bilirubin', 'albumin', 'ascites', 'tumour_extent']);*/

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
    return BlocProvider<AllFormBloc>(
      builder: (context) => AllFormBloc(),
      child: Builder(
        builder: (context) {
          //final formBloc = widget.formBloc;//BlocProvider.of<AllFormBloc>(context);
          final formBloc = BlocProvider.of<AllFormBloc>(context);

          return FormBlocListener<AllFormBloc, String, String>(
            child: Scaffold(
              appBar: CustomAppBar(
                context,
                'calculators_all_algorithms_results',
                selScreenshot: true,
                //selPartialSettings: true,
              ),
              drawer: MenuWidget(),
              body: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _buildResultsRow(context, formBloc),
                      _buildTreatmentsRow(context)
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

  Container _buildTreatmentsRow(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: context.heightPct(0.20),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildRecommendedTreatments(),
          SizedBox(
            width: 70,
          ),
          _buildMoreInfoButton(),
          SizedBox(
            width: 55,
          ),
          _buildAlbertaButton(),
          RightBottomTitle(
            title: 'result',
            padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
          ),
        ],
      ),
    );
  }

  Container _buildResultsRow(BuildContext context, AllFormBloc formBloc) {
    return Container(
      height: context.heightPct(0.55),
      //color: Colors.green,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildLeftColumn(formBloc),
          _buildRightColumn(formBloc),
        ],
      ),
    );
  }

  _buildLeftColumn(AllFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    Map<String, String> resultMap = {
      'cirrhosis': '-',
      'apri': '-',
      'child_pugh_score_oneline': '-',
      'meld': '-',
      'meld_na': '-',
      '5v_meld': '-',
    };

    return Container(
      width: context.widthPct(0.5),
      //color: Colors.red,
      padding: EdgeInsets.only(left: 20, top: 20),
      child: Column(
        children: <Widget>[
          Container(
              width: isTablet ? 400 : 200,
              height: isTablet ? 30 : 20,
              color: Color.fromARGB(255, 210, 242, 245),
              child: Center(
                  child: Text(
                aux.tr('liver_function').toUpperCase(),
                style: TextStyle(
                    color: Colors.black, fontSize: isTablet ? 16 : 14),
              ))),
          CalcResultWidget(
            resultList: resultMap,
            alignment: MainAxisAlignment.start,
          ),
        ],
      ),
    );
  }

  _buildBottomSheet(AllFormBloc formBloc) {
    var aux = AppLocalizations.of(context);

    return BottomAppBar(
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildResetButton(aux, formBloc),
              SizedBox(
                width: 15,
              ),
              _buildPreviousButton(aux, formBloc),
              SizedBox(
                width: 15,
              ),
              //_buildMoreInfoButton(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _buildNextButton(aux, formBloc),
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
      padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 10),
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
        return MoreInformation(
          title: 'okuda',
          path: 'assets/images/calc/M3C14S0d.png',
        );
      },
    );
  }

  Container _buildPreviousButton(AppLocalizations aux, formBloc) {
    bool isTablet = context.diagonalInches >= 7;

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

  Container _buildResetButton(AppLocalizations aux, AllFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;

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

  _buildRightColumn(AllFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    Map<String, String> resultMap = {
      'okuda': '-',
      'clip': '-',
      'getch': '-',
      'tnm': '-',
      'cupi': '-',
      'bclc': '-',
    };

    return Container(
      width: context.widthPct(0.5),
      // color: Colors.blue,
      padding: EdgeInsets.only(left: 20, top: 20),
      child: Column(
        children: <Widget>[
          Container(
              width: isTablet ? 400 : 200,
              height: isTablet ? 30 : 20,
              color: Color.fromARGB(255, 210, 242, 245),
              child: Center(
                  child: Text(
                aux.tr('staging_algorithms').toUpperCase(),
                style: TextStyle(
                    color: Colors.black, fontSize: isTablet ? 16 : 14),
              ))),
          CalcResultWidget(
            resultList: resultMap,
            alignment: MainAxisAlignment.start,
          ),
        ],
      ),
    );
  }

  _buildRecommendedTreatments() {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);
    return Row(
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
                  TextStyle(color: Colors.black, fontSize: isTablet ? 16 : 12),
            ),
            SizedBox(
              height: 10,
            ),

            buildRecommendedTreatmentRow('1', 'recommended treatment 1'),
            SizedBox(
              height: 10,
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
    return Container(
      color: Color.fromARGB(255, 210, 242, 245),
      width: 15.0,
      height: 110.0,
    );
  }

  void submitDiagnostic(AllFormBloc formBloc) {
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

  void resetValues(AllFormBloc formBloc) {
    reset = true;
    formBloc.reset();
    setState(() {});
  }

  void previousValues(AllFormBloc formBloc) {
    reset = false;
    previous = true;
    formBloc.previous();
    setState(() {});
  }

  _buildNextButton(AppLocalizations aux, AllFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: FlatButton(
        child: Text(
          aux.tr('next'),
          style: TextStyle(
            fontSize: isTablet ? 14 : 12,
          ),
        ),
        color: Color.fromARGB(255, 210, 242, 245),
        onPressed: () {
          //submitDiagnostic(formBloc);
          Navigator.pushNamed(context, '/AllSummaryCalc', arguments: formBloc);
        },
      ),
    );
  }

  _buildAlbertaButton() {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      //width: 250,
      padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 10),
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
}
