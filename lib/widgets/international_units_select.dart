/*

import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

class InternationalUnitsSelect extends StatefulWidget {
  const InternationalUnitsSelect({
    Key key,
  }) : super(key: key);

  @override
  _InternationalUnitsSelectState createState() => _InternationalUnitsSelectState();
}

class _InternationalUnitsSelectState extends State<InternationalUnitsSelect> {
  final prefs = new PreferenciasUsuario();
  List<bool> isSelected;

  var iUnits;

  @override
  void initState() {
    isSelected = [true, false];
    //prefs.internationalUnits = true;
    print(
        "iunits desde prefs initstate " + prefs.internationalUnits.toString());
    iUnits = prefs.internationalUnits;
    isSelected[0] = prefs.internationalUnits;
    isSelected[1] = !prefs.internationalUnits;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    return  ToggleButtons(
        borderColor: Color.fromARGB(255, 45, 145, 155),
        fillColor: Theme
            .of(context)
            .primaryColor,
        borderWidth: 1.3,
        selectedBorderColor: Color.fromARGB(255, 45, 145, 155),
        selectedColor: Colors.white,
        color: Theme
            .of(context)
            .primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        children: <Widget>[
          Container(
            width: 60,
            child: Text(
              aux.tr('on'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ), //color: Theme.of(context).primaryColor) ,
            ),
          ),
          Container(
            width: 60,
            child: Text(
              aux.tr('off'),
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

            prefs.internationalUnits = isSelected[0];

            setState(() {

            });

            iUnits = isSelected[0];
            print("iunits $iUnits");
          });
        },
        isSelected: isSelected,

    );
  }  }
*/
