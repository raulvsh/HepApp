import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';

import 'DetailPageWidgets/FigureDetailPage.dart';

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

  /*static var schemes = [
    ['scheme_1', 'schemes/Scheme_1_Jaundice.png', '/SchemesPV'],
    ['scheme_2', 'schemes/Scheme_2_AbN_Liver_Tests.png', '/SchemesPV'],
    ['scheme_3', 'schemes/Scheme_3_Hepatomegaly.png', '/SchemesPV'],
    ['scheme_4', 'schemes/Scheme_4_Splenomegaly.png', '/SchemesPV'],
    ['scheme_5', 'schemes/Scheme_5_Liver_Mass.png', '/SchemesPV'],
    ['scheme_6', 'schemes/Scheme_6_UGI_Bleed.png', '/SchemesPV'],
    ['scheme_7', 'schemes/Scheme_7_Abdominal_Distention.png', '/SchemesPV'],
    ['scheme_8', 'schemes/Scheme_8_Decreased_LOC.png', '/SchemesPV'],
  ];*/
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
    ));
  }

  List<Widget> _buildChildren() {
    List<Widget> widgets = [];
    for (int i = 0; i < numPages; i++) {
      widgets.add(FigureDetailPage(
          title: widget.data[i][0],
          url: widget.data[i][1],
          bottomSheet: BottomNavigationSheet(
              widget.initialPage, widget.route, numPages)));
    }
    return widgets;
  }
}
