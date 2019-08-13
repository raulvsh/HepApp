import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  bool _isBorderEnabled = false;

  @override
  Widget build(BuildContext context) {
    final title = 'HepApp';
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        /*child: Container(
          height: 80,*/
        /*PreferredSize(
          preferredSize: Size.fromHeight(30),*/

        child: AppBar(
          title: Container(
            height: 30,
            //width: MediaQuery.of(context).size.width,
            child: Text(
              title,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 14,
                backgroundColor: Color.fromARGB(255, 93, 188, 210),
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
                  //width: 1200,
                  width: width,

                  //width: context.,
                ),
                Center(
                  child: Container(
                    //height: 60,
                    //padding: EdgeInsets.all(2),
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

      /*PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Stack(
          children: <Widget>[
            Image.asset(
              'images/header4.png',
              //width: context.,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(2),
                child: Image.asset(
                  'images/hepapplogo.png',
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Text(
                title,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 14,
                  backgroundColor: Color.fromARGB(255, 93, 188, 210),
                ),
              ),
            ),
          ],
        ),
      ),*/

      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildVerticalLayout()
              : _buildHorizontalLayout();
        },
      ),
    );
  }

  _buildVerticalLayout() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(85, 80, 85, 60),
      child: Table(
        //border: _isBorderEnabled ? TableBorder.all() : TableBorder.all(),
        //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,

          children: <TableRow>[
            //Cuatro filas de dos elementos cada una
            TableRow(children: <Widget>[
              //Primera fila: Chapters y podcasts
              _iconoChapters(),
              _iconoPodcasts(),
            ]),
            TableRow(children: <Widget>[
              //Segunda fila: Cards y figures
              _iconoCards(),
              _iconoFigures(),
            ]),
            TableRow(children: <Widget>[
              //Tercera fila: Calculators y resources
              _iconoCalculators(),
              _iconoResources(),
            ]),
            TableRow(children: <Widget>[
              //Cuarta fila: PubMed e Information
              _iconoPubMed(),
              _iconoInformation(),
            ]),
          ]),
    );
  }

  _buildHorizontalLayout() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
      child: Table(children: <TableRow>[
        //Dos filas de cuatro elementos cada una
        TableRow(children: <Widget>[
          //Primera fila: Chapters, podcasts, cards, figures
          _iconoChapters(),
          _iconoPodcasts(),
          _iconoCards(),
          _iconoFigures(),
        ]),
        TableRow(children: <Widget>[
          //Segunda fila: Calculators, resources, pubmed, information
          _iconoCalculators(),
          _iconoResources(),
          _iconoPubMed(),
          _iconoInformation(),
        ]),
      ]),
    );
  }

  _iconoChapters() {
    //bool orientation == Orientation.portrait;
    return FittedBox(
      //Chapters
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
            padding: EdgeInsets.all(5),
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
                        fontSize: 18,
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

  _iconoPodcasts() {
    return FittedBox(
      //Podcasts
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/podcast.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Podcasts',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: 18,
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
  }

  _iconoCards() {
    return FittedBox(
      //Cards
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
            padding: EdgeInsets.all(5),
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
                        fontSize: 18,
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
  }

  _iconoFigures() {
    return FittedBox(
      //Figures
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/newfiguresbutton.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Figures',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: 18,
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
  }

  _iconoCalculators() {
    return FittedBox(
      //Calculators
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/calc.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Calculators',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: 18,
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
  }

  _iconoResources() {
    return FittedBox(
      //Resources
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/favs.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Resources',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: 18,
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
  }

  _iconoPubMed() {
    return FittedBox(
      //PubMed
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
            padding: EdgeInsets.all(5),
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
                        fontSize: 18,
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
  }

  _iconoInformation() {
    return FittedBox(
      //Information
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/questionmarkicon.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Information',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: 18,
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
  }

  _buildVerticalAppBar() {}

  _buildHorizontalAppBar() {}
}
