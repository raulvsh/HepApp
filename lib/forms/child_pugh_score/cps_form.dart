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
import 'cps_form_bloc.dart';

class CpsForm extends StatefulWidget with Observable {
  CpsForm({Key key}) : super(key: key);

  @override
  CpsFormState createState() => CpsFormState();
}

class CpsFormState extends State<CpsForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = PreferenciasUsuario();
  final units = Units();
  bool _internationalUnits = true;
  List<bool> _errorList;
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
          (newVal) =>
          setState(() {
            _internationalUnits = newVal;
          }),
    );

    prefs.setInternationalUnits(true);

    //_error = false;


    /*streamSubErrorList = prefs.errorListUpdates.listen((newVal) =>
        setState(() {
          _errorList = newVal;
        }));
    prefs.initErrorList(5);*/

    streamSubErrorMap = prefs.errorMapUpdates.listen((newVal) =>
        setState(() {
          _errorMap = newVal;
        }));
    prefs.initErrorMap(
        ['bilirubin', 'inr', 'albumin', 'encephalopaty', 'ascites']);


    //prefs.setErrorMap('bilirubin', false);
    //print("error map " + prefs.getErrorMap().toString());

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

    //streamSubErrorList.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildLeftColumn(formBloc),
                      _buildRightColumn(formBloc),
                    ],
                  ),

                  //prefs.getError() ? showDialog2() : Container(),
                  //prefs.getError() ? showErrorDialog() : Container(),
                ],
              ),
              bottomSheet: _buildBottomSheet(formBloc),
            ),
          );
        },
      ),
    );
  }

  _buildLeftColumn(CpsFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      width: isTablet ? context.widthPct(0.62) : context.widthPct(0.65),
      height: context.heightPx,
      //color: Colors.red,
      padding: EdgeInsets.only(left: 20, top: 20),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          _buildBilirrubinRow(aux, formBloc),
          _buildInrRow(aux, formBloc),
          _buildAlbuminRow(aux, formBloc),
          _buildEncephalopatyRow(aux, formBloc),
          _buildAscitesRow(aux, formBloc),
          _buildCalcButton(aux, formBloc),
          //Text(_errorMap.toString()),
          Text(prefs.getErrorMap().toString()),
          //.entries.toList().toString(), style: TextStyle(fontSize: 16, color: Colors.black),),
          Text(prefs
              .getErrorMap()
              .values
              .toString()),
          //Text(prefs.getErrorMap().values.contains(true).toString()),
          Text(prefs.isMapError().toString()),
          Text(errorPrueba),


        ],
      ),
    );
  }

  _buildBilirrubinRow(AppLocalizations aux, CpsFormBloc formBloc) {
    return PartialCalcTextField(

      //formBloc: formBloc,
      textFieldBloc: formBloc.bilirubinField,
      title: 'bilirubin',
      uds: _internationalUnits ? units.bilirubinUds[0] : units.bilirubinUds[1],
    );
  }

  _buildInrRow(AppLocalizations aux, CpsFormBloc formBloc) {
    return PartialCalcTextField(
      //formBloc: formBloc,
      textFieldBloc: formBloc.inrField,
      title: 'inr',
      uds: '',
    );
  }

  _buildAlbuminRow(AppLocalizations aux, CpsFormBloc formBloc) {
    return PartialCalcTextField(
      //formBloc: formBloc,
      textFieldBloc: formBloc.albuminField,
      title: 'albumin',
      uds: _internationalUnits ? units.albuminUds[0] : units.albuminUds[1],
    );
  }

  _buildEncephalopatyRow(AppLocalizations aux,
      CpsFormBloc formBloc,) {
    //print("error encephalopaty " + _error.toString());
    return PartialCalcGroupField(
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

  _buildAscitesRow(AppLocalizations aux,
      CpsFormBloc formBloc,) {

    return PartialCalcGroupField(
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

  _buildCalcButton(AppLocalizations aux,
      CpsFormBloc formBloc,) {
    bool isTablet = context.diagonalInches >= 7;
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
        color: Theme
            .of(context)
            .primaryColor,
        splashColor: Color.fromARGB(255, 56, 183, 198),
        elevation: 3,
        onPressed: () {
          print(_errorList);
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
          title: 'child_pugh_score_oneline',
          path: 'assets/images/calc/M3C14S0c.png',
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

  Container _buildResetButton(AppLocalizations aux, CpsFormBloc formBloc) {
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

  _buildRightColumn(CpsFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    List<List<String>> resultList = [
      ['child_pugh_score_oneline', formBloc.resultadoField]
    ];
    return Container(
      width: isTablet ? context.widthPct(0.38) : context.widthPct(0.35),
      //color: Colors.blue,
      child: Column(
        children: <Widget>[
          _buildIUnitsRow(formBloc),

          Container(
            //padding: EdgeInsets.fromLTRB(0, 30, 40, 0),
            child: CalcResultWidget(resultList),),

          // 'child_pugh_score_oneline', formBloc.resultadoField)),
          _buildRightBottomTitle(),
        ],
      ),
    );
  }

  Container _buildIUnitsRow(CpsFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    return Container(
        height: 60,
        padding: EdgeInsets.only(top: 30),
        child: Row(
          children: <Widget>[
            Text(
              aux.tr("international_units"),
              style: TextStyle(
                fontSize: isTablet ? 15 : 12,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            _buildIUnitsSelect(formBloc),
          ],
        ));
  }

  _buildIUnitsSelect(CpsFormBloc formBloc) {
    final prefs = new PreferenciasUsuario();
    var aux = AppLocalizations.of(context);

    List<bool> isSelected = [true, false];

    isSelected[0] = prefs.getInternationalUnits();
    isSelected[1] = !isSelected[0];

    return ToggleButtons(
      borderColor: Color.fromARGB(255, 45, 145, 155),
      fillColor: Theme
          .of(context)
          .primaryColor,
      borderWidth: 1.3,
      selectedBorderColor: Color.fromARGB(255, 45, 145, 155),
      selectedColor: Colors.white,
      color: Theme
          .of(context)
          .primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
      children: <Widget>[
        Container(
          width: 60,
          child: Text(
            aux.tr('on'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Container(
          width: 60,
          child: Text(
            aux.tr('off'),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
          isSelected[0]
              ? formBloc.showIU()
              : formBloc.showNotIU(); // : formBloc.convertToNoIU();

          prefs.setInternationalUnits(isSelected[0]);
        });
      },
      isSelected: isSelected,
    );
  }

  Expanded _buildRightBottomTitle() {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);
    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,

        //margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.fromLTRB(10, 0, 60, 50),
        //alignment: Alignment.bottomRight,
        child: Text(
          aux.tr('child_pugh_score_oneline'),
          style: TextStyle(
            fontSize: isTablet ? 28 : 20,
            color: Theme
                .of(context)
                .primaryColor
                .withAlpha(150), //Color.fromARGB(255, 210, 242, 245),
          ),
        ),
      ),
    );
  }

  void calculateCps(CpsFormBloc formBloc) {
    //prefs.isError() ?
    prefs.isMapError() ? errorPrueba = "hay al menos un error" : errorPrueba =
    "no hay errores";

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
              aux.tr('error'), style: TextStyle(color: Colors.black),),
            content: Container(
              height: context.heightPct(0.20),
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(aux.tr('fill_empty_fields'),
                        style: TextStyle(color: Colors.black),)),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            aux.tr('accept'), style: TextStyle(color: Theme
                              .of(context)
                              .primaryColor),),
                          onPressed: () {
                            //prefs.setError(false);

                            Navigator.pop(context);
                            setState(() {

                            });
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

  void resetValues(CpsFormBloc formBloc) {
    reset = true;
    formBloc.reset();
    setState(() {});
  }

  void previousValues(CpsFormBloc formBloc) {
    reset = false;
    previous = true;
    formBloc.previous();
    setState(() {});
  }
}
