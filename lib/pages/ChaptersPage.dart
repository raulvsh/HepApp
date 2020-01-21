import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/HomeButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class ChaptersPage extends StatefulWidget {
  @override
  _ChaptersPageState createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  /*var _currencies = ['Rupees', 'Dollars', 'Pounds', 'Others'];
  var _currentItemSelected = '';
  String nameCity = "";

  final prefs = PreferenciasUsuario();*/

  final numChapterModules = 3;

  var chapterTypesNames = [
    "Module1",
    "Module2",
    "Module3",
  ];

  var chapterTypes = {
    "Module1": ['module_1', '9_modules.png', '/Module1Chap'],
    "Module2": ['module_2', '9_modules.png', '/Module2Chap'],
    "Module3": ['module_3', '9_modules.png', '/Module3Chap'],

  };


  @override
  void initState() {
    super.initState();
    //_currentItemSelected = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'chapters'),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
    );
  }

  _buildLayout(orientation) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    var padding = width / 100;

    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.lightBlueAccent,
      child: FractionallySizedBox(
        widthFactor: orientation == Orientation.portrait ? 0.7 : 0.7,
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.symmetric(vertical: 20 * padding)
              : EdgeInsets.symmetric(vertical: 4 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildModulesGridView(),
        ),
      ),
    );
  }

  _buildModulesGridView() {
    List<HomeButton> widgets = [];
    for (int i = 0; i < numChapterModules; i++) {
      widgets.add(HomeButton(context, chapterTypes[chapterTypesNames[i]]));
    }
    return widgets;
  }


/*_buildChaptersBody2() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              DropdownButton<String>(
                items: _currencies.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newValueSelected) {
                  // Your code to execute, when a menu item is selected from drop down
                  _onDropDownItemSelected(newValueSelected);
                },
                value: _currentItemSelected,
              ),
              Text('Color secundario: ${prefs.colorSecundario}'),
              Divider(),
              Text('Género: ${prefs.genero}'),
              Divider(),
              Text('Nombre usuario: ${prefs.nombreUsuario}'),
              Divider(),
              Text('Bilirrubina: ${prefs.bilirubin}'),

            ],
          ),
          RaisedButton(
            child: Text('Preferencias'),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          ),
        ],
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }*/

}
