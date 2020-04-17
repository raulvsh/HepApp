import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';
import 'package:sized_context/sized_context.dart';

class PartialCalcTextField extends StatefulWidget {
  const PartialCalcTextField({
    Key key,
    @required this.textFieldBloc,
    @required this.title,
    @required this.uds,
  }) : super(key: key);

  final TextFieldBloc textFieldBloc;
  final title;
  final uds;

  @override
  _PartialCalcTextFieldState createState() => _PartialCalcTextFieldState();
}

class _PartialCalcTextFieldState extends State<PartialCalcTextField> {
  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    bool isTablet = context.diagonalInches >= 7;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(width: 8),
        _buildInitialBlueRectangle(),
        _buildInitialText(isTablet),
        _buildTextField(isTablet, context),
        Container(
          //color: Colors.red,
          //width: 90,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              widget.uds, //'umol/L',
              style: TextStyle(
                color: Colors.black,
                fontSize: isTablet ? 15 : 12,
              ),
            )),
      ],
    );
  }

  Container _buildTextField(bool isTablet, BuildContext context) {
    return Container(
      width: isTablet ? 80 : 60,
      height: 40,
      child: TextFieldBlocBuilder(
        padding:
        EdgeInsets.symmetric(vertical: 10, horizontal: isTablet ? 10 : 5),
        cursorColor: Theme
            .of(context)
            .primaryColor,
        keyboardType: TextInputType.numberWithOptions(),
        isEnabled: true,
        //Controlo si está activo o no, útil para cuando elijo número de tumores
        textFieldBloc: widget.textFieldBloc,
        //formBloc.bilirubinField, anterior, borrar

        expands: false,

        style: TextStyle(
          fontSize: isTablet ? 14 : 12,
          color: Theme
              .of(context)
              .primaryColor,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              width: 1.3,
              color: Color.fromARGB(255, 45, 145, 155),
            ), //color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.0),
            borderSide: BorderSide(
              width: 1.3,
              color: Color.fromARGB(255, 45, 145, 155),
            ), //color: Colors.red),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),

          /*errorText: "hola",
            errorStyle: TextStyle(
              backgroundColor: Colors.yellow,
            ),*/
        ),
        onChanged: (text) {
          print("widget text title " + widget.title);
          if (widget.title == 'bilirubin') {
            prefs.setErrorList(0, false);
          } else if (widget.title == 'inr') {
            prefs.setErrorList(1, false);
          } else if (widget.title == 'albumin') {
            prefs.setErrorList(2, false);
          }
        },
        errorBuilder: (context, error) {
          print("widget text title " + widget.title);
          if (widget.title == 'bilirubin') {
            prefs.setErrorList(0, true);
          } else if (widget.title == 'inr') {
            prefs.setErrorList(1, true);
          } else if (widget.title == 'albumin') {
            prefs.setErrorList(2, true);
          }
          // prefs.incrementNumErrors();
          switch (error) {
            case ValidatorsError.requiredTextFieldBloc:
              return " ";
            default:
              return 'This text is nor valid.';
          }
        },
      ),
    );
  }

  Container _buildInitialText(bool isTablet) {
    AppLocalizations aux = AppLocalizations.of(context);
    return Container(
      //color: Colors.red,
      //width: 90,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          aux.tr(widget.title),
          style: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 15 : 12,
          ),
        ));
  }

  Container _buildInitialBlueRectangle() {
    return Container(
      color: Color.fromARGB(255, 210, 242, 245),
      width: 10.0,
      height: 20.0,
    );
  }
}
