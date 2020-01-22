import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/pages/WebViewPage.dart';

class WebViewButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;

  WebViewButton(this.context, this.type);

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    var assetPDFPath;
    return Container(
      margin: EdgeInsets.all(4),
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/items/${type[1]}',
            ),
            Container(
              alignment: Alignment(0, 0.7),
              padding: EdgeInsets.only(bottom: 0),
              //alignment: Alignment(0, 0.7),
              child: Text(
                aux.tr(type[0]),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 93, 188, 210),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        onTap: //() => Navigator.pushNamed(context, type[2]),
            () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebViewPage(
                        url: type[2],
                        title: type[0],
                      )));
        },
      ),
    );
  }
}
