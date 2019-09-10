import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class ChapterFigPage extends StatefulWidget {
  @override
  _ChapterFigPageState createState() => _ChapterFigPageState();
}

class _ChapterFigPageState extends State<ChapterFigPage> {
  Utils u = Utils();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: u.showAppBar(context, "Chapter Figures"),

      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
