import 'package:flutter/material.dart';
import 'package:hepapp/vista/CustomWidgets.dart';

class CalculatorsPage extends StatefulWidget {
  @override
  _CalculatorsPageState createState() => _CalculatorsPageState();
}

class _CalculatorsPageState extends State<CalculatorsPage> {
  var calculatorTypesNames = [
    "All",
    "Child",
    "MELD",
    "Okuda",
    "CLIP",
  ];
  var calculatorTypes = {
    "All": ['All Algorithms', 'calculators.png', '/AllCalc'],
    "Child": ['Child Pugh Score', 'calculators.png', '/ChildCalc'],
    "MELD": ['MELD', 'calculators.png', '/MELDCalc'],
    "Okuda": ['Okuda Staging System', 'calculators.png', '/OkudaCalc'],
    "CLIP": ['CLIP Staging System', 'calculators.png', '/CLIPCalc'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca
      appBar: CustomAppBar(context, "Calculators", true),
      //u.showAppBar(context, "Calculators"),
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
        widthFactor: orientation == Orientation.portrait ? 0.6 : 0.65,
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.only(top: 25 * padding)
              : EdgeInsets.only(top: 4 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildCalcGridView(),

          /*<CustomButton>[
              CustomButton(context, calculatorTypes["All"]),
              CustomButton(context, calculatorTypes["Child"]),
              CustomButton(context, calculatorTypes["MELD"]),
              CustomButton(context, calculatorTypes["Okuda"]),
              CustomButton(context, calculatorTypes["CLIP"]),
            ]*/
        ),
      ),
    );
  }

  _buildCalcGridView() {
    List<CustomButton> widgets = [];

    for (int i = 0; i < 5; i++) {
      widgets
          .add(CustomButton(context, calculatorTypes[calculatorTypesNames[i]]));
    }

    return widgets;
  }
}
