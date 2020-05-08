import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:sized_context/sized_context.dart';

class CalculatorButton extends StatelessWidget {
  final onPressed;
  final title;

  const CalculatorButton(
      {Key key, @required this.context, this.title, this.onPressed})
      : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    AppLocalizations aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    return Container(
      width: 250,
      //padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(right: context.widthPct(0.25), left: 25),
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
        /*onPressed: () async {
          await Future.delayed(Duration(milliseconds: 400));
          calculateClip(formBloc);
        },*/
        child: Center(
          child: Text(
            aux.tr(title),
            //aux.tr('calculate_clip'),
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
