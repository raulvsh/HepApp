import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/vista/VistaUtils.dart';

class AllCalcPage extends StatefulWidget {
  @override
  _AllCalcPageState createState() => _AllCalcPageState();
}

class _AllCalcPageState extends State<AllCalcPage> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          context, "Calculators - All Algorithms - Diagnostic"),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
