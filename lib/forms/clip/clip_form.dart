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

import '../PartialCalcGroupField.dart';
import '../PartialCalcTextField.dart';
import '../calc_result_widget.dart';
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
  final prefs = PreferenciasUsuario();
  final units = Units();
  bool _internationalUnits = true;

  //List<bool> _errorList;
  Map<String, bool> _errorMap;

  StreamSubscription streamSubIUnits;

  //StreamSubscription streamSubErrorList;
  StreamSubscription streamSubErrorMap;

  String errorPrueba = "";

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    streamSubIUnits = prefs.iUnitsUpdates.listen(
      (newVal) => setState(() {
        _internationalUnits = newVal;
      }),
    );
    prefs.setInternationalUnits(true);

    streamSubErrorMap = prefs.errorMapUpdates.listen((newVal) => setState(() {
          _errorMap = newVal;
        }));
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
    streamSubIUnits.cancel();
    //streamSubErrorList.cancel();
    streamSubErrorMap.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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

  _buildLeftColumn(ClipFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      width: isTablet ? context.widthPct(0.68) : context.widthPct(0.71),
      height: context.heightPx,
      //color: Colors.red,
      padding: EdgeInsets.only(left: 20, top: 20),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          _buildAFPRow(aux, formBloc),
          _buildCPSRow(aux, formBloc),
          _buildTumourNumberRow(aux, formBloc),
          _buildTumourExtentRow(aux, formBloc),

          _buildPVTRow(aux, formBloc),
          _buildCalcButton(aux, formBloc),
          Text(prefs.getErrorMap().toString()),
          //.entries.toList().toString(), style: TextStyle(fontSize: 16, color: Colors.black),),
          Text(prefs.getErrorMap().values.toString()),
          //Text(prefs.getErrorMap().values.contains(true).toString()),
          Text(prefs.isMapError().toString()),
          Text(errorPrueba),
        ],
      ),
    );
  }

  _buildAFPRow(AppLocalizations aux, ClipFormBloc formBloc) {
    return PartialCalcTextField(
      textFieldBloc: formBloc.afpField,
      title: 'afp',
      uds: 'ug/L',
    );
  }

  _buildCPSRow(AppLocalizations aux, ClipFormBloc formBloc) {
    return PartialCalcGroupField(
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

  _buildTumourNumberRow(AppLocalizations aux, ClipFormBloc formBloc) {
    return PartialCalcGroupField(
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

  _buildTumourExtentRow(AppLocalizations aux, ClipFormBloc formBloc) {
    return PartialCalcGroupField(
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

  _buildPVTRow(AppLocalizations aux, ClipFormBloc formBloc) {
    return PartialCalcGroupField(
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
    ClipFormBloc formBloc,
  ) {
    bool isTablet = context.diagonalInches >= 7;
    //var errordentro = prefs.getError();
    return Container(
      width: 250,
      //padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(right: context.widthPct(0.25), left: 25),
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
          calculateClip(formBloc);
        },
        child: Center(
          child: Text(
            aux.tr('calculate_clip'),
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 15 : 12,
            ),
          ),
        ),
      ),
    );
  }

  _buildBottomSheet(ClipFormBloc formBloc) {
    var aux = AppLocalizations.of(context);

    return BottomAppBar(
      child: Row(
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
          title: 'clip',
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

  Container _buildResetButton(AppLocalizations aux, ClipFormBloc formBloc) {
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

  _buildRightColumn(ClipFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    List<List<String>> resultList = [
      ['clip', formBloc.result],
    ];

    return Container(
      width: isTablet ? context.widthPct(0.32) : context.widthPct(0.29),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 30, 30, 0),
            child: CalcResultWidget(
              resultList: resultList, alignment: MainAxisAlignment.center,),
          ),
          RightBottomTitle(
            title: 'clip', padding: EdgeInsets.fromLTRB(10, 0, 30, 50),),

        ],
      ),
    );
  }


  void calculateClip(ClipFormBloc formBloc) {
    prefs.isMapError()
        ? errorPrueba = "hay al menos un error"
        : errorPrueba = "no hay errores";

    //prefs.isError()
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

  void resetValues(ClipFormBloc formBloc) {
    reset = true;
    formBloc.reset();
    setState(() {});
  }

  void previousValues(ClipFormBloc formBloc) {
    reset = false;
    previous = true;
    formBloc.previous();
    setState(() {});
  }
}
