import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/calc_multiple_text_field.dart';
import 'package:hepapp/forms/right_bottom_title.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/calc_bottom_button.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';
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
              //FittedBox(
              //fit: BoxFit.contain,
              //child:
              _buildDataFields(widget.formBloc),
              //),
              _buildRightBottomTitle(widget.formBloc),
            ],
          ),
        ],
      ),
      bottomSheet: _buildBottomSheet(widget.formBloc),
    );
  }

  _buildDataFields(CompleteFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;

    return //FittedBox(
      //fit: BoxFit.contain,
      SingleChildScrollView(
      child: Container(
        width: context.widthPx,
        padding: isTablet
            ? EdgeInsets.only(left: 20, top: 20)
            : EdgeInsets.only(left: 10, top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildBilirrubinRow(formBloc),
            _buildInrRow(formBloc),
            _buildCreatinineRow(formBloc),
            _buildAlbuminRow(formBloc),
            _buildSodiumRow(formBloc),
            _buildPlateletsRow(formBloc),
            _buildAFPRow(formBloc),
            _buildASTRow(formBloc),
            _buildALPRow(formBloc),
            _buildDialysisRow(formBloc),
            SizedBox(
              height: kToolbarHeight + 10,
            )
          ],
        ),
      ),
    );
  }

  _buildBilirrubinRow(CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.bilirubinField,
      title: 'bilirubin',
      uds: _internationalUnits ? units.bilirubinUds[0] : units.bilirubinUds[1],
    );
  }

  _buildInrRow(CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.inrField,
      title: 'inr',
      uds: '',
    );
  }

  _buildCreatinineRow(CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.creatinineField,
      title: 'creatinine',
      uds:
          _internationalUnits ? units.creatinineUds[0] : units.creatinineUds[1],
    );
  }

  _buildAlbuminRow(CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.albuminField,
      title: 'albumin',
      uds: _internationalUnits ? units.albuminUds[0] : units.albuminUds[1],
    );
  }

  _buildSodiumRow(CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.sodiumField,
      title: 'sodium',
      uds: _internationalUnits ? units.sodiumUds[0] : units.sodiumUds[1],
    );
  }

  _buildPlateletsRow(CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.plateletsField,
      title: 'platelets',
      uds: 'x10E3/uL',
    );
  }

  _buildAFPRow(CompleteFormBloc formBloc) {
    return CalcTextField(
      textFieldBloc: formBloc.afpField,
      title: 'afp',
      uds: 'ug/L',
    );
  }

  _buildASTRow(CompleteFormBloc formBloc) {
    bool isLandscape = context.isLandscape;
    var astCompleteRow = CalcMultipleTextField(
      multiTitle: true,
      textFieldBlocList: formBloc.astField,
      titleList: ['ast', 'ast_upper_limit'],
      udsList: ['ug/L', 'ug/L'],
      length: 2,
      numActivos: 2,
    );

    var ast = CalcTextField(
      textFieldBloc: formBloc.astField[0],
      title: 'ast',
      uds: 'ug/L',
    );

    var astUpperLimit = CalcTextField(
      textFieldBloc: formBloc.astField[1],
      title: 'ast_upper_limit',
      uds: 'ug/L',
    );

    return isLandscape
        ? astCompleteRow
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[ast, astUpperLimit],
    );
  }

  _buildALPRow(CompleteFormBloc formBloc) {
    bool isLandscape = context.isLandscape;
    var alpCompleteRow = CalcMultipleTextField(
      multiTitle: true,
      textFieldBlocList: formBloc.alpField,
      titleList: ['alp', 'alp_upper_limit'],
      length: 2,
      numActivos: 2,
      udsList: ['ug/L', 'ug/L'],
    );
    var alp = CalcTextField(
      textFieldBloc: formBloc.alpField[0],
      title: 'alp',
      uds: 'ug/L',
    );

    var alpUpperLimit = CalcTextField(
      textFieldBloc: formBloc.alpField[1],
      title: 'alp_upper_limit',
      uds: 'ug/L',
    );
    return isLandscape
        ? alpCompleteRow
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[alp, alpUpperLimit],
    );
  }

  _buildDialysisRow(CompleteFormBloc formBloc) {
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

  _buildNextButton(CompleteFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);

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
