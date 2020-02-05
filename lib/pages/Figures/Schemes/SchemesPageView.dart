import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../FigureViewPage.dart';

class SchemesPageView extends StatefulWidget {
  final initialPage;

  SchemesPageView(this.initialPage);

  @override
  _SchemesPageViewState createState() => _SchemesPageViewState();
}

class _SchemesPageViewState extends State<SchemesPageView> {
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

  /*final numSchemes = 8;

  var schemesIndex = [
    "Scheme1",
    "Scheme2",
    "Scheme3",
    "Scheme4",
    "Scheme5",
    "Scheme6",
    "Scheme7",
    "Scheme8",
  ];

  var schemesInfo = {
    //"Scheme1": ['scheme_1', 'schemes/Scheme 1 Jaundice.png', '/SchemePV1'],
    "Scheme1": ['scheme_1', 'schemes/Scheme 1 Jaundice.png', '/SchemesPV1'],
    "Scheme2": [
      'scheme_2',
      'schemes/Scheme 2 AbN Liver Tests.png',
      '/SchemesPV2'
    ],
    "Scheme3": ['scheme_3', 'schemes/Scheme 3 Hepatomegaly.png', '/SchemesPV3'],
    "Scheme4": ['scheme_4', 'schemes/Scheme 4 Splenomegaly.png', '/SchemesPV4'],
    "Scheme5": ['scheme_5', 'schemes/Scheme 5 Liver Mass.png', '/SchemesPV5'],
    "Scheme6": ['scheme_6', 'schemes/Scheme 6 UGI Bleed.png', '/SchemesPV6'],
    "Scheme7": [
      'scheme_7',
      'schemes/Scheme 7 Abdominal Distention.png',
      '/SchemesPV7'
    ],
    "Scheme8": [
      'scheme_8',
      'schemes/Scheme 8 Decreased LOC.png',
      '/SchemesPV8'
    ],
  };*/

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
/*
  _buildBottomSheet(int i, url) {
    List<IconButton> widgets = [];
    var backIcon = IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Theme.of(context).primaryColor,
      onPressed: () => Navigator.pushReplacementNamed(context, '$url$i'),
    );

    var nextIcon = IconButton(
      icon: Icon(Icons.arrow_forward_ios),
      color: Theme.of(context).primaryColor,
      onPressed: () => Navigator.pushReplacementNamed(context, '$url${i + 2}'),
    );

    if (i == 0) {
      widgets.add(nextIcon);
    } else if (i == numSchemes - 1) {
      widgets.add(backIcon);
    } else {
      widgets.add(backIcon);
      widgets.add(nextIcon);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: widgets,
    );
  }*/
}
