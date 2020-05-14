import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';

Color blueTreatmentColor = Color.fromARGB(255, 85, 163, 188);


class AlbertaField extends StatelessWidget {
  final height;
  final width;
  final color;
  final txt;
  final shape;
  final isSelected;

  final padding;

  const AlbertaField({
    Key key,
    this.height,
    this.width,
    this.color,
    this.txt = '',
    this.shape = BoxShape.rectangle,
    this.padding = const EdgeInsets.all(4),
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
      //shape ==BoxShape.rectangle?EdgeInsets.symmetric(horizontal: 8, vertical: 8):padding,
      child: Container(
        decoration: BoxDecoration(
          shape: shape,
          color: isSelected ? color : Colors.white,
          border: Border.all(
            color: blueTreatmentColor,
            width: 1.3,
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: shape == BoxShape.rectangle ? EdgeInsets.symmetric(
                horizontal: 4, vertical: 2) : EdgeInsets.symmetric(
                horizontal: 2, vertical: 0),
            child: Text(
              aux.tr(txt),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 8, color: blueTreatmentColor),
            ),
          ),
        ),
      ),
    );
  }
}
