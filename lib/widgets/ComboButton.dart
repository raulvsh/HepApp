import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/pages/DetailPages/PDFDetailPage.dart';
import 'package:sized_context/sized_context.dart';

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
    bool isTablet = context.diagonalInches >= 7;

    return Stack(
      children: <Widget>[
        Container(
          //color: Colors.red,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/${type[1]}',
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment(0, 0.65),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            aux.tr(type[0]),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme
                  .of(context)
                  .primaryColor,
              //Colors.black, //Color.fromARGB(255, 93, 188, 210),
              fontSize: isTablet ? 18 : 16,
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
          builder: (context) =>
              PdfDetailPage(
                path: assetPDFPath,
                title: type[0],
              ),
        ),
      );
    }
  }
}
