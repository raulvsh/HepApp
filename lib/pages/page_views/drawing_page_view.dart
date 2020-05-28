import 'package:flutter/material.dart';
import 'package:hepapp/pages/detail_pages/drawing_detail_page.dart';
import 'package:hepapp/pages/widgets_navigation/bottom_navigation_sheet.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';

import 'file:///D:/GitHub/HepApp/lib/data/figures/draws.dart';

class DrawingPageView extends StatefulWidget {
  final initialPage;

  DrawingPageView(this.initialPage);

  @override
  _DrawingPageViewState createState() => _DrawingPageViewState();
}

class _DrawingPageViewState extends State<DrawingPageView> {
  PageController controller;
  var numDraws = draws.length;

  @override
  void initState() {
    controller = PageController(
      initialPage: widget.initialPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(),
      body: DrawingDetailPage(
        title: draws[widget.initialPage][0],
        url: draws[widget.initialPage][1],
        bottomSheet:
            BottomNavigationSheet(widget.initialPage, '/DrawingPV', numDraws),
      ),
    );
  }
}
