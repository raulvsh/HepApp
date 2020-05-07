import 'package:flutter/material.dart';
import 'package:hepapp/pages/DetailPages/figure_detail_page.dart';
import 'package:hepapp/widgets/bottom_navigation_sheet.dart';

class CommonDetailPageView extends StatefulWidget {
  final initialPage;
  final data;
  final route;

  CommonDetailPageView({
    this.initialPage,
    this.data,
    this.route,
  });

  @override
  _CommonDetailPageViewState createState() => _CommonDetailPageViewState();
}

class _CommonDetailPageViewState extends State<CommonDetailPageView> {
  PageController controller;
  var numPages;

  @override
  void initState() {
    super.initState();
    numPages = widget.data.length;
    controller = PageController(
      initialPage: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: _buildChildren(),
      ),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> widgets = [];
    for (int i = 0; i < numPages; i++) {
      widgets.add(
        FigureDetailPage(
          title: widget.data[i][0],
          url: widget.data[i][1],
          bottomSheet: BottomNavigationSheet(i, widget.route, numPages),
        ),
      );
    }
    return widgets;
  }
}
