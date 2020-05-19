import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:sized_context/sized_context.dart';

class CalculatorButton extends StatelessWidget {
  final onPressed;
  final title;
  final width;
  final height;
  const CalculatorButton(
      {Key key,
      this.title,
      this.onPressed,
      this.width = 250.0,
      this.height = 50.0})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: BorderSide(
              color: Color.fromARGB(255, 45, 145, 155),
              width: 1.5,
            )),
        color: Theme.of(context).primaryColor,
        splashColor: Color.fromARGB(255, 56, 183, 198),
        elevation: 3,
        onPressed: onPressed,
        child: Center(
          child: Text(
            aux.tr(title),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: isTablet ? 15 : 12,
            ),
          ),
        ),
      ),
    );
  }
}
