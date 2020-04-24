import 'package:flutter/material.dart';

import '../CommonPages/CommonPageWithBottomNav.dart';

class CommonPageView extends StatefulWidget {
  final initialPage;
  final data;
  final type;

  CommonPageView({this.initialPage, this.data, this.type});

  @override
  _CommonPageViewState createState() => _CommonPageViewState();
}

class _CommonPageViewState extends State<CommonPageView> {
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
    var numPages = widget.data.length;

    List<Widget> widgets = [];
    for (int i = 0; i < numPages; i++) {
      widgets.add(
        CommonPageWithBottomNav(
          title: widget.data[i][0],
          data: widget.data[i][1],
          route: widget.data[i][2],
          initialPage: widget.data[i][3],
          type: widget.type,
          numPages: numPages,
        ),
      );
    }

    return Scaffold(
        body: PageView(
      controller: controller,

      children: widgets,

      //<Widget>[

      /*CommonPageWithBottomNav(
              title: widget.data[0][0],//'module_1',
              data: widget.data[0][1],//module1Chapters,
              route: widget.data[0][2],//'/ModulePV',
              initialPage: widget.data[0][3],
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
            ),*/
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

            ),*/

      //Module1Page(),
      //Module2Page(),
      //Module3Page(),
      //],
    ));
  }
}
