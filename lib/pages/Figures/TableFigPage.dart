import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';

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
    return Scaffold(
      appBar: CustomAppBar(context, "Figures - Table of Contents", true),
      //u.showAppBar(context, "Figures - Table of Contents"),

      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
