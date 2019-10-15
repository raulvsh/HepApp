import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/widgets/CalcBottomBar.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';

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
      appBar: CustomAppBar(context, "Calculators - MELD", false),
      //u.showAppBar(context, "Calculators - MELD"),
      body: new Center(
        child: new Text("Some text"),
      ),
      bottomSheet: CalcBottomBar(),

    );
  }
}
