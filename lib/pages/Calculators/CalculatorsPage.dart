import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../CommonGridPage.dart';

class CalculatorsPage extends StatefulWidget {
  @override
  _CalculatorsPageState createState() => _CalculatorsPageState();
}

class _CalculatorsPageState extends State<CalculatorsPage> {
  static var calculators = [
    ['all_algorithms', 'items/5_calculators.png', '/AllCalc', 'Nav'],
    ['child_pugh_score', 'items/5_calculators.png', '/ChildCalc', 'Nav'],
    ['meld', 'items/5_calculators.png', '/MELDCalc', 'Nav'],
    ['okuda_staging_system', 'items/5_calculators.png', '/OkudaCalc', 'Nav'],
    ['clip_staging_system', 'items/5_calculators.png', '/CLIPCalc', 'Nav'],
  ];

  var numCalcCategories = calculators.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca
      appBar: CustomAppBar(context, "calculators"),
      drawer: MenuWidget(),
      body: CommonGridPage(data: calculators,), //type: 'figure'),

      /*OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),*/
    );
  }

/*_buildLayout(orientation) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    var padding = width / 100;

    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.greenAccent,
      child: FractionallySizedBox(
        widthFactor: orientation == Orientation.portrait ? 0.7 : 0.7,
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.symmetric(vertical: 20 * padding)
              : EdgeInsets.symmetric(vertical: 4 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildCalcGridView(),
        ),
      ),
    );
  }

  _buildCalcGridView() {
    List<Widget> widgets = [];

    for (int i = 0; i < numCalcCategories; i++) {
      widgets.add(ComboButton(context, calculators[i]));

      //widgets.add(NavigationButton(context, calculators[i]));
    }

    return widgets;
  }*/
}
