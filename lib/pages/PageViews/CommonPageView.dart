import 'package:flutter/material.dart';

import '../CommonPages/common_page_bottom_nav.dart';

class CommonPageView extends StatefulWidget {
  final initialPage;
  final data;
  final type;

  CommonPageView({this.initialPage, this.data, this.type});

  @override
  _CommonPageViewState createState() => _CommonPageViewState();
}

class _CommonPageViewState extends State<CommonPageView> {
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
    var numPages = widget.data.length;

    List<Widget> widgets = [];
    for (int i = 0; i < numPages; i++) {
      widgets.add(
        CommonPageWithBottomNav(
          title: widget.data[i][0],
          data: widget.data[i][1],
          route: widget.data[i][2],
          initialPage: widget.data[i][3],
          type: widget.type,
          numPages: numPages,
        ),
      );
    }

    return Scaffold(
      body: PageView(
        controller: controller,
        children: widgets,
      ),
    );
  }
}
