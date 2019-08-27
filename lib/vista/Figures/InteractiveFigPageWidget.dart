import 'package:flutter/material.dart';

class InteractiveFigPage extends StatefulWidget {
  @override
  _InteractiveFigPageState createState() => _InteractiveFigPageState();
}

class _InteractiveFigPageState extends State<InteractiveFigPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("_InteractiveFigPageState"),
      ),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
