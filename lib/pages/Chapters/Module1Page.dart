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
  final numModules = 3;

  static var chaptersMod1 = [
    ['chapter_1', 'items/1_chapters.png', 'HepAPP_M1C1.pdf', 'PDF'],
    ['chapter_2', 'items/1_chapters.png', 'HepAPP_M1C2.pdf', 'PDF'],
    ['chapter_3', 'items/1_chapters.png', 'HepAPP_M1C3.pdf', 'PDF'],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(context, 'module_1'),
        drawer: MenuWidget(),
        body: CommonGridPage(data: chaptersMod1),
        bottomSheet: BottomNavigationSheet(0, '/ModulePV', numModules));
  }
}
