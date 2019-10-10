import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title;
  final bool selComunCalc;

  CustomAppBar(this.context, this.title, this.selComunCalc);

  @override
  Widget build(BuildContext context) {
    var actions = this.selComunCalc == true
        ? null
        : <Widget>[
      IconButton(
        icon: Icon(Icons.photo_camera),
        onPressed: () {
          //Añadir función captura de pantalla _screenCapture()
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Camera"),
                content: Text("captura de pantalla"),
              );
            },
          );
        },
      ),
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {
          //Añadir función captura de pantalla _screenCapture()
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("settings"),
                content: Text("preferencias de pantalla"),
              );
            },
          );
        },
      ),
    ];

    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      //centerTitle: false,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
      title: Container(
        //margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        //padding: EdgeInsets.all(0),
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'images/arrowthickleft.png',
                          width: 22,
                          height: 22,
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
                    onTap: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: Image.asset(
                      'images/homeicon.png',
                      width: 22,
                      height: 22,
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  //color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;

  CustomButton(this.context, this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5),
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'images/${type[1]}',
            ),
            Align(
              alignment: Alignment(0, 0.7),
              child: Text(
                type[0],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 93, 188, 210),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        onTap: () => Navigator.pushNamed(context, type[2]),
      ),
    );
  }
}

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
