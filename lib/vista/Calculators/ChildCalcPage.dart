import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/vista/CustomWidgets.dart';

class ChildCalcPage extends StatefulWidget {
  @override
  _ChildCalcPageState createState() => _ChildCalcPageState();
}

class _ChildCalcPageState extends State<ChildCalcPage> {

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
      appBar: CustomAppBar(context, "Calculators - Child Pugh Score", false),
      //u.showAppBar(context, "Calculators - Child Pugh Score"),
      body: new Center(
        child: new Text("Some text"),
      ),
      bottomSheet: CalcBottomBar(),

    );
  }
}
