import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';
import 'package:sized_context/sized_context.dart';

import 'alberta_field.dart';

class AlbertaPage extends StatefulWidget {
  //final title;
  //final data;
  //final type;

  /* AlbertaPage({
    this.title,
    this.data,
    this.type,
  });*/

  @override
  _AlbertaPageState createState() => _AlbertaPageState();
}

class _AlbertaPageState extends State<AlbertaPage> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('calculators_all_algorithms_alberta'),
        drawer: MenuWidget(),
        body: Center(
          child: FractionallySizedBox(
            heightFactor: 0.90,
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.pink.withAlpha(25),
                    height: 300,
                    width: 530,
                    child: Column(
                      children: <Widget>[
                        _buildTitleRow(),
                        _buildTumourRow(),
                        _buildCpsRow(),
                        _buildClinicalRow(),
                        _buildTreatmentRow(),
                        _buildPrognosisRow()
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.green,
                    height: 300,
                    width: 530,
                    child: CustomPaint(
                      //                       <-- CustomPaint widget
                      size: Size(300, 530),
                      painter: MyPainter(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _buildTitleRow() {
    var heightTitleRow = 15.0;
    return Row(
      children: <Widget>[
        Container(
          height: heightTitleRow,
          width: 15,
          color: Colors.white,
          child: Text('hola'),
        ),
        Container(
          height: heightTitleRow,
          width: 75,
          color: Colors.green,
          child: FittedBox(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text(
                'BCLC',
                style: TextStyle(fontSize: 8, color: Colors.black),
              ),
            ),
          ),
        ),
        Container(
          height: heightTitleRow,
          width: 80,
          color: Colors.yellow,
        ),
        Container(
          height: heightTitleRow,
          width: 105,
          color: Colors.pink,
        ),
        Container(
          height: heightTitleRow,
          width: 110,
          color: Colors.orange,
        ),
        Container(
          height: heightTitleRow,
          width: 85,
          color: Colors.purple,
        ),
        Container(
          height: heightTitleRow,
          width: 60,
          color: Colors.blueGrey,
        )
      ],
    );
  }

  _buildTumourRow() {
    var heightTumourRow = 35.0;
    return Row(
      children: <Widget>[
        Container(
          height: heightTumourRow,
          width: 15,
          color: Colors.blueGrey,
        ),
        Container(
          height: heightTumourRow,
          width: 75,
          color: Colors.pinkAccent,
        ),
        Container(
          height: heightTumourRow,
          width: 80,
          color: Colors.green,
        ),
        Container(
          height: heightTumourRow,
          width: 105,
          color: Colors.deepPurpleAccent,
        ),
        Container(
          height: heightTumourRow,
          width: 110,
          color: Colors.black,
        ),
        Container(
          height: heightTumourRow,
          width: 85,
          color: Colors.greenAccent,
        ),
        Container(
          height: heightTumourRow,
          width: 60,
          color: Colors.green,
        )
      ],
    );
  }

  _buildCpsRow() {
    var cpsHeight = 35.0;
    return Row(
      children: <Widget>[
        Container(
          height: cpsHeight,
          width: 15,
          color: Colors.grey,
        ),
        Container(
          height: cpsHeight,
          width: 75,
          color: Colors.green,
        ),
        Container(
          height: cpsHeight,
          width: 80,
          color: Colors.yellow,
        ),
        Container(
          height: cpsHeight,
          width: 105,
          color: Colors.pink,
        ),
        Container(
          height: cpsHeight,
          width: 110,
          color: Colors.orange,
        ),
        Container(
          height: cpsHeight,
          width: 85,
          color: Colors.purple,
        ),
        Container(
          height: cpsHeight,
          width: 60,
          color: Colors.blueGrey,
        )
      ],
    );
  }

  _buildClinicalRow() {
    var clinicalHeight = 135.0;
    return Row(
      children: <Widget>[
        Container(
          height: clinicalHeight,
          width: 15,
          color: Colors.pink,
        ),
        Container(
          height: clinicalHeight,
          width: 75,
          color: Colors.black,
        ),
        Container(
          height: clinicalHeight,
          width: 80,
          color: Colors.brown,
        ),
        Container(
          height: clinicalHeight,
          width: 105,
          color: Colors.orange,
        ),
        Container(
          height: clinicalHeight,
          width: 110,
          color: Colors.cyan,
        ),
        Container(
          height: clinicalHeight,
          width: 85,
          color: Colors.pinkAccent,
        ),
        Container(
          height: clinicalHeight,
          width: 60,
          color: Colors.green,
        )
      ],
    );
  }

  _buildTreatmentRow() {
    var treatmentHeight = 48.0;
    return Row(
      children: <Widget>[
        Container(
          height: treatmentHeight,
          width: 15,
          color: Colors.blue,
        ),
        Container(
          height: treatmentHeight,
          width: 75,
          color: Colors.green,
        ),
        Container(
          height: treatmentHeight,
          width: 80,
          color: Colors.yellow,
        ),
        Container(
          height: treatmentHeight,
          width: 105,
          color: Colors.pink,
        ),
        Container(
          height: treatmentHeight,
          width: 110,
          color: Colors.orange,
        ),
        Container(
          height: treatmentHeight,
          width: 85,
          color: Colors.purple,
        ),
        Container(
          height: treatmentHeight,
          width: 60,
          color: Colors.blueGrey,
        )
      ],
    );
  }

  _buildPrognosisRow() {
    var prognosisHeight = 32.0;
    return Row(
      children: <Widget>[
        Container(
          height: prognosisHeight,
          width: 15,
          color: Colors.blueGrey,
        ),
        Container(
          height: prognosisHeight,
          width: 75,
          color: Colors.purple,
        ),
        Container(
          height: prognosisHeight,
          width: 80,
          color: Colors.grey,
        ),
        Container(
          height: prognosisHeight,
          width: 105,
          color: Colors.deepOrangeAccent,
        ),
        Container(
          height: prognosisHeight,
          width: 110,
          color: Colors.yellow,
        ),
        Container(
          height: prognosisHeight,
          width: 85,
          color: Colors.black,
        ),
        Container(
          height: prognosisHeight,
          width: 60,
          color: Colors.amber,
        )
      ],
    );
  }

  _buildTitleRow2() {
    List<String> txt = [
      '1 (<=2cm)',
      '1(>=2cm) or up to 3 (<=3cm)',
      '>Milan Criteria',
      'PVI, N1, M1'
    ];

    return Container(
      margin: EdgeInsets.only(top: 20),
      //padding: EdgeInsets.only(left: 5.0),

      //color: Colors.red,
      //width: context.widthPx,
      width: 100 * 4.0,
      height: 20.0,
      child: Container(
        //color: Colors.pink,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          shrinkWrap: false,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              //crossAxisAlignment: CrossAxisAlignment.sp,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 1.3,
                      ),
                    ),
                    child: Text(txt[index]),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _buildListView() {
    print("toolbar height: " + kToolbarHeight.toString());

    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(left: 5.0),
        //color: Colors.red,
        //width: context.widthPx,
        width: context.widthPx,
        height: 25.0,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.sp,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            AlbertaField(
              //color: Colors.red,
              width: 200.0,
              height: 20.0,
              shape: BoxShape.rectangle,
              txt: '1 (<=2cm)',
            ),
            AlbertaField(
              color: Colors.yellow,
              width: 150.0,
              height: 100.0,
              shape: BoxShape.circle,
              txt: 'A',
            ),
          ],
        ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;
    print("width: " + width.toString() + " height: " + height.toString());
    double widthPct(double pct) {
      return width * pct;
    }

    double heightPct(double pct) {
      return height * pct;
    }

    final pointMode = ui.PointMode.polygon;
    final points = [
      Offset(50, 100),
      Offset(150, 75),
      Offset(250, 250),
      Offset(130, 200),
      Offset(270, 100),
    ];
    final paint = Paint()
      ..color = Color.fromARGB(255, 73, 195, 207)
      ..strokeWidth = 1.3
      ..strokeCap = StrokeCap.round;

    canvas.drawPoints(
        pointMode,
        [
          /*Offset(0, 0),
          Offset(10, 10),
          Offset(20, 5),
          Offset(20, 25),
          Offset(100, 25),
          Offset(100, 30),
          Offset(120, 30),*/
        ],
        paint);

    canvas.drawPoints(
        pointMode,
        [
          /*Offset(330, 35),
          Offset(330, 75),
          Offset(323, 68),
          Offset(330, 75),
          Offset(337, 68),*/
        ],
        paint);

    canvas.drawPoints(
        pointMode,
        [
          /*Offset(100, 43),
          Offset(100, 70),
          Offset(280, 70),
          Offset(280, 44),
          Offset(276, 48),
          Offset(280, 44),
          Offset(284, 48),*/
        ],
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
