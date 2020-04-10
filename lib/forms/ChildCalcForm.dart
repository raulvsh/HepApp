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
import 'package:sized_context/sized_context.dart';

import 'CalcResultWidget.dart';
import 'ChildCalcForm_bloc.dart';
import 'CustomButtonGroupFieldBlocBuilder.dart';
import 'CustomTextFieldBlocBuilder.dart';

class ChildCalcForm extends StatefulWidget {
  ChildCalcForm({Key key}) : super(key: key);

  @override
  ChildCalcFormState createState() => ChildCalcFormState();
}

class ChildCalcFormState extends State<ChildCalcForm> {
  var reset = false;
  final prefs = PreferenciasUsuario();
  final units = Units();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    prefs.internationalUnits = true;
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                'child_pugh_score_oneline',
                selScreenshot: true,
              ),
              drawer: MenuWidget(),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildLeftColumn(formBloc),
                  _buildRightColumn(formBloc.resultadoField),
                ],
              ),
              bottomSheet:
              _buildBottomSheet(formBloc),
            ),
          );
        },
      ),
    );
  }

  _buildLeftColumn(ChildCalcFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      width: isTablet ? context.widthPct(0.62) : context.widthPct(0.65),
      //color: Colors.red,
      padding: EdgeInsets.only(left: 20, top: 20),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          _buildBilirrubinRow(aux, formBloc),
          _buildInrRow(aux, formBloc),
          _buildAlbuminRow(aux, formBloc),
          _buildEncephalopatyRow(aux, formBloc),
          _buildAscitesRow(aux, formBloc),
          _buildCalcButton(aux, formBloc),
        ],
      ),
      //),
    );
  }

  _buildBilirrubinRow(AppLocalizations aux, ChildCalcFormBloc formBloc) {
    return CustomTextFieldBlocBuilder(
      //formBloc: formBloc,
      textFieldBloc: formBloc.bilirubinField,
      title: aux.tr('bilirubin'),
      uds: prefs.internationalUnits
          ? units.bilirubinUds[0]
          : units.bilirubinUds[1],
    );
  }

  _buildInrRow(AppLocalizations aux, ChildCalcFormBloc formBloc) {
    return CustomTextFieldBlocBuilder(
      //formBloc: formBloc,
      textFieldBloc: formBloc.inrField,
      title: aux.tr('inr'),
      uds: '',
    );
  }

  _buildAlbuminRow(AppLocalizations aux, ChildCalcFormBloc formBloc) {
    return CustomTextFieldBlocBuilder(
      //formBloc: formBloc,
      textFieldBloc: formBloc.albuminField,
      title: aux.tr('albumin'),
      uds: prefs.internationalUnits ? units.albuminUds[0] : units.albuminUds[1],
    );
  }

  _buildEncephalopatyRow(AppLocalizations aux,
      ChildCalcFormBloc formBloc,) {
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

  _buildAscitesRow(AppLocalizations aux,
      ChildCalcFormBloc formBloc,) {
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

  _buildCalcButton(AppLocalizations aux,
      ChildCalcFormBloc formBloc,) {
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      width: 250,
      //padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(right: context.widthPct(0.25), left: 25),
      //left: 20),
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
              fontSize: isTablet ? 15 : 12,
            ),
          ),
        ),
      ),
    );
  }

  _buildBottomSheet(ChildCalcFormBloc formBloc) {
    var aux = AppLocalizations.of(context);

    return BottomAppBar(
      child: Row(
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
    );

    // CalcBottomBar("reseteo2");
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
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return MoreInformation(
                title: 'child_pugh_score_oneline',
                path: 'assets/images/calc/M3C14S0c.png',
              );
            },
          );
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

  Container _buildResetButton(AppLocalizations aux,
      ChildCalcFormBloc formBloc) {
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

  _buildRightColumn(String resultadoField) {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);
    return Container(
      width: isTablet ? context.widthPct(0.38) : context.widthPct(0.35),

      //color: Colors.blue,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildIUnitsRow(aux),
          //Center(
          //child:
          Container(
            //padding: EdgeInsets.fromLTRB(0, 30, 40, 0),
              child:
              CalcResultWidget('child_pugh_score_oneline', resultadoField)),
          //),
          _buildRightBottomTitle(aux),
        ],
      ),
    );
  }

  Container _buildIUnitsRow(AppLocalizations aux) {
    bool isTablet = context.diagonalInches >= 7;
    return Container(
        height: 60,
        padding: EdgeInsets.only(top: 30),
        child: Row(
          children: <Widget>[
            Text(
              aux.tr("international_units"),
              style: TextStyle(
                fontSize: isTablet ? 15 : 12,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            _buildIUnitsSelect(),
          ],
        ));
  }

  _buildIUnitsSelect() {
    final prefs = new PreferenciasUsuario();
    var aux = AppLocalizations.of(context);

    List<bool> isSelected = [true, false];

    isSelected[0] = prefs.internationalUnits;
    isSelected[1] = !prefs.internationalUnits;

    return ToggleButtons(
      borderColor: Color.fromARGB(255, 45, 145, 155),
      fillColor: Theme
          .of(context)
          .primaryColor,
      borderWidth: 1.3,
      selectedBorderColor: Color.fromARGB(255, 45, 145, 155),
      selectedColor: Colors.white,
      color: Theme
          .of(context)
          .primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
      children: <Widget>[
        Container(
          width: 60,
          child: Text(
            aux.tr('on'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ), //color: Theme.of(context).primaryColor) ,
          ),
        ),
        Container(
          width: 60,
          child: Text(
            aux.tr('off'),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
          print("isselected 0 " + isSelected[0].toString());
          print("isselected 1 " + isSelected[1].toString());

          prefs.internationalUnits = isSelected[0];
          //setState(() {});
        });
      },
      isSelected: isSelected,
    );
  }

  Expanded _buildRightBottomTitle(AppLocalizations aux) {
    bool isTablet = context.diagonalInches >= 7;

    return Expanded(
      child: Container(
        alignment: Alignment.bottomRight,

        //margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.fromLTRB(10, 0, 60, 50),
        //alignment: Alignment.bottomRight,
        child: Text(
          aux.tr('child_pugh_score_oneline'),
          style: TextStyle(
            fontSize: isTablet ? 28 : 20,
            color: Theme
                .of(context)
                .primaryColor
                .withAlpha(150), //Color.fromARGB(255, 210, 242, 245),
          ),
        ),
      ),
    );
  }

  void resetValues(ChildCalcFormBloc formBloc) {
    print("\n\n************************RESET");

    reset = true;
    //print("valor reset dentro método $reset");
    formBloc.reset();

    setState(() {});
  }


  void previousValues(ChildCalcFormBloc formBloc) {
    reset = false;
    formBloc.previous();
    setState(() {});
  }
}
