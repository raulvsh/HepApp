import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:sized_context/sized_context.dart';

class CalcTextField extends StatefulWidget {
  const CalcTextField({
    Key key,
    @required this.textFieldBloc,
    @required this.title,
    this.uds = '',
    this.errorControl = false,
  }) : super(key: key);

  final TextFieldBloc textFieldBloc;
  final title;
  final uds;
  final errorControl;

  @override
  _CalcTextFieldState createState() => _CalcTextFieldState();
}

class _CalcTextFieldState extends State<CalcTextField> {
  final prefs = UserSettings();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(width: 8),
        _buildInitialBlueRectangle(),
        _buildInitialText(),
        _buildTextField(),
        _buildUds(),
        /*Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              widget.uds,
              style: TextStyle(
                color: Colors.black,
                fontSize: isTablet ? 15 : 12,
              ),
            ),),*/
      ],
    );
  }

  Container _buildInitialBlueRectangle() {
    return Container(
      color: Color.fromARGB(255, 210, 242, 245),
      width: 10.0,
      height: 20.0,
    );
  }

  Container _buildInitialText() {
    bool isTablet = context.diagonalInches >= 7;

    AppLocalizations aux = AppLocalizations.of(context);
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          aux.tr(widget.title),
          style: TextStyle(
            color: Colors.black,
            fontSize: isTablet ? 15 : 12,
          ),
        ));
  }

  Container _buildTextField() {
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      width: isTablet ? 90 : 60,
      height: 40,
      child: TextFieldBlocBuilder(
        padding:
        EdgeInsets.symmetric(vertical: 10, horizontal: isTablet ? 10 : 5),
        cursorColor: Theme
            .of(context)
            .primaryColor,
        keyboardType: TextInputType.numberWithOptions(),
        isEnabled: true,
        textFieldBloc: widget.textFieldBloc,
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
        ),
        onChanged: (text) => _markErrorFalse(),
        errorBuilder: widget.errorControl
            ? (context, error) {
          _markErrorTrue();
          switch (error) {
            case ValidatorsError.requiredTextFieldBloc:
              return "";
            default:
              return 'This text is nor valid.';
          }
        }
            : (context, error) => null,
      ),
    );
  }

  Container _buildUds() {
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        widget.uds,
        style: TextStyle(
          color: Colors.black,
          fontSize: isTablet ? 15 : 12,
        ),
      ),
    );
  }

  void _markErrorTrue() {
    prefs.getErrorMap().forEach((key, value) {
      if (widget.title == key) {
        prefs.getErrorMap().update(key, (v) => true);
      }
    });
  }

  void _markErrorFalse() {
    prefs.getErrorMap().forEach((key, value) {
      if (widget.title == key) {
        prefs.getErrorMap().update(key, (v) => false);
      }
    });
  }
}
