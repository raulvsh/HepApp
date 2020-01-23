import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class MapsFigPage extends StatefulWidget {
  @override
  _MapsFigPageState createState() => _MapsFigPageState();
}

class _MapsFigPageState extends State<MapsFigPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'maps'),
      drawer: MenuWidget(),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
