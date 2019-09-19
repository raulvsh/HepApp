import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class CalculatorsPage extends StatefulWidget {
  @override
  _CalculatorsPageState createState() => _CalculatorsPageState();
}

class _CalculatorsPageState extends State<CalculatorsPage> {
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
      appBar: CustomAppBar(context, "Calculators"),
      //u.showAppBar(context, "Calculators"),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),

      /*OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? _buildVerticalLayout(orientation)
                : _buildHorizontalLayout(orientation);
          },
        )*/
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
            children: <CustomButton>[
              CustomButton(context, calculatorTypes["All"]),
              CustomButton(context, calculatorTypes["Child"]),
              CustomButton(context, calculatorTypes["MELD"]),
              CustomButton(context, calculatorTypes["Okuda"]),
              CustomButton(context, calculatorTypes["CLIP"]),
            ]),
      ),
    );
  }

/* _buildVerticalLayout(orientation) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // color: Colors.greenAccent,
      padding: EdgeInsets.fromLTRB(80, 80, 80, 80),
      child: Center(
        child: Table(children: <TableRow>[
          //Cuatro filas de dos elementos cada una
          TableRow(children: <Widget>[
            CustomButton(context, calculatorTypes["All"], orientation),
            CustomButton(context, calculatorTypes["Child"], orientation),

            //u.showCalcButton(context, "All", orientation),
            //u.showCalcButton(context, "Child", orientation),
          ]),
          TableRow(children: <Widget>[
            CustomButton(context, calculatorTypes["MELD"], orientation),
            CustomButton(context, calculatorTypes["Okuda"], orientation),
            /*u.showCalcButton(context, "MELD", orientation),
            u.showCalcButton(context, "Okuda", orientation),*/
          ]),
          TableRow(children: <Widget>[
            CustomButton(context, calculatorTypes["CLIP"], orientation),
//            u.showCalcButton(context, "CLIP", orientation),
            FittedBox(),
          ]),
        ]),
      ),
    );
  }*/

/*_buildHorizontalLayout(orientation) {
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
            CustomButton(context, calculatorTypes["All"], orientation),
            CustomButton(context, calculatorTypes["Child"], orientation),
            CustomButton(context, calculatorTypes["MELD"], orientation),
            CustomButton(context, calculatorTypes["Okuda"], orientation),
            /*u.showCalcButton(context, "All", orientation),
            u.showCalcButton(context, "Child", orientation),
            u.showCalcButton(context, "MELD", orientation),
            u.showCalcButton(context, "Okuda", orientation),*/
          ]),
          TableRow(children: <Widget>[
            //Segunda fila: Calculators, resources, pubmed, information
            CustomButton(context, calculatorTypes["CLIP"], orientation),
            //u.showCalcButton(context, "CLIP", orientation),
            FittedBox(),
            FittedBox(),
            FittedBox(),
          ]),
        ]),
      ),
    );
  }*/
}
