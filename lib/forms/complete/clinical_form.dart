import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/right_bottom_title.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:hepapp/widgets/more_information.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import '../CalcGroupField.dart';
import 'complete_form_bloc.dart';

class ClinicalForm extends StatefulWidget with Observable {
  ClinicalForm({Key key, this.formBloc}) : super(key: key);
  final formBloc;

  @override
  ClinicalFormState createState() => ClinicalFormState();
}

class ClinicalFormState extends State<ClinicalForm> with Observable {
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
    return BlocProvider<CompleteFormBloc>(
      builder: (context) => CompleteFormBloc(),
      child: Builder(
        builder: (context) {
          //final formBloc = widget.formBloc;//BlocProvider.of<AllFormBloc>(context);
          final formBloc = BlocProvider.of<CompleteFormBloc>(context);

          return FormBlocListener<CompleteFormBloc, String, String>(
            child: Scaffold(
              appBar: CustomAppBar(
                context,
                'calculators_all_algorithms_clinical',
                selScreenshot: true,
                //selPartialSettings: true,
              ),
              drawer: MenuWidget(),
              body: Stack(
                children: <Widget>[
                  Stack(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildLeftColumn(formBloc),
                      _buildRightColumn(formBloc),
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

  _buildLeftColumn(CompleteFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      width: context.widthPx,
      //isTablet ? context.widthPct(0.62) : context.widthPct(0.65),
      height: context.heightPx,
      //color: Colors.red,
      padding: EdgeInsets.only(left: 20, top: 20),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          _buildCirrhosisRow(aux, formBloc),
          _buildEncephalopatyRow(aux, formBloc),
          _buildAscitesRow(aux, formBloc),
          _buildVaricesRow(aux, formBloc),
          _buildEcogRow(aux, formBloc),

          //_buildCalcButton(aux, formBloc),
        ],
      ),
    );
  }

  _buildCirrhosisRow(
    AppLocalizations aux,
      CompleteFormBloc formBloc,
  ) {
    //print("error encephalopaty " + _error.toString());
    return CalcGroupField(
      //error: _error,
      initialValue: formBloc.cirrhosisField.value.toString(),
      reset: reset,
      previous: previous,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.cirrhosisField,
      title: 'cirrhosis',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),

      itemBuilder: (context, item) => item,
    );
  }

  _buildEncephalopatyRow(
    AppLocalizations aux,
      CompleteFormBloc formBloc,
  ) {
    return CalcGroupField(
      //error: _error,
      initialValue: formBloc.encephalopatyField.value.toString(),
      reset: reset,
      previous: previous,
      padding: EdgeInsets.only(left: 8),
      //formBloc: formBloc,
      selectFieldBloc: formBloc.encephalopatyField,
      title: 'encephalopaty',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),

      itemBuilder: (context, item) => item,
    );
  }

  _buildAscitesRow(
    AppLocalizations aux,
      CompleteFormBloc formBloc,
  ) {
    return CalcGroupField(
      initialValue: formBloc.ascitesField.value.toString(),
      previous: previous,
      reset: reset,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.ascitesField,
      title: 'ascites',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildVaricesRow(
    AppLocalizations aux,
      CompleteFormBloc formBloc,
  ) {
    return CalcGroupField(
      initialValue: formBloc.varicesField.value.toString(),
      previous: previous,
      reset: reset,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.varicesField,
      title: 'varices',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildEcogRow(
    AppLocalizations aux,
      CompleteFormBloc formBloc,
  ) {
    return CalcGroupField(
      initialValue: formBloc.ecogField.value.toString(),
      previous: previous,
      reset: reset,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.ecogField,
      title: 'ecog',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildCalcButton(
    AppLocalizations aux,
      CompleteFormBloc formBloc,
  ) {
    bool isTablet = context.diagonalInches >= 7;
    //var errordentro = prefs.getError();
    return Container(
      //width: 250,
      //padding: EdgeInsets.all(8.0),
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
          submitDiagnostic(formBloc);
        },
        child: Center(
          child: Text(
            aux.tr('calculate_okuda'),
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 15 : 12,
            ),
          ),
        ),
      ),
    );
  }

  _buildBottomSheet(CompleteFormBloc formBloc) {
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
              _buildMoreInfoButton(aux),
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

  Container _buildMoreInfoButton(AppLocalizations aux) {
    bool isTablet = context.diagonalInches >= 7;
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

  Container _buildResetButton(AppLocalizations aux, CompleteFormBloc formBloc) {
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

  _buildRightColumn(CompleteFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    List<List<String>> resultList = [
      ['okuda', formBloc.results.toString()],
    ];

    return Column(
      children: <Widget>[
        // _buildIUnitsRow(formBloc),
        /*Container(
            alignment: Alignment.topRight,
            //padding: EdgeInsets.fromLTRB(0, 30, 40, 0),
            child: CalcResultWidget(resultList),),*/
        RightBottomTitle(
          title: 'clinical_questions',
          padding: EdgeInsets.fromLTRB(10, 0, 15, 50),
        ),
      ],
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

  void resetValues(CompleteFormBloc formBloc) {
    reset = true;
    formBloc.reset();
    setState(() {});
  }

  void previousValues(CompleteFormBloc formBloc) {
    reset = false;
    previous = true;
    formBloc.previous();
    setState(() {});
  }

  _buildNextButton(AppLocalizations aux, CompleteFormBloc formBloc) {
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
//          submitDiagnostic(formBloc);
          Navigator.pushNamed(context, '/AllResultsCalc', arguments: formBloc);
        },
      ),
    );
  }
}
