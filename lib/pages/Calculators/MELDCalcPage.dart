import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/widgets/CalcBottomBar.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

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
      appBar: CustomAppBar(context, "Calculators - MELD", selScreenshot: true,
        selPartialSettings: true,),
      drawer: MenuWidget(),
      body: new Center(
        child: new Text("Some text"),
      ),
      bottomSheet: CalcBottomBar("reseteo2"),
    );
  }
}
