import 'package:flutter/material.dart';
import 'package:hepapp/vista/VistaUtils.dart';

class FiguresPage extends StatefulWidget {
  @override
  _FiguresPageState createState() => _FiguresPageState();
}

class _FiguresPageState extends State<FiguresPage> {
  var figureTypesNames = [
    "TableOfContents",
    "Schemes",
    "Interactive",
    "Chapter",
    "Drawing",
  ];

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

      appBar: CustomAppBar(context, "Figures"),
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
      //color: Colors.lightBlueAccent,
      child: FractionallySizedBox(
        widthFactor: orientation == Orientation.portrait ? 0.6 : 0.65,
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.only(top: 25 * padding)
              : EdgeInsets.only(top: 4 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildFiguresGridView(),
          /* Método antiguo de mostrar los botones
          <CustomButton>[
              CustomButton(context, figureTypes["TableOfContents"]),
              CustomButton(context, figureTypes["Schemes"]),
              CustomButton(context, figureTypes["Interactive"]),
              CustomButton(context, figureTypes["Chapter"]),
              CustomButton(context, figureTypes["Drawing"]),
            ]*/
        ),
      ),
    );
  }

  _buildFiguresGridView() {
    List<CustomButton> widgets = [];
    for (int i = 0; i < 5; i++) {
      widgets.add(CustomButton(context, figureTypes[figureTypesNames[i]]));
    }
    return widgets;
  }

/*_buildVerticalLayout(orientation) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // color: Colors.lightBlueAccent,
      padding: EdgeInsets.fromLTRB(80, 80, 80, 80),
      child: Center(
        child: Table(children: <TableRow>[
          //Cuatro filas de dos elementos cada una
          TableRow(children: <Widget>[
            CustomButton(context, figureTypes["TableOfContents"], orientation),
            CustomButton(context, figureTypes["Schemes"], orientation),
          ]),
          TableRow(children: <Widget>[
            CustomButton(context, figureTypes["Interactive"], orientation),
            CustomButton(context, figureTypes["Chapter"], orientation),
          ]),
          TableRow(children: <Widget>[
            CustomButton(context, figureTypes["Drawing"], orientation),
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
      //  color: Colors.yellowAccent,
      padding: EdgeInsets.fromLTRB(100, 25, 100, 25),
      child: Center(
        child: Table(children: <TableRow>[
          //Dos filas de cuatro elementos cada una
          TableRow(children: <Widget>[
            //Primera fila: Chapters, podcasts, cards, figures
            CustomButton(context, figureTypes["TableOfContents"], orientation),
            CustomButton(context, figureTypes["Schemes"], orientation),
            CustomButton(context, figureTypes["Interactive"], orientation),
            CustomButton(context, figureTypes["Chapter"], orientation),
          ]),
          TableRow(children: <Widget>[
            //Segunda fila: Calculators, resources, pubmed, information
            CustomButton(context, figureTypes["Drawing"], orientation),
            FittedBox(),
            FittedBox(),
            FittedBox(),
          ]),
        ]),
      ),
    );
  }*/
}
