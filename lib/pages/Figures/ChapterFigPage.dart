import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

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
      drawer: MenuWidget(),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
