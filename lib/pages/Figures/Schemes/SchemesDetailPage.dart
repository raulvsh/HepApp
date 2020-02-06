import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../FigureViewPage.dart';

class SchemesDetailPage extends StatefulWidget {
  final initialPage;

  SchemesDetailPage(this.initialPage);

  @override
  _SchemesDetailPageState createState() => _SchemesDetailPageState();
}

class _SchemesDetailPageState extends State<SchemesDetailPage> {
  PageController controller;

  static var Schemes = [
    ['scheme_1', 'schemes/Scheme 1 Jaundice.png', '/SchemesPV1'],
    ['scheme_2', 'schemes/Scheme 2 AbN Liver Tests.png', '/SchemesPV2'],
    ['scheme_3', 'schemes/Scheme 3 Hepatomegaly.png', '/SchemesPV3'],
    ['scheme_4', 'schemes/Scheme 4 Splenomegaly.png', '/SchemesPV4'],
    ['scheme_5', 'schemes/Scheme 5 Liver Mass.png', '/SchemesPV5'],
    ['scheme_6', 'schemes/Scheme 6 UGI Bleed.png', '/SchemesPV6'],
    ['scheme_7', 'schemes/Scheme 7 Abdominal Distention.png', '/SchemesPV7'],
    ['scheme_8', 'schemes/Scheme 8 Decreased LOC.png', '/SchemesPV8'],
  ];


  var numSchemes = Schemes.length;

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
      widgets.add(FigureViewPage(
          title: Schemes[i][0],
          url: Schemes[i][1],
          //bottomSheet: _buildBottomSheet(i,'/SchemesPV')));
          bottomSheet: BottomNavigationSheet(i, '/SchemesPV', numSchemes)));
    }
    return widgets;
  }
}
