import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class ChildCalcPage extends StatefulWidget {
  @override
  _ChildCalcPageState createState() => _ChildCalcPageState();
}

class _ChildCalcPageState extends State<ChildCalcPage> {
  Utils u = new Utils();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: u.showAppBar(context, "Calculators - Child Pugh Score"),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
