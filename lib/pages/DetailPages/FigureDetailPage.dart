import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:sized_context/sized_context.dart';
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
    bool isLandscape = context.isLandscape;
    return Scaffold(
      appBar: CustomAppBar(context, widget.title),
      drawer: MenuWidget(),
      body: Container(
        height: context.heightPct(isLandscape ? 0.95 : 0.85),

        child: Card(

          margin: EdgeInsets.all(15),
          elevation: 5,
          //padding: EdgeInsets.all(15),
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/images/${widget.url}',
              width: double.infinity,
              fit: BoxFit.contain,
              //alignment: Alignment.centerRight,

            ),
          ),

        ),
      ),
      bottomSheet: widget.bottomSheet,

    );
  }
}
