import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
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
  ScreenshotController screenshotController = ScreenshotController();

  GlobalKey commonKey = GlobalKey();
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Stack(
            children: <Widget>[
              CustomAppBar(widget.title),
            ],
          ),
        ),
        drawer: MenuWidget(),
        body: CommonGridPage(
          data: widget.data,
          type: widget.type,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _imageFile = null;
            screenshotController.capture().then((File image) async {
              //print("Capture Done");
              setState(() {
                _imageFile = image;
              });
              final result = await ImageGallerySaver.saveImage(image
                  .readAsBytesSync()); // Save image to gallery,  Needs plugin  https://pub.dev/packages/image_gallery_saver
              print("File Saved to Gallery");
            }).catchError((onError) {
              print(onError);
            });
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
