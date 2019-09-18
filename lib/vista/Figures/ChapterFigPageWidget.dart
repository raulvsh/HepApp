import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';

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
    return Scaffold(
      appBar: CustomAppBar(context, "Figures - Chapter Figures"),
      //u.showAppBar(context, "Figures - Chapter Figures"),

      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
