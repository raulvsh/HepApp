import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../FigureDetailPage.dart';

class SchemesDetailPage extends StatefulWidget {
  final initialPage;

  SchemesDetailPage(this.initialPage);

  @override
  _SchemesDetailPageState createState() => _SchemesDetailPageState();
}

class _SchemesDetailPageState extends State<SchemesDetailPage> {
  PageController controller;

  static var schemes = [
    ['scheme_1', 'schemes/Scheme_1_Jaundice.png', '/SchemesPV'],
    ['scheme_2', 'schemes/Scheme_2_AbN_Liver_Tests.png', '/SchemesPV'],
    ['scheme_3', 'schemes/Scheme_3_Hepatomegaly.png', '/SchemesPV'],
    ['scheme_4', 'schemes/Scheme_4_Splenomegaly.png', '/SchemesPV'],
    ['scheme_5', 'schemes/Scheme_5_Liver_Mass.png', '/SchemesPV'],
    ['scheme_6', 'schemes/Scheme_6_UGI_Bleed.png', '/SchemesPV'],
    ['scheme_7', 'schemes/Scheme_7_Abdominal_Distention.png', '/SchemesPV'],
    ['scheme_8', 'schemes/Scheme_8_Decreased_LOC.png', '/SchemesPV'],
  ];

  var numSchemes = schemes.length;

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
    for (int i = 0; i < numSchemes; i++) {
      widgets.add(FigureDetailPage(
          title: schemes[i][0],
          url: schemes[i][1],
          bottomSheet: BottomNavigationSheet(i, '/SchemesPV', numSchemes)));
    }
    return widgets;
  }
}
