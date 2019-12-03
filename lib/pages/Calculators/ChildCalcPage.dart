import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/forms/ChildCalcForm.dart';
import 'package:hepapp/widgets/CalcBottomBar.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

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
      appBar: CustomAppBar(
        context, 'child_pugh_score', selScreenshot: true,
        selPartialSettings: true,),
      drawer: MenuWidget(),
      body: new Center(
        child: ChildCalcForm(),
      ),
      bottomSheet: CalcBottomBar("reseteo2"),

    );
  }
}
