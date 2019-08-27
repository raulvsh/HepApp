import 'package:flutter/material.dart';

class CalculatorsPage extends StatefulWidget {
  @override
  _CalculatorsPageState createState() => _CalculatorsPageState();
}

class _CalculatorsPageState extends State<CalculatorsPage> {
  bool _isBorderEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: new Text(
            "Calculators",
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
              _iconoAllAlgorithms(orientation),
              _iconoChildPugh(orientation),
            ]),
            TableRow(children: <Widget>[
              _iconoMELD(orientation),
              _iconoOkuda(orientation),
            ]),
            TableRow(children: <Widget>[
              _iconoCLIP(orientation),
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
          _iconoAllAlgorithms(orientation),
          _iconoChildPugh(orientation),
          _iconoMELD(orientation),
          _iconoOkuda(orientation),
        ]),
        TableRow(children: <Widget>[
          //Segunda fila: Calculators, resources, pubmed, information
          _iconoCLIP(orientation),
          FittedBox(),
          FittedBox(),
          FittedBox(),
        ]),
      ]),
    );
  }

  _iconoAllAlgorithms(orientation) {
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
                  'images/calculators.png',
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
              Navigator.pushNamed(context, '/AllCalc');
            }),
      ),
    );
  }

  _iconoChildPugh(orientation) {
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
                  'images/calculators.png',
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
              Navigator.pushNamed(context, '/ChildCalc');
            }),
      ),
    );
  }

  _iconoMELD(orientation) {
    return FittedBox(
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
                  'images/calculators.png',
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
              Navigator.pushNamed(context, '/MELDCalc');

              /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MELDCalcPage()));*/
            }),
      ),
    );
  }

  _iconoOkuda(orientation) {
    return FittedBox(
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
                  'images/calculators.png',
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
              Navigator.pushNamed(context, '/OkudaCalc');

              /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OkudaCalcPage()));*/
            }),
      ),
    );
  }

  _iconoCLIP(orientation) {
    return FittedBox(
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
                  'images/calculators.png',
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
              Navigator.pushNamed(context, '/CLIPCalc');
            }),
      ),
    );
  }
}
