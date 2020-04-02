import 'package:flutter/material.dart';
import 'package:hepapp/widgets/ComboButton.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';


class FiguresPage extends StatefulWidget {
  @override
  _FiguresPageState createState() => _FiguresPageState();
}

class _FiguresPageState extends State<FiguresPage> {
  static var figures = [
    ['table_contents', 'items/4_figures.png', '/TableFig', 'Nav',],
    ['schemes', 'items/4_figures.png', '/SchemesFig', 'Nav',],
    ['maps', 'items/4_figures.png', '/MapsFig', 'Nav',],
    ['pathology', 'items/4_figures.png', '/PathologyFig', 'Nav',],
    ['interactive_figures', 'items/4_figures.png', '/InteractiveFig', 'Nav',],
    ['drawing', 'items/4_figures.png', '/DrawingFig', 'Nav',],
  ];

  var numFigCategories = figures.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: CustomAppBar(context, 'figures'),
      drawer: MenuWidget(),

      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
    );
  }

  _buildLayout(orientation) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
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
              ? EdgeInsets.symmetric(vertical: 20 * padding)
              : EdgeInsets.symmetric(vertical: 4 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildFiguresGridView(),
        ),
      ),
    );
  }

  _buildFiguresGridView() {
    List<Widget> widgets = [];
    for (int i = 0; i < numFigCategories; i++) {
      widgets.add(ComboButton(context, figures[i]));

      //widgets.add(NavigationButton(context, figures[i]));
    }
    return widgets;
  }

}
