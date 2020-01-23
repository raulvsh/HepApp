import 'package:flutter/material.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import 'FigureViewPage.dart';

class TOCPageView extends StatefulWidget {
  final initialPage;

  TOCPageView(this.initialPage);

  @override
  _TOCPageViewState createState() => _TOCPageViewState();
}

class _TOCPageViewState extends State<TOCPageView> {
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
        drawer: MenuWidget(),
        body: PageView(
          controller: controller,
          children: <Widget>[
            FigureViewPage(
              title: 'toc_1',
            ),
            FigureViewPage(
              title: 'toc_2',
            ),
            FigureViewPage(
              title: 'toc_3',
            ),
          ],
        ));
  }
}
