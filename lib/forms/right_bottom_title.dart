import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:sized_context/sized_context.dart';

class RightBottomTitle extends StatelessWidget {
  final title;
  final padding;

  const RightBottomTitle({
    Key key,
    this.title,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTablet = context.diagonalInches >= 7;
    AppLocalizations aux = AppLocalizations.of(context);
    return Expanded(
      child: Container(
        //color: Colors.red,
        alignment: Alignment.bottomRight,

        //margin: EdgeInsets.only(top: 50),
        padding: padding, //EdgeInsets.fromLTRB(10, 0, 15, 50),
        //alignment: Alignment.bottomRight,
        child: Text(
          aux.tr(title),
          style: TextStyle(
            fontSize: isTablet ? 28 : 20,
            color: Theme.of(context)
                .primaryColor
                .withAlpha(150), //Color.fromARGB(255, 210, 242, 245),
          ),
        ),
      ),
    );
  }
}
