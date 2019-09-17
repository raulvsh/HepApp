import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class CalculatorsPage extends StatefulWidget {
  @override
  _CalculatorsPageState createState() => _CalculatorsPageState();
}

class _CalculatorsPageState extends State<CalculatorsPage> {
  Utils u = Utils();

  //bool _isBorderEnabled = false;

  var tiposCalculators = {
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
        appBar: u.showAppBar(context, "Calculators"),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? _buildVerticalLayout(orientation)
                : _buildHorizontalLayout(orientation);
          },
        ));
  }

  _buildVerticalLayout(orientation) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // color: Colors.greenAccent,
      padding: EdgeInsets.fromLTRB(80, 80, 80, 80),
      child: Center(
        child: Table(children: <TableRow>[
          //Cuatro filas de dos elementos cada una
          TableRow(children: <Widget>[
            u.showCalcButton(context, "All", orientation),
            u.showCalcButton(context, "Child", orientation),
          ]),
          TableRow(children: <Widget>[
            u.showCalcButton(context, "MELD", orientation),
            u.showCalcButton(context, "Okuda", orientation),
          ]),
          TableRow(children: <Widget>[
            u.showCalcButton(context, "CLIP", orientation),
            FittedBox(),
          ]),
        ]),
      ),
    );
  }

  _buildHorizontalLayout(orientation) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // color: Colors.purple,
      padding: EdgeInsets.fromLTRB(100, 25, 100, 25),
      child: Center(
        child: Table(children: <TableRow>[
          //Dos filas de cuatro elementos cada una
          TableRow(children: <Widget>[
            //Primera fila: Chapters, podcasts, cards, figures
            u.showCalcButton(context, "All", orientation),
            u.showCalcButton(context, "Child", orientation),
            u.showCalcButton(context, "MELD", orientation),
            u.showCalcButton(context, "Okuda", orientation),
          ]),
          TableRow(children: <Widget>[
            //Segunda fila: Calculators, resources, pubmed, information
            u.showCalcButton(context, "CLIP", orientation),
            FittedBox(),
            FittedBox(),
            FittedBox(),
          ]),
        ]),
      ),
    );
  }
}
