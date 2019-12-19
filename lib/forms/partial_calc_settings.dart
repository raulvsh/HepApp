import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hepapp/forms/partial_calc_settings_bloc.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

import 'CalcResultWidget.dart';
import 'ChildCalcForm_bloc.dart';
import 'CustomButtonGroupFieldBlocBuilder.dart';
import 'CustomTextFieldBlocBuilder.dart';

//var resultado = 'defecto';
class PartialCalcSettings extends StatefulWidget {
  @override
  _PartialCalcSettingsState createState() => _PartialCalcSettingsState();
}

class _PartialCalcSettingsState extends State<PartialCalcSettings> {
  final prefs = new PreferenciasUsuario();
  bool _international_units;

  bool resultado;

  @override
  void initState() {
    super.initState();
    /*prefs.internationalUnits = true;
    _international_units = prefs.internationalUnits;*/
  }

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);

    return BlocProvider<PartialCalcSettingsBloc>(
      builder: (context) => PartialCalcSettingsBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<PartialCalcSettingsBloc>(context);

          return AlertDialog(
              content: ConstrainedBox(
            constraints: BoxConstraints.tight(Size.fromHeight(100)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomButtonGroupFieldBlocBuilder(
                  selectFieldBloc: formBloc.iuField,
                  text: aux.tr('international_units'),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  //body: Text('CheckboxFieldBlocBuilder'),
                ),
                /*Text(
                  "International Units",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                SizedBox(
                  height: 5.0,
                ),
                filaInternationalUnits,
                SizedBox(
                  height: 5.0,
                ),*/
                Container(
                  width: 150,
                  padding: const EdgeInsets.all(8.0),
                  //margin: EdgeInsets.only(right: 270, left: 20),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: Color.fromARGB(255, 45, 145, 155),
                          width: 2,
                        )),
                    color: Theme.of(context).primaryColor,
                    splashColor: Color.fromARGB(255, 56, 183, 198),
                    elevation: 3,
                    onPressed: () /*async*/ {
                      formBloc.submit();
                      //await Future<void>.delayed(Duration(seconds: 2));

                      //resultado = formBloc.iuField.toString();
                      //print('otra res $resultado');

                      setState(() {
                        prefs.internationalUnits = _international_units;
                        //prefs.bilirubin(2);
                        print(
                            'accedo bien a las prefs ${prefs.internationalUnits}');
                        print(_international_units);
                      });
                    },
                    child: Center(
                      child: Text(
                        aux.tr('save_settings'),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }

  _buildLeftColumn(
      AppLocalizations aux, ChildCalcFormBloc formBloc, BuildContext context) {
    return //Expanded(
        //child:
        Container(
      width: MediaQuery.of(context).size.width * 0.65,
      //color: Colors.red,
      child: ListView(
        shrinkWrap: true,
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          CustomTextFieldBlocBuilder(
              aux: aux,
              formBloc: formBloc,
              textFieldBloc: formBloc.bilirubinField,
              title: aux.tr('bilirubin'),
              uds: 'umol/L'),
          CustomTextFieldBlocBuilder(
              aux: aux,
              formBloc: formBloc,
              textFieldBloc: formBloc.inrField,
              title: aux.tr('inr'),
              uds: ''),
          CustomTextFieldBlocBuilder(
              aux: aux,
              formBloc: formBloc,
              textFieldBloc: formBloc.albuminField,
              title: aux.tr('albumin'),
              uds: 'g/L'),
          CustomButtonGroupFieldBlocBuilder(
            selectFieldBloc: formBloc.encephalopatyField,
            text: aux.tr('encephalopaty'),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            //itemBuilder: (context, item) => item,
          ),
          /*CustomButtonGroupFieldBlocBuilder(
                          selectFieldBloc: formBloc.tumourPercentageField,
                          text: aux.tr('tumour_extent'),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          //itemBuilder: (context, item) => item,
                        ),*/
          CustomButtonGroupFieldBlocBuilder(
            selectFieldBloc: formBloc.ascitesField,
            text: aux.tr('ascites'),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            //itemBuilder: (context, item) => item,
          ),

          /*DropdownFieldBlocBuilder<String>(
                          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 0),
                          selectFieldBloc: formBloc.selectField1,
                          decoration: InputDecoration(
                            labelText: 'DropdownFieldBlocBuilder',
                            // prefixIcon: Icon(Icons.sentiment_very_dissatisfied),
                          ),
                          itemBuilder: (context, value) => value,
                        ),
                        CheckboxGroupFieldBlocBuilder<String>(
                          multiSelectFieldBloc: formBloc.multiSelectField,
                          itemBuilder: (context, item) => item,
                          decoration: InputDecoration(
                            labelText: 'CheckboxGroupFieldBlocBuilder',
                            prefixIcon: Icon(Icons.sentiment_very_dissatisfied),
                          ),
                        ),*/
          /*RadioButtonGroupFieldBlocBuilder<String>(
                          selectFieldBloc: formBloc.selectField2,
                          decoration: InputDecoration(
                            labelText: 'RadioButtonGroupFieldBlocBuilder',
                            prefixIcon: Icon(Icons.sentiment_very_dissatisfied),
                          ),
                          itemBuilder: (context, item) => item,
                        ),*/
          /*CheckboxFieldBlocBuilder(
                          booleanFieldBloc: formBloc.booleanField,
                          body: Text('CheckboxFieldBlocBuilder'),
                        ),*/
          //Row(

          //children: <Widget>[
          Container(
            width: 200,
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.only(right: 270, left: 20),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Color.fromARGB(255, 45, 145, 155),
                    width: 2,
                  )),
              color: Theme.of(context).primaryColor,
              splashColor: Color.fromARGB(255, 56, 183, 198),
              elevation: 3,
              onPressed: () /*async*/ {
                formBloc.submit();
                //await Future<void>.delayed(Duration(seconds: 2));

                //resultado = formBloc.resultadoField;
                //print('otra res $resultado');

                setState(() {});
              },
              child: Center(
                child: Text(
                  aux.tr('calculate_cp_score'),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          /*Container(
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: RaisedButton(
                  onPressed: formBloc.clear,
                  child: Center(child: Text('CLEAR')),
                ),
              ),*/
          //],
          //),
        ],
      ),
      //),
    );
  }

  _buildRightColumn(
      AppLocalizations aux, resultadoField, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,

      //color: Colors.blue,
      child: ListView(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Center(
            child: CalcResultWidget('child_pugh_score', resultadoField),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 50),
              //alignment: Alignment.bottomRight,
              child: Text(
                aux.tr('child_pugh_score'),
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 210, 242, 245),
                ),
              ),
            ),
          ),
          /*Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 50),
                //alignment: Alignment.bottomRight,
                child: Text(
                  aux.tr('child_pugh_score'),
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 210, 242, 245),
                  ),
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
