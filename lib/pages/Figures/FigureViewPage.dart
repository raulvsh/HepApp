import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';

class FigureViewPage extends StatefulWidget {
  final String url;
  final title;

  const FigureViewPage({Key key, this.url, this.title}) : super(key: key);

  @override
  _FigureViewPageState createState() => _FigureViewPageState();
}

class _FigureViewPageState extends State<FigureViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, widget.title),
      body: Image.asset(
        'assets/images/header4.png',
        height: 70,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
