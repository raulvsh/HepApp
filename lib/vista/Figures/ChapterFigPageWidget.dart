import 'package:flutter/material.dart';

class ChapterFigPage extends StatefulWidget {
  @override
  _ChapterFigPageState createState() => _ChapterFigPageState();
}

class _ChapterFigPageState extends State<ChapterFigPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chapter Fig"),
      ),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
