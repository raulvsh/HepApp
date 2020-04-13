import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../CommonGridPage.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Module1Page extends StatefulWidget {
  @override
  _Module1PageState createState() => _Module1PageState();
}

class _Module1PageState extends State<Module1Page> {
  String assetPDFPath = "";
  final numModules = 3;

  static var chaptersMod1 = [
    ['chapter_1', 'items/1_chapters.png', 'HepAPP_M1C1.pdf', 'PDF'],
    ['chapter_2', 'items/1_chapters.png', 'HepAPP_M1C2.pdf', 'PDF'],
    ['chapter_3', 'items/1_chapters.png', 'HepAPP_M1C3.pdf', 'PDF'],
  ];

  // var numChaptersModule1 = chaptersMod1.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //No haría falta al no escribirse nunca

        appBar: CustomAppBar(context, 'module_1'),

        drawer: MenuWidget(),
        body: CommonGridPage(data: chaptersMod1),
        /*OrientationBuilder(
          builder: (context, orientation) {
            return _buildLayout(orientation);
          },
        ),*/
        //bottomSheet: _buildBottomSheet(context),
        bottomSheet: BottomNavigationSheet(0, '/ModulePV', numModules));
  }

/*_buildLayout(orientation) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    var padding = width / 100;

    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.lightBlueAccent,
      child: FractionallySizedBox(
        widthFactor: orientation == Orientation.portrait ? 0.7 : 0.7,
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.symmetric(vertical: 20 * padding)
              : EdgeInsets.symmetric(vertical: 4 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildChaptersGridView(),
        ),
      ),
    );
  }

  _buildChaptersGridView() {
    List<Widget> widgets = [];
    for (int i = 0; i < numChaptersModule1; i++) {
      widgets.add(ComboButton(context, chaptersMod1[i]));
      */ /*widgets.add(PDFButton(context, ChaptersMod1[i],
          'module_1_chapter_${i + 1}'));*/ /*
    }
    return widgets;
  }*/
}
