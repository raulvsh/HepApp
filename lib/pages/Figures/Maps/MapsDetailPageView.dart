import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';

import '../../DetailPageWidgets/FigureDetailPage.dart';

class MapsDetailPageView extends StatefulWidget {
  final initialPage;

  MapsDetailPageView(this.initialPage);

  @override
  _MapsDetailPageViewState createState() => _MapsDetailPageViewState();
}

class _MapsDetailPageViewState extends State<MapsDetailPageView> {
  PageController controller;

  static var maps = [
    ['map_1', 'maps/Map01_HAV.png', '/MapsPV'],
    ['map_2', 'maps/Map02_HBV.png', '/MapsPV'],
    ['map_3', 'maps/Map03_HCV.png', '/MapsPV'],
    ['map_4', 'maps/Map04_HDV.png', '/MapsPV'],
    ['map_5', 'maps/Map05_HEV.png', '/MapsPV'],
    ['map_6', 'maps/Map06_Alcohol.png', '/MapsPV'],
    ['map_7', 'maps/Map07_Obesity.png', '/MapsPV'],
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
        body: PageView(
          controller: controller,
          children: _buildChildren(),
        ));
  }

  List<Widget> _buildChildren() {
    List<Widget> widgets = [];
    for (int i = 0; i < numMaps; i++) {
      widgets.add(FigureDetailPage(
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
