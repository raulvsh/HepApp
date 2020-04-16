import 'package:flutter/material.dart';
import 'package:hepapp/data/interactive.dart';
import 'package:hepapp/pages/DetailPageWidgets/InteractiveDetailPage.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';

class InteractiveDetailPageView extends StatefulWidget {
  final initialPage;

  InteractiveDetailPageView(this.initialPage);

  @override
  _InteractiveDetailPageViewState createState() =>
      _InteractiveDetailPageViewState();
}

class _InteractiveDetailPageViewState extends State<InteractiveDetailPageView> {
  PageController controller;

  var numInteractive = interactive.length;

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
        children: _buildChildren(),
      ),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> widgets = [];
    for (int i = 0; i < numInteractive; i++) {
      widgets.add(InteractiveDetailPage(
          title: interactive[i][0],
          img1: interactive[i][1],
          img2: interactive[i][3],
          txt1: interactive[i][4],
          txt2: interactive[i][5],
          bottomSheet:
              BottomNavigationSheet(i, '/InteractivePV', numInteractive)));
    }
    return widgets;
  }
}
