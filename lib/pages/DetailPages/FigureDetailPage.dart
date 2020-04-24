import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class FigureDetailPage extends StatefulWidget {
  final String url;
  final title;
  final bottomSheet;

  const FigureDetailPage({Key key, this.title, this.url, this.bottomSheet})
      : super(key: key);

  @override
  _FigureDetailPageState createState() => _FigureDetailPageState();
}

class _FigureDetailPageState extends State<FigureDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, widget.title),
      drawer: MenuWidget(),
      body: Container(
        //padding: EdgeInsets.all(15),
        child: Card(
          margin: EdgeInsets.all(15),
          elevation: 5,
          //padding: EdgeInsets.all(15),
          child: Container(
            //alignment: Alignment.center,
            padding: EdgeInsets.all(3),
            child: Image.asset(
              'assets/images/${widget.url}',
              width: double.infinity,
              fit: BoxFit.fill,
              //alignment: Alignment.centerRight,
            ),
          ),

        ),
      ),
      bottomSheet: widget.bottomSheet,

    );
  }
}
