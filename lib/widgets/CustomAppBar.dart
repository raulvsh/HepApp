import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/full_calc_settings.dart';
import 'package:sized_context/sized_context.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title;
  final bool selScreenshot;
  final bool selFullSettings;
  final bool calcBack;
  final PageController controller;

  CustomAppBar(this.context, this.title,
      {this.selScreenshot,
        this.selFullSettings,
        this.calcBack = false,
        this.controller});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

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
        //height: double.infinity,
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
                  fontSize: isTablet ? 25 : 20,
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
        /*(widget.selPartialSettings == true)
            ? _partialSettingsIcon(context)
            : Container(),*/
      ],
    );
  }

  IconButton _homeIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.home),

      /*Image.asset(
        'assets/images/homeicon.png',
        width: 18,
        height: 18,
      ),*/
      onPressed: () => Navigator.pushReplacementNamed(context, '/'),
    );
  }

  _backIcon(BuildContext context) {
    var aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return GestureDetector(
      onTap: () =>
      widget.calcBack
          ? widget.controller.previousPage(
          duration: Duration(seconds: 1), curve: Curves.easeInOut)
          : Navigator.pop(context),
      child: Container(
        color: Theme
            .of(context)
            .primaryColor,
        height: 60,
        child: Row(
          children: <Widget>[
            Icon(Icons.keyboard_arrow_left),
            Text(
              aux.tr('back'),
              style: TextStyle(
                color: Colors.white,
                fontSize: isTablet ? 14 : 12,
              ),
            ),
          ],
        ),
      ),
    );
  }


  IconButton _fullSettingsIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
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
