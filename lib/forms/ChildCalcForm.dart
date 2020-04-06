import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/widgets/notifications.dart';

import 'CalcResultWidget.dart';
import 'ChildCalcForm_bloc.dart';
import 'CustomButtonGroupFieldBlocBuilder.dart';
import 'CustomTextFieldBlocBuilder.dart';

//var resultado = 'defecto';
class ChildCalcForm extends StatefulWidget {
  @override
  _ChildCalcFormState createState() => _ChildCalcFormState();
}

class _ChildCalcFormState extends State<ChildCalcForm> {
  String resultado = '';
  var reset = false;

  /*List<String> encephalopatyList = [
    "None",
    "Grade 1- 2",
    "Grade 3-4",

  ];*/

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);

    return BlocProvider<ChildCalcFormBloc>(
      builder: (context) => ChildCalcFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<ChildCalcFormBloc>(context);
          //print("formbloc desde fuera resultado ${formBloc.resultadoField}");
          //print("formbloc desde fuera prueba " + formBloc.pruebaField.toString());
          //reseteo(formBloc);
          return //Scaffold(
            //appBar: AppBar(title: Text('Form Fields Example')),
            //body:

            FormBlocListener<ChildCalcFormBloc, String, String>(
              /*onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                 Notifications.showSnackBarWithSuccess(
                    context, state.successResponse);
                 //Muestra una barra verde con la palabra success
              },*/
              onFailure: (context, state) {
                //LoadingDialog.hide(context);
                Notifications.showSnackBarWithError(
                    context, state.failureResponse);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildLeftColumn(aux, formBloc, context),
                  _buildRightColumn(aux, formBloc.resultadoField, context),
                ],
              ),
              //),
            );
        },
      ),
    );
  }

  _buildLeftColumn(AppLocalizations aux, ChildCalcFormBloc formBloc,
      BuildContext context) {
    //var reset = false;
    //List<bool> _selections = List.generate(3, (_) => true);
    return //Expanded(
      //child:
      Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.65,
        //color: Colors.red,
        child: ListView(
          shrinkWrap: true,
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            //OnlySelectChip(encephalopatyList, formBloc.pruebaField),


            ListTile(
              title: CustomTextFieldBlocBuilder(
                  aux: aux,
                  formBloc: formBloc,
                  textFieldBloc: formBloc.bilirubinField,
                  title: aux.tr('bilirubin'),
                  uds: 'umol/L'),
              //contentPadding: EdgeInsets.all(0),
            ),

            ListTile(
              //contentPadding: EdgeInsets.all(0),

              title: CustomTextFieldBlocBuilder(
                aux: aux,
                formBloc: formBloc,
                textFieldBloc: formBloc.inrField,
                title: aux.tr('inr'),
                uds: '',
              ),
            ),
            ListTile(
              //contentPadding: EdgeInsets.all(0),

              title: CustomTextFieldBlocBuilder(
                  aux: aux,
                  formBloc: formBloc,
                  textFieldBloc: formBloc.albuminField,
                  title: aux.tr('albumin'),
                  uds: 'g/L'),
            ),
            ListTile(
              //contentPadding: EdgeInsets.all(0),

              title: CustomButtonGroupFieldBlocBuilder(
                reset: reset,
                padding: EdgeInsets.only(left: 8),
                selectFieldBloc: formBloc.encephalopatyField,
                text: aux.tr('encephalopaty'),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),


                //itemBuilder: (context, item) => item,
              ),
            ),

            ListTile(
              //contentPadding: EdgeInsets.all(0),

              title: CustomButtonGroupFieldBlocBuilder(
                //optionList: encephalopatyList,
                reset: reset,
                padding: EdgeInsets.only(left: 8),

                selectFieldBloc: formBloc.ascitesField,
                text: aux.tr('ascites'),

                decoration: InputDecoration(
                  border: InputBorder.none,


                ),
                //itemBuilder: (context, item) => item,
              ),
            ),

            ListTile(
              title: Container(
                width: 250,
                //padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.only(right: 250, left: 25), //left: 20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                      side: BorderSide(
                        color: Color.fromARGB(255, 45, 145, 155),
                        width: 1.5,
                      )),
                  color: Theme
                      .of(context)
                      .primaryColor,
                  splashColor: Color.fromARGB(255, 56, 183, 198),
                  elevation: 3,
                  onPressed: () {
                    formBloc.submit();
                    reset = false;
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

            ),
            /*ListTile(
              title: Container(),
            ),*/
            ListTile(
              title: RaisedButton(
                onPressed: () {
                  reseteo(formBloc);
                },
                child: Text("boton reset prueba"),

              ),
            ),
            ListTile(
              title: Container(),
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

  _buildRightColumn(AppLocalizations aux, resultadoField,
      BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.35,

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
              margin: EdgeInsets.only(top: 50),
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

  void reseteo(ChildCalcFormBloc formBloc) {
    print("************************RESET");
    print("valor reset dentro método $reset");

    reset = true;
    print("valor reset dentro método $reset");
    formBloc.reset();
    /*formBloc.bilirubinField="0";
    //formBloc.inrField=0 as TextFieldBloc;
    //formBloc.albuminField=0 as TextFieldBloc;

    formBloc.encephalopatyField="none" as SelectFieldBloc<String>;
    formBloc.ascitesField="none" as SelectFieldBloc<String>;*/
    /*formBloc.encephalopatyField.dispatch(UpdateFieldBlocItems(['none_fem', 'grade_1_2', 'grade_3_4'],));

    formBloc.encephalopatyField.updateInitialValue('none_fem');
    formBloc.encephalopatyField.updateItems(['none_fem', 'grade_1_2', 'grade_3_4']);
    formBloc.encephalopatyField.removeItem("none_fem");
    formBloc.encephalopatyField.removeItem("grade_1_2");
    formBloc.encephalopatyField.removeItem("grade_3_4");
    formBloc.encephalopatyField.updateValue('none_fem');

    formBloc.encephalopatyField.addItem("none_fem");
    formBloc.encephalopatyField.addItem("grade_1_2");
    formBloc.encephalopatyField.addItem("grade_3_4");
    formBloc.encephalopatyField.updateInitialValue('none_fem');*/


    //formBloc.pruebaField = "holiiii";


    print(
        "después del reseteo " +
            "\n bili: " + formBloc.bilirubinField.toString() +
            "\n inr: " + formBloc.inrField.toString() +
            "\n albumina: " + formBloc.albuminField.toString() +
            "\n ence: " + formBloc.encephalopatyField.toString() +
            "\n asci: " + formBloc.ascitesField.toString()
      //+
      //"\n pruebafield: " + formBloc.pruebaField.toString()
    );
    formBloc.resultadoField = "CPS";
    setState(() {

    });
    print("formbloc desde reset: ${formBloc.resultadoField}");
  }
}
