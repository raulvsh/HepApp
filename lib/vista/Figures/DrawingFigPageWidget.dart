import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class DrawingFigPage extends StatefulWidget {
  @override
  _DrawingFigPageState createState() => _DrawingFigPageState();
}

class _DrawingFigPageState extends State<DrawingFigPage> {
  Utils u = Utils();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: u.showAppBar(context, "Figures - Drawing"),

      body: Center(
        child: Text("Some text"),
      ),
    );
  }
}
