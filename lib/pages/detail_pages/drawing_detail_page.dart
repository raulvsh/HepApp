import 'package:flutter/material.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/draw_bottom_bar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:painter/painter.dart';
import 'package:screenshot/screenshot.dart';
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
  ScreenshotController screenShotController = ScreenshotController();

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
    return Screenshot(
      controller: screenShotController,
      child: Scaffold(
        appBar: CustomAppBar(
          widget.title,
          screenshotController: screenShotController,
        ),
        drawer: MenuWidget(),
        body: Container(
          height: context.heightPct(isLandscape ? 0.65 : 0.8),
          child: Card(
            margin: EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: widget.url,
                    child: Image.asset(
                      'assets/images/${widget.url}',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Painter(_controller),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          width: context.widthPx,
          height: 45, //kBottomNavigationBarHeight,//context.heightPx,
          color: Colors.amber,
          child: Stack(
            children: <Widget>[
              DrawBottomBar(controller: _controller), //),
              Container(
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  child: widget.bottomSheet),
            ],
          ),
        ),
      ),
    );
  }
}
