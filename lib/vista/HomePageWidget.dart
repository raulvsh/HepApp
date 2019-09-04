import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          child: Stack(
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
    );
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
              //Primera fila: Chapters y podcasts
              _mostrarIcono('Chapters', orientation),
              _mostrarIcono('Podcasts', orientation),
            ]),
            TableRow(children: <Widget>[
              //Segunda fila: Cards y figures
              _mostrarIcono('Cards', orientation),
              _mostrarIcono('Figures', orientation),
            ]),
            TableRow(children: <Widget>[
              //Tercera fila: Calculators y resources
              _mostrarIcono('Calculators', orientation),
              _mostrarIcono('Resources', orientation),
            ]),
            TableRow(children: <Widget>[
              //Cuarta fila: PubMed e Information
              _mostrarIcono('PubMed', orientation),
              _mostrarIcono('Information', orientation),
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
          _mostrarIcono('Chapters', orientation),
          _mostrarIcono('Podcasts', orientation),
          _mostrarIcono('Cards', orientation),
          _mostrarIcono('Figures', orientation),
        ]),
        TableRow(children: <Widget>[
          //Segunda fila: Calculators, resources, pubmed, information
          _mostrarIcono('Calculators', orientation),
          _mostrarIcono('Resources', orientation),
          _mostrarIcono('PubMed', orientation),
          _mostrarIcono('Information', orientation),
        ]),
      ]),
    );
  }

  _mostrarIcono(tipoSeccion, orientation) {
    return FittedBox(
      //Chapters
      fit: BoxFit.scaleDown,
      child: Container(
        width: orientation == Orientation.portrait ? 110 : 100,
        height: orientation == Orientation.portrait ? 110 : 100,
        child: FlatButton(
          padding: EdgeInsets.all(2),
          child: Stack(
            children: <Widget>[
              Image.asset(
                'images/${sectionTypes[tipoSeccion][1]}',
              ),
              Center(
                child: Align(
                  alignment: Alignment(0, 0.7),
                  child: Text(
                    sectionTypes[tipoSeccion][0],
                    style: TextStyle(
                      color: Color.fromARGB(255, 93, 188, 210),
                      fontSize: orientation == Orientation.portrait ? 16 : 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          onPressed: () =>
              Navigator.pushNamed(context, sectionTypes[tipoSeccion][2]),
        ),
      ),
    );
  }
}
