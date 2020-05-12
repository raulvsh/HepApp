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
        alignment: Alignment.bottomRight,
        padding: padding,
        child: Text(
          aux.tr(title),
          style: TextStyle(
            fontSize: isTablet ? 28 : 20,
            color: Theme.of(context)
                .primaryColor
                .withAlpha(150),
          ),
        ),
      ),
    );
  }
}
