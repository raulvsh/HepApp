import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';

Color blueTreatmentColor = Color.fromARGB(255, 85, 163, 188);

class AlbertaHeader extends StatelessWidget {
  final height;
  final width;
  final color;
  final txt;
  final upperCase;
  final isSelected;

  const AlbertaHeader({
    Key key,
    this.height,
    this.width,
    this.color = Colors.white,
    this.txt = '',
    this.upperCase = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations aux = AppLocalizations.of(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        border: isSelected
            ? Border.all(
                color: blueTreatmentColor,
                width: 1,
              )
            : null,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Text(
            upperCase ? aux.tr(txt).toUpperCase() : aux.tr(txt),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
