import 'package:flutter/material.dart';
import 'package:hepapp/forms/partial_calc_settings.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/FullCalcSettings.dart';


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
    var aux = AppLocalizations.of(context);

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
                aux.tr(widget.title),
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
        (widget.selScreenshot == true) ? _screenshotIcon(context) : Container(),
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
        'assets/images/homeicon.png',
        width: 18,
        height: 18,
      ),
      onPressed: () => Navigator.pushReplacementNamed(context, '/'),
    );
  }

  GestureDetector _backIcon(BuildContext context) {
    var aux = AppLocalizations.of(context);

    return GestureDetector(
      child: Container(
        height: double.infinity,
        child: Row(
          children: <Widget>[
            Icon(Icons.keyboard_arrow_left),
            Text(
              aux.tr('back'),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.pop(context),
    );
  }

  IconButton _partialSettingsIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
        //TODO Añadir función captura de pantalla _screenCapture()
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
        //Añadir función fullSettings()
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
