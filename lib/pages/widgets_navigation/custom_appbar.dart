import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/shared_preferences/full_calc_settings.dart';
import 'package:hepapp/widgets/screenshot_button.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sized_context/sized_context.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @required
  final String title;
  final bool selScreenshot;
  final bool selFullSettings;
  final bool calcBack;
  final PageController pageController;
  @required
  final ScreenshotController screenshotController;

  CustomAppBar(this.title,
      {this.selScreenshot = true,
      this.selFullSettings = false,
      this.calcBack = false,
      this.pageController,
      this.screenshotController});

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
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      title: Center(
        child: Container(
          width: double.infinity,
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
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      aux.tr(widget.title),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isTablet ? 20 : 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        widget.selScreenshot
            ? ScreenShotButton(widget.screenshotController)
            : Container(),
        widget.selFullSettings ? _fullSettingsIcon(context) : Container(),
      ],
    );
  }

  IconButton _homeIcon(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.home),
      onPressed: () => Navigator.pushReplacementNamed(context, '/'),
    );
  }

  _backIcon(BuildContext context) {
    var aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return GestureDetector(
      onTap: () =>
      widget.calcBack
          ? widget.pageController.previousPage(
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

}
