import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../../CommonGridPage.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'maps'),
      body:
      CommonGridPage(data: maps, type: 'figure'),

      /* OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),*/
    );
  }

/* _buildLayout(orientation) {
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
          .add(FigureButton(context, maps[i], i)); //, MapsPageView(i)));
    }
    return widgets;
  }*/
}
