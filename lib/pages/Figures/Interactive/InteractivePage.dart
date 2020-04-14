/*
import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../../CommonGridPage.dart';

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

  //
  // var numInteractive = interactive.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'interactive_figures'),
      drawer: MenuWidget(),
      body: CommonGridPage(data: interactive, type: 'figure'),



    );
  }

}
*/
