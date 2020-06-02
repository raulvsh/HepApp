import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class ScreenShotButton extends StatefulWidget {
  final screenshotController;
  final double iconSize;

  ScreenShotButton(this.screenshotController, {this.iconSize = 25});

  @override
  _ScreenShotButtonState createState() => _ScreenShotButtonState();
}

class _ScreenShotButtonState extends State<ScreenShotButton> {
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    AppLocalizations aux = AppLocalizations.of(context);
    return IconButton(
      onPressed: () {
        _imageFile = null;
        widget.screenshotController
            .capture(
          pixelRatio: 3.0,
        )
            .then((File image) async {
          setState(() {
            _imageFile = image;
          });
          final result =
              await ImageGallerySaver.saveImage(image.readAsBytesSync());
          print("File Saved to Gallery");
          Scaffold.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Theme
                  .of(context)
                  .primaryColor
                  .withOpacity(100),
              content: Text(aux.tr('screenshot_saved')),
            ),
          );
        }).catchError((onError) {
          print(onError);
        });
      },
      icon: Icon(
        Icons.camera_alt,
        color: Colors.white,
        size: widget.iconSize,
      ),
    );
  }
}
