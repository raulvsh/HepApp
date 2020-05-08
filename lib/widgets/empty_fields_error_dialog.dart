import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:sized_context/sized_context.dart';

class EmptyFieldsErrorDialog extends StatelessWidget {
  const EmptyFieldsErrorDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations aux = AppLocalizations.of(context);

    return AlertDialog(
      title: Text(
        aux.tr('error'),
        style: TextStyle(color: Colors.black),
      ),
      content: Container(
        height: context.heightPct(0.20),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  aux.tr('fill_empty_fields'),
                  style: TextStyle(color: Colors.black),
                )),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  child: Text(
                    aux.tr('accept'),
                    style: TextStyle(color: Theme.of(context).primaryColor),
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
