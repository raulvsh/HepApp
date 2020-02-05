import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../FigureViewPage.dart';

class MapsPageView extends StatefulWidget {
  var initialPage;

  MapsPageView(this.initialPage);

  @override
  _MapsPageViewState createState() => _MapsPageViewState();
}

class _MapsPageViewState extends State<MapsPageView> {
  PageController controller;

/*
  var mapsIndex = [
    "Map1",
    "Map2",
    "Map3",
    "Map4",
    "Map5",
    "Map6",
    "Map7",
  ];

  var mapsInfo = {
    "Map1": ['map_1', 'maps/Map01_HAV.png', '/MapsPV1'],
    "Map2": ['map_2', 'maps/Map02_HBV.png', '/MapsPV2'],
    "Map3": ['map_3', 'maps/Map03_HCV.png', '/MapsPV3'],
    "Map4": ['map_4', 'maps/Map04_HDV.png', '/MapsPV4'],
    "Map5": ['map_5', 'maps/Map05_HEV.png', '/MapsPV5'],
    "Map6": ['map_6', 'maps/Map06_Alcohol.png', '/MapsPV6'],
    "Map7": ['map_7', 'maps/Map07_Obesity.png', '/MapsPV7'],
  };
*/

  static var Maps = [
    ['map_1', 'maps/Map01_HAV.png', '/MapsPV1'],
    ['map_2', 'maps/Map02_HBV.png', '/MapsPV2'],
    ['map_3', 'maps/Map03_HCV.png', '/MapsPV3'],
    ['map_4', 'maps/Map04_HDV.png', '/MapsPV4'],
    ['map_5', 'maps/Map05_HEV.png', '/MapsPV5'],
    ['map_6', 'maps/Map06_Alcohol.png', '/MapsPV6'],
    ['map_7', 'maps/Map07_Obesity.png', '/MapsPV7'],
  ];

  var numMaps = Maps.length;


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
          title: Maps[i][0],
          url: Maps[i][1],
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
