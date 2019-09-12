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
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(85, 80, 85, 60),
      child: Table(
        //border: _isBorderEnabled ? TableBorder.all() : TableBorder.all(),
        //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
          children: <TableRow>[
            //Cuatro filas de dos elementos cada una
            TableRow(children: <Widget>[
              u.showCalcButton(context, "All", orientation),
              u.showCalcButton(context, "Child", orientation),

              //_iconoAllAlgorithms(orientation),
              //_iconoChildPugh(orientation),
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
    );
  }

  _buildHorizontalLayout(orientation) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(200, 50, 200, 50),
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
    );
  }

/*_mostrarIcono(tipoCalculator, orientation) {
    return FittedBox(
      //All algorithms
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
          padding: EdgeInsets.all(5),
          child: Stack(
            children: <Widget>[
              Image.asset(
                //Podría ser fija al ser común, pero se deja por si se quiere poner un icono distinto a cada algoritmo
                'images/${tiposCalculators[tipoCalculator][1]}',
              ),
              Center(
                child: Align(
                  alignment: Alignment(0, 0.7),
                  child: Text(
                    tiposCalculators[tipoCalculator][0],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 93, 188, 210),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          onPressed: () =>
              Navigator.pushNamed(context, tiposCalculators[tipoCalculator][2]),
        ),
      ),
    );
  }*/
}
