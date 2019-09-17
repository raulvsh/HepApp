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
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightBlueAccent,
      child:
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Row>[
        //Cuatro filas de dos elementos cada una
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          u.showFigureButton(context, 'TableOfContents', orientation),
          u.showFigureButton(context, 'Schemes', orientation),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          u.showFigureButton(context, 'Interactive', orientation),
          u.showFigureButton(context, 'Chapter', orientation),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 95.5),
            child: u.showFigureButton(context, 'Drawing', orientation),
          ),
        ]),
      ]),
    );
  }

  _buildHorizontalLayout(orientation) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellowAccent,
      //padding: EdgeInsets.fromLTRB(200, 50, 200, 50),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          //border: _isBorderEnabled ? TableBorder.all() : TableBorder.all(),
          //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,

          children: <Row>[
            //Dos filas de cuatro elementos cada una
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              //Primera fila: Chapters, podcasts, cards, figures
              u.showFigureButton(context, 'TableOfContents', orientation),
              u.showFigureButton(context, 'Schemes', orientation),
              u.showFigureButton(context, 'Interactive', orientation),
              u.showFigureButton(context, 'Chapter', orientation),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              //Segunda fila: Calculators, resources, pubmed, information

              Padding(
                padding: EdgeInsets.only(left: 167.5),
                child: u.showFigureButton(context, 'Drawing', orientation),
              ),
            ]),
          ]),
    );
  }
}
