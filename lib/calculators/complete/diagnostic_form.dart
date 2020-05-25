import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/calculators/widgets_calc/calc_bottom_button.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/pop_up_dialog.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import 'file:///D:/GitHub/HepApp/lib/calculators/widgets_calc/calc_multiple_text_field.dart';

import '../widgets_calc/calc_group_field.dart';
import '../widgets_calc/right_bottom_title.dart';
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

  int _tumourNumber = -1;
  StreamSubscription streamTumourNumber;

  @override
  void initState() {
    streamTumourNumber = prefs.tumourNumUpdates.listen(
      (newVal) => setState(() {
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
    if (!isTablet)
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
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
            ? EdgeInsets.only(left: 15, top: 20)
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
            Text(prefs.getParseErrorMap().toString()),
            Text(prefs.getParseErrorMap().values.toString()),
            Text(prefs.isParseError().toString()),
            SizedBox(height: kToolbarHeight)
          ],
        ),
      ),
    );
  }

  _buildTumourNumberRow(CompleteFormBloc formBloc) {
    return CalcGroupField(
      reset: reset,
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
      numActivos: _tumourNumber != -1 ? _tumourNumber - 1 : -1,
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
    bool isTablet = context.diagonalInches >= 7;
    return BottomAppBar(
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: isLandscape
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: isTablet ? 10 : 0),
              CalcBottomButton(
                  title: 'reset_values',
                  onPressed: () {
                    comprobarValoresDiag();
                    resetValues(formBloc);
                  }),
              SizedBox(width: isTablet ? 15 : 10),
              CalcBottomButton(
                  title: 'previous_values',
                  onPressed: () {
                    comprobarValoresDiag();
                    previousValues(formBloc);
                  }),
              SizedBox(width: isTablet ? 15 : 10),
              CalcBottomButton(
                title: 'more_information',
                onPressed: showMeldInfoDialog,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CalcBottomButton(
                  title: 'next',
                  onPressed: () {
                    comprobarValoresDiag();
                    if (prefs.isParseError()) {
                      showErrorDialog('format_error'); //print("error parse");
                    } else {
                      widget.controller.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOut);
                    }
                  }),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  showErrorDialog(String content) {
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PopUpDialog(
            title: 'error',
            content: content,
            height: context
                .heightPct(isLandscape ? (isTablet ? 0.20 : 0.25) : 0.12),
            width: context.widthPct(isLandscape ? (isTablet ? 0.3 : 0.4) : 0.5),
          );
        });
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
    formBloc.resetDiagnostic();
    prefs.setTumourNumber(0);
    setState(() {});
    reset = false;
  }

  void previousValues(CompleteFormBloc formBloc) {
    reset = false;
    formBloc.previousDiagnostic();
    setState(() {});
  }

  void showMeldInfoDialog() {
    bool isTablet = context.diagonalInches >= 7;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PopUpDialog(
            title: 'meld_info_title',
            content: 'meld_info_content',
            height: context.heightPct(isTablet ? 0.35 : 0.45),
          );
        });
  }

  void comprobarValoresDiag() {
    //Si el usuario no introduce valor, se pondrá a cero para que haya contenido
    for (int i = 0; i < widget.formBloc.tumourSizeField.length; i++) {
      if (widget.formBloc.tumourSizeField[i].value == '') {
        widget.formBloc.tumourSizeField[i].updateValue('0');
      }
    }
  }
}
