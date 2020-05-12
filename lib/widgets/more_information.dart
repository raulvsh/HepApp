import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:sized_context/sized_context.dart';

class MoreInformation extends StatelessWidget {
  const MoreInformation({
    Key key,
    this.title,
    this.pathList,
  }) : super(key: key);

  final String title;
  final List<String> pathList;

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return AlertDialog(
      title: Center(
          child: Text(
            aux.tr(title),
            style: TextStyle(
              fontSize: isTablet ? 24 : 12,
            ),
          )),
      content: buildImageList(pathList), //Image.asset(path),
      actions: <Widget>[
        FlatButton(
          child: Text(
            aux.tr("close"),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: isTablet ? 16 : 12,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  buildImageList(pathList) {
    List<Widget> imageList = [];
    for (int i = 0; i < pathList.length; i++) {
      imageList.add(Image.asset(pathList[i]));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: imageList,
    );
  }
}
