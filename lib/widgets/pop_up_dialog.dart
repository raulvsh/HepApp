import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';

class PopUpDialog extends StatelessWidget {
  final String title;
  final String content;
  final double height;
  final double width;

  const PopUpDialog({
    Key key,
    this.title = '',
    this.content = '',
    this.height,
    this.width = 500.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations aux = AppLocalizations.of(context);

    return AlertDialog(
      title: Text(
        aux.tr(title),
        textAlign: TextAlign.justify,
        style:
        TextStyle(color: Theme
            .of(context)
            .primaryColor),
      ),
      content: Container(
        height: height,
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
                width: width,
                //padding: EdgeInsets.only(right: 20),
                child: Text(
                  aux.tr(content),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
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
