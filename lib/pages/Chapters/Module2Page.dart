import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../CommonGridPage.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Module2Page extends StatefulWidget {
  @override
  _Module2PageState createState() => _Module2PageState();
}

class _Module2PageState extends State<Module2Page> {
  //String assetPDFPath = "";
  final numModules = 3;

  static var chaptersMod2 = [
    ['chapter_4', 'items/1_chapters.png', 'HepAPP_M2C4.pdf', 'PDF'],
    ['chapter_5', 'items/1_chapters.png', 'HepAPP_M2C5.pdf', 'PDF'],
    ['chapter_6', 'items/1_chapters.png', 'HepAPP_M2C6.pdf', 'PDF'],
    ['chapter_7', 'items/1_chapters.png', 'HepAPP_M2C7.pdf', 'PDF'],
    ['chapter_8', 'items/1_chapters.png', 'HepAPP_M2C8.pdf', 'PDF'],
    ['chapter_9', 'items/1_chapters.png', 'HepAPP_M2C9.pdf', 'PDF'],
  ];

  var numChaptersModule2 = chaptersMod2.length;

  @override
  void initState() {
    super.initState();
  }

/*Construcción del Layout del menú principal*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: MenuWidget(),
        appBar: CustomAppBar(context, 'module_2'),
        body: CommonGridPage(data: chaptersMod2),

        /*OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),*/
        bottomSheet: BottomNavigationSheet(1, '/ModulePV', numModules));
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
    for (int i = 0; i < numChaptersModule2; i++) {
      widgets.add(ComboButton(context, chaptersMod2[i]));

      */ /*     widgets.add(PDFButton(context, chaptersMod2[i],
          'module_2_chapter_${i + 4}'));*/ /*
    }
    return widgets;
  }
*/
}
