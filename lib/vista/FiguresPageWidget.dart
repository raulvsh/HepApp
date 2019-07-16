import 'package:flutter/material.dart';

class FiguresPage extends StatefulWidget {
  @override
  _FiguresPageState createState() => _FiguresPageState();
}

class _FiguresPageState extends State<FiguresPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Figures"),
      ),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
