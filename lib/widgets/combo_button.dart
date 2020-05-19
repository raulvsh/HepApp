import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/pages/detail_pages/pdf_detail_page.dart';
import 'package:sized_context/sized_context.dart';

class ComboButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;
  final int initialPage;

  ComboButton(this.context, this.type, [this.initialPage]);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: GestureDetector(
        child: buildStack(),
        onTap: onTap,
      ),
    );
  }

  Stack buildStack() {
    var aux = AppLocalizations.of(context);
    bool isLandscape = context.isLandscape;

    return Stack(
      children: <Widget>[
        Container(
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
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              aux.tr(type[0]),
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme
                    .of(context)
                    .primaryColor,
                fontSize: context.heightPct(isLandscape ? 0.03 : 0.02),
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
        Navigator.pushNamed(context, '/Video',
            arguments: [type[2], type[0].replaceFirst(RegExp('p'), 'v')]);
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
