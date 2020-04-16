import 'dart:async';

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
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import 'CPSForm_bloc.dart';
import 'CalcResultWidget.dart';
import 'CustomButtonGroupFieldBlocBuilder.dart';
import 'CustomTextFieldBlocBuilder.dart';

class CPSForm extends StatefulWidget with Observable {
  CPSForm({Key key}) : super(key: key);

  @override
  CPSFormState createState() => CPSFormState();
}

class CPSFormState extends State<CPSForm> with Observable {
  var reset = false;
  final prefs = PreferenciasUsuario();
  final units = Units();
  bool _internationalUnits = true;
  StreamSubscription streamSubscription;


  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    streamSubscription = prefs.iUnitsUpdates.listen(
          (newVal) =>
          setState(() {
            _internationalUnits = newVal;
          }),
    );
    prefs.setInternationalUnits(true);
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
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CPSFormBloc>(
      builder: (context) => CPSFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<CPSFormBloc>(context);
          return FormBlocListener<CPSFormBloc, String, String>(
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
                //selPartialSettings: true,
              ),
              drawer: MenuWidget(),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildLeftColumn(formBloc),
                  _buildRightColumn(formBloc),
                ],
              ),
              bottomSheet: _buildBottomSheet(formBloc),
            ),
          );
        },
      ),
    );
  }

  _buildLeftColumn(CPSFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      width: isTablet ? context.widthPct(0.62) : context.widthPct(0.65),
      height: context.heightPx,
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
          //Text(maps.toString()),
        ],
      ),
    );
  }

  _buildBilirrubinRow(AppLocalizations aux, CPSFormBloc formBloc) {
    return CustomTextFieldBlocBuilder(
      //formBloc: formBloc,
      textFieldBloc: formBloc.bilirubinField,
      title: aux.tr('bilirubin'),
      uds: _internationalUnits
          ? units.bilirubinUds[0]
          : units.bilirubinUds[1],

    );
  }

  _buildInrRow(AppLocalizations aux, CPSFormBloc formBloc) {
    return CustomTextFieldBlocBuilder(
      //formBloc: formBloc,
      textFieldBloc: formBloc.inrField,
      title: aux.tr('inr'),
      uds: '',
    );
  }

  _buildAlbuminRow(AppLocalizations aux, CPSFormBloc formBloc) {
    return CustomTextFieldBlocBuilder(
      //formBloc: formBloc,
      textFieldBloc: formBloc.albuminField,
      title: aux.tr('albumin'),
      uds: _internationalUnits ? units.albuminUds[0] : units.albuminUds[1],
    );
  }

  _buildEncephalopatyRow(AppLocalizations aux,
      CPSFormBloc formBloc,) {
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
      CPSFormBloc formBloc,) {
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
      CPSFormBloc formBloc,) {
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
          calculateCPS(formBloc);
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


  _buildBottomSheet(CPSFormBloc formBloc) {
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
      CPSFormBloc formBloc) {
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

  _buildRightColumn(CPSFormBloc formBloc) {
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      width: isTablet ? context.widthPct(0.38) : context.widthPct(0.35),

      //color: Colors.blue,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildIUnitsRow(formBloc),
          //Center(
          //child:
          Container(
            //padding: EdgeInsets.fromLTRB(0, 30, 40, 0),
              child:
              CalcResultWidget(
                  'child_pugh_score_oneline', formBloc.resultadoField)),
          //),
          _buildRightBottomTitle(),
        ],
      ),
    );
  }

  Container _buildIUnitsRow(CPSFormBloc formBloc) {
    AppLocalizations aux = AppLocalizations.of(context);
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
            _buildIUnitsSelect(formBloc),
          ],
        ));
  }

  _buildIUnitsSelect(CPSFormBloc formBloc) {
    final prefs = new PreferenciasUsuario();
    var aux = AppLocalizations.of(context);

    List<bool> isSelected = [true, false];

    isSelected[0] = prefs.getIunitsPrueba();
    isSelected[1] = !isSelected[0];
    //isSelected[1] = !prefs.getIunitsPrueba();

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
          //formBloc.showIU();
          isSelected[0] ? formBloc.showIU() : formBloc
              .showNotIU(); // : formBloc.convertToNoIU();


          prefs.setInternationalUnits(isSelected[0]);
        });
      },
      isSelected: isSelected,
    );
  }

  Expanded _buildRightBottomTitle() {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);
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


  void calculateCPS(CPSFormBloc formBloc) {
    formBloc.submit();
    reset = false;
    setState(() {});
  }

  void resetValues(CPSFormBloc formBloc) {
    print("\n\n************************RESET");

    reset = true;
    //print("valor reset dentro método $reset");
    formBloc.reset();


    setState(() {});
  }

  void previousValues(CPSFormBloc formBloc) {
    reset = false;
    formBloc.previous();
    setState(() {});
  }
}
