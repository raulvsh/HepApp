import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';


class SchemesFigPage extends StatefulWidget {
  @override
  _SchemesFigPageState createState() => _SchemesFigPageState();
}

class _SchemesFigPageState extends State<SchemesFigPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "Figures - Schemes", true),
      //u.showAppBar(context, "Figures - Schemes"),

      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
