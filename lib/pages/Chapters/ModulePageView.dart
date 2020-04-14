import 'package:flutter/material.dart';
import 'package:hepapp/data/module_1_chapters.dart';
import 'package:hepapp/data/module_2_chapters.dart';
import 'package:hepapp/data/module_3_chapters.dart';

import '../CommonPageWithBottomNav.dart';

class ModulePageView extends StatefulWidget {
  final initialPage;

  ModulePageView(this.initialPage);

  @override
  _ModulePageViewState createState() => _ModulePageViewState();
}

class _ModulePageViewState extends State<ModulePageView> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: controller,
          children: <Widget>[
            CommonPageWithBottomNav(
              title: 'module_1',
              data: module1Chapters,
              route: '/ModulePV',
            ),
            CommonPageWithBottomNav(
              title: 'module_2',
              data: module2Chapters,
              route: '/ModulePV',
            ),
            CommonPageWithBottomNav(
              title: 'module_3',
              data: module3Chapters,
              route: '/ModulePV',
            ),

            //Module1Page(),
            //Module2Page(),
            //Module3Page(),
          ],
        ));
  }
}
