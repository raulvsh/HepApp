import 'package:flutter/material.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';
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
      appBar: CustomAppBar(widget.title),
      drawer: MenuWidget(),
      body: Center(
        heightFactor: 1,
        child: Container(
          height: isLandscape ? context.heightPx * 0.77 : null,
          width: !isLandscape ? context.widthPx : null,
          child: Card(
            margin: EdgeInsets.all(15),
            elevation: 5,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/${widget.url}',
                //width: double.infinity,
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ),
      bottomSheet: widget.bottomSheet,
    );
  }
}
