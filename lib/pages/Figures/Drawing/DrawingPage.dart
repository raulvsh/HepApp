import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/FigureButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class DrawingPage extends StatefulWidget {
  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  static var draws = [
    ['anatomy', 'drawing/Doodle_Figure_1.png', '/DrawingPV'],
    ['anterior_view_liver', 'drawing/Doodle_Figure_2.png', '/DrawingPV'],
    ['posterior_view_liver', 'drawing/Doodle_Figure_3.png', '/DrawingPV'],
    ['portal_circulation', 'drawing/Doodle_Figure_4.png', '/DrawingPV'],
    [
      'liver_stomach_pancreas_gall_bladder',
      'drawing/Doodle_Figure_5.png',
      '/DrawingPV'
    ],
    ['liver_vasculature', 'drawing/Doodle_Figure_6.png', '/DrawingPV'],
    ['liver_histology', 'drawing/Doodle_Figure_7.png', '/DrawingPV'],
    ['liver_cell', 'drawing/Doodle_Figure_8.png', '/DrawingPV'],
  ];

  var numDraws = draws.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'drawing'),
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
          children: _buildDrawingGridView(),
        ),
      ),
    );
  }

  _buildDrawingGridView() {
    List<Widget> widgets = [];
    for (int i = 0; i < numDraws; i++) {
      widgets.add(FigureButton(context, draws[i], i));
    }
    return widgets;
  }
}
