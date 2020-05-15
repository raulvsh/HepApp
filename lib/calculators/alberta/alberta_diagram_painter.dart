import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alberta_arrows.dart';

Color blueTreatmentColor = Color.fromARGB(255, 85, 163, 188);

/*Clase que se encargará de dibujar las líneas del diagrama de flujo Alberta*/
class AlbertaDiagramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pointMode = ui.PointMode.polygon;
    //final p1 = Offset(50, 50);
    //final p2 = Offset(250, 150);
    final points = [
      Offset(430, 183),
      Offset(500, 183),
      Offset(497, 180),
      Offset(500, 183),
      Offset(497, 186),
    ];
    final paintBlue = Paint()
      ..color = blueTreatmentColor
      ..strokeWidth = 1.3
      ..strokeCap = StrokeCap.round;
    final paintGrey = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.3
      ..strokeCap = StrokeCap.round;
    //canvas.drawLine(p1, p2, paint);

    //canvas.drawPoints(pointMode, points, paintBlue);
    canvas.drawPoints(pointMode, arrow00, paintBlue);
    canvas.drawPoints(pointMode, arrow01, paintBlue);
    canvas.drawPoints(pointMode, arrow02, paintBlue);
    canvas.drawPoints(pointMode, arrow03, paintBlue);
    canvas.drawPoints(pointMode, arrow04, paintBlue);
    canvas.drawPoints(pointMode, arrow05, paintBlue);
    canvas.drawPoints(pointMode, arrow06, paintBlue);
    canvas.drawPoints(pointMode, arrow07, paintBlue);
    canvas.drawPoints(pointMode, arrow08, paintBlue);
    canvas.drawPoints(pointMode, arrow09, paintBlue);
    canvas.drawPoints(pointMode, arrow10, paintBlue);
    canvas.drawPoints(pointMode, arrow11, paintBlue);
    canvas.drawPoints(pointMode, arrow12, paintBlue);
    canvas.drawPoints(pointMode, arrow13, paintBlue);
    canvas.drawPoints(pointMode, arrow14, paintBlue);
    canvas.drawPoints(pointMode, arrow15, paintBlue);
    canvas.drawPoints(pointMode, arrow16, paintBlue);
    canvas.drawPoints(pointMode, arrow17, paintBlue);
    canvas.drawPoints(pointMode, arrow18, paintBlue);
    canvas.drawPoints(pointMode, arrow19, paintBlue);
    canvas.drawPoints(pointMode, arrow20, paintBlue);
    canvas.drawPoints(pointMode, arrow21, paintBlue);
    canvas.drawPoints(pointMode, arrow22, paintBlue);
    canvas.drawPoints(pointMode, arrow23, paintBlue);
    canvas.drawPoints(pointMode, arrow24, paintBlue);
    canvas.drawPoints(pointMode, arrow25, paintBlue);
    canvas.drawPoints(pointMode, arrow26, paintBlue);
    canvas.drawPoints(pointMode, arrow27, paintBlue);
    canvas.drawPoints(pointMode, arrow28, paintBlue);
    canvas.drawPoints(pointMode, arrow29, paintBlue);
    canvas.drawPoints(pointMode, arrow30, paintBlue);
    canvas.drawPoints(pointMode, arrow31, paintBlue);
    canvas.drawPoints(pointMode, arrow32, paintBlue);
    canvas.drawPoints(pointMode, arrow33, paintBlue);
    canvas.drawPoints(pointMode, arrow34, paintBlue);
    canvas.drawPoints(pointMode, arrow35, paintBlue);

    canvas.drawPoints(pointMode, arrow36, paintGrey);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
