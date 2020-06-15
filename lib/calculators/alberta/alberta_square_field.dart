import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';

Color blueTreatmentColor = Color.fromARGB(255, 85, 163, 188);

class AlbertaRectangleField extends StatelessWidget {
  final height;
  final width;
  final color;
  final txt;
  final isSelected;

  final padding;

  const AlbertaRectangleField({
    Key key,
    this.height,
    this.width,
    this.color,
    this.txt = '',
    this.padding = const EdgeInsets.all(8),
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations aux = AppLocalizations.of(context);
    return Container(
      height: height,
      width: width,
      color: Colors.white,
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: isSelected ? color : Colors.white,
          border: Border.all(
            color: blueTreatmentColor,
            width: 1.3,
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              aux.tr(txt),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 8,
                  color: isSelected ? Colors.white : blueTreatmentColor),
            ),
          ),
        ),
      ),
    );
  }
}
