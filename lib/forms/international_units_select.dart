import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:sized_context/sized_context.dart';

class InternationalUnitsSelect extends StatefulWidget {
  const InternationalUnitsSelect({
    Key key,
    this.formBloc,
  }) : super(key: key);
  final formBloc;

  @override
  _InternationalUnitsSelectState createState() =>
      _InternationalUnitsSelectState();
}

class _InternationalUnitsSelectState extends State<InternationalUnitsSelect> {
  final prefs = new UserSettings();

  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    isSelected[0] = prefs.getInternationalUnits();
    isSelected[1] = !isSelected[0];
    var aux = AppLocalizations.of(context);

    bool isTablet = context.diagonalInches >= 7;
    return Container(
        height: 60,
        padding: EdgeInsets.only(top: 30),
        child: Row(
          children: <Widget>[
            Text(
              aux.tr("international_units"),
              style: TextStyle(
                fontSize: isTablet ? 15 : 12,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: isTablet ? 20 : 10,
            ),
            _buildToggleButtons(context, aux),
          ],
        ));
  }

  ToggleButtons _buildToggleButtons(
      BuildContext context, AppLocalizations aux) {
    bool isTablet = context.diagonalInches >= 7;

    return ToggleButtons(
      borderColor: Color.fromARGB(255, 45, 145, 155),
      fillColor: Theme.of(context).primaryColor,
      borderWidth: 1.3,
      selectedBorderColor: Color.fromARGB(255, 45, 145, 155),
      selectedColor: Colors.white,
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
      children: <Widget>[
        Container(
          width: isTablet ? 60 : 50,
          child: Text(
            aux.tr('on'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Container(
          width: isTablet ? 60 : 50,
          child: Text(
            aux.tr('off'),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
      onPressed: _switchInternationalUnits,
      isSelected: isSelected,
    );
  }

  void _switchInternationalUnits(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
    }
    isSelected[0] ? widget.formBloc.showIU() : widget.formBloc.showNotIU();

    prefs.setInternationalUnits(isSelected[0]);
    print("unidades internacionales: " +
        prefs.getInternationalUnits().toString());
//    setState(() {});
  }
}
