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

import 'file:///D:/GitHub/HepApp/lib/calculators/widgets_calc/right_bottom_title.dart';

import '../widgets_calc/calc_group_field.dart';
import 'complete_form_bloc.dart';

class ClinicalForm extends StatefulWidget with Observable {
  final formBloc;
  final PageController controller;

  ClinicalForm({Key key, this.formBloc, this.controller}) : super(key: key);

  @override
  ClinicalFormState createState() => ClinicalFormState();
}

class ClinicalFormState extends State<ClinicalForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = UserSettings();
  final units = Units();

  //StreamSubscription streamSubErrorMap;
  //Map<String, bool> _errorMap;

  @override
  void initState() {
    /*streamSubErrorMap = prefs.errorMapUpdates.listen((newVal) => setState(() {
          _errorMap = newVal;
        }));*/
    super.initState();
  }

  @override
  void dispose() {
    //streamSubErrorMap.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        'calculators_all_algorithms_clinical',
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
          children: <Widget>[
            _buildCirrhosisRow(formBloc),
            _buildEncephalopatyRow(formBloc),
            _buildAscitesRow(formBloc),
            _buildVaricesRow(formBloc),
            _buildEcogRow(formBloc),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  _buildCirrhosisRow(CompleteFormBloc formBloc) {
    return CalcGroupField(
      //initialValue: formBloc.cirrhosisField.value.toString(),
      reset: reset,
      //previous: previous,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.cirrhosisField,
      title: 'cirrhosis',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildEncephalopatyRow(CompleteFormBloc formBloc) {
    return CalcGroupField(
      //initialValue: formBloc.encephalopatyField.value.toString(),
      reset: reset,
      //previous: previous,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.encephalopatyField,
      title: 'encephalopaty',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildAscitesRow(CompleteFormBloc formBloc) {
    return CalcGroupField(
      //initialValue: formBloc.ascitesField.value.toString(),
      //previous: previous,
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

  _buildVaricesRow(CompleteFormBloc formBloc) {
    return CalcGroupField(
      //initialValue: formBloc.varicesField.value.toString(),
      //previous: previous,
      reset: reset,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.varicesField,
      title: 'varices',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildEcogRow(CompleteFormBloc formBloc) {
    return CalcGroupField(
      //initialValue: formBloc.ecogField.value.toString(),
      //previous: previous,
      reset: reset,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.ecogField,
      title: 'ecog',
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
                    resetValues(formBloc);
                  }),
              SizedBox(width: isTablet ? 15 : 10),
              CalcBottomButton(
                  title: 'previous_values',
                  onPressed: () {
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
                    formBloc.submit();
                    widget.controller.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  }),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }


  _buildRightBottomTitle(CompleteFormBloc formBloc) {
    return Column(
      children: <Widget>[
        RightBottomTitle(
          title: 'clinical_questions',
          padding: EdgeInsets.fromLTRB(10, 0, 15, 50),
        ),
      ],
    );
  }

  void resetValues(CompleteFormBloc formBloc) {
    reset = true;
    previous = true;
    formBloc.resetClinical();
    setState(() {});
    reset = false;
  }

  void previousValues(CompleteFormBloc formBloc) {
    reset = false;
    previous = true;
    formBloc.previousClinical();
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
