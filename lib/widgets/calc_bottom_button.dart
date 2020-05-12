import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:sized_context/sized_context.dart';

class CalcBottomButton extends StatelessWidget {
  final onPressed;
  final title;

  const CalcBottomButton({
    Key key,
    @required this.onPressed,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: FlatButton(
        child: Text(
          aux.tr(title),
          style: TextStyle(
            fontSize: isTablet ? 14 : 12,
          ),
        ),
        color: Color.fromARGB(255, 210, 242, 245),
        onPressed: onPressed, //() {
      ),
    );
  }
}
