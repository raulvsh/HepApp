import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';


class CLIPCalcPage extends StatefulWidget {
  @override
  _CLIPCalcPageState createState() => _CLIPCalcPageState();
}

class _CLIPCalcPageState extends State<CLIPCalcPage> {
  Utils u = new Utils();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: u.showAppBar(context, "Calculators - CLIP Staging System"),

      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
