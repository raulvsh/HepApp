import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';

class PopUpDialog extends StatelessWidget {
  final String title;
  final String content;
  final double height;

  const PopUpDialog({
    Key key,
    this.title = '',
    this.content = '',
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations aux = AppLocalizations.of(context);

    return AlertDialog(
      title: Text(
        aux.tr(title),
        style:
        TextStyle(color: Theme
            .of(context)
            .primaryColor),
      ),
      content: Container(
        height: height, //context.heightPct(0.20),
        width: 500,
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  aux.tr(content),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                )),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  child: Text(
                    aux.tr('close'),
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
