import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:hepapp/forms/units.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:hepapp/widgets/more_information.dart';

import 'CalcResultWidget.dart';
import 'ChildCalcForm_bloc.dart';
import 'CustomButtonGroupFieldBlocBuilder.dart';
import 'CustomTextFieldBlocBuilder.dart';

class ChildCalcForm extends StatefulWidget {
  @override
  _ChildCalcFormState createState() => _ChildCalcFormState();
}

class _ChildCalcFormState extends State<ChildCalcForm> {
  var reset = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);

    return BlocProvider<ChildCalcFormBloc>(
      builder: (context) => ChildCalcFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<ChildCalcFormBloc>(context);
          return FormBlocListener<ChildCalcFormBloc, String, String>(
            /*onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) {
                LoadingDialog.hide(context);
                 Notifications.showSnackBarWithSuccess(
                    context, state.successResponse);
                 //Muestra una barra verde con la palabra success
              },*/
            /*onFailure: (context, state) {

              //LoadingDialog.hide(context);
              Notifications.showSnackBarWithError(
                  context, state.failureResponse);
            },*/
            child: Scaffold(
              appBar: CustomAppBar(
                context,
                'child_pugh_score',
                selScreenshot: true,
                selPartialSettings: true,
              ),
              drawer: MenuWidget(),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildLeftColumn(aux, formBloc, context),
                  _buildRightColumn(aux, formBloc.resultadoField, context),
                ],
              ),
              bottomSheet: _buildBottomSheet(formBloc),
            ),
          );
        },
      ),
    );
  }

  _buildLeftColumn(AppLocalizations aux, ChildCalcFormBloc formBloc,
      BuildContext context) {
    final prefs = new PreferenciasUsuario();
    var udsController = Units();

    return Container(
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
          _buildBilirrubinRow(aux, formBloc),
          _buildInrRow(aux, formBloc),
          _buildAlbuminRow(aux, formBloc),
          _buildEncephalopatyRow(formBloc, aux),
          _buildAscitesRow(formBloc, aux),
          _buildCalcButton(context, formBloc, aux),
          /*ListTile(
              title: Container(),
            ),*/
          /*ListTile(
            title: RaisedButton(
              onPressed: () {
                reseteo(formBloc);
              },
              child: Text("boton reset prueba"),
            ),
          ),*/
          /*Text(prefs.internationalUnits.toString()),
          Text(udsController.albuminUds[0] +
              " " +
              udsController.albuminUds[1] +
              " " +
              udsController.bilirubinUds[0] +
              " " +
              udsController.bilirubinUds[1]),
          Text(udsController.getConvertedAlbumin(1).toString() +
              "         " +
              udsController.getConvertedBilirrubin(2).toString()),*/
        ],
      ),
      //),
    );
  }

  _buildBilirrubinRow(AppLocalizations aux, ChildCalcFormBloc formBloc) {
    return CustomTextFieldBlocBuilder(
        aux: aux,
        formBloc: formBloc,
        textFieldBloc: formBloc.bilirubinField,
        title: aux.tr('bilirubin'),
        uds: 'umol/L');
  }

  _buildInrRow(AppLocalizations aux, ChildCalcFormBloc formBloc) {
    return CustomTextFieldBlocBuilder(
      aux: aux,
      formBloc: formBloc,
      textFieldBloc: formBloc.inrField,
      title: aux.tr('inr'),
      uds: '',
    );
  }

  _buildAlbuminRow(AppLocalizations aux, ChildCalcFormBloc formBloc) {
    return CustomTextFieldBlocBuilder(
      aux: aux,
      formBloc: formBloc,
      textFieldBloc: formBloc.albuminField,
      title: aux.tr('albumin'),
      uds: 'g/L',
    );
  }

  _buildEncephalopatyRow(ChildCalcFormBloc formBloc, AppLocalizations aux) {
    return CustomButtonGroupFieldBlocBuilder(
      reset: reset,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.encephalopatyField,
      text: aux.tr('encephalopaty'),
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildAscitesRow(ChildCalcFormBloc formBloc, AppLocalizations aux) {
    return CustomButtonGroupFieldBlocBuilder(
      reset: reset,
      padding: EdgeInsets.only(left: 8),
      selectFieldBloc: formBloc.ascitesField,
      text: aux.tr('ascites'),
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      itemBuilder: (context, item) => item,
    );
  }

  _buildCalcButton(BuildContext context, ChildCalcFormBloc formBloc,
      AppLocalizations aux) {
    return Container(
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
    );
  }

  _buildBottomSheet(ChildCalcFormBloc formBloc) {
    //ButtonActions actions = ButtonActions();
    var aux = AppLocalizations.of(context);
    return //CalcBottomBar("reseteo2");

      BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildResetButton(aux, formBloc),
            SizedBox(
              width: 15,
            ),
            _buildPreviousButton(aux),
            SizedBox(
              width: 15,
            ),
            _buildMoreInfoButton(aux),
          ],
      ),
    );

    // CalcBottomBar("reseteo2");
  }

  Container _buildMoreInfoButton(AppLocalizations aux) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: FlatButton(
        child: Text(
          aux.tr('more_information'),
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        color: Color.fromARGB(255, 210, 242, 245),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MoreInformation(title: 'child_pugh_score',
                path: 'assets/images/calc/M3C14S0c.png',);
            },
          );
        },
      ),
    );
  }

  Container _buildPreviousButton(AppLocalizations aux) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: FlatButton(
        child: Text(
          aux.tr('previous_values'),
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        color: Color.fromARGB(255, 210, 242, 245),
        onPressed: () {},
      ),
    );
  }

  Container _buildResetButton(AppLocalizations aux,
      ChildCalcFormBloc formBloc) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: FlatButton(
        child: Text(
          aux.tr('reset'),
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        color: Color.fromARGB(255, 210, 242, 245),
        onPressed: () {
          resetValues(formBloc);
        },
      ),
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
        ],
      ),
    );
  }

  void resetValues(ChildCalcFormBloc formBloc) {
    print("\n\n************************RESET");
    print("valor reset antes método $reset");

    reset = true;
    print("valor reset dentro método $reset");
    formBloc.reset();
    print("\n\n *********FIELD VALUES AFTER RESET");
    print("Campo bilirrubina: " + formBloc.bilirubinField.toString());
    print("Campo inr: " + formBloc.inrField.toString());
    print("Campo albumina: " + formBloc.albuminField.toString());
    print("Campo encefalopatía: " + formBloc.encephalopatyField.toString());
    print("Campo ascitis: " + formBloc.ascitesField.toString());
    print("Campo resultado antes de operar: " + formBloc.resultadoField); /*formBloc.bilirubinField="0";
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

    formBloc.resultadoField = "CPS";
    setState(() {});
    //print("formbloc desde reset: ${formBloc.resultadoField}");
  }

  void _showDialog() {
    var aux = AppLocalizations.of(context);
    // flutter defined function

  }

}

