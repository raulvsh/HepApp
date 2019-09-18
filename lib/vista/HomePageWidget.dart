import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  //bool _isBorderEnabled = false;

  final title = 'HepApp';

  var sectionTypes = {
    "Chapters": ['Chapters', 'chapters.png', '/Chapters'],
    "Podcasts": ['Podcasts', 'podcasts.png', '/Podcasts'],
    "Cards": ['Cards', 'cards.png', '/Cards'],
    "Figures": ['Figures', 'figures.png', '/Figures'],
    "Calculators": ['Calculators', 'calculators.png', '/Calculators'],
    "Resources": ['Resources', 'resources.png', '/Resources'],
    "PubMed": ['PubMed', 'pubmed.png', '/PubMed'],
    "Information": ['Information', 'information.png', '/Information'],
  };

  //String get title => null;

  @override
  Widget build(BuildContext context) {
    //bool orientationPortrait =        MediaQuery.of(context).orientation == Orientation.portrait;
    /*final width = MediaQuery
        .of(context)
        .size
        .width;*/

    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: _buildHomeAppBar(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildVerticalLayout(orientation)
              : _buildHorizontalLayout(orientation);
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
  }

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
  }
}
