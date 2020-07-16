import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';

Color blueTreatmentColor = Color.fromARGB(255, 85, 163, 188);

class AlbertaCircleField extends StatelessWidget {
  final height;
  final width;
  final color;
  final txt;
  final isSelected;
  final padding;

  const AlbertaCircleField({
    Key key,
    this.height,
    this.width,
    this.color,
    this.txt = '',
    this.padding = EdgeInsets.zero,
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
          shape: BoxShape.circle,
          color: isSelected ? color : Colors.white,
          border: Border.all(
            color: blueTreatmentColor,
            width: 1.3,
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: EdgeInsets.zero,
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
