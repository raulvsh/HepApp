import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:hepapp/widgets/more_information.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import '../CalcGroupField.dart';
import '../right_bottom_title.dart';
import 'all_form_bloc.dart';

class AllDiagnosticForm extends StatefulWidget with Observable {
  AllDiagnosticForm({Key key}) : super(key: key);

  @override
  AllDiagnosticFormState createState() => AllDiagnosticFormState();
}

class AllDiagnosticFormState extends State<AllDiagnosticForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = PreferenciasUsuario();
  final units = Units();

  //bool _internationalUnits = true;

  Map<String, bool> _errorMap;

  //StreamSubscription streamSubIUnits;

  //StreamSubscription streamSubErrorList;
  StreamSubscription streamSubErrorMap;

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
    prefs.setInternationalUnits(true);*/

    streamSubErrorMap = prefs.errorMapUpdates.listen((newVal) => setState(() {
          _errorMap = newVal;
        }));
    prefs.initErrorMap([
      'tumour_number',
      'tumour_size',
      'tumour_extent',
      'pvi',
      'nodes',
      'metastasis',
      'portal_hypertension',
      'pvt_complete'
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
    return BlocProvider<AllFormBloc>(
      builder: (context) => AllFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<AllFormBloc>(context);
          return FormBlocListener<AllFormBloc, String, String>(
            child: Scaffold(
              appBar: CustomAppBar(
                context,
                'calculators_all_algorithms_diagnostic',
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

  _buildLeftColumn(AllFormBloc formBloc) {
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
          _buildTumourNumberRow(aux, formBloc),
          _buildTumourSizeRow(aux, formBloc),
          _buildTumourExtentRow(aux, formBloc),
          //_buildCalcButton(aux, formBloc),
          _buildPviRow(aux, formBloc),
          _buildNodesRow(aux, formBloc),
          _buildMetastasisRow(aux, formBloc),
          _buildPortalHypertensionRow(aux, formBloc),
          _buildPvtRow(aux, formBloc),
        ],
      ),
    );
  }

  _buildTumourNumberRow(AppLocalizations aux, AllFormBloc formBloc) {
    return CalcGroupField(
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

  _buildTumourSizeRow(AppLocalizations aux, AllFormBloc formBloc) {
    return CalcGroupField(
      reset: reset,
      previous: previous,
      initialValue: formBloc.tumourSizeField.value.toString(),
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.tumourSizeField,
      title: 'tumour_size',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildTumourExtentRow(AppLocalizations aux, AllFormBloc formBloc) {
    return CalcGroupField(
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

  _buildPviRow(AppLocalizations aux, AllFormBloc formBloc) {
    return CalcGroupField(
      reset: reset,
      previous: previous,
      initialValue: formBloc.pviField.value.toString(),
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.pviField,
      title: 'pvi_portal_vein_invasion',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildNodesRow(AppLocalizations aux, AllFormBloc formBloc) {
    return CalcGroupField(
      reset: reset,
      previous: previous,
      initialValue: formBloc.nodesField.value.toString(),
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.nodesField,
      title: 'nodes',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildMetastasisRow(AppLocalizations aux, AllFormBloc formBloc) {
    return CalcGroupField(
      reset: reset,
      previous: previous,
      initialValue: formBloc.metastasisField.value.toString(),
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.metastasisField,
      title: 'metastasis',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildPortalHypertensionRow(AppLocalizations aux, AllFormBloc formBloc) {
    return CalcGroupField(
      reset: reset,
      previous: previous,
      initialValue: formBloc.portalHypertensionField.value.toString(),
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.portalHypertensionField,
      title: 'portal_hypertension_complete',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildPvtRow(AppLocalizations aux, AllFormBloc formBloc) {
    return CalcGroupField(
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

  _buildCalcButton(
    AppLocalizations aux,
    AllFormBloc formBloc,
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
    bool isTablet = context.diagonalInches >= 7;
    List<List<String>> resultList = [
      ['okuda', formBloc.results.toString()],
    ];

    return //Container(
        //width: isTablet ? context.widthPct(0.38) : context.widthPct(0.35),
        //color: Colors.blue,
        // child:
        Column(
      children: <Widget>[
        // _buildIUnitsRow(formBloc),
        /*Container(
            alignment: Alignment.topRight,
            //padding: EdgeInsets.fromLTRB(0, 30, 40, 0),
            child: CalcResultWidget(resultList),),*/
        RightBottomTitle(
          title: 'diagnostic_imaging',
          padding: EdgeInsets.fromLTRB(10, 0, 15, 50),
        ),
        //_buildRightBottomTitle(),
      ],
      //),
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
          submitDiagnostic(formBloc);
          Navigator.pushNamed(context, '/AllLaboratoryCalc',
              arguments: formBloc);
        },
      ),
    );
  }
}
