import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hepapp/data/home_sections.dart';
import 'package:hepapp/pages/widgets_navigation/home_appbar.dart';
import 'package:hepapp/widgets/screenshot_button.dart';
import 'package:screenshot/screenshot.dart';

import 'common_pages/common_grid_page.dart';

final String scrawlImagePath = '/screen_shot_scraw.png';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numHomeSections = homeSections.length;
  ScreenshotController screenShotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenShotController,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Stack(
            children: <Widget>[
              HomeAppBar(),
              Container(
                  margin: EdgeInsets.only(top: 16),
                  height: 20,
                  alignment: Alignment.centerRight,
                  child: ScreenShotButton(
                    screenShotController,
                    iconSize: 20,
                  )),
            ],
          ),
        ),
        body: CommonGridPage(
          data: homeSections,
        ),
      ),
    );
  }
}
