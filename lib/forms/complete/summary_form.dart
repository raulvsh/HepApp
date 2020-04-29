import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final formBloc;

  SummaryForm({Key key, this.formBloc}) : super(key: key);

  @override
  SummaryFormState createState() => SummaryFormState();
}

class SummaryFormState extends State<SummaryForm> with Observable {
  var reset = false;
  var previous = false;
  final prefs = UserSettings();
  final units = Units();

  //bool _internationalUnits = true;

  //Map<String, bool> _errorMap;

  //StreamSubscription streamSubIUnits;

  //StreamSubscription streamSubErrorList;
  //StreamSubscription streamSubErrorMap;

  //String errorPrueba = "";

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    /*streamSubIUnits = prefs.iUnitsUpdates.listen(
          (newVal) =>
          setState(() {
            _internationalUnits = newVal;
          }),
    );
    prefs.setInternationalUnits(true);

    streamSubErrorMap = prefs.errorMapUpdates.listen((newVal) =>
        setState(() {
          _errorMap = newVal;
        }));
    prefs.initErrorMap(
        ['bilirubin', 'albumin', 'ascites', 'tumour_extent']);*/

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
    //streamSubIUnits.cancel();
    //streamSubErrorMap.cancel();

    super.dispose();
  }

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
                //selPartialSettings: true,
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
    Map<String, dynamic> diagnosticMap1 = {
      'tumours': '0',
      '#1': '-',
      '#2': '-',
      '#3': '-',
      '#4': '-',
      '#5': '-',
      '#6': '-',
      'tumour_extent': '<=50%',
    };
    Map<String, dynamic> diagnosticMap2 = {
      'pvi': '0',
      'nodes': '-',
      'metastasis': '-',
      'portal_hypertension': '-',
      'pvt': '-',
    };

    return Container(
      width: context.widthPct(0.42),
      //color: Colors.grey,
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
      //horizontal: 5, vertical: 10),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildSummaryTitle('diagnostic_imaging'),
          _buildSeparator(0.38),
          Row(
            //mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: context.widthPct(0.20),

                padding: EdgeInsets.only(top: 5),
                //color: Colors.orange,
                child: _buildSummaryColumn(diagnosticMap1),
                //Column(
                //mainAxisSize: MainAxisSize.min,
                //children:
                //),
              ),
              Container(
                width: context.widthPct(0.18),
                padding: EdgeInsets.only(top: 5),

                //color: Colors.yellow,
                child: _buildSummaryColumn(diagnosticMap2),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildLabColumn() {
    Map<String, dynamic> diagnosticMap3 = {
      'international_units': 'yes',
      'bilirubin': '-',
      'inr_summary': '-',
      'creatinine': '-',
      'dialysis': '-',
      'albumin': '-',
      'sodium': '-',
      'platelets': '-',
      'afp': '-',
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
    Map<String, dynamic> diagnosticMap4 = {
      'cirrhosis': 'yes',
      'encephalopaty': '-',
      'ascites': '-',
      'varices': '-',
      'ecog': '-',
      'preclude_major_surgery': '-',
      'age': '-',
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
