import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class Module2Page extends StatefulWidget {
  @override
  _Module2PageState createState() => _Module2PageState();
}

class _Module2PageState extends State<Module2Page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'module_2'),
      drawer: MenuWidget(),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
