import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

class FullCalcSettings extends StatefulWidget {
  @override
  _FullCalcSettingsState createState() => _FullCalcSettingsState();
}

class _FullCalcSettingsState extends State<FullCalcSettings> {
  final prefs = new UserSettings();
  List<bool> isSelected = [true, false];

  initState() {
    //print("iu" + prefs.internationalUnits.toString());
    super.initState();

    isSelected[0] = prefs.getInternationalUnits();
    isSelected[1] = !prefs.getInternationalUnits();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: FittedBox(
        child: Column(
          children: <Widget>[
            Container(
              height: 20,
              //width: 40,
              child: ToggleButtons(
                borderColor: Color.fromARGB(255, 45, 145, 155),
                fillColor: Theme.of(context).primaryColor,
                borderWidth: 1.3,
                selectedBorderColor: Color.fromARGB(255, 45, 145, 155),
                selectedColor: Colors.white,
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
                children: <Widget>[
                  Container(
                    width: 60,
                    child: Text(
                      "ON",
                      //aux.tr('on'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ), //color: Theme.of(context).primaryColor) ,
                    ),
                  ),
                  Container(
                    width: 60,
                    child: Text(
                      'OFF',
                      //aux.tr('off'),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                    print("isselected 0 " + isSelected[0].toString());
                    print("isselected 1 " + isSelected[1].toString());

                    //prefs.internationalUnits = isSelected[0];
                    //prefs.iUnitsTrue();
                    //prefs.switchInternationalUnits();
                    //prefs.

                    print("International Units: " +
                        prefs.getInternationalUnits().toString());

                    //setState(() {});
                  });
                },
                isSelected: isSelected,
              ),
            ),
            FlatButton(
                child: Text("Guardar"),
                onPressed: () {
                  prefs.setInternationalUnits(isSelected[0]);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
