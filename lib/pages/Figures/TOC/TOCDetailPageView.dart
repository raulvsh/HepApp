/*
import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';

import '../../DetailPageWidgets/FigureDetailPage.dart';

class TOCDetailPageView extends StatefulWidget {
  final initialPage;

  TOCDetailPageView(this.initialPage);

  @override
  _TOCDetailPageViewState createState() => _TOCDetailPageViewState();
}

class _TOCDetailPageViewState extends State<TOCDetailPageView> {
  PageController controller;

  static var tocs = [
    ['toc_1', 'toc/TOC1.png', '/TOCPV1'],
    ['toc_2', 'toc/TOC2.png', '/TOCPV2'],
    ['toc_3', 'toc/TOC3.png', '/TOCPV3'],
    ['toc_4', 'toc/TOC4.png', '/TOCPV4'],
  ];


  var numTOC = tocs.length;

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
      //drawer: MenuWidget(),
        body: PageView(
          controller: controller,
          children: _buildChildren(),
        ));
  }

  List<Widget> _buildChildren() {
    List<Widget> widgets = [];
    for (int i = 0; i < numTOC; i++) {
      widgets.add(FigureDetailPage(
          title: tocs[i][0],
          url: tocs[i][1],
          bottomSheet: BottomNavigationSheet(i, '/TOCPV', numTOC)));
    }
    return widgets;
  }
}
*/
