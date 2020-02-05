import 'package:flutter/material.dart';
import 'package:hepapp/pages/Figures/TOC/TOCPageView.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/FigureButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class TOCFigPage extends StatefulWidget {
  @override
  _TOCFigPageState createState() => _TOCFigPageState();
}

class _TOCFigPageState extends State<TOCFigPage> {
  static var tocs = [
    ['toc_1', 'toc/TOC1.png', '/TOCPV1'],
    ['toc_2', 'toc/TOC2.png', '/TOCPV2'],
    ['toc_3', 'toc/TOC3.png', '/TOCPV3'],
    ['toc_4', 'toc/TOC4.png', '/TOCPV4'],
  ];


  var numTOC = tocs.length;

  /*var tableContentsIndex = [
    "TOC1",
    "TOC2",
    "TOC3",
    "TOC4",
  ];
  var tableContentsInfo = {
    "TOC1": ['toc_1', 'toc/TOC1.png', '/TOCPV1'],
    "TOC2": ['toc_2', 'toc/TOC2.png', '/TOCPV2'],
    "TOC3": ['toc_3', 'toc/TOC3.png', '/TOCPV3'],
    "TOC4": ['toc_4', 'toc/TOC4.png', '/TOCPV4'],
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
      appBar: CustomAppBar(context, 'table_contents'),
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
      widgets.add(FigureButton(
          context, tocs[i], TOCPageView(i)));
    }
    return widgets;
  }
}
