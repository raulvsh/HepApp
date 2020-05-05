import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/right_bottom_title.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:hepapp/widgets/more_information.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import '../calc_group_field.dart';
import '../calc_result_widget.dart';
import '../calc_text_field.dart';
import '../international_units_select.dart';
import 'cps_form_bloc.dart';

class CpsForm extends StatefulWidget with Observable {
  CpsForm({Key key}) : super(key: key);

  @override
  CpsFormState createState() => CpsFormState();
}

class CpsFormState extends State<CpsForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = UserSettings();
  final units = Units();
  bool _internationalUnits = true;

  Map<String, bool> _errorMap;
  StreamSubscription streamSubIUnits;
  StreamSubscription streamSubErrorMap;

  String errorPrueba = "";

  @override
  void initState() {
    streamSubIUnits = prefs.iUnitsUpdates.listen(
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
        ['bilirubin', 'inr', 'albumin', 'encephalopaty', 'ascites']);

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
    streamSubErrorMap.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = context.isLandscape;
    bool isTablet = context.diagonalInches >= 7;
    !isTablet
        ? SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ])
        : null;

    return BlocProvider<CpsFormBloc>(
      builder: (context) => CpsFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<CpsFormBloc>(context);

          return FormBlocListener<CpsFormBloc, String, String>(
            /*onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                 Notifications.showSnackBarWithSuccess(
                    context, state.successResponse);
                 //Muestra una barra verde con la palabra success
              },*/
            /*onFailure: (context, state) {

              //LoadingDialog.hide(context);
              Notifications.showSnackBarWithError(
                  context, state.failureResponse);
            },*/
            child: Scaffold(
              appBar: CustomAppBar(
                context,
                'child_pugh_score_oneline',
                selScreenshot: true,
                //selPartialSettings: true,
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
                        title: 'child_pugh_score_oneline',
                        padding:
                        EdgeInsets.fromLTRB(10, 10, isTablet ? 45 : 20, 50),
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

  _buildDataFields(CpsFormBloc formBloc) {
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
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildBilirrubinRow(formBloc),
              _buildInrRow(formBloc),
              _buildAlbuminRow(formBloc),
              _buildEncephalopatyRow(formBloc),
              _buildAscitesRow(formBloc),
              SizedBox(height: 20),
              _buildCalcButton(formBloc),
              //SizedBox(height: 45,)
              //Text(prefs.getErrorMap().toString()),
              //Text(prefs.getErrorMap().values.toString()),
              //Text(prefs.isMapError().toString()),
              //Text(errorPrueba),
            ],
          ),
        ),
      ),
    );
  }

  _buildBilirrubinRow(CpsFormBloc formBloc) {
    return CalcTextField(
      errorControl: true,
      textFieldBloc: formBloc.bilirubinField,
      title: 'bilirubin',
      uds: _internationalUnits ? units.bilirubinUds[0] : units.bilirubinUds[1],
    );
  }

  _buildInrRow(CpsFormBloc formBloc) {
    return CalcTextField(
      errorControl: true,
      textFieldBloc: formBloc.inrField,
      title: 'inr',
    );
  }

  _buildAlbuminRow(CpsFormBloc formBloc) {
    return CalcTextField(
      errorControl: true,
      textFieldBloc: formBloc.albuminField,
      title: 'albumin',
      uds: _internationalUnits ? units.albuminUds[0] : units.albuminUds[1],
    );
  }

  _buildEncephalopatyRow(CpsFormBloc formBloc) {
    return CalcGroupField(
      errorControl: true,
      initialValue: formBloc.encephalopatyField.value.toString(),
      reset: reset,
      previous: previous,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.encephalopatyField,
      title: 'encephalopaty',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildAscitesRow(CpsFormBloc formBloc) {
    return CalcGroupField(
      errorControl: true,
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

  _buildCalcButton(CpsFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: context.widthPct(0.25), left: 25),
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
          calculateCps(formBloc);
        },
        child: Center(
          child: Text(
            aux.tr('calculate_cp_score'),
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 15 : 12,
            ),
          ),
        ),
      ),
    );
  }

  _buildBottomSheet(CpsFormBloc formBloc) {
    return BottomAppBar(
      child: Row(
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
          _buildMoreInfoButton(),
        ],
      ),
    );
  }

  Container _buildMoreInfoButton() {
    AppLocalizations aux = AppLocalizations.of(context);

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
          title: 'child_pugh_score_oneline',
          pathList: ['assets/images/calc/M3C14S0c.png'],
        );
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

  Container _buildResetButton(CpsFormBloc formBloc) {
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

  _buildResult(CpsFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;
    Map<String, String> resultMap = {
      'child_pugh_score_oneline': formBloc.resultadoField
    };
    return Expanded(
      child: Container(
        //color: Colors.green,
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
            Container(
              padding: isLandscape && !isTablet
                  ? EdgeInsets.only(left: 77)
                  : EdgeInsets.zero,
              child: FittedBox(
                fit: BoxFit.contain,
                child: InternationalUnitsSelect(
                  formBloc: formBloc,
                ),
              ),
            ),

            FittedBox(
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
            ),

            // 'child_pugh_score_oneline', formBloc.resultadoField)),
          ],
        ),
      ),
    );
  }

  void calculateCps(CpsFormBloc formBloc) {
    prefs.isMapError()
        ? errorPrueba = "hay al menos un error"
        : errorPrueba = "no hay errores";

    prefs.isMapError() ? showErrorDialog() : errorPrueba = "no hay errores";

    formBloc.submit();

    reset = false;
    //setState(() {});
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
                        child: Text(
                          aux.tr('accept'),
                          style:
                          TextStyle(color: Theme
                              .of(context)
                              .primaryColor),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void resetValues(CpsFormBloc formBloc) {
    reset = true;
    formBloc.reset();
    // setState(() {});
  }

  void previousValues(CpsFormBloc formBloc) {
    reset = false;
    previous = true;
    formBloc.previous();
    //setState(() {});
  }
}
