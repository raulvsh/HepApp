import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../FigureDetailPage.dart';

class MapsDetailPage extends StatefulWidget {
  final initialPage;

  MapsDetailPage(this.initialPage);

  @override
  _MapsDetailPageState createState() => _MapsDetailPageState();
}

class _MapsDetailPageState extends State<MapsDetailPage> {
  PageController controller;

  static var maps = [
    ['map_1', 'maps/Map01_HAV.png', '/MapsPV1'],
    ['map_2', 'maps/Map02_HBV.png', '/MapsPV2'],
    ['map_3', 'maps/Map03_HCV.png', '/MapsPV3'],
    ['map_4', 'maps/Map04_HDV.png', '/MapsPV4'],
    ['map_5', 'maps/Map05_HEV.png', '/MapsPV5'],
    ['map_6', 'maps/Map06_Alcohol.png', '/MapsPV6'],
    ['map_7', 'maps/Map07_Obesity.png', '/MapsPV7'],
  ];

  var numMaps = maps.length;


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
    for (int i = 0; i < numMaps; i++) {
      widgets.add(FigureViewPage(
          title: maps[i][0],
          url: maps[i][1],
          //bottomSheet: _buildBottomSheet(i,'/SchemesPV')));
          bottomSheet: BottomNavigationSheet(i, '/MapsPV', numMaps)));
    }

    /*for (int i = 0; i < numMaps; i++) {
      widgets.add(FigureViewPage(
          title: mapsInfo[mapsIndex[i]][0],
          url: mapsInfo[mapsIndex[i]][1],
          //bottomSheet: _buildBottomSheet(i,'/SchemesPV')));
          bottomSheet: BottomNavigationSheet(i, '/MapsPV', numMaps)));
    }*/
    return widgets;
  }
}
