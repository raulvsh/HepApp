import 'package:flutter/material.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:screenshot/screenshot.dart';

import 'common_grid_page.dart';

class CommonPage extends StatefulWidget {
  final title;
  final data;
  final type;

  CommonPage({
    this.title,
    this.data,
    this.type,
  });

  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  ScreenshotController screenShotController = ScreenshotController();

  /*void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);    super.initState();
  }*/
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenShotController,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Stack(
            children: <Widget>[
              CustomAppBar(
                widget.title,
                screenshotController: screenShotController,
              ),
            ],
          ),
        ),
        drawer: MenuWidget(),
        body: CommonGridPage(
          data: widget.data,
          type: widget.type,
        ),
      ),
    );
  }
}
