import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';

class MoreInformation extends StatelessWidget {
  const MoreInformation({
    Key key,
    this.title,
    this.path,
  }) : super(key: key);

  final String title;
  final String path;

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    return AlertDialog(
      title: Center(child: Text(aux.tr(title))),
      content: Image.asset(path),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new FlatButton(
          child: Text(
            aux.tr("close"),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
