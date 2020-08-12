import 'package:flutter/material.dart';
import 'package:hepapp/pages/widgets_navigation/bottom_navigation_sheet.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:screenshot/screenshot.dart';

import 'common_grid_page.dart';

class CommonPageWithBottomNav extends StatefulWidget {
  final title;
  final data;
  final type;
  final route;
  final initialPage;
  final numPages;

  CommonPageWithBottomNav({
    this.title,
    this.data,
    this.type,
    this.route,
    this.initialPage,
    this.numPages,
  });

  @override
  _CommonPageWithBottomNavState createState() =>
      _CommonPageWithBottomNavState();
}

class _CommonPageWithBottomNavState extends State<CommonPageWithBottomNav> {
  ScreenshotController commonScreenShotController = ScreenshotController();

  /*void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: commonScreenShotController,
      child: Scaffold(
        drawer: MenuWidget(),
        appBar: CustomAppBar(
          widget.title,
          screenshotController: commonScreenShotController,
        ),
        body: Stack(
          children: <Widget>[
            CommonGridPage(
              data: widget.data,
              type: widget.type,
            ),
            BottomNavigationSheet(
                widget.initialPage, widget.route, widget.numPages),
          ],
        ),
      ),
    );
  }
}
