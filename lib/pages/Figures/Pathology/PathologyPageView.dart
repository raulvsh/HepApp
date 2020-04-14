import 'package:flutter/material.dart';
import 'package:hepapp/data/pathology_1.dart';
import 'package:hepapp/data/pathology_2.dart';

import '../../CommonPageWithBottomNav.dart';

class PathologyPageView extends StatefulWidget {
  final initialPage;

  PathologyPageView(this.initialPage);

  @override
  _PathologyPageViewState createState() => _PathologyPageViewState();
}

class _PathologyPageViewState extends State<PathologyPageView> {
  PageController controller = PageController();

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
              title: 'pathology_section_1',
              data: pathology1,
              route: '/PathologyPV',
              type: 'figure',

            ),
            CommonPageWithBottomNav(
              title: 'pathology_section_2',
              data: pathology2,
              route: '/PathologyPV',

              type: 'figure',
            ),
            //Pathology1Page(),
            //Pathology2Page(),
          ],
        ));
  }
}
