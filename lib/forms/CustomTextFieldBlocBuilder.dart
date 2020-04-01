import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/lang/app_localizations.dart';

import 'ChildCalcForm_bloc.dart';

class CustomTextFieldBlocBuilder extends StatelessWidget {
  const CustomTextFieldBlocBuilder({
    Key key,
    @required this.aux,
    @required this.formBloc,
    @required this.textFieldBloc,
    @required this.title,
    @required this.uds,
  }) : super(key: key);

  final AppLocalizations aux;
  final ChildCalcFormBloc formBloc;
  final TextFieldBloc textFieldBloc;
  final title;
  final uds;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(width: 8),
        Container(
          color: Color.fromARGB(255, 210, 242, 245),
          width: 10.0,
          height: 20.0,
        ),
        Container(
          //color: Colors.red,
          //width: 90,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              title, //aux.tr('bilirubin'),
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            )),
        Container(
          width: 60,
          height: 40,
          child: TextFieldBlocBuilder(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            cursorColor: Theme
                .of(context)
                .primaryColor,
            keyboardType: TextInputType.numberWithOptions(),
            isEnabled: true,
            //Controlo si está activo o no, útil para cuando elijo número de tumores
            textFieldBloc: textFieldBloc,
            //formBloc.bilirubinField, anterior, borrar

            expands: false,

            style: TextStyle(
              fontSize: 12,
              color: Theme
                  .of(context)
                  .primaryColor,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 45, 145, 155),
                ), //color: Colors.red),
              ),
              //TODO añadir errorText: 'Introduce un texto',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(
                  width: 1.5,
                  color: Color.fromARGB(255, 45, 145, 155),
                ), //color: Colors.red),
              ),

              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              /*errorText: "hola",
              errorStyle: TextStyle(
                backgroundColor: Colors.yellow,
              ),*/
            ),

            errorBuilder: (context, error) {
              switch (error) {
                case ValidatorsError.requiredTextFieldBloc:
                //TODO activar el flag errorflag
                  return ""; //aux.tr('enter_text');
                  break;
                default:
                  return 'This text is nor valid.';
              }
            },
          ),
        ),
        Container(
          //color: Colors.red,
          //width: 90,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              uds, //'umol/L',
              //TODO poner las unidades correctas según las preferencias, las unidades no se traducen
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            )),
      ],
    );
  }
}
