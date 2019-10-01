import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/vista/VistaUtils.dart';

class CLIPCalcPage extends StatefulWidget {
  @override
  _CLIPCalcPageState createState() => _CLIPCalcPageState();
}

class _CLIPCalcPageState extends State<CLIPCalcPage> {

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
      appBar: CustomAppBar(context, "Calculators - CLIP Staging System"),
      //u.showAppBar(context, "Calculators - CLIP Staging System"),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
