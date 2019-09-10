import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';


class MELDCalcPage extends StatefulWidget {
  @override
  _MELDCalcPageState createState() => _MELDCalcPageState();
}

class _MELDCalcPageState extends State<MELDCalcPage> {
  Utils u = new Utils();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: u.showAppBar(context, "Calculators - MELD"),

      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
