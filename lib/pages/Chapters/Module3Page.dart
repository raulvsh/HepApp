import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class Module3Page extends StatefulWidget {
  @override
  _Module3PageState createState() => _Module3PageState();
}

class _Module3PageState extends State<Module3Page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'module_3'),
      drawer: MenuWidget(),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
