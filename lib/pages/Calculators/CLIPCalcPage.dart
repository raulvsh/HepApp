/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        context,
        'clip_staging_system',
        selScreenshot: true,
      ),
      drawer: MenuWidget(),
      body: Container(
        child: Text("CLIP Calc Page"),
      ),
    );
  }
}
*/
