import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class Schemes3Page extends StatefulWidget {
  @override
  _Schemes3PageState createState() => _Schemes3PageState();
}

class _Schemes3PageState extends State<Schemes3Page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "Figures - Schemes3"),
      drawer: MenuWidget(),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
