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
              //_screenShotButton,
              Container(
                  //color: Colors.red,
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
        /*floatingActionButton: FloatingActionButton(
          onPressed: takeScreenShot,
          child: Icon(Icons.add_to_home_screen),
          mini: true,
        ),*/
      ),
    );
  }

/* Container get _screenShotButton {
    AppLocalizations aux = AppLocalizations.of(context);

    return Container(
      margin: EdgeInsets.only(top: 17),
      width: context.widthPx,
      height: 20,
      alignment: Alignment.centerRight,
      child: Builder(
        builder: (context) => IconButton(
            icon: Icon(
              Icons.camera_alt,
              size: 20,
              color: Colors.white,
            ),
            onPressed: () async {
              await takeScreenShot();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text(aux.tr('screenshot_saved')),
                ),
              );
            }),
      ),
    );
  }*/

/* takeScreenShot() async {
    await Future<void>.delayed(Duration(milliseconds: 300));

    RenderRepaintBoundary boundary =
        mainScaffold.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage(pixelRatio: 3);
    ByteData byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    var filePath = await ImagePickerSaver.saveFile(
      fileData: byteData.buffer.asUint8List(),
    );
    print(filePath);
  }*/
}
