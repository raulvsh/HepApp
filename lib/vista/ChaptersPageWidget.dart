import 'package:flutter/material.dart';

class ChaptersPage extends StatefulWidget {
  @override
  _ChaptersPageState createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Module Chapters",
          /*style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),*/
        ),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Image.asset(
              'images/homeicon.png',
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          // action button
        ],
      ),
      body: Center(
        //TODO: Hacer recuperación de datos de internet
        child: new Text("Some text"),
      ),
    );
  }
}
