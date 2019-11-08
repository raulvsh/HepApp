import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class Schemes2Page extends StatefulWidget {
  @override
  _Schemes2PageState createState() => _Schemes2PageState();
}

class _Schemes2PageState extends State<Schemes2Page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'schemes'),
      drawer: MenuWidget(),
      body: new Center(
        child: new Text("Some text2"),
      ),
    );
  }
}
