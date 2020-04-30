import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/calc_multiple_text_field.dart';
import 'package:hepapp/forms/right_bottom_title.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
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

  final PageController controller;

  LaboratoryForm({Key key, this.formBloc, this.controller}) : super(key: key);

  @override
  LaboratoryFormState createState() => LaboratoryFormState();
}

class LaboratoryFormState extends State<LaboratoryForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = UserSettings();
  final units = Units();

  bool _internationalUnits = true;

  StreamSubscription streamSubIUnits;

  @override
  void initState() {
    streamSubIUnits = prefs.iUnitsUpdates.listen(
      (newVal) => setState(() {
        _internationalUnits = newVal;
      }),
    );
    prefs.setInternationalUnits(true);
    super.initState();
  }

  @override
  dispose() {
    streamSubIUnits.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        'calculators_all_algorithms_laboratory',
        selScreenshot: true,
        selFullSettings: true,
        controller: widget.controller,
        calcBack: true,

      ),
      drawer: MenuWidget(),
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _buildLeftColumn(widget.formBloc),
              _buildRightBottomTitle(widget.formBloc),
            ],
          ),
        ],
      ),
      bottomSheet: _buildBottomSheet(widget.formBloc),
    );
  }

  _buildLeftColumn(CompleteFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    return Container(
      width: context.widthPx,
      height: context.heightPx,
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
          _buildALPRow(aux, formBloc),
          _buildDialysisRow(aux, formBloc),
          Container(
            height: 50,
          ),
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
      uds: 'x10E3/uL',
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

  _buildRightBottomTitle(CompleteFormBloc formBloc) {
    return Column(
      children: <Widget>[
        RightBottomTitle(
          title: 'laboratory_values',
          padding: EdgeInsets.fromLTRB(10, 0, 15, 50),
        ),
      ],
    );
  }

  void resetValues(CompleteFormBloc formBloc) {
    reset = true;
    formBloc.reset();
    //setState(() {});
  }

  void previousValues(CompleteFormBloc formBloc) {
    reset = false;
    previous = true;
    formBloc.previous();
    // setState(() {});
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
          // printLaboratory(formBloc);
          widget.controller.nextPage(
              duration: Duration(seconds: 1), curve: Curves.easeInOut);
        },
      ),
    );
  }

  void printLaboratory(CompleteFormBloc formBloc) {
    print("\n***LABORATORY***");
    print("Campo bilirrubina: " + formBloc.bilirubinField.value);
    print("Campo inr: " + formBloc.inrField.value);
    print("Campo creatinina: " + formBloc.creatinineField.value);
    print("Campo albumina: " + formBloc.albuminField.value);
    print("Campo sodio: " + formBloc.sodiumField.value);
    print("Campo plaquetas: " + formBloc.plateletsField.value);
    print("Campo afp: " + formBloc.afpField.value);
    print("Campo ast: " +
        formBloc.astField[0].value +
        " " +
        formBloc.astField[1].value);
    print("Campo alp: " +
        formBloc.alpField[0].value +
        " " +
        formBloc.alpField[1].value);
    print("Campo dialisis: " + formBloc.dialysisField.value);
  }
}
