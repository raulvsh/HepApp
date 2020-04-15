/*
import 'package:flutter/material.dart';
import 'package:hepapp/data/module_1_chapters.dart';
import 'package:hepapp/data/module_2_chapters.dart';
import 'package:hepapp/data/module_3_chapters.dart';
import 'package:hepapp/data/modules_page_view.dart';

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
 var numPages = modulesPageView.length;
  @override
  Widget build(BuildContext context) {
    //print(module1Chapters);
    //print(module2Chapters);
    //print(module3Chapters);

    return Scaffold(
        body: PageView(
          controller: controller,
          children: <Widget>[
            CommonPageWithBottomNav(
              title: modulesPageView[0][0],//'module_1',
              data: modulesPageView[0][1],//module1Chapters,
              route: modulesPageView[0][2],//'/ModulePV',
              initialPage: modulesPageView[0][3],
              numPages: numPages,//0,
            ),
            CommonPageWithBottomNav(
              title: modulesPageView[1][0],//'module_1',
              data: modulesPageView[1][1],//module1Chapters,
              route: modulesPageView[1][2],//'/ModulePV',
              initialPage: modulesPageView[1][3],
              numPages: numPages,//0,
            ),
            CommonPageWithBottomNav(
              title: modulesPageView[2][0],//'module_1',
              data: modulesPageView[2][1],//module1Chapters,
              route: modulesPageView[2][2],//'/ModulePV',
              initialPage: modulesPageView[2][3],
              numPages: numPages,//0,
            ),
            */
/*CommonPageWithBottomNav(
              title: 'module_2',
              data: module2Chapters,
              route: '/ModulePV',
              initialPage: 1,

            ),
            CommonPageWithBottomNav(
              title: 'module_3',
              data: module3Chapters,
              route: '/ModulePV',
              initialPage: 2,

            ),*/ /*


            //Module1Page(),
            //Module2Page(),
            //Module3Page(),
          ],
        ));
  }
}
*/
