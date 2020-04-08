/*

import 'package:flutter/material.dart';

class CalcBottomButton extends StatelessWidget {
  final String text;
  final Function action;

  CalcBottomButton(this.text, {this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      margin: EdgeInsets.all(7),
      child: RaisedButton(
        onPressed: () {
          print("Texto dentro de boton " + action.toString());
          //action;
          showModalBottomSheet(
              context: context, builder: (BuildContext context) => action());

          //action;
        },
        //textColor: Colors.yellow,
        padding: const EdgeInsets.all(7.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}*/
