import 'package:flutter/material.dart';
import 'package:hepapp/vista/CustomWidgets.dart';

class PubMedPage extends StatefulWidget {
  @override
  _PubMedPageState createState() => _PubMedPageState();
}

class _PubMedPageState extends State<PubMedPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: CustomAppBar(context, "PubMed", true),
      //u.showAppBar(context, "PubMed"),

      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
