import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/calculators/widgets_calc/calc_bottom_button.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/pop_up_dialog.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import 'file:///D:/GitHub/HepApp/lib/calculators/widgets_calc/calc_multiple_text_field.dart';
import 'file:///D:/GitHub/HepApp/lib/calculators/widgets_calc/right_bottom_title.dart';

import '../widgets_calc/calc_group_field.dart';
import '../widgets_calc/calc_text_field.dart';
import 'complete_form_bloc.dart';

class LaboratoryForm extends StatefulWidget with Observable {
  final CompleteFormBloc formBloc;
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
  StreamSubscription streamSubErrorMap;
  Map<String, bool> _errorMap;

  @override
  void initState() {
    streamSubIUnits = prefs.iUnitsUpdates.listen(
      (newVal) => setState(() {
        _internationalUnits = newVal;
      }),
    );
    streamSubErrorMap = prefs.errorMapUpdates.listen((newVal) => setState(() {
          _errorMap = newVal;
        }));
    prefs.setInternationalUnits(true);
    super.initState();
  }

  @override
  dispose() {
    streamSubIUnits.cancel();
    streamSubErrorMap.cancel();

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
              _buildDataFields(widget.formBloc),
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
                onPressed: () => resetValues(formBloc),
              ),
              SizedBox(width: isTablet ? 15 : 10),
              CalcBottomButton(
                title: 'previous_values',
                onPressed: () => previousValues(formBloc),
              ),
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
                    comprobarValoresLab();
                    widget.controller.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  }),
              SizedBox(width: 10),

              //_buildNextButton(formBloc),
            ],
          ),
        ],
      ),
    );
  }

  void comprobarValoresLab() {
    //Si el usuario no introduce valor, se pondrá a cero para que haya contenido
    if (widget.formBloc.bilirubinField.value == '') {
      widget.formBloc.bilirubinField.updateValue('0');
    }
    if (widget.formBloc.inrField.value == '') {
      widget.formBloc.inrField.updateValue('0');
    }
    if (widget.formBloc.creatinineField.value == '') {
      widget.formBloc.creatinineField.updateValue('0');
    }
    if (widget.formBloc.albuminField.value == '') {
      widget.formBloc.albuminField.updateValue('0');
    }
    if (widget.formBloc.sodiumField.value == '') {
      widget.formBloc.sodiumField.updateValue('0');
    }
    if (widget.formBloc.plateletsField.value == '') {
      widget.formBloc.plateletsField.updateValue('0');
    }
    if (widget.formBloc.afpField.value == '') {
      widget.formBloc.afpField.updateValue('0');
    }
    if (widget.formBloc.astField[0].value == '') {
      widget.formBloc.astField[0].updateValue('0');
    }
    if (widget.formBloc.astField[1].value == '') {
      widget.formBloc.astField[1].updateValue('0');
    }
    if (widget.formBloc.alpField[0].value == '') {
      widget.formBloc.alpField[0].updateValue('0');
    }
    if (widget.formBloc.alpField[1].value == '') {
      widget.formBloc.alpField[1].updateValue('0');
    }
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
    //previous = true;
    formBloc.resetLaboratory();
    setState(() {});
    reset = false;
  }

  void previousValues(CompleteFormBloc formBloc) {
    reset = false;
    previous = true;
    formBloc.previousLaboratory();
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
}
