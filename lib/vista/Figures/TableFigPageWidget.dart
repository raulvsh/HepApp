import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class TableFigPage extends StatefulWidget {
  @override
  _TableFigPageState createState() => _TableFigPageState();
}

class _TableFigPageState extends State<TableFigPage> {
  Utils u = Utils();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: u.showAppBar(context, "Figures - Table of Contents"),

      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
