import 'package:flutter/material.dart';
//import 'package:flutter_widget_guide/utils.dart';

class SquareHomeWidget extends StatefulWidget {
  @override
  _SquareHomeWidgetState createState() => _SquareHomeWidgetState();
}

class _SquareHomeWidgetState extends State<SquareHomeWidget> {
  bool _isBorderEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
            centerTitle: true,
            title: Container(
              child: Text(
                'Table Widget',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  //fontFamily: Utils.ubuntuRegularFont),
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => setState(() {
                  _isBorderEnabled == false
                      ? _isBorderEnabled = true
                      : _isBorderEnabled = false;
                }),
              ),
            ]),*/
      body: SingleChildScrollView(
        padding: EdgeInsets.all(100),
        child: Table(
            border: _isBorderEnabled ? TableBorder.all() : null,
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            children: <TableRow>[
              ///First table row with 2 children
              TableRow(children: <Widget>[
                FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    width: 110,
                    height: 110,
                    child:
                        Image.asset('images/chapters.png', fit: BoxFit.contain),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    width: 110.0,
                    height: 110.0,
                    child: Image.asset('images/podcast.png', fit: BoxFit.cover),
                  ),
                ),
              ]),

              ///First table row with 2 children
              TableRow(children: <Widget>[
                FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    width: 110,
                    height: 110,
                    child: Image.asset('images/cards.png', fit: BoxFit.cover),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    width: 110.0,
                    height: 110.0,
                    child: Image.asset('images/newfiguresbutton.png',
                        fit: BoxFit.cover),
                  ),
                ),
              ]),

              ///First table row with 2 children
              TableRow(children: <Widget>[
                FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    width: 110,
                    height: 110,
                    child: Image.asset('images/calc.png', fit: BoxFit.cover),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    width: 110.0,
                    height: 110.0,
                    child: Image.asset('images/favs.png', fit: BoxFit.cover),
                  ),
                ),
              ]),

              ///First table row with 2 children
              TableRow(children: <Widget>[
                FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    width: 110,
                    height: 110,
                    child: Image.asset('images/pubmed.png', fit: BoxFit.cover),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    margin: EdgeInsets.all(2),
                    width: 110.0,
                    height: 110.0,
                    child: Image.asset('images/questionmarkicon.png',
                        fit: BoxFit.cover),
                  ),
                ),
              ]),
            ]),
      ),
    );
  }
}
