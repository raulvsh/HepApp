import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';


class AllCalcPage extends StatefulWidget {
  @override
  _AllCalcPageState createState() => _AllCalcPageState();
}

class _AllCalcPageState extends State<AllCalcPage> {

  Utils u = new Utils();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: u.showAppBar(
          context, "Calculators - All Algorithms - Diagnostic"),

      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
