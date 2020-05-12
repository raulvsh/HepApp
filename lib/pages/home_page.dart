import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hepapp/data/home_sections.dart';
import 'package:hepapp/pages/CommonPages/common_grid_page.dart';
import 'package:hepapp/widgets/home_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numHomeSections = homeSections.length;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: HomeAppBar(context),
      ),
      body: RepaintBoundary(
        //key: mainScaffold,
        child: CommonGridPage(
          data: homeSections,
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: takeScreenShot,
        child: new Icon(Icons.add_to_home_screen),
      ),*/
    );
  }

/* takeScreenShot() async {
    RenderRepaintBoundary boundary = mainScaffold.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage(pixelRatio: 3);
    ByteData byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    var filePath = await ImagePickerSaver.saveFile(
        fileData: byteData.buffer.asUint8List());
    print(filePath);
  }*/
}
