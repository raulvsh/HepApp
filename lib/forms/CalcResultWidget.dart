import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:sized_context/sized_context.dart';

class CalcResultWidget extends StatefulWidget {
  final title;
  final resultado;

  CalcResultWidget(
    this.title,
    this.resultado,
  );

  @override
  _CalcResultWidgetState createState() => _CalcResultWidgetState();
}

class _CalcResultWidgetState extends State<CalcResultWidget> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      width: isTablet ? 400 : 200,
      height: isTablet ? 170 : 120,
      //color: Colors.yellow,
      margin: EdgeInsets.fromLTRB(0, 30, 50, 0),
      //margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 210, 242, 245),
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            //"${aux.tr('child_pugh_score')}: ",
            '${aux.tr(widget.title)}: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.resultado,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
      //),
    );
  }
}
