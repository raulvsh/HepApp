import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:sized_context/sized_context.dart';

class BooleanSelect extends StatefulWidget {
  const BooleanSelect({
    Key key,
    this.title,
    this.formBloc,
  }) : super(key: key);
  final formBloc;
  final title;

  @override
  _BooleanSelectState createState() =>
      _BooleanSelectState();
}

class _BooleanSelectState extends State<BooleanSelect> {
  final prefs = new UserSettings();

  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {

    var aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    if (widget.title == 'international_units') {
      isSelected[0] = prefs.getInternationalUnits();
    }
    else if (widget.title == 'preclude_major_surgery') {
      isSelected[0] = prefs.getPrecludeSurgery();
    }
    isSelected[1] = !isSelected[0];

    return Container(
        height: 30,
        child: Row(
          children: <Widget>[
            Text(
              aux.tr(widget.title),
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
      onPressed: (index) {
        if (widget.title == 'international_units') {
          _switchInternationalUnits(index);
        } else if (widget.title == 'preclude_major_surgery') {
          _switchPrecludeSurgery(index);
        }
        setState(() {});
      },
      isSelected: isSelected,
    );
  }

  void _switchInternationalUnits(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
    }
    isSelected[0] ? widget.formBloc.showIU() : widget.formBloc.showNotIU();

    prefs.setInternationalUnits(isSelected[0]);
    print("unidades int: " + prefs.getInternationalUnits().toString());
    setState(() {});
  }

  void _switchPrecludeSurgery(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
    }

    prefs.setPrecludeSurgery(isSelected[0]);
    print("preclude surgery: " + prefs.getPrecludeSurgery().toString());
    setState(() {});
  }
}
