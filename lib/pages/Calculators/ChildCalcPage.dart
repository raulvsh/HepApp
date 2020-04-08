/*
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/forms/ChildCalcForm.dart';
import 'package:hepapp/widgets/CalcBottomButton.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:image_picker_saver/image_picker_saver.dart';

import 'Dart:ui' as ui;

class ChildCalcPage extends StatefulWidget {
  @override
  _ChildCalcPageState createState() => _ChildCalcPageState();
}

class _ChildCalcPageState extends State<ChildCalcPage> {
  //static GlobalKey previewContainer = new GlobalKey();
  static GlobalKey screen = new GlobalKey();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        context,
        'child_pugh_score',
        selScreenshot: true,
        selPartialSettings: true,
      ),
      drawer: MenuWidget(),
      body: RepaintBoundary(
        key: screen,
        child: Center(
          child: ChildCalcForm(),
        ),
      ),
      //bottomSheet: _buildBottomSheet(),
      //CalcBottomBar("reseteo2"),
      floatingActionButton: new FloatingActionButton(
        onPressed: takeScreenShot,
        tooltip: 'screenshot',
        child: new Icon(Icons.camera),
      ),
    );
  }

  _buildBottomSheet() {
    //ButtonActions actions = ButtonActions();

    return //CalcBottomBar("reseteo2");


      BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            CalcBottomButton("Reset", action: reset),
            CalcBottomButton("Previous values", action: _previous),
            CalcBottomButton("More information", action: _information),

          ],
        ),
      );

    // CalcBottomBar("reseteo2");
  }


  reset() {
    print('reset pulsado prueba');
    return AlertDialog(
      title: Text("Reset Values"),
      content: Text("reset"),
      elevation: 1.0,
    );
  }

  //TODO hacer método previous
  _previous() {
    return AlertDialog(
      title: Text("Previous Values"),
      content: Text("Valores Anteriores"),
    );
  }

  //TODO hacer método information

  _information() {
    return AlertDialog(
      title: Text("More information"),
      content: Text("Informacion adicional"),
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
*/
