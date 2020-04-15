import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/data/home_sections.dart';
import 'package:hepapp/pages/CommonGridPage.dart';
import 'package:hepapp/widgets/HomeAppBar.dart';
import 'package:image_picker_saver/image_picker_saver.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numHomeSections = homeSections.length;
  static GlobalKey screen = GlobalKey();

  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 93, 188, 210),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness:  Brightness.light,
    ));*/

    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: HomeAppBar(context),
      ),
      body: RepaintBoundary(
        key: screen,
        child: CommonGridPage(
          data: homeSections,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: takeScreenShot,
        child: new Icon(Icons.add_to_home_screen),
      ),
    );
  }

  takeScreenShot() async {
    RenderRepaintBoundary boundary = screen.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage(pixelRatio: 3);
    ByteData byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    var filePath = await ImagePickerSaver.saveFile(
        fileData: byteData.buffer.asUint8List());
    print(filePath);
  }
}
