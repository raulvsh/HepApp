import 'package:flutter/material.dart';

class FullCalcSettings extends StatelessWidget {
  const FullCalcSettings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _radioValueLT = -1;

    var filaInternationalUnits = Row(
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
    var filaAgeCutoff = Row(
      children: <Widget>[
        Container(
          color: Colors.lightBlueAccent[100],
          width: 10.0,
          height: 20.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          "Age cutoff",
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        SizedBox(
          width: 10.0,
        ),
        //Futuro TextFormField
        Placeholder(
          fallbackWidth: 50.0,
          fallbackHeight: 20.0,
        ),
      ],
    );
    var filaLTCriteria = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Radio(
          materialTapTargetSize: MaterialTapTargetSize.values[1],
          value: 0,
          groupValue: _radioValueLT,
          onChanged: (int value) {},
        ),
        new Text(
          'Milan Criteria',
          style: new TextStyle(fontSize: 12, color: Colors.black),
        ),
        new Radio(
          materialTapTargetSize: MaterialTapTargetSize.values[1],
          value: 1,
          groupValue: _radioValueLT,
          onChanged: (int value) {},
        ),
        new Text(
          'TTV+AFP',
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        new Radio(
          materialTapTargetSize: MaterialTapTargetSize.values[1],
          value: 2,
          groupValue: _radioValueLT,
          onChanged: (int value) {},
        ),
        new Text(
          'UCFS',
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
        new Radio(
          materialTapTargetSize: MaterialTapTargetSize.values[1],
          value: 3,
          groupValue: _radioValueLT,
          onChanged: (int value) {},
        ),
        new Text(
          'Up to seven',
          style: TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
    );
    var filaMajorSurgery = Row(
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
      //title: Text("settings full"),
      content: Container(
        //color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
              height: 10.0,
            ),
            filaAgeCutoff,
            SizedBox(
              height: 10.0,
            ),
            Text(
              'LT Criteria',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            filaLTCriteria,
            Text(
              'Preclude major surgery',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            SizedBox(
              height: 5.0,
            ),
            filaMajorSurgery,
            Expanded(
                child: SizedBox(
              height: 10.0,
            )),
            botonSaveSettings,
          ],
        ),
      ),
    );
  }
}
