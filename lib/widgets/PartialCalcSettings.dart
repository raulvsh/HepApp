import 'package:flutter/material.dart';

class PartialCalcSettings extends StatelessWidget {
  const PartialCalcSettings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filaInternationalUnits = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Placeholder(
          fallbackWidth: 20.0,
          fallbackHeight: 20.0,
        ),
        Placeholder(
          fallbackWidth: 20.0,
          fallbackHeight: 20.0,
        ),
      ],
    );
    var botonSaveSettings = Center(
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Text('Save Settings'),
        onPressed: () {},
        color: Color.fromARGB(255, 93, 188, 210),
        padding: EdgeInsets.all(7),
      ),
    );

    return AlertDialog(
      content: ConstrainedBox(
        constraints: BoxConstraints.tight(Size.fromHeight(95)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "International Units",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            SizedBox(
              height: 5.0,
            ),
            filaInternationalUnits,
            SizedBox(
              height: 5.0,
            ),
            botonSaveSettings,
          ],
        ),
      ),
    );
  }
}
