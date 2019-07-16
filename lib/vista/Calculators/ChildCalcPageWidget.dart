import 'package:flutter/material.dart';

class ChildCalcPage extends StatefulWidget {
  @override
  _ChildCalcPageState createState() => _ChildCalcPageState();
}

class _ChildCalcPageState extends State<ChildCalcPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ChildCalcPage"),
      ),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
