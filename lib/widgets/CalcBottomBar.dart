import 'package:flutter/material.dart';

class CalcBottomBar extends StatelessWidget {
  const CalcBottomBar({
    Key key,
  }) : super(key: key);

  //TODO hacer método reset
  _reset() {
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

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        //mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //BottomCalcButton("Reset Values", () => print("hola")),
          RaisedButton(
            splashColor: Colors.redAccent,

            //icon: Icon(Icons.menu),
            child: Text("Reset Values"),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => _reset(),
              );
              //_reset());
            },
          ),
          SizedBox(width: 20.0),
          RaisedButton(
            //icon: Icon(Icons.menu),
            child: Text("Previous Values"),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => _previous());
            },
          ),
          SizedBox(width: 20.0),
          RaisedButton(
            //icon: Icon(Icons.menu),
            child: Text("More information"),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => _information());
            },
          ),
        ],
      ),
    );
  }
}
