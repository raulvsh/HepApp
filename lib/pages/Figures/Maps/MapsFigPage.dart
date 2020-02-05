import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/FigureButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import 'MapsPageView.dart';

class MapsFigPage extends StatefulWidget {
  @override
  _MapsFigPageState createState() => _MapsFigPageState();
}

class _MapsFigPageState extends State<MapsFigPage> {
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

  /*final numMaps = 7;

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
  };*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'maps'),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
    );
  }

  _buildLayout(orientation) {
    final width = MediaQuery.of(context).size.width;
    var padding = width / 100;

    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.lightBlueAccent,
      child: FractionallySizedBox(
        widthFactor: orientation == Orientation.portrait ? 0.7 : 0.7,
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.symmetric(vertical: 10 * padding)
              : EdgeInsets.symmetric(vertical: 3 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildModulesGridView(),
        ),
      ),
    );
  }

  _buildModulesGridView() {
    List<Widget> widgets = [];
    for (int i = 0; i < numMaps; i++) {
      widgets
          .add(FigureButton(context, Maps[i], MapsPageView(i)));
    }
    return widgets;
  }
}
