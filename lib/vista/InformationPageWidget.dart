import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {


  Utils u = new Utils();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: u.showAppBar(context, "Information"),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pushNamed(context, '/CLIPCalc'),
          child: Text('CLIP Calculator'),

        ),
      ),
    );
  }


}
