import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/forms/calc_multiple_text_field.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:hepapp/widgets/more_information.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import '../calc_group_field.dart';
import '../right_bottom_title.dart';
import 'complete_form_bloc.dart';

class DiagnosticForm extends StatefulWidget with Observable {
  final CompleteFormBloc formBloc;

  final PageController controller;

  DiagnosticForm({Key key, this.formBloc, this.controller}) : super(key: key);

  @override
  DiagnosticFormState createState() => DiagnosticFormState();
}

class DiagnosticFormState extends State<DiagnosticForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = UserSettings();

  int _tumourNumber;
  StreamSubscription streamTumourNumber;

  @override
  void initState() {
    streamTumourNumber = prefs.tumourNumUpdates.listen(
          (newVal) =>
          setState(() {
            _tumourNumber = newVal;
          }),
    );

    prefs.setTumourNumber(0);
    super.initState();
  }

  @override
  void dispose() {
    streamTumourNumber.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        'calculators_all_algorithms_diagnostic',
        selScreenshot: true,
        selFullSettings: true,
      ),
      drawer: MenuWidget(),
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _buildLeftColumn(widget.formBloc),
              _buildRightBottomTitle(),
            ],
          ),
        ],
      ),
      bottomSheet: _buildBottomSheet(widget.formBloc),
    );
  }

  _buildLeftColumn(CompleteFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      width: context.widthPx,
      height: context.heightPx,
      padding: EdgeInsets.only(left: 20, top: 20),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          _buildTumourNumberRow(aux, formBloc),
          _buildTumourSizeRow(aux, formBloc),
          _buildTumourExtentRow(aux, formBloc),
          _buildPviRow(aux, formBloc),
          _buildNodesRow(aux, formBloc),
          _buildMetastasisRow(aux, formBloc),
          _buildPortalHypertensionRow(aux, formBloc),
          _buildPvtRow(aux, formBloc),
        ],
      ),
    );
  }

  _buildTumourNumberRow(AppLocalizations aux, CompleteFormBloc formBloc) {
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

  _buildTumourSizeRow(AppLocalizations aux, CompleteFormBloc formBloc) {
    return CalcMultipleTextField(
      numActivos: _tumourNumber != null ? _tumourNumber - 1 : 0,
      titleList: ['tumour_size'],
      textFieldBlocList: formBloc.tumourSizeField,
      length: 6,
      hintList: ['#1', '#2', '#3', '#4', '#5', '#6+'],
      //udsList: [''],
      showUds: false,
    );
  }

  _buildTumourExtentRow(AppLocalizations aux, CompleteFormBloc formBloc) {
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

  _buildPviRow(AppLocalizations aux, CompleteFormBloc formBloc) {
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

  _buildNodesRow(AppLocalizations aux, CompleteFormBloc formBloc) {
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

  _buildMetastasisRow(AppLocalizations aux, CompleteFormBloc formBloc) {
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

  _buildPortalHypertensionRow(AppLocalizations aux, CompleteFormBloc formBloc) {
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

  _buildPvtRow(AppLocalizations aux, CompleteFormBloc formBloc) {
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

  _buildRightBottomTitle() {
    return Column(
      children: <Widget>[
        RightBottomTitle(
          title: 'diagnostic_imaging',
          padding: EdgeInsets.fromLTRB(10, 0, 15, 50),
        ),
      ],
    );
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
          //printdiagnostic(formBloc);
          widget.controller.nextPage(
              duration: Duration(seconds: 1), curve: Curves.easeInOut);
        },
      ),
    );
  }

  void printdiagnostic(CompleteFormBloc formBloc) {
    print("\n***DIAGNOSTIC***");
    print("Campo numero: " + formBloc.tumourNumberField.value);
    print("Campo tamaño: " +
        formBloc.tumourSizeField[0].value +
        " " +
        formBloc.tumourSizeField[1].value +
        " " +
        formBloc.tumourSizeField[2].value +
        " " +
        formBloc.tumourSizeField[3].value +
        " " +
        formBloc.tumourSizeField[4].value +
        " " +
        formBloc.tumourSizeField[5].value);
    print("Campo extension: " + formBloc.tumourExtentField.value);
    print("Campo pvi: " + formBloc.pviField.value);
    print("Campo nodos: " + formBloc.nodesField.value);
    print("Campo metastasis: " + formBloc.metastasisField.value);
    print(
        "Campo portal hipertension: " + formBloc.portalHypertensionField.value);
    print("Campo pvt: " + formBloc.pvtField.value);
  }
}
