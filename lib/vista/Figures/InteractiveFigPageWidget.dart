import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class InteractiveFigPage extends StatefulWidget {
  @override
  _InteractiveFigPageState createState() => _InteractiveFigPageState();
}

class _InteractiveFigPageState extends State<InteractiveFigPage> {
  Utils u = Utils();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: u.showAppBar(context, "Figures - Interactive Figures"),

      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
