import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/forms/calc_multiple_text_field.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/calc_bottom_button.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';
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
    super.initState();
  }

  @override
  void dispose() {
    streamTumourNumber.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = context.diagonalInches >= 7;
    !isTablet
        ? SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ])
        : null;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        'calculators_all_algorithms_diagnostic',
        selScreenshot: true,
        selFullSettings: true,
      ),
      drawer: MenuWidget(),
      body: Stack(
        children: <Widget>[
          _buildRightBottomTitle(),
          _buildDataFields(widget.formBloc),
        ],
      ),
      bottomSheet: _buildBottomSheet(widget.formBloc),
    );
  }

  _buildDataFields(CompleteFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    return SingleChildScrollView(
      child: Container(
        width: context.widthPx,
        padding: isTablet
            ? EdgeInsets.only(left: 20, top: 20)
            : EdgeInsets.only(left: 10, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTumourNumberRow(formBloc),
            _buildTumourSizeRow(formBloc),
            _buildTumourExtentRow(formBloc),
            _buildPviRow(formBloc),
            _buildNodesRow(formBloc),
            _buildMetastasisRow(formBloc),
            _buildPortalHypertensionRow(formBloc),
            _buildPvtRow(formBloc),
            SizedBox(height: kToolbarHeight)
          ],
        ),
      ),
    );
  }

  _buildTumourNumberRow(CompleteFormBloc formBloc) {
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

  _buildTumourSizeRow(CompleteFormBloc formBloc) {
    return CalcMultipleTextField(
      numActivos: _tumourNumber != null ? _tumourNumber - 1 : 0,
      titleList: ['tumour_size'],
      textFieldBlocList: formBloc.tumourSizeField,
      length: 6,
      hintList: ['#1', '#2', '#3', '#4', '#5', '#6+'],
      showUds: false,
    );
  }

  _buildTumourExtentRow(CompleteFormBloc formBloc) {
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

  _buildPviRow(CompleteFormBloc formBloc) {
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

  _buildNodesRow(CompleteFormBloc formBloc) {
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

  _buildMetastasisRow(CompleteFormBloc formBloc) {
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

  _buildPortalHypertensionRow(CompleteFormBloc formBloc) {
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

  _buildPvtRow(CompleteFormBloc formBloc) {
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
    var isLandscape = context.isLandscape;
    return BottomAppBar(
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: isLandscape
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: <Widget>[
              CalcBottomButton(
                  title: 'reset_values',
                  onPressed: () {
                    resetValues(formBloc);
                  }),
              SizedBox(width: 15),
              CalcBottomButton(
                  title: 'previous_values',
                  onPressed: () {
                    previousValues(formBloc);
                  }),
              SizedBox(width: 15),
              CalcBottomButton(
                  title: 'more_information',
                  onPressed: () {
                    showMoreInfo();
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _buildNextButton(formBloc),
            ],
          ),
        ],
      ),
    );
  }

  Future showMoreInfo() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        /*return MoreInformation(
          title: 'okuda',
          pathList: 'assets/images/calc/M3C14S0d.png',
        );*/
        return Text("por hacer");
      },
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
    previous = true;
    formBloc.reset();
    setState(() {});
    reset = false;
  }

  void previousValues(CompleteFormBloc formBloc) {
    reset = false;
    previous = true;
    formBloc.previous();
    setState(() {});
  }

  _buildNextButton(CompleteFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      height: 40,
      width: 150,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
