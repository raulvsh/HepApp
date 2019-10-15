import 'package:flutter/material.dart';

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
