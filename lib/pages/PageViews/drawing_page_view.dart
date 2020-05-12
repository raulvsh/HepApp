import 'package:flutter/material.dart';
import 'package:hepapp/data/draws.dart';
import 'package:hepapp/pages/DetailPages/drawing_detail_page.dart';
import 'package:hepapp/widgets/bottom_navigation_sheet.dart';
import 'package:hepapp/widgets/drawer_menu.dart';

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
