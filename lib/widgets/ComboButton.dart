import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/pages/DetailPageWidgets/PDFDetailPage.dart';

class ComboButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;
  final int initialPage;

  ComboButton(this.context, this.type, [this.initialPage]);

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    return Card(
      elevation: 0,
      //margin: EdgeInsets.all(4),
      child: GestureDetector(
        child: buildStack(),

        onTap: onTap,
      ),
    );
  }

  Stack buildStack() {
    var aux = AppLocalizations.of(context);
    return Stack(
      children: <Widget>[
        Container(
          //color: Colors.red,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/${type[1]}',
                //fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment(0, 0.7),
          padding: EdgeInsets.symmetric(horizontal: 10),
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
    );
  }

  onTap() {
    switch (type[3]) {
      case 'Nav':
        Navigator.pushNamed(context, type[2], arguments: initialPage);
        break;
      case 'Web':
        Navigator.pushNamed(context, '/Web', arguments: [type[2], type[0]]);
        break;
      case 'PDF':
        showPDF(type);
        break;
      case 'Video':
        Navigator.pushNamed(context, '/Video', arguments: [type[2], type[0]]);
        break;
    }
  }

  showPDF(List<String> type) async {
    var assetPDFPath;
    await getFileFromAsset("assets/pdf/${type[2]}").then((f) {
      assetPDFPath = f.path;
    });
    if (assetPDFPath != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PdfDetailPage(
                    path: assetPDFPath,
                    title: type[0],
                  )));
    }
  }
}
