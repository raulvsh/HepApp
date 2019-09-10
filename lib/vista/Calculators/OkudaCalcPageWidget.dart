import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';


class OkudaCalcPage extends StatefulWidget {
  @override
  _OkudaCalcPageState createState() => _OkudaCalcPageState();
}

class _OkudaCalcPageState extends State<OkudaCalcPage> {
  Utils u = new Utils();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: u.showAppBar(context, "Calculators - Okuda"),

      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
