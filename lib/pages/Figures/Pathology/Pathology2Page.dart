import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../../CommonGridPage.dart';

class Pathology2Page extends StatefulWidget {
  @override
  _Pathology2PageState createState() => _Pathology2PageState();
}

class _Pathology2PageState extends State<Pathology2Page> {
  final numPathologyPages = 2;

  static var pathology2 = [
    [
      'pathology_9',
      'pathology/Pathology09_Autoimmune_Hepatitis.png',
      '/PathologyDetail'
    ],
  ];

  var numPathology2 = pathology2.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuWidget(),
        appBar: CustomAppBar(context, 'pathology_section_2'),
        body: CommonGridPage(data: pathology2, type: 'figure'),

        /*OrientationBuilder(
          builder: (context, orientation) {
            return _buildLayout(orientation);
          },
        ),*/
        bottomSheet:
            BottomNavigationSheet(1, '/PathologyPV', numPathologyPages));
  }

/*_buildLayout(orientation) {
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
              ? EdgeInsets.symmetric(vertical: 2 * padding)
              : EdgeInsets.symmetric(vertical: 2 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildPathologyGridView(),
        ),
      ),
    );
  }

  _buildPathologyGridView() {
    List<Widget> widgets = [];
    for (int i = 0; i < numPathology2 + 0; i++) {
      widgets
          .add(
          FigureButton(context, pathology2[i], i + 8)); //, MapsPageView(i)));
    }
    return widgets;
  }*/
}
