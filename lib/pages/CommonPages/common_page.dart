import 'package:flutter/material.dart';
import 'package:hepapp/pages/CommonPages/common_grid_page.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

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
    //_currentItemSelected = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: CustomAppBar(context, widget.title),
      drawer: MenuWidget(),
      body: CommonGridPage(
        data: widget.data,
        type: widget.type,

      ),

      /*OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),*/
    );
  }
}
