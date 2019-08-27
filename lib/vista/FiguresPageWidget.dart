import 'package:flutter/material.dart';

class FiguresPage extends StatefulWidget {
  @override
  _FiguresPageState createState() => _FiguresPageState();
}

class _FiguresPageState extends State<FiguresPage> {
  bool _isBorderEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          title: Container(
            child: Row(
              children: <Widget>[
                FlatButton(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'images/arrowthickleft.png',
                          width: 25,
                          height: 25,
                        ),
                        Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    }),
                IconButton(
                  icon: Image.asset(
                    'images/homeicon.png',
                    width: 25,
                    height: 25,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                Text(
                  "Figures",
                ),
              ],
            ),
          ),
        ),
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
              _iconoTableContents(orientation),
              _iconoSchemes(orientation),
            ]),
            TableRow(children: <Widget>[
              _iconoInteractive(orientation),
              _iconoChapter(orientation),
            ]),
            TableRow(children: <Widget>[
              _iconoDrawing(orientation),
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
          _iconoTableContents(orientation),
          _iconoSchemes(orientation),
          _iconoInteractive(orientation),
          _iconoChapter(orientation),
        ]),
        TableRow(children: <Widget>[
          //Segunda fila: Calculators, resources, pubmed, information
          _iconoDrawing(orientation),
          FittedBox(),
          FittedBox(),
          FittedBox(),
        ]),
      ]),
    );
  }

  _iconoTableContents(orientation) {
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
                  'images/figures.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Table of Contents',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/TableFig');
            }),
      ),
    );
  }

  _iconoSchemes(orientation) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/figures.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Schemes',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/SchemesFig');
            }),
      ),
    );
  }

  _iconoInteractive(orientation) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/figures.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Interactive Figures',
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
            onPressed: () {
              Navigator.pushNamed(context, '/InteractiveFig');
            }),
      ),
    );
  }

  _iconoChapter(orientation) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Container(
        width: 145,
        height: 145,
        child: FlatButton(
            padding: EdgeInsets.all(5),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/figures.png',
                ),
                Align(
                  alignment: Alignment(0, 0.7),
                  child: Text(
                    'Chapter Figures',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 93, 188, 210),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/ChapterFig');
            }),
      ),
    );
  }

  _iconoDrawing(orientation) {
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
                  'images/figures.png',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      'Drawing',
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/DrawingFig');
            }),
      ),
    );
  }
}
