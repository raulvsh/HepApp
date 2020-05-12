import 'package:flutter/material.dart';
import 'package:hepapp/pages/CommonPages/common_grid_page.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';

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
