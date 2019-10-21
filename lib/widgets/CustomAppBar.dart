import 'package:flutter/material.dart';
import 'package:hepapp/shared_preferences/FullCalcSettings.dart';

import '../shared_preferences/PartialCalcSettings.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title;

  final bool selScreenshot;
  final bool selFullSettings;
  final bool selPartialSettings;

  CustomAppBar(this.context, this.title,
      {this.selScreenshot, this.selFullSettings, this.selPartialSettings});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    /* List<Widget> actions = [];

    if (this.widget.selScreenshot == true) {
      actions.add(IconButton(
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
      ));
    }
    if (this.widget.selFullSettings == true) {
      actions.add(
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            //Añadir función captura de pantalla _screenCapture()
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return FullCalcSettings();
              },
            );
          },
        ),
      );
    }
    if (this.widget.selPartialSettings == true) {
      actions.add(
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            //Añadir función captura de pantalla _screenCapture()
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return PartialCalcSettings();
              },
            );
          },
        ),
      );
    }*/

    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      //centerTitle: false,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      title: Container(
        // color: Colors.red,
        //margin: EdgeInsets.only(left: 5.0),
        //padding: EdgeInsets.all(0),
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /*IconButton(
              icon: Icon(Icons.menu),
              onPressed: _handleTap,
            ),*/
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _backIcon(context),
                  _homeIcon(context),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                widget.title,
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
      actions: <Widget>[
        (widget.selScreenshot == true)
            ? _screenshotIcon(context)
            : Container(),
        (widget.selFullSettings == true)
            ? _fullSettingsIcon(context)
            : Container(),
        (widget.selPartialSettings == true)
            ? _partialSettingsIcon(context)
            : Container(),

      ],
    );
  }


  IconButton _homeIcon(BuildContext context) {
    return IconButton(
      icon: //Icon(Icons.home),

      Image.asset(
        'images/homeicon.png',
        width: 18,
        height: 18,
      ),
      onPressed: () => Navigator.pushNamed(context, '/'),
    );
  }

  GestureDetector _backIcon(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Icon(Icons.keyboard_arrow_left),
          /*Image.asset(
            'images/arrowthickleft.png',
            width: 22,
            height: 22,
          ),*/
          Text(
            'Back',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
      onTap: () => Navigator.pop(context),
    );
  }


  IconButton _partialSettingsIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
        //Añadir función captura de pantalla _screenCapture()
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return PartialCalcSettings();
          },
        );
      },
    );
  }

  IconButton _fullSettingsIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
        //Añadir función captura de pantalla _screenCapture()
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return FullCalcSettings();
          },
        );
      },
    );
  }

  IconButton _screenshotIcon(BuildContext context) {
    return IconButton(
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
    );
  }
}
