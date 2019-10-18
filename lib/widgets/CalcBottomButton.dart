import 'package:flutter/material.dart';
/*
class CalcBottomButton extends StatelessWidget {
  final String text;
  final Function action;

  CalcBottomButton(String this.text, {Function this.action});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      margin: EdgeInsets.all(7),
      child: RaisedButton(
        splashColor: Colors.redAccent,

        //icon: Icon(Icons.menu),
        child: Text(text, style: TextStyle(fontSize: 12),),
        onPressed: () {

          action();

          //_reset());
        },
      ),
    );
  }

  Widget reset() {
    return AlertDialog(
      //title: Text("Reset Values"),
      content: Text("reseteo"),
      elevation: 1.0,
    );
  }
}*/

class CalcBottomButton extends StatelessWidget {
  final String text;
  final Function action;

  CalcBottomButton(String this.text, {Function this.action});

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
