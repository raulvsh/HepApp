import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/HomeButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';


class CalculatorsPage extends StatefulWidget {
  @override
  _CalculatorsPageState createState() => _CalculatorsPageState();
}

class _CalculatorsPageState extends State<CalculatorsPage> {
  final numCalcCategories = 5;
  var calcTypesNames = [
    "All",
    "Child",
    "MELD",
    "Okuda",
    "CLIP",
  ];
  var calcTypes = {
    "All": ['All Algorithms', '5_calculators.png', '/AllCalc'],
    "Child": ['Child Pugh Score', '5_calculators.png', '/ChildCalc'],
    "MELD": ['MELD', '5_calculators.png', '/MELDCalc'],
    "Okuda": ['Okuda Staging System', '5_calculators.png', '/OkudaCalc'],
    "CLIP": ['CLIP Staging System', '5_calculators.png', '/CLIPCalc'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca
      appBar: CustomAppBar(context, "Calculators"),
      drawer: MenuWidget(),
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
    List<HomeButton> widgets = [];

    for (int i = 0; i < numCalcCategories; i++) {
      widgets
          .add(HomeButton(context, calcTypes[calcTypesNames[i]]));
    }

    return widgets;
  }
}
