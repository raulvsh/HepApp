import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hepapp/forms/units.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

import 'ChildCalcForm_bloc.dart';

class PartialCalcSettings extends StatefulWidget {
  @override
  _PartialCalcSettingsState createState() => _PartialCalcSettingsState();
}

class _PartialCalcSettingsState extends State<PartialCalcSettings>
    with SingleTickerProviderStateMixin {
  String myTitle = "My Parent Title";
  final units = Units();


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

    //_international_units = prefs.internationalUnits;
  }

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    return BlocProvider<ChildCalcFormBloc>(
        builder: (context) => ChildCalcFormBloc(),
        child: Builder(builder: (context) {
          /*setState(() {

          });*/
          final formBloc = BlocProvider.of<ChildCalcFormBloc>(context);
          return AlertDialog(
            content: ConstrainedBox(
              constraints: BoxConstraints.tight(Size.fromHeight(150)),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _buildInitialBlueRectangle(),
                        _buildInitialText(),
                        SizedBox(
                          width: 20,
                        ),
                        _buildToggleButtons(context),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    //OnlySelectChip(['yes', 'no']),
                    Container(
                      width: 150,
                      padding: EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                            side: BorderSide(
                              color: Color.fromARGB(255, 45, 145, 155),
                              width: 1.5,
                            )),
                        color: Theme
                            .of(context)
                            .primaryColor,
                        splashColor: Color.fromARGB(255, 56, 183, 198),
                        elevation: 3,
                        child: Text(
                          aux.tr('save_settings'),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          print("iunits desde boton $iUnits");
                          prefs.internationalUnits = iUnits;

                          Navigator.pop(context);
                          //PRUEBO A CAMBIAR
                          //units.udsbili="pruebatoloca";


                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Container _buildInitialBlueRectangle() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      color: Color.fromARGB(255, 210, 242, 245),
      width: 10.0,
      height: 20.0,
    );
  }

  Container _buildInitialText() {
    var aux = AppLocalizations.of(context);
    return Container(
      //width: 90,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          aux.tr('international_units'),
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ));
  }

  _buildToggleButtons(BuildContext context) {
    var aux = AppLocalizations.of(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 200,
        maxHeight: 20,
      ),
      child: ToggleButtons(
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
              aux.tr('yes'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ), //color: Theme.of(context).primaryColor) ,
            ),
          ),
          Container(
            width: 60,
            child: Text(
              aux.tr('no'),
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
            iUnits = isSelected[0] == true;
            print("iunits $iUnits");
          });
        },
        isSelected: isSelected,
      ),
    );
  }
}
