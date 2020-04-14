/*
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
    );
  }
}
*/
