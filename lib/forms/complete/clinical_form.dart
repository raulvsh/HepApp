import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/forms/right_bottom_title.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:hepapp/widgets/calc_bottom_button.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import '../calc_group_field.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
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
              FittedBox(
                fit: BoxFit.contain,
                child: _buildDataFields(widget.formBloc),
              ),
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

    return Container(
      height: context.heightPct(isTablet ? 1 : 0.6),
      child: FittedBox(
        fit: BoxFit.contain,
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
            ],
          ),
        ),
      ),
    );
  }

  _buildCirrhosisRow(CompleteFormBloc formBloc) {
    return CalcGroupField(
      initialValue: formBloc.cirrhosisField.value.toString(),
      reset: reset,
      previous: previous,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.cirrhosisField,
      title: 'cirrhosis',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildEncephalopatyRow(CompleteFormBloc formBloc,
  ) {
    return CalcGroupField(
      initialValue: formBloc.encephalopatyField.value.toString(),
      reset: reset,
      previous: previous,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.encephalopatyField,
      title: 'encephalopaty',
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildAscitesRow(CompleteFormBloc formBloc,
  ) {
    return CalcGroupField(
      initialValue: formBloc.ascitesField.value.toString(),
      previous: previous,
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

  _buildVaricesRow(CompleteFormBloc formBloc,
  ) {
    return CalcGroupField(
      initialValue: formBloc.varicesField.value.toString(),
      previous: previous,
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

  _buildEcogRow(CompleteFormBloc formBloc,
  ) {
    return CalcGroupField(
      initialValue: formBloc.ecogField.value.toString(),
      previous: previous,
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
          title: 'clinical_questions',
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
          formBloc.submit();
          //printClinical(formBloc);
          widget.controller.nextPage(
              duration: Duration(seconds: 1), curve: Curves.easeInOut);
        },
      ),
    );
  }

  void printClinical(CompleteFormBloc formBloc) {
    print("\n***CLINICAL***");
    print("Campo cirrosis: " + formBloc.cirrhosisField.value);
    print("Campo encefalopatia: " + formBloc.encephalopatyField.value);
    print("Campo ascites: " + formBloc.ascitesField.value);
    print("Campo varices: " + formBloc.varicesField.value);
    print("Campo ecog: " + formBloc.ecogField.value);
  }
}
