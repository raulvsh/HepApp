import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import 'file:///D:/GitHub/HepApp/lib/calculators/widgets_calc/right_bottom_title.dart';

import 'complete_form_bloc.dart';

class SummaryForm extends StatefulWidget with Observable {
  final CompleteFormBloc formBloc;
  final PageController controller;

  SummaryForm({Key key, this.formBloc, this.controller}) : super(key: key);

  @override
  SummaryFormState createState() => SummaryFormState();
}

class SummaryFormState extends State<SummaryForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = UserSettings();
  final units = Units();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompleteFormBloc>(
      builder: (context) => CompleteFormBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: CustomAppBar(
              'calculators_all_algorithms_summary',
              selScreenshot: true,
              controller: widget.controller,
              calcBack: true,
            ),
            drawer: MenuWidget(),
            body: _buildBody(),
          );
        },
      ),
    );
  }

  _buildBody() {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildDiagnosticColumn(),
              _buildLabColumn(),
              _buildClinicalColumn()
            ],
          ),
        ),
        Column(
          children: <Widget>[
            RightBottomTitle(
              title: 'value_summary',
              padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
            ),
          ],
        ),
      ],
    );
  }

  Container _buildDiagnosticColumn() {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isLandscape = context.isLandscape;
    bool isTablet = context.diagonalInches >= 7;

    var tumourSize = widget.formBloc.tumourSizeField;

    Map<String, dynamic> diagnosticMap1 = {
      'tumours': widget.formBloc.tumourNumberField.value,
    };
    for (int i = 0; i < tumourSize.length; i++) {
      diagnosticMap1.addAll({
        "#${i + 1}": tumourSize[i].value != '0'
            ? tumourSize[i].valueToDouble.toStringAsFixed(2) + " cm."
            : '-',
      });
    }
    diagnosticMap1.addAll({
      'tumour_extent': widget.formBloc.tumourExtentField.value,
    });

    Map<String, dynamic> diagnosticMap2 = {
      'pvi': aux.tr(widget.formBloc.pviField.value),
      'nodes': aux.tr(widget.formBloc.nodesField.value),
      'metastasis': aux.tr(widget.formBloc.metastasisField.value),
      'portal_hypertension':
          aux.tr(widget.formBloc.portalHypertensionField.value),
      'pvt': aux.tr(widget.formBloc.pvtField.value),
    };
    var unionMap = {};
    unionMap.addAll(diagnosticMap1);
    unionMap.addAll(diagnosticMap2);

    return Container(
      width: isLandscape
          ? context.widthPct(isTablet ? 0.42 : 0.35)
          : context.widthPct(0.35),
      //width:
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
      child: Column(
        children: <Widget>[
          _buildSummaryTitle('diagnostic_imaging'),
          _buildSeparator(isLandscape && isTablet ? 0.38 : 0.31),
          isLandscape && isTablet
              ? _buildDiagnosticTwoColumns(diagnosticMap1, diagnosticMap2)
              : _buildDiagnosticOneColumn(unionMap),
        ],
      ),
    );
  }

  Row _buildDiagnosticTwoColumns(diagnosticMap1, diagnosticMap2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: context.widthPct(0.20),
          padding: EdgeInsets.only(top: 5),
          child: _buildSummaryColumn(diagnosticMap1),
        ),
        Container(
          width: context.widthPct(0.18),
          padding: EdgeInsets.only(top: 5),
          child: _buildSummaryColumn(diagnosticMap2),
        ),
      ],
    );
  }

  _buildDiagnosticOneColumn(diagnosticMap) {
    return Container(
        padding: EdgeInsets.only(top: 5),
        child: _buildSummaryColumn(diagnosticMap));
  }

  Container _buildLabColumn() {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isLandscape = context.isLandscape;
    bool isSmallFormFactor = context.diagonalInches <= 8;

    var internationalUnits =
    prefs.getInternationalUnits() ? aux.tr('yes') : aux.tr('no');
    var bilirubin = widget.formBloc.bilirubinField.valueToDouble != 0
        ? widget.formBloc.bilirubinField.valueToDouble.toStringAsFixed(2)
        : '-';
    var inr = widget.formBloc.inrField.valueToDouble != 0
        ? widget.formBloc.inrField.valueToDouble.toStringAsFixed(2)
        : '-';
    var creatinine = widget.formBloc.creatinineField.valueToDouble != 0
        ? widget.formBloc.creatinineField.valueToDouble.toStringAsFixed(2)
        : '-';
    var dialysis = widget.formBloc.dialysisField.value != '-'
        ? aux.tr(widget.formBloc.dialysisField.value)
        : '-';
    var albumin = widget.formBloc.albuminField.valueToDouble != 0
        ? widget.formBloc.albuminField.valueToDouble.toStringAsFixed(2)
        : '-';
    var sodium = widget.formBloc.sodiumField.valueToDouble != 0
        ? widget.formBloc.sodiumField.valueToDouble.toStringAsFixed(2)
        : '-';
    var platelets = widget.formBloc.plateletsField.valueToDouble != 0
        ? widget.formBloc.plateletsField.valueToDouble.toStringAsFixed(2)
        : '-';
    var afp = widget.formBloc.afpField.valueToDouble != 0
        ? widget.formBloc.afpField.valueToDouble.toStringAsFixed(2)
        : '-';
    var ast = widget.formBloc.astField[0].valueToDouble != 0
        ? widget.formBloc.astField[0].valueToDouble.toStringAsFixed(2)
        : '-';
    var astLimit = widget.formBloc.astField[1].valueToDouble != 0
        ? widget.formBloc.astField[1].valueToDouble.toStringAsFixed(2)
        : '-';
    var alp = widget.formBloc.alpField[0].valueToDouble != 0
        ? widget.formBloc.alpField[0].valueToDouble.toStringAsFixed(2)
        : '-';
    var alpLimit = widget.formBloc.alpField[1].valueToDouble != 0
        ? widget.formBloc.alpField[1].valueToDouble.toStringAsFixed(2)
        : '-';

    Map<String, dynamic> laboratoryMap = {
      'international_units': internationalUnits,
      'bilirubin': bilirubin,
      'inr_summary': inr,
      'creatinine': creatinine,
      'dialysis': dialysis,
      'albumin': albumin,
      'sodium': sodium,
      'platelets': platelets,
      'afp': afp,
      'ast': ast,
      isSmallFormFactor ? 'ast_limit' : 'ast_upper_limit': astLimit,
      'alp': alp,
      isSmallFormFactor ? 'alp_limit' : 'alp_upper_limit': alpLimit,
    };
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: context.widthPct(isLandscape ? 0.29 : 0.33),
      child: Column(
        children: <Widget>[
          _buildSummaryTitle('laboratory_values'),
          _buildSeparator(isLandscape ? 0.27 : 0.31),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: _buildSummaryColumn(laboratoryMap),
          ),
        ],
      ),
    );
  }

  Container _buildClinicalColumn() {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isLandscape = context.isLandscape;
    print("Edad " + prefs.getAgeCutoff().toString());
    Map<String, dynamic> clinicalMap = {
      'cirrhosis': aux.tr(widget.formBloc.cirrhosisField.value),
      'encephalopaty': aux.tr(widget.formBloc.encephalopatyField.value),
      'ascites': aux.tr(widget.formBloc.ascitesField.value),
      'varices': aux.tr(widget.formBloc.varicesField.value),
      'ecog': widget.formBloc.ecogField.value,
      'preclude_major_surgery':
      prefs.getPrecludeSurgery() == true ? aux.tr('yes') : aux.tr('no'),
      //prefs.getPrecludeSurgery() ? aux.tr('yes') : aux.tr('no'),
      'age': prefs.getAgeCutoff() != 0 ? prefs.getAgeCutoff().toString() : '-',
      //widget.formBloc.
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      width: isLandscape ? context.widthPct(0.29) : context.widthPct(0.30),
      child: Column(
        children: <Widget>[
          _buildSummaryTitle('clinical_questions'),
          _buildSeparator(isLandscape ? 0.27 : 0.26),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: _buildSummaryColumn(clinicalMap),
          ),
        ],
      ),
    );
  }

  Row _buildSeparator(double anchura) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: context.widthPct(anchura),
          height: 3,
          color: Theme
              .of(context)
              .primaryColor,
        ),
      ],
    );
  }

  _buildSummaryTitle(String title) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            aux.tr(title),
            style: TextStyle(fontSize: isTablet ? 14 : 12, color: Colors.black),
          ),
        ],
      ),
    );
  }

  _buildSummaryColumn(summaryMap) {
    List<Widget> widgets = [];
    summaryMap.forEach((key, value) {
      widgets.add(Row(
        children: <Widget>[
          _buildInitialBlueRectangle(),
          _buildSummaryText(key),
          _buildSummaryContent(value != null ? value.toString() : '-'),
        ],
      ));
    });

    return Column(children: widgets);
  }

  Container _buildInitialBlueRectangle() {
    return Container(
      color: Color.fromARGB(255, 210, 242, 245),
      width: 10.0,
      height: 20.0,
    );
  }

  _buildSummaryText(String summaryText) {
    AppLocalizations aux = AppLocalizations.of(context);
    var isTablet = context.diagonalInches >= 7;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Text(
          aux.tr(summaryText) + ': ',
          style: TextStyle(
            fontSize: isTablet ? 12 : 10,
            color: Colors.black,
          ),
        ));
  }

  _buildSummaryContent(String summaryContent) {
    var isTablet = context.diagonalInches >= 7;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Text(
          summaryContent,
          style: TextStyle(
            fontSize: isTablet ? 12 : 10,
          ),
        ));
  }
}
