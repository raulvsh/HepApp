import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class SchemesFigPage extends StatefulWidget {
  @override
  _SchemesFigPageState createState() => _SchemesFigPageState();
}

class _SchemesFigPageState extends State<SchemesFigPage> {
  Utils u = Utils();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: u.showAppBar(context, "Figures - Schemes"),

      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
