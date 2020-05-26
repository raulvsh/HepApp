import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hepapp/data/home_sections.dart';
import 'package:hepapp/pages/widgets_navigation/home_appbar.dart';
import 'package:image_picker_saver/image_picker_saver.dart';

import 'common_pages/common_grid_page.dart';

final String scrawlImagePath = '/screen_shot_scraw.png';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numHomeSections = homeSections.length;
  GlobalKey mainScaffold = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: mainScaffold,
      child: Scaffold(
        resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: HomeAppBar(),
        ),
        body: //RepaintBoundary(
            //child:
            CommonGridPage(
          data: homeSections,
          //),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: takeScreenShot,
          child: Icon(Icons.add_to_home_screen),
          mini: true,

        ),
      ),
    );
  }

  takeScreenShot() async {
    await Future<void>.delayed(Duration(milliseconds: 500));

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
  }
}
