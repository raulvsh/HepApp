import 'package:flutter/material.dart';

class TableFigPage extends StatefulWidget {
  @override
  _TableFigPageState createState() => _TableFigPageState();
}

class _TableFigPageState extends State<TableFigPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Table of Contents"),
      ),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
