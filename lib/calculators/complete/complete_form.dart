import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/calculators/complete/clinical_form.dart';
import 'package:hepapp/calculators/complete/diagnostic_form.dart';
import 'package:hepapp/calculators/complete/laboratory_form.dart';
import 'package:hepapp/calculators/complete/results_form.dart';
import 'package:hepapp/calculators/complete/summary_form.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import 'complete_form_bloc.dart';

class CompleteForm extends StatefulWidget with Observable {
  final initialPage;

  CompleteForm({Key key, this.initialPage}) : super(key: key);

  @override
  CompleteFormState createState() => CompleteFormState();
}

class CompleteFormState extends State<CompleteForm> with Observable {
  var reset = false;
  final prefs = UserSettings();
  final units = Units();
  PageController controller;
  Map<String, bool> _parseErrorMap;
  StreamSubscription streamSubParseErrorMap;

  @override
  void initState() {
    controller = PageController(
      initialPage: widget.initialPage,
    );
    prefs.setInternationalUnits(true);
    prefs.setTumourNumber(0);
    prefs.setPrecludeSurgery(true);
    prefs.setLtCriteria('milan_criteria');
    streamSubParseErrorMap =
        prefs.parseErrorMapUpdates.listen((newVal) => setState(() {
              _parseErrorMap = newVal;
            }));
    prefs.initParseErrorMap([
      'tumour_size[0]',
      'tumour_size[1]',
      'tumour_size[2]',
      'tumour_size[3]',
      'tumour_size[4]',
      'tumour_size[5]',
      'bilirubin',
      'inr',
      'creatinine',
      'albumin',
      'sodium',
      'platelets',
      'afp',
      'ast',
      'ast_upper_limit',
      'alp',
      'alp_upper_limit',
    ]);

    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    streamSubParseErrorMap.cancel();

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
    return BlocProvider<CompleteFormBloc>(
      builder: (context) => CompleteFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<CompleteFormBloc>(context);
          return FormBlocListener<CompleteFormBloc, String, String>(
            child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                DiagnosticForm(formBloc: formBloc, controller: controller),
                LaboratoryForm(formBloc: formBloc, pageController: controller),
                ClinicalForm(formBloc: formBloc, pageController: controller),
                ResultsForm(formBloc: formBloc, pageController: controller),
                SummaryForm(formBloc: formBloc, pageController: controller),
              ],
            ),
          );
        },
      ),
    );
  }
}
