import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/DrawBottomBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:painter/painter.dart';
import 'package:sized_context/sized_context.dart';

class DrawingDetailPage extends StatefulWidget {
  final String url;
  final title;
  final bottomSheet;

  const DrawingDetailPage(
      {Key key, this.title, this.url, this.bottomSheet}) //, this.bottomSheet})
      : super(key: key);

  @override
  _FigureDetailPageState createState() => _FigureDetailPageState();
}

class _FigureDetailPageState extends State<DrawingDetailPage> {
  PainterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = _newController();
  }

  //Valores por defecto de la aplicación de dibujo
  PainterController _newController() {
    PainterController controller = new PainterController();
    controller.thickness = 5.0;
    //Color transparente para que no tape la imagen
    controller.backgroundColor = Color.fromARGB(0, 0, 0, 0);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = context.isLandscape;
    return Scaffold(
      appBar: CustomAppBar(context, widget.title),
      drawer: MenuWidget(),
      body: Container(
        //color: Colors.red,
        //padding: EdgeInsets.only(top: 50),
        height: context.heightPct(isLandscape ? 0.75 : 0.85),
        child: Card(
          margin: EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/images/${widget.url}',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Painter(_controller),
            ],
          ),
        ),
      ),
      bottomSheet: Stack(
        children: <Widget>[
          DrawBottomBar(controller: _controller),
          widget.bottomSheet
        ],
      ),
    );
  }
}
