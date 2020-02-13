import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/FigureButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class InteractivePage extends StatefulWidget {
  @override
  _InteractivePageState createState() => _InteractivePageState();
}

class _InteractivePageState extends State<InteractivePage> {
  static var interactive = [
    ['interactive_1', 'interactive/M1C1S2a.png', '/InteractivePV'],
    ['interactive_2', 'interactive/M1C1S2f.png', '/InteractivePV'],
    ['interactive_3', 'interactive/M1C1S3a.png', '/InteractivePV'],
    ['interactive_4', 'interactive/M1C1S5a.png', '/InteractivePV'],
    ['interactive_5', 'interactive/M2C8S2a.png', '/InteractivePV'],
    ['interactive_6', 'interactive/M2C9S2a.png', '/InteractivePV'],
    ['interactive_7', 'interactive/M3C14S2b.png', '/InteractivePV'],
    ['interactive_8', 'interactive/M3C15S1a.png', '/InteractivePV'],
  ];

  var numInteractive = interactive.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'interactive_figures'),
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
    for (int i = 0; i < numInteractive; i++) {
      widgets
          .add(FigureButton(context, interactive[i], i));
    }
    return widgets;
  }
}
