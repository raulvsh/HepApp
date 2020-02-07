import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../FigureDetailPage.dart';

class PathologyDetailPage extends StatefulWidget {
  var initialPage;

  PathologyDetailPage(this.initialPage);

  @override
  _PathologyDetailPageState createState() => _PathologyDetailPageState();
}

class _PathologyDetailPageState extends State<PathologyDetailPage> {
  PageController controller;

  static var pathology = [
    [
      'pathology_1',
      'pathology/Pathology01_Normal_Histology.png',
      '/PathologyPV'
    ],
    ['pathology_2', 'pathology/Pathology02_Cirrhosis.png', '/PathologyPV'],
    ['pathology_3', 'pathology/Pathology03_PBC.png', '/PathologyPV'],
    ['pathology_4', 'pathology/Pathology04_PSC.png', '/PathologyPV'],
    ['pathology_5', 'pathology/Pathology05_Cholestasis.png', '/PathologyPV'],
    ['pathology_6', 'pathology/Pathology06_Granuloma.png', '/PathologyPV'],
    [
      'pathology_7',
      'pathology/Pathology07_Hemochromatosis.png',
      '/PathologyPV'
    ],
    ['pathology_8', 'pathology/Pathology08_A1AT_def.png', '/PathologyPV'],
    [
      'pathology_9',
      'pathology/Pathology01_Normal_Histology.png',
      '/PathologyPV'
    ],
  ];

  var numPathologies = pathology.length;

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
    for (int i = 0; i < numPathologies; i++) {
      widgets.add(FigureViewPage(
          title: pathology[i][0],
          url: pathology[i][1],
          //bottomSheet: _buildBottomSheet(i,'/SchemesPV')));
          bottomSheet:
              BottomNavigationSheet(i, '/PathologyDetail', numPathologies)));
    }

    return widgets;
  }
}
