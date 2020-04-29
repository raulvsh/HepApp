import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/calc_multiple_text_field.dart';
import 'package:hepapp/forms/right_bottom_title.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:hepapp/widgets/more_information.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import '../calc_group_field.dart';
import '../calc_text_field.dart';
import 'complete_form_bloc.dart';

class LaboratoryForm extends StatefulWidget with Observable {
  final formBloc;

  LaboratoryForm({Key key, this.formBloc}) : super(key: key);

  @override
  LaboratoryFormState createState() => LaboratoryFormState();
}

class LaboratoryFormState extends State<LaboratoryForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = PreferenciasUsuario();
  final units = Units();

  bool _internationalUnits = true;

  Map<String, bool> _errorMap;

  StreamSubscription streamSubIUnits;

  //StreamSubscription streamSubErrorList;
  StreamSubscription streamSubErrorMap;

  //String errorPrueba = "";

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
    //prefs.initErrorMap(['bilirubin','albumin']);
    /*prefs.initErrorMap(
        ['bilirubin', 'inr', 'creatinine', 'albumin', 'sodium', 'platelets', 'afp', 'ast', 'ast_upper_limit', 'alp', 'alp_upper_limit']);
    */
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
          final formBloc =
              widget.formBloc; //BlocProvider.of<AllFormBloc>(context);
          return FormBlocListener<CompleteFormBloc, String, String>(
            child: Scaffold(
              appBar: CustomAppBar(
                context,
                'calculators_all_algorithms_laboratory',
                selScreenshot: true,
                selFullSettings: true,
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
          _buildBilirrubinRow(aux, formBloc),
          _buildInrRow(aux, formBloc),
          _buildCreatinineRow(aux, formBloc),
          _buildAlbuminRow(aux, formBloc),
          _buildSodiumRow(aux, formBloc),
          _buildPlateletsRow(aux, formBloc),
          _buildAFPRow(aux, formBloc),
          _buildASTRow(aux, formBloc),
          //_buildASTUpperLimitRow(aux, formBloc),
          _buildALPRow(aux, formBloc),
          // _buildALPUpperLimitRow(aux, formBloc),

          _buildDialysisRow(aux, formBloc),
          Container(
            height: 50,
          ),

          //_buildCalcButton(aux, formBloc),
        ],
      ),
    );
  }

  _buildBilirrubinRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.bilirubinField,
      title: 'bilirubin',
      uds: _internationalUnits ? units.bilirubinUds[0] : units.bilirubinUds[1],
    );
  }

  _buildInrRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.inrField,
      title: 'inr',
      uds: '',
    );
  }

  _buildCreatinineRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.creatinineField,
      title: 'creatinine',
      uds:
          _internationalUnits ? units.creatinineUds[0] : units.creatinineUds[1],
    );
  }

  _buildAlbuminRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.albuminField,
      title: 'albumin',
      uds: _internationalUnits ? units.albuminUds[0] : units.albuminUds[1],
    );
  }

  _buildSodiumRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.sodiumField,
      title: 'sodium',
      uds: _internationalUnits ? units.sodiumUds[0] : units.sodiumUds[1],
    );
  }

  _buildPlateletsRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.plateletsField,
      title: 'platelets',
      uds:
          'x10E3/uL', //_internationalUnits ? units.sodiumUds[0] : units.sodiumUds[1],
    );
  }

  _buildAFPRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.afpField,
      title: 'afp',
      uds: 'ug/L',
    );
  }

  _buildASTRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcMultipleTextField(
      multiTitle: true,
      textFieldBlocList: formBloc.astField,
      titleList: ['ast', 'ast_upper_limit'],
      //titleList: ['ast','ast_upper_limit'],
      udsList: ['ug/L', 'ug/L'],
      length: 2,
      numActivos: 2,
      //uds: 'ug/L',
    );
  }

  /*_buildASTUpperLimitRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.astUpperLimitField,
      title: 'ast_upper_limit',
      uds: 'ug/L',
    );
  }*/

  _buildALPRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcMultipleTextField(
      multiTitle: true,

      textFieldBlocList: formBloc.alpField,
      titleList: ['alp', 'alp_upper_limit'],
      length: 2,
      numActivos: 2,
      udsList: ['ug/L', 'ug/L'],
    );
  }

  /*_buildALPUpperLimitRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.alpUpperLimitField,
      title: 'alp_upper_limit',
      uds: 'ug/L',
    );
  }*/

  _buildDialysisRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcGroupField(
      reset: reset,
      previous: previous,
      initialValue: formBloc.dialysisField.value.toString(),
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.dialysisField,
      title: 'dialysis',
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
          title: 'laboratory_values',
          padding: EdgeInsets.fromLTRB(10, 0, 15, 50),
        ),
      ],
    );
  }

  Container _buildIUnitsRow(CompleteFormBloc formBloc) {
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

  _buildIUnitsSelect(CompleteFormBloc formBloc) {
    final prefs = new PreferenciasUsuario();
    var aux = AppLocalizations.of(context);

    List<bool> isSelected = [true, false];

    isSelected[0] = prefs.getInternationalUnits();
    isSelected[1] = !isSelected[0];

    return ToggleButtons(
      borderColor: Color.fromARGB(255, 45, 145, 155),
      fillColor: Theme.of(context).primaryColor,
      borderWidth: 1.3,
      selectedBorderColor: Color.fromARGB(255, 45, 145, 155),
      selectedColor: Colors.white,
      color: Theme.of(context).primaryColor,
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

  _buildRightBottomTitle() {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);
    return Expanded(
      child: Container(
        //color: Colors.red,
        alignment: Alignment.bottomRight,

        //margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.fromLTRB(10, 0, 60, 50),
        //alignment: Alignment.bottomRight,
        child: Text(
          aux.tr('laboratory_values'),
          style: TextStyle(
            fontSize: isTablet ? 28 : 20,
            color: Theme.of(context)
                .primaryColor
                .withAlpha(150), //Color.fromARGB(255, 210, 242, 245),
          ),
        ),
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
          //submitDiagnostic(formBloc);
          Navigator.pushNamed(context, '/CompletePage', arguments: 2);
        },
      ),
    );
  }
}
