/*
import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../../CommonGridPage.dart';

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
      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'drawing'),
      body: CommonGridPage(data: draws, type: 'figure'),
    );
  }
}
*/
