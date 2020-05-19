import 'package:flutter/material.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';

import 'common_grid_page.dart';

class CommonPage extends StatefulWidget {
  final title;
  final data;
  final type;

  CommonPage({
    this.title,
    this.data,
    this.type,
  });

  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(widget.title),
      drawer: MenuWidget(),
      body: CommonGridPage(
        data: widget.data,
        type: widget.type,
      ),
    );
  }
}
