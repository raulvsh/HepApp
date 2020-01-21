import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/pages/Chapters/Module1Page.dart';
import 'package:hepapp/pages/Chapters/PDFViewPage.dart';

class PDFButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;

  final String title;

  PDFButton(this.context, this.type, this.title);

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
                aux.tr('${type[0]}'),
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
            () async {
          //Este es el que se lee, hay que pasárselo por referencia
          await getFileFromAsset("assets/${type[2]}").then((f) {
            //setState(() {
            assetPDFPath = f.path;
            print("Asset pdf path " + assetPDFPath);
            //});
          });
          if (assetPDFPath != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PdfViewPage(
                          path: assetPDFPath,
                          title: title,
                        )));
          }
        },
      ),
    );
  }
}
