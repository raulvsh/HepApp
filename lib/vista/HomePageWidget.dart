import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  bool _isBorderEnabled = false;

  @override
  Widget build(BuildContext context) {
    //bool orientationPortrait =        MediaQuery.of(context).orientation == Orientation.portrait;

    final title = 'HepApp';
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: PreferredSize(
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
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildVerticalLayout(orientation)
              : _buildHorizontalLayout(orientation);
        },
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
              _iconoChapters(orientation),
              _iconoPodcasts(orientation),
            ]),
            TableRow(children: <Widget>[
              //Segunda fila: Cards y figures
              _iconoCards(orientation),
              _iconoFigures(orientation),
            ]),
            TableRow(children: <Widget>[
              //Tercera fila: Calculators y resources
              _iconoCalculators(orientation),
              _iconoResources(orientation),
            ]),
            TableRow(children: <Widget>[
              //Cuarta fila: PubMed e Information
              _iconoPubMed(orientation),
              _iconoInformation(orientation),
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
          _iconoChapters(orientation),
          _iconoPodcasts(orientation),
          _iconoCards(orientation),
          _iconoFigures(orientation),
        ]),
        TableRow(children: <Widget>[
          //Segunda fila: Calculators, resources, pubmed, information
          _iconoCalculators(orientation),
          _iconoResources(orientation),
          _iconoPubMed(orientation),
          _iconoInformation(orientation),
        ]),
      ]),
    );
  }

  _iconoChapters(orientation) {
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
                  'images/chapters.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Chapters',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: orientation == Orientation.portrait ? 16 : 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/Chapters');
            }),
      ),
    );
  }

  _iconoPodcasts(orientation) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: orientation == Orientation.portrait ? 110 : 100,
        height: orientation == Orientation.portrait ? 110 : 100,
        child: FlatButton(
            padding: EdgeInsets.all(2),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/podcasts.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Podcasts',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: orientation == Orientation.portrait ? 16 : 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/Podcasts');
            }),
      ),
    );
    // },
    // );
  }

  _iconoCards(orientation) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: orientation == Orientation.portrait ? 110 : 100,
        height: orientation == Orientation.portrait ? 110 : 100,
        child: FlatButton(
            padding: EdgeInsets.all(2),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/cards.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Cards',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: orientation == Orientation.portrait ? 16 : 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/Cards');
            }),
      ),
    );
    // },
    // );
  }

  _iconoFigures(orientation) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: orientation == Orientation.portrait ? 110 : 100,
        height: orientation == Orientation.portrait ? 110 : 100,
        child: FlatButton(
            padding: EdgeInsets.all(2),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/figures.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Figures',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: orientation == Orientation.portrait ? 16 : 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/Figures');
            }),
      ),
    );
    // },
    // );
  }

  _iconoCalculators(orientation) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: orientation == Orientation.portrait ? 110 : 100,
        height: orientation == Orientation.portrait ? 110 : 100,
        child: FlatButton(
            padding: EdgeInsets.all(2),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/calculators.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Calculators',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: orientation == Orientation.portrait ? 16 : 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/Calculators');
            }),
      ),
    );
    // },
    // );
  }

  _iconoResources(orientation) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: orientation == Orientation.portrait ? 110 : 100,
        height: orientation == Orientation.portrait ? 110 : 100,
        child: FlatButton(
            padding: EdgeInsets.all(2),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/resources.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Resources',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: orientation == Orientation.portrait ? 16 : 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/Resources');
            }),
      ),
    );
    // },
    // );
  }

  _iconoPubMed(orientation) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: orientation == Orientation.portrait ? 110 : 100,
        height: orientation == Orientation.portrait ? 110 : 100,
        child: FlatButton(
            padding: EdgeInsets.all(2),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/pubmed.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'PubMed',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: orientation == Orientation.portrait ? 16 : 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/PubMed');
            }),
      ),
    );
    // },
    // );
  }

  _iconoInformation(orientation) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: orientation == Orientation.portrait ? 110 : 100,
        height: orientation == Orientation.portrait ? 110 : 100,
        child: FlatButton(
            padding: EdgeInsets.all(2),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/information.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Information',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: orientation == Orientation.portrait ? 16 : 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/Information');
            }),
      ),
    );
    // },
    // );
  }

}
