import 'package:flutter/material.dart';

class CalcBottomBar extends StatelessWidget {
  final numreset;

  CalcBottomBar(this.numreset,);

  //TODO hacer método reset
  reset() {
    print('reset pulsado prueba');
    return AlertDialog(
      //title: Text("Reset Values"),
      content: Text("reseteo"),
      elevation: 1.0,
    );
  }

  //TODO hacer método previous
  _previous() {
    return AlertDialog(
      title: Text("Previous Values"),
      content: Text("Valores Anteriores"),
    );
  } //TODO hacer método information

  _information() {
    return AlertDialog(
      title: Text("More information"),
      content: Text("Informacion adicional"),
    );
  }

  /*var reseteo = AlertDialog(
    //title: Text("Reset Values"),
    content: Text("reseteo"),
    elevation: 1.0,
  );
  var reseteo2 = AlertDialog(
    //title: Text("Reset Values"),
    content: Text("reseteo2"),
    elevation: 1.0,
  );*/

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //color: Color.fromARGB(0, 0, 0, 0),
      child: Row(
        //TODO HACER BOTÓN PERSONALIZADO bottom, y pasar texto y acción por referencia
        //mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //BottomCalcButton("Reset Values", () => print("hola")),
          CalcBottomButton("Presioname", action: () => {reset()}),
          SizedBox(width: 10.0,), //height: 30,),
          Container(
            height: 25.0,
            margin: EdgeInsets.all(7),

            child: RaisedButton(
              //icon: Icon(Icons.menu),
              child: Text("Previous Values", style: TextStyle(fontSize: 12),),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => _previous());
              },
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            height: 25.0,
            margin: EdgeInsets.all(7),

            child: RaisedButton(
              //icon: Icon(Icons.menu),
              child: Text("More Information", style: TextStyle(fontSize: 12),),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => _information());
              },
            ),
          ),
          //TODO hacer botón Next opcional como en el CustomAppBar
        ],
      ),
    );
  }
}


class CalcBottomButton extends StatelessWidget {
  final String text;
  final Function action;

  CalcBottomButton(this.text, {this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          onPressed: () {
            action();
          },
          textColor: Colors.yellow,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xAF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                ],
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(text, style: TextStyle(fontSize: 20)),
          )),
    );
  }
}

