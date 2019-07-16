import 'package:flutter/material.dart';

class AllCalcPage extends StatefulWidget {
  @override
  _AllCalcPageState createState() => _AllCalcPageState();
}

class _AllCalcPageState extends State<AllCalcPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AllCalcPage"),
      ),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
