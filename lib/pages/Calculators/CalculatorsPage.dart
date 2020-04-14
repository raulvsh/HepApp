/*
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "calculators"),
      drawer: MenuWidget(),
      body: CommonGridPage(
        data: calculators,
      ), //type: 'figure'),
    );
  }
}
*/
