/*
import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/DrawBottomBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:painter/painter.dart';


class DrawingFigPage extends StatefulWidget {
  @override
  _DrawingFigPageState createState() => _DrawingFigPageState();
}

class _DrawingFigPageState extends State<DrawingFigPage> {
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
    return Scaffold(
      appBar: CustomAppBar(context, 'drawing'),
      drawer: MenuWidget(),
      body: Container(
        child: Stack(
          children: <Widget>[
            Image.asset('assets/images/higadoprueba.png', fit: BoxFit.cover,),

            Painter(_controller),

          ],
        ),
      ),
      bottomSheet: DrawBottomBar(controller: _controller),
    );
  }
}
*/