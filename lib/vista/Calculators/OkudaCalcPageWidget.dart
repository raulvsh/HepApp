import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class OkudaCalcPage extends StatefulWidget {
  @override
  _OkudaCalcPageState createState() => _OkudaCalcPageState();
}

class _OkudaCalcPageState extends State<OkudaCalcPage> {

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(context, "Calculators - Okuda"),
      //u.showAppBar(context, "Calculators - Okuda"),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
