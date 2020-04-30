import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/right_bottom_title.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

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
          //final formBloc = widget.formBloc;//BlocProvider.of<AllFormBloc>(context);
          final formBloc = BlocProvider.of<CompleteFormBloc>(context);
          return FormBlocListener<CompleteFormBloc, String, String>(
            child: Scaffold(
              appBar: CustomAppBar(
                context,
                'calculators_all_algorithms_summary',
                selScreenshot: true,
                controller: widget.controller,
                calcBack: true,
              ),
              drawer: MenuWidget(),
              body: _buildBody(),
            ),
          );
        },
      ),
    );
  }

  _buildBody() {
    return Stack(
      children: <Widget>[
        Row(
          children: <Widget>[
            _buildDiagnosticColumn(),
            _buildLabColumn(),
            _buildClinicalColumn()
          ],
        ),
        Column(
          children: <Widget>[
            RightBottomTitle(
              title: 'value_summary',
              padding: EdgeInsets.fromLTRB(10, 0, 15, 30),
            ),
          ],
        ),
      ],
    );
  }

  Container _buildDiagnosticColumn() {
    AppLocalizations aux = AppLocalizations.of(context);
    var tumourSize = widget.formBloc.tumourSizeField;
    print("build diagnostic ${tumourSize.length}");
    for (int i = 0; i < tumourSize.length; i++)
      print(tumourSize[i].value);
    Map<String, dynamic> diagnosticMap1 = {
      'tumours': widget.formBloc.tumourNumberField.value,
      '#1': tumourSize[0].value != '' ? tumourSize[0].value : '-',
      '#2': tumourSize[1].value != '' ? tumourSize[1].value : '-',
      '#3': tumourSize[2].value != '' ? tumourSize[2].value : '-',
      '#4': tumourSize[3].value != '' ? tumourSize[3].value : '-',
      '#5': tumourSize[4].value != '' ? tumourSize[4].value : '-',
      '#6': tumourSize[5].value != '' ? tumourSize[5].value : '-',
      'tumour_extent': widget.formBloc.tumourExtentField.value,
    };
    Map<String, dynamic> diagnosticMap2 = {
      'pvi': aux.tr(widget.formBloc.pviField.value),
      'nodes': aux.tr(widget.formBloc.nodesField.value),
      'metastasis': aux.tr(widget.formBloc.metastasisField.value),
      'portal_hypertension':
      aux.tr(widget.formBloc.portalHypertensionField.value),
      'pvt': aux.tr(widget.formBloc.pvtField.value),
    };

    return Container(
      width: context.widthPct(0.42),
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildSummaryTitle('diagnostic_imaging'),
          _buildSeparator(0.38),
          Row(
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
          ),
        ],
      ),
    );
  }

  Container _buildLabColumn() {
    AppLocalizations aux = AppLocalizations.of(context);
    Map<String, dynamic> diagnosticMap3 = {
      'international_units':
      prefs.getInternationalUnits() ? aux.tr('yes') : aux.tr('no'),
      'bilirubin': widget.formBloc.bilirubinField.value,
      'inr_summary': widget.formBloc.inrField.value,
      'creatinine': widget.formBloc.creatinineField.value,
      'dialysis': widget.formBloc.dialysisField.value == 'yes'
          ? aux.tr('yes')
          : aux.tr('no'),
      'albumin': widget.formBloc.albuminField.value,
      'sodium': widget.formBloc.sodiumField.value,
      'platelets': widget.formBloc.plateletsField.value,
      'afp': widget.formBloc.afpField.value,
    };
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: context.widthPct(0.29),
      child: Column(
        children: <Widget>[
          _buildSummaryTitle('laboratory_values'),
          _buildSeparator(0.27),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: _buildSummaryColumn(diagnosticMap3),
          ),
        ],
      ),
    );
  }

  Container _buildClinicalColumn() {
    AppLocalizations aux = AppLocalizations.of(context);
    Map<String, dynamic> diagnosticMap4 = {
      'cirrhosis': aux.tr(widget.formBloc.cirrhosisField.value),
      'encephalopaty': aux.tr(widget.formBloc.encephalopatyField.value),
      'ascites': aux.tr(widget.formBloc.ascitesField.value),
      'varices': aux.tr(widget.formBloc.varicesField.value),
      'ecog': widget.formBloc.ecogField.value,
      //'preclude_major_surgery': prefs.getPrecludeSurgery() ? aux.tr('yes') : aux.tr('no'),
      //'age': widget.formBloc.
    };
    var anchura = 0.27;

    return Container(
      //color:Colors.pink,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),

      width: context.widthPct(0.29),
      child: Column(
        children: <Widget>[
          _buildSummaryTitle('clinical_questions'),
          _buildSeparator(0.27),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: _buildSummaryColumn(diagnosticMap4),
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

  _buildSummaryColumn(Map<String, dynamic> summaryMap) {
    List<Widget> widgets = [];
    summaryMap.forEach((key, value) {
      widgets.add(Row(
        children: <Widget>[
          _buildInitialBlueRectangle(),
          _buildSummaryText(key),
          _buildSummaryContent(value.toString()),
        ],
      ));
    });

    return Column(children: widgets);
    /*Row(
      children: <Widget>[
        _buildInitialBlueRectangle(),
        _buildSummaryText("hola"),
        _buildSummaryContent("contenido"),
      ],
    );*/
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
    AppLocalizations aux = AppLocalizations.of(context);
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
