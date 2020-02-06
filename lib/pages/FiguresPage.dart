import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/NavigationButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';


class FiguresPage extends StatefulWidget {
  @override
  _FiguresPageState createState() => _FiguresPageState();
}

class _FiguresPageState extends State<FiguresPage> {
  static var figures = [
    ['table_contents', '4_figures.png', '/TableFig'],
    ['schemes', '4_figures.png', '/SchemesFig'],
    ['maps', '4_figures.png', '/MapsFig'],
    ['pathology', '4_figures.png', '/PathologyFig'],
    ['interactive_figures', '4_figures.png', '/InteractiveFig'],
    ['drawing', '4_figures.png', '/DrawingFig'],
  ];

  var numFigCategories = figures.length;

  /*final numFigCategories = 6;

  var figuresIndex = [
    "TableOfContents",
    "Schemes",
    "Maps",
    "Pathology",
    "Interactive",
    "Drawing",
  ];

  var figuresInfo = {
    "TableOfContents":  ['table_contents', '4_figures.png', '/TableFig'],
    "Schemes":          ['schemes', '4_figures.png', '/SchemesFig'],
    "Maps":             ['maps', '4_figures.png', '/MapsFig'],
    "Pathology":        ['pathology', '4_figures.png', '/PathologyFig'],
    "Interactive":      ['interactive_figures', '4_figures.png', '/InteractiveFig'],
    "Drawing":          ['drawing', '4_figures.png', '/DrawingFig'],
  };*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: CustomAppBar(context, 'figures'),
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
      //color: Colors.lightBlueAccent,
      child: FractionallySizedBox(
        widthFactor: orientation == Orientation.portrait ? 0.7 : 0.7,
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.symmetric(vertical: 20 * padding)
              : EdgeInsets.symmetric(vertical: 4 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildFiguresGridView(),
        ),
      ),
    );
  }

  _buildFiguresGridView() {
    List<NavigationButton> widgets = [];
    for (int i = 0; i < numFigCategories; i++) {
      widgets.add(NavigationButton(context, figures[i]));
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
