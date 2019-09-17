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
      color: Colors.greenAccent,
      //padding: EdgeInsets.fromLTRB(85, 80, 85, 60),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          //border: _isBorderEnabled ? TableBorder.all() : TableBorder.all(),
          //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,

          children: <Row>[
            //Cuatro filas de dos elementos cada una
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              u.showCalcButton(context, "All", orientation),
              u.showCalcButton(context, "Child", orientation),

              //_iconoAllAlgorithms(orientation),
              //_iconoChildPugh(orientation),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              u.showCalcButton(context, "MELD", orientation),
              u.showCalcButton(context, "Okuda", orientation),
            ]),
            Row(children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 95.5),
                  child: u.showCalcButton(context, "CLIP", orientation)),
              //FittedBox(),
            ]),
          ]),
    );
  }

  _buildHorizontalLayout(orientation) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.purple,
      //padding: EdgeInsets.fromLTRB(200, 50, 200, 50),
      child:
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Row>[
        //Dos filas de cuatro elementos cada una
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          //Primera fila: Chapters, podcasts, cards, figures
          u.showCalcButton(context, "All", orientation),
          u.showCalcButton(context, "Child", orientation),
          u.showCalcButton(context, "MELD", orientation),
          u.showCalcButton(context, "Okuda", orientation),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          //Segunda fila: Calculators, resources, pubmed, information
          Padding(
              padding: EdgeInsets.only(left: 167.5),
              child: u.showCalcButton(context, "CLIP", orientation)),
          /*FittedBox(),
          FittedBox(),
          FittedBox(),*/
        ]),
      ]),
    );
  }
}
