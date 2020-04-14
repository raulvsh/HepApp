/*
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
        body: CommonGridPage(data: pathology2, type: 'figure', index: 8),
        bottomSheet:
            BottomNavigationSheet(1, '/PathologyPV', numPathologyPages));
  }
}
*/
