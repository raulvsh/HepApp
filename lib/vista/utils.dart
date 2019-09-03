/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class showIcon(tipoSeccion, orientation) extends StatelessWidget {


  @override
Widget build (BuildContext context){
    return FittedBox(
      //Chapters
      fit: BoxFit.scaleDown,
      child: Container(
        width: orientation == Orientation.portrait ? 110 : 100,
        height: orientation == Orientation.portrait ? 110 : 100,
        child: FlatButton(
            padding: EdgeInsets.all(2),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/${TiposSecciones[tipoSeccion][1]}',
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      TiposSecciones[tipoSeccion][0],
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: orientation == Orientation.portrait ? 16 : 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, TiposSecciones[tipoSeccion][2]);
            }),
      ),
    );
  }
}*/
