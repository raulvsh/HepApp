import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../../CommonGridPage.dart';

class TOCPage extends StatefulWidget {
  @override
  _TOCPageState createState() => _TOCPageState();
}

class _TOCPageState extends State<TOCPage> {
  static var tocs = [
    ['toc_1', 'toc/TOC1.png', '/TOCPV'],
    ['toc_2', 'toc/TOC2.png', '/TOCPV'],
    ['toc_3', 'toc/TOC3.png', '/TOCPV'],
    ['toc_4', 'toc/TOC4.png', '/TOCPV'],
  ];

  var numTOC = tocs.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'table_contents'),
      body: CommonGridPage(data: tocs, type: 'figure'),

      /*OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),*/
    );
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
              ? EdgeInsets.symmetric(vertical: 20 * padding)
              : EdgeInsets.symmetric(vertical: 4 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildModulesGridView(),
        ),
      ),
    );
  }

  _buildModulesGridView() {
    List<Widget> widgets = [];
    for (int i = 0; i < numTOC; i++) {
      widgets.add(FigureButton(context, tocs[i], i));
    }
    return widgets;
  }*/
}
