import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class InteractiveFigPage extends StatefulWidget {
  @override
  _InteractiveFigPageState createState() => _InteractiveFigPageState();
}

class _InteractiveFigPageState extends State<InteractiveFigPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'interactive_figures'),
      drawer: MenuWidget(),
      body: new Center(
        child: new Text("Some text interactive"),
      ),
    );
  }
}
