import 'package:flutter/material.dart';
import 'package:hepapp/vista/Calculators/AllCalcPageWidget.dart';
import 'package:hepapp/vista/Calculators/CLIPCalcPageWidget.dart';
import 'package:hepapp/vista/Calculators/ChildCalcPageWidget.dart';
import 'package:hepapp/vista/Calculators/MELDCalcPageWidget.dart';
import 'package:hepapp/vista/Calculators/OkudaCalcPageWidget.dart';

class CalculatorsPage extends StatefulWidget {
  @override
  _CalculatorsPageState createState() => _CalculatorsPageState();
}

class _CalculatorsPageState extends State<CalculatorsPage> {
  bool _isBorderEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Calculators"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(65, 105, 65, 70),
        child: Table(
            //border: _isBorderEnabled ? TableBorder.all() : TableBorder.all(),
            //defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            children: <TableRow>[
              TableRow(children: <Widget>[
                //Primera fila: All algorithms y Child Pugh Score
                FittedBox(
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
                              'images/calc.png',
                            ),
                            Center(
                              child: Align(
                                alignment: Alignment(0, 0.7),
                                child: Text(
                                  'All algorithms',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllCalcPage()));
                        }),
                  ),
                ),
                FittedBox(
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
                              'images/calc.png',
                            ),
                            Center(
                              child: Align(
                                alignment: Alignment(0, 0.7),
                                child: Text(
                                  'Child Pugh Score',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChildCalcPage()));
                        }),
                  ),
                ),
              ]),
              TableRow(children: <Widget>[
                //Segunda fila: MELD y Okuda Staging System
                FittedBox(
                  //MELD
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
                                  'MELD',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MELDCalcPage()));
                        }),
                  ),
                ),
                FittedBox(
                  //Okuda Staging System
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
                                  'Okuda Staging System',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OkudaCalcPage()));
                        }),
                  ),
                ),
              ]),
              TableRow(children: <Widget>[
                //Tercera fila: CLIP Staging System
                FittedBox(
                  //CLIP Staging System
                  fit: BoxFit.fill,
                  child: Container(
                    //alignment: Alignment(-1,0),
                    width: 145,
                    height: 145,
                    child: FlatButton(
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              'images/calc.png',
                            ),
                            Align(
                              alignment: Alignment(0, 0.7),
                              child: Text(
                                'CLIP Staging System',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CLIPCalcPage()));
                        }),
                  ),
                ),
                FittedBox(//Caja vacía

                    ),
              ]),
            ]),
      ),
    );
  }
}
