import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class FiguresPage extends StatefulWidget {
  @override
  _FiguresPageState createState() => _FiguresPageState();
}

class _FiguresPageState extends State<FiguresPage> {
  Utils u = new Utils();

  //bool _isBorderEnabled = false;

  var figureTypes = {
    "TableOfContents": ['Table of Contents', 'figures.png', '/TableFig'],
    "Schemes": ['Schemes', 'figures.png', '/SchemesFig'],
    "Interactive": ['Interactive Figures', 'figures.png', '/InteractiveFig'],
    "Chapter": ['Chapter Figures', 'figures.png', '/ChapterFig'],
    "Drawing": ['Drawing', 'figures.png', '/DrawingFig'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

        appBar: u.showAppBar(context, "Figures"),

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

              _mostrarIcono('TableOfContents', orientation),
              _mostrarIcono('Schemes', orientation),
            ]),
            TableRow(children: <Widget>[
              _mostrarIcono('Interactive', orientation),
              _mostrarIcono('Chapter', orientation),
            ]),
            TableRow(children: <Widget>[
              _mostrarIcono('Drawing', orientation),
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
          _mostrarIcono('TableOfContents', orientation),
          _mostrarIcono('Schemes', orientation),
          _mostrarIcono('Interactive', orientation),
          _mostrarIcono('Chapter', orientation),
        ]),
        TableRow(children: <Widget>[
          //Segunda fila: Calculators, resources, pubmed, information
          _mostrarIcono('Drawing', orientation),
          FittedBox(),
          FittedBox(),
          FittedBox(),
        ]),
      ]),
    );
  }

  _mostrarIcono(figureType, orientation) {
    return FittedBox(
      //Child Pugh Score
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
          padding: EdgeInsets.all(5),
          child: Stack(
            children: <Widget>[
              Image.asset(
                //Podría ser fija al ser común, pero se deja por si se quiere poner un icono distinto a cada elemento
                'images/${figureTypes[figureType][1]}',
              ),
              Center(
                child: Align(
                  alignment: Alignment(0, 0.7),
                  child: Text(
                    figureTypes[figureType][0],
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
              Navigator.pushNamed(context, figureTypes[figureType][2]),
        ),
      ),
    );
  }
}
