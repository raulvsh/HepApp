/*
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

ColorSwatch _selectedColor;
ColorSwatch _mainColor = Colors.blue;

class DrawingWidget extends StatefulWidget {
  DrawingWidgetState createState() => DrawingWidgetState();
}

class DrawingWidgetState extends State<DrawingWidget> {
  List<Offset> _points = <Offset>[];

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/higadoprueba.png',
          fit: BoxFit.fill,
        ),
        Container(
          //color: Colors.blue[50],
          child: GestureDetector(
              //child: Image.asset('assets/images/higadoprueba.png', fit: BoxFit.scaleDown,),
              onPanUpdate: (DragUpdateDetails details) {
            //_points = List.from(_points)..clear();
            RenderBox referenceBox = context.findRenderObject();
            Offset localPosition =
                referenceBox.globalToLocal(details.globalPosition);

            setState(() {
              _points = List.from(_points)..add(localPosition);
            });
          }, onPanEnd: (DragEndDetails details) {
            _points.add(null);
          }),
        ),
        CustomPaint(painter: SignaturePainter(_points)),
        Positioned(
          bottom: 25,
          right: 25,
          child: IconButton(
            onPressed: _abrirPaleta,
            icon: Icon(
              Icons.palette,
              color: Color.fromARGB(255, 93, 188, 210),
              size: 50,
            ),
          ),
        ),
      ],
    );
  }

  void _abrirPaleta() async {
    _openDialog(
      //"Paleta de colores",
      Container(
        height: 360,
        child: MaterialColorPicker(
          colors: fullMaterialColors,
          selectedColor: _mainColor,
          allowShades: false,
          onMainColorChange: (color) => setState(() => _selectedColor = color),
        ),
      ),
    );
  }

  void _openDialog(*/
/*String title,*/ /*
 Widget content) {
    //TODO TRADUCIR MENSAJES AlertDialog
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          // title: Text(title),
          content: content,
          actions: [
            FlatButton(
              child: Text('CANCELAR'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('ACEPTAR'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _mainColor = _selectedColor);
              },
            ),
          ],
        );
      },
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = _mainColor //Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

*/
/* PAINT DE PRUEBA CON LISTAS PARA PROBAR DISTINTOS COLORES (NO FUNCIONA)
 List<Canvas> lista2 = [];

  void paint(Canvas canvas, Size size) {
    List<Paint> lista = [];
    lista2.add(canvas);
    Paint paint = Paint()
      ..color = _mainColor //Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    lista.add(paint);
    lista.forEach((item) {
      for (int i = 0; i < points.length - 1; i++) {
        if (points[i] != null && points[i + 1] != null)
          canvas.drawLine(points[i], points[i + 1], item);
      }
    });
  }*/ /*


  bool shouldRepaint(SignaturePainter other) => other.points != points;
}
*/

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:painter/painter.dart';

/*class DrawingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ExamplePage(),
    );
  }
}*/

class DrawingWidget extends StatefulWidget {
  @override
  _DrawingWidgetState createState() => new _DrawingWidgetState();
}

class _DrawingWidgetState extends State<DrawingWidget> {
  bool _finished;
  PainterController _controller;

  @override
  void initState() {
    super.initState();
    _finished = false;
    _controller = _newController();
  }

  PainterController _newController() {
    PainterController controller = new PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.green;
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actions;
    if (_finished) {
      actions = <Widget>[
        new IconButton(
          icon: new Icon(Icons.content_copy),
          tooltip: 'New Painting',
          onPressed: () => setState(() {
            _finished = false;
            _controller = _newController();
          }),
        ),
      ];
    } else {
      actions = <Widget>[
        new IconButton(
            icon: new Icon(Icons.undo),
            tooltip: 'Undo',
            onPressed: _controller.undo),
        new IconButton(
            icon: new Icon(Icons.delete),
            tooltip: 'Clear',
            onPressed: _controller.clear),
        new IconButton(
            icon: new Icon(Icons.check),
            onPressed: () => _show(_controller.finish(), context)),
      ];
    }
    return new Scaffold(
      appBar: new AppBar(
          title: const Text('Painter Example'),
          actions: actions,
          bottom: new PreferredSize(
            child: new DrawBar(_controller),
            preferredSize: new Size(MediaQuery.of(context).size.width, 30.0),
          )),
      body: new Center(
        child: Painter(_controller),

        /*new AspectRatio(
              aspectRatio: 1.0,
              child: new Painter( _controller)
          )*/
      ),
    );
  }

  void _show(PictureDetails picture, BuildContext context) {
    setState(() {
      _finished = true;
    });
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: const Text('View your image'),
        ),
        body: new Container(
            alignment: Alignment.center,
            child: new FutureBuilder<Uint8List>(
              future: picture.toPNG(),
              builder:
                  (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return new Text('Error: ${snapshot.error}');
                    } else {
                      return Image.memory(snapshot.data);
                    }
                    break;
                  default:
                    return new Container(
                        child: new FractionallySizedBox(
                      widthFactor: 0.1,
                      child: new AspectRatio(
                          aspectRatio: 1.0,
                          child: new CircularProgressIndicator()),
                      alignment: Alignment.center,
                    ));
                }
              },
            )),
      );
    }));
  }
}

class DrawBar extends StatelessWidget {
  final PainterController _controller;

  DrawBar(this._controller);

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Flexible(child: new StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return new Container(
              child: new Slider(
            value: _controller.thickness,
            onChanged: (double value) => setState(() {
              _controller.thickness = value;
            }),
            min: 1.0,
            max: 20.0,
            activeColor: Colors.white,
          ));
        })),
        new ColorPickerButton(_controller, false),
        new ColorPickerButton(_controller, true),
      ],
    );
  }
}

class ColorPickerButton extends StatefulWidget {
  final PainterController _controller;
  final bool _background;

  ColorPickerButton(this._controller, this._background);

  @override
  _ColorPickerButtonState createState() => new _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorPickerButton> {
  @override
  Widget build(BuildContext context) {
    return new IconButton(
        icon: new Icon(_iconData, color: _color),
        tooltip: widget._background
            ? 'Change background color'
            : 'Change draw color',
        onPressed: _pickColor);
  }

  void _pickColor() {
    Color pickerColor = _color;
    Navigator.of(context)
        .push(new MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) {
              return new Scaffold(
                  appBar: new AppBar(
                    title: const Text('Pick color'),
                  ),
                  body: new Container(
                      alignment: Alignment.center,
                      child: new ColorPicker(
                        pickerColor: pickerColor,
                        onColorChanged: (Color c) => pickerColor = c,
                      )));
            }))
        .then((_) {
      setState(() {
        _color = pickerColor;
      });
    });
  }

  Color get _color => widget._background
      ? widget._controller.backgroundColor
      : widget._controller.drawColor;

  IconData get _iconData =>
      widget._background ? Icons.format_color_fill : Icons.brush;

  set _color(Color color) {
    if (widget._background) {
      widget._controller.backgroundColor = color;
    } else {
      widget._controller.drawColor = color;
    }
  }
}
