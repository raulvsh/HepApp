import 'package:flutter/material.dart';

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
    return new Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "PubMed",
        ),
      ),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}