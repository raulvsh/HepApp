import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hepapp/vista/VistaUtils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final title = 'HepApp';

  var sectionTypesNames = [
    "Chapters",
    "Podcasts",
    "Cards",
    "Figures",
    "Calculators",
    "Resources",
    "PubMed",
    "Information",
    "Information2",

  ];

  var sectionTypes = {
    "Chapters": ['Chapters', 'chapters.png', '/Chapters'],
    "Podcasts": ['Podcasts', 'podcasts.png', '/Podcasts'],
    "Cards": ['Cards', 'cards.png', '/Cards'],
    "Figures": ['Figures', 'figures.png', '/Figures'],
    "Calculators": ['Calculators', 'calculators.png', '/Calculators'],
    "Resources": ['Resources', 'resources.png', '/Resources'],
    "PubMed": ['PubMed', 'pubmed.png', '/PubMed'],
    "Information": ['Information', 'information.png', '/Information'],
    "Information2": ['Information', 'information.png', '/Information'],

  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: _buildHomeAppBar(),
      body: //_buildLayout(orientation),

      OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
    );
  }

  _buildHomeAppBar() {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return PreferredSize(
      preferredSize: Size.fromHeight(90),
      child: AppBar(
        automaticallyImplyLeading: false, //Elimina el botón back
        title: Container(
          height: 30,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Container(
            height: 70.0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Image.asset(
                  'images/header4.png',
                  height: 70,
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
                Center(
                  child: Container(
                    //height: 60,
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Image.asset(
                      'images/hepapplogo.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
      //color: Colors.red,
      child: FractionallySizedBox(
        widthFactor: orientation == Orientation.portrait ? 0.6 : 0.65,
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.only(top: 12 * padding)
              : EdgeInsets.only(top: 3 * padding),
            primary: false,
            crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildHomeGridView(),
          /*<CustomButton>[
              CustomButton(context, sectionTypes["Chapters"]),
              CustomButton(context, sectionTypes["Podcasts"]),
              CustomButton(context, sectionTypes["Cards"]),
              CustomButton(context, sectionTypes["Figures"]),
              CustomButton(context, sectionTypes["Calculators"]),
              CustomButton(context, sectionTypes["Resources"]),
              CustomButton(context, sectionTypes["PubMed"]),
              CustomButton(context, sectionTypes["Information"]),
            ]*/
        ),
      ),
    );
  }


  //Método para crear la lista de botones según, en vez de colocar los 8 botones directamente
  _buildHomeGridView() {
    List<CustomButton> widgets = [];

    for (int i = 0; i < 8; i++) {
      widgets.add(CustomButton(context, sectionTypes[sectionTypesNames[i]]));
    }

    return widgets;
  }

/*
Antiguo método para crear layout vertical
_buildVerticalLayout(orientation) {

    return Container(
      width: double.infinity,
      height: double.infinity,

      //color: Colors.blueAccent,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          //border: _isBorderEnabled ? TableBorder.all() : TableBorder.all(),
          //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,

          children: <Row>[
            //Cuatro filas de dos elementos cada una
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              //Primera fila: Chapters y podcasts
              CustomButton(context, sectionTypes["Chapters"], orientation),
              CustomButton(context, sectionTypes["Podcasts"], orientation),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              //Segunda fila: Cards y figures

              CustomButton(context, sectionTypes["Cards"], orientation),
              CustomButton(context, sectionTypes["Figures"], orientation),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              //Tercera fila: Calculators y resources
              CustomButton(context, sectionTypes["Calculators"], orientation),
              CustomButton(context, sectionTypes["Resources"], orientation),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              //Cuarta fila: PubMed e Information
              CustomButton(context, sectionTypes["PubMed"], orientation),
              CustomButton(context, sectionTypes["Information"], orientation),
            ]),
          ]),
    );
  }*/

/*
Antiguo método para crear layout horizontal
_buildHorizontalLayout(orientation) {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      height: double.infinity,

      //padding: EdgeInsets.fromLTRB(150, 25, 150, 25),

      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Row>[
            //Dos filas de cuatro elementos cada una
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              //Primera fila: Chapters, podcasts, cards, figures
              CustomButton(context, sectionTypes["Chapters"], orientation),
              CustomButton(context, sectionTypes["Podcasts"], orientation),
              CustomButton(context, sectionTypes["Cards"], orientation),
              CustomButton(context, sectionTypes["Figures"], orientation),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              //Segunda fila: Calculators, resources, pubmed, information
              CustomButton(context, sectionTypes["Calculators"], orientation),
              CustomButton(context, sectionTypes["Resources"], orientation),
              CustomButton(context, sectionTypes["PubMed"], orientation),
              CustomButton(context, sectionTypes["Information"], orientation),
            ]),
          ]),
    );
  }*/

}
