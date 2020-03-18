import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../../DetailPageWidgets/DrawingDetailPage.dart';

class DrawingPageView extends StatefulWidget {
  final initialPage;

  DrawingPageView(this.initialPage);

  @override
  _DrawingPageViewState createState() => _DrawingPageViewState();
}

class _DrawingPageViewState extends State<DrawingPageView> {
  PageController controller;

  static var draws = [
    ['anatomy', 'drawing/Doodle_Figure_1.png', '/DrawingPV'],
    ['anterior_view_liver', 'drawing/Doodle_Figure_2.png', '/DrawingPV'],
    ['posterior_view_liver', 'drawing/Doodle_Figure_3.png', '/DrawingPV'],
    ['portal_circulation', 'drawing/Doodle_Figure_4.png', '/DrawingPV'],
    [
      'liver_stomach_pancreas_gall_bladder',
      'drawing/Doodle_Figure_5.png',
      '/DrawingPV'
    ],
    ['liver_vasculature', 'drawing/Doodle_Figure_6.png', '/DrawingPV'],
    ['liver_histology', 'drawing/Doodle_Figure_7.png', '/DrawingPV'],
    ['liver_cell', 'drawing/Doodle_Figure_8.png', '/DrawingPV'],
  ];

  var numDraws = draws.length;

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
      body: DrawingDetailPage(
        title: draws[widget.initialPage][0],
        url: draws[widget.initialPage][1],
        bottomSheet:
            BottomNavigationSheet(widget.initialPage, '/DrawingPV', numDraws),
      ),
    );
  }

/*@override
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
    for (int i = 0; i < numDraws; i++) {
      widgets.add(DrawingDetailPage(
          title: draws[i][0],
          url: draws[i][1],),);

    }

    return widgets;
  }*/
}
