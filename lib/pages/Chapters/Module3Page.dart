import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../CommonGridPage.dart';

class Module3Page extends StatefulWidget {
  @override
  _Module3PageState createState() => _Module3PageState();
}

class _Module3PageState extends State<Module3Page> {
  final numModules = 3;

  static var chaptersMod3 = [
    ['chapter_10', 'items/1_chapters.png', 'HepAPP_M3C10.pdf', 'PDF'],
    ['chapter_11', 'items/1_chapters.png', 'HepAPP_M3C11.pdf', 'PDF'],
    ['chapter_12', 'items/1_chapters.png', 'HepAPP_M3C12.pdf', 'PDF'],
    ['chapter_13', 'items/1_chapters.png', 'HepAPP_M3C13.pdf', 'PDF'],
    ['chapter_14', 'items/1_chapters.png', 'HepAPP_M3C14.pdf', 'PDF'],
    ['chapter_15', 'items/1_chapters.png', 'HepAPP_M3C15.pdf', 'PDF'],
  ];

  var numChaptersModule3 = chaptersMod3.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuWidget(),
        appBar: CustomAppBar(context, 'module_3'),
        body: CommonGridPage(data: chaptersMod3),
        bottomSheet: BottomNavigationSheet(2, '/ModulePV', numModules));
  }
}
