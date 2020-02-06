import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/NavigationButton.dart';
import 'package:hepapp/widgets/PDFButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class ChaptersPage extends StatefulWidget {
  @override
  _ChaptersPageState createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {

  static var modules = [
    ['module_1', '9_modules.png', '/ModulePV'],
    ['module_2', '9_modules.png', '/ModulePV'],
    ['module_3', '9_modules.png', '/ModulePV'],
  ];

  var numModules = modules.length;

  /*var modulesIndex = [
    "Module1",
    "Module2",
    "Module3",

  ];

  var modulesInfo = {
    "Module1": ['module_1', '9_modules.png', '/ModulePV1'],
    "Module2": ['module_2', '9_modules.png', '/ModulePV2'],
    "Module3": ['module_3', '9_modules.png', '/ModulePV3'],
  };*/

  var references = ['references', '9_modules.png', 'HepAPP_References.pdf'];

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
    List<Widget> widgets = [];
    for (int i = 0; i < numModules; i++) {
      widgets.add(
          NavigationButton(context, modules[i], i));
    }
    widgets.add(PDFButton(context, references, 'references'));
    return widgets;
  }

}
