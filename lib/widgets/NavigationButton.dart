/*
import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';

class NavigationButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;
  final int page;

  NavigationButton(this.context, this.type, [this.page]);

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(4),
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/items/${type[1]}',
            ),
            Container(
              alignment: Alignment(0, 0.7),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: FittedBox(
                child: Text(
                  aux.tr(type[0]),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black, //Color.fromARGB(255, 93, 188, 210),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: () => Navigator.pushNamed(context, type[2], arguments: page),
      ),
    );
  }
}
*/
