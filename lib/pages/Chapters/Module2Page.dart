import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../CommonGridPage.dart';

class Module2Page extends StatefulWidget {
  @override
  _Module2PageState createState() => _Module2PageState();
}

class _Module2PageState extends State<Module2Page> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuWidget(),
        appBar: CustomAppBar(context, 'module_2'),
        body: CommonGridPage(data: chaptersMod2),
        bottomSheet: BottomNavigationSheet(1, '/ModulePV', numModules));
  }
}
