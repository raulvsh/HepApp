import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/vista/VistaUtils.dart';

class MELDCalcPage extends StatefulWidget {
  @override
  _MELDCalcPageState createState() => _MELDCalcPageState();
}

class _MELDCalcPageState extends State<MELDCalcPage> {

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
      appBar: CustomAppBar(context, "Calculators - MELD"),
      //u.showAppBar(context, "Calculators - MELD"),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
