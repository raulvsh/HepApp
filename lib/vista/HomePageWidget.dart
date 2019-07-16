import 'package:flutter/material.dart';
import 'package:hepapp/vista/CalculatorsPageWidget.dart';
import 'package:hepapp/vista/CardsPageWidget.dart';
import 'package:hepapp/vista/ChaptersPageWidget.dart';
import 'package:hepapp/vista/FiguresPageWidget.dart';
import 'package:hepapp/vista/InformationPageWidget.dart';
import 'package:hepapp/vista/PodcastsPageWidget.dart';
import 'package:hepapp/vista/PubMedPageWidget.dart';
import 'package:hepapp/vista/ResourcesPageWidget.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  bool _isBorderEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(85, 80, 85, 60),
        child: Table(
            //border: _isBorderEnabled ? TableBorder.all() : TableBorder.all(),
            //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            children: <TableRow>[
              TableRow(children: <Widget>[
                //Primera fila: Chapters y podcasts
                FittedBox(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChaptersPage()));
                        }),
                  ),
                ),
                FittedBox(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PodcastsPage()));
                        }),
                  ),
                ),
              ]),
              TableRow(children: <Widget>[
                //Segunda fila: Cards y figures
                FittedBox(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CardsPage()));
                        }),
                  ),
                ),
                FittedBox(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FiguresPage()));
                        }),
                  ),
                ),
              ]),
              TableRow(children: <Widget>[
                //Tercera fila: Calculators y resources
                FittedBox(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalculatorsPage()));
                        }),
                  ),
                ),
                FittedBox(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResourcesPage()));
                        }),
                  ),
                ),
              ]),
              TableRow(children: <Widget>[
                //Cuarta fila: PubMed e Information
                FittedBox(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PubMedPage()));
                        }),
                  ),
                ),
                FittedBox(
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InformationPage()));
                        }),
                  ),
                ),
              ]),
            ]),
      ),
    );
  }
}
