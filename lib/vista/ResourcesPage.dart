import 'package:flutter/material.dart';
import 'package:hepapp/vista/CustomWidgets.dart';

class ResourcesPage extends StatefulWidget {
  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: CustomAppBar(context, "Resources", true),
      //u.showAppBar(context, "Resources"),

      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
