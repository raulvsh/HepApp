import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/DrawingWidget.dart';
import 'package:hepapp/widgets/menu_widget.dart';

/*ColorSwatch _selectedColor;
ColorSwatch _mainColor = Colors.blue;*/

class DrawingFigPage extends StatefulWidget {
  @override
  _DrawingFigPageState createState() => _DrawingFigPageState();
}

class _DrawingFigPageState extends State<DrawingFigPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "Figures - Drawing"),
      drawer: MenuWidget(),
      body: DrawingWidget(),
    );
  }
}
/*

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

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}

class DrawingWidget extends StatefulWidget {
  DrawingWidgetState createState() => DrawingWidgetState();
}

class DrawingWidgetState extends State<DrawingWidget> {
  List<Offset> _points = <Offset>[];


  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blue[50],
          child: GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              RenderBox referenceBox = context.findRenderObject();
              Offset localPosition =
                  referenceBox.globalToLocal(details.globalPosition);

              setState(() {
                _points = List.from(_points)..add(localPosition);
              });
            },
            onPanEnd: (DragEndDetails details) => _points.add(null),
          ),
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

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('SUBMIT'),
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

  void _abrirPaleta() async {
    _openDialog(
      "Full Material Color picker",
      MaterialColorPicker(
        colors: fullMaterialColors,
        selectedColor: _mainColor,
        allowShades: false,
        onMainColorChange: (color) => setState(() => _selectedColor = color),
      ),
    );
  }
}
*/
