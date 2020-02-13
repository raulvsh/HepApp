import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import 'DrawingDetailPage.dart';

class DrawingPageView extends StatefulWidget {
  final initialPage;

  DrawingPageView(this.initialPage);

  @override
  _DrawingPageViewState createState() => _DrawingPageViewState();
}

class _DrawingPageViewState extends State<DrawingPageView> {
  PageController controller;

  static var draws = [
    ['anatomy', 'drawing/Doodle Figure 1.png', '/DrawingPV'],
    ['anterior_view_liver', 'drawing/Doodle Figure 2.png', '/DrawingPV'],
    ['posterior_view_liver', 'drawing/Doodle Figure 3.png', '/DrawingPV'],
    ['portal_circulation', 'drawing/Doodle Figure 4.png', '/DrawingPV'],
    [
      'liver_stomach_pancreas_gall_bladder',
      'drawing/Doodle Figure 5.png',
      '/DrawingPV'
    ],
    ['liver_vasculature', 'drawing/Doodle Figure 6.png', '/DrawingPV'],
    ['liver_histology', 'drawing/Doodle Figure 7.png', '/DrawingPV'],
    ['liver_cell', 'drawing/Doodle Figure 8.png', '/DrawingPV'],
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
