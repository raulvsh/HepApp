import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';

class FigureViewPage extends StatefulWidget {
  final String url;
  final title;
  final bottomSheet;

  const FigureViewPage({Key key, this.title, this.url, this.bottomSheet})
      : super(key: key);

  @override
  _FigureViewPageState createState() => _FigureViewPageState();
}

class _FigureViewPageState extends State<FigureViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, widget.title),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Image.asset(
          'assets/images/${widget.url}',
          width: double.infinity,
          fit: BoxFit.contain,
        ),

      ),
      bottomSheet: widget.bottomSheet,

    );
  }
}
