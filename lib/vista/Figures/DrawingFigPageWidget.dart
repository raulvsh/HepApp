import 'package:flutter/material.dart';

class DrawingFigPage extends StatefulWidget {
  @override
  _DrawingFigPageState createState() => _DrawingFigPageState();
}

class _DrawingFigPageState extends State<DrawingFigPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("_DrawingFigPageState"),
      ),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
