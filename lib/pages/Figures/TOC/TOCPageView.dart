import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../FigureViewPage.dart';

class TOCPageView extends StatefulWidget {
  final initialPage;

  TOCPageView(this.initialPage);

  @override
  _TOCPageViewState createState() => _TOCPageViewState();
}

class _TOCPageViewState extends State<TOCPageView> {
  PageController controller;

  var numTableContents = 4;

  var tableContentsIndex = [
    "TOC1",
    "TOC2",
    "TOC3",
    "TOC4",
  ];
  var tableContentsInfo = {
    "TOC1": ['toc_1', 'toc/TOC1.png', '/TOCPV1'],
    "TOC2": ['toc_2', 'toc/TOC2.png', '/TOCPV2'],
    "TOC3": ['toc_3', 'toc/TOC3.png', '/TOCPV3'],
    "TOC4": ['toc_4', 'toc/TOC4.png', '/TOCPV4'],
  };

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
          children: _buildChildren(),
        ));
  }

  List<Widget> _buildChildren() {
    List<Widget> widgets = [];
    for (int i = 0; i < numTableContents; i++) {
      widgets.add(FigureViewPage(
          title: tableContentsInfo[tableContentsIndex[i]][0],
          url: tableContentsInfo[tableContentsIndex[i]][1],
          bottomSheet: BottomNavigationSheet(i, '/TOCPV', numTableContents)));
    }
    return widgets;
  }
}
