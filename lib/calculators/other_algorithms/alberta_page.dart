import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';

import 'alberta_field.dart';
import 'alberta_header.dart';

Color blueTumourColor = Color.fromARGB(255, 68, 142, 179);
Color yellowCpsColor = Color.fromARGB(255, 229, 215, 95);
Color redClinicalColor = Color.fromARGB(255, 214, 85, 101);
Color blueTreatmentColor = Color.fromARGB(255, 85, 163, 188);
Color greyPrognosisColor = Color.fromARGB(255, 68, 103, 114);

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
                    //color: Colors.pink.withAlpha(25),
                    height: 300.0,
                    width: 530.0,
                    child: Column(
                      children: <Widget>[
                        _buildTitleRow(),
                        _buildSeparator(),
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

  Container _buildSeparator() {
    return Container(
      height: 2,
      width: 530,
      color: Color.fromARGB(255, 24, 125, 153),
    );
  }

  _buildTitleRow() {
    var heightTitleRow = 15.0;
    return Row(
      children: <Widget>[
        Container(
          height: heightTitleRow,
          width: 15.0,
          color: Colors.white,
          //child: Text('hola'),
        ),
        AlbertaHeader(
          height: heightTitleRow,
          width: 75.0,
          txt: 'bclc',

          //color: Colors.red,
        ),
        AlbertaHeader(
          height: heightTitleRow,
          width: 80.0,
          txt: 'stage_0_very_early',
          //color: Colors.yellow,
        ),
        AlbertaHeader(
          height: heightTitleRow,
          width: 105.0,
          //color: Colors.pink,
          txt: 'stage_a_early',
        ),
        AlbertaHeader(
          height: heightTitleRow,
          width: 110.0,
          txt: 'stage_b_intermediate',
          isSelected: true,

          // color: Colors.orange,
        ),
        AlbertaHeader(
          height: heightTitleRow,
          width: 85.0,
          txt: 'stage_c_advanced',
          //color: Colors.purple,
        ),
        AlbertaHeader(
          height: heightTitleRow,
          width: 60.0,
          txt: 'stage_d_end_stage',
          //color: Colors.blueGrey,
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
          width: 15.0,
          color: blueTumourColor,
        ),
        AlbertaHeader(
          height: heightTumourRow,
          width: 75.0,
          upperCase: true,
          txt: 'tumour',
          //color: Colors.pinkAccent,
        ),
        AlbertaField(
          height: heightTumourRow,
          width: 80.0,
          txt: '1_(≤2cm)',
          isSelected: false,
          padding: EdgeInsets.all(8),
          //color: Colors.green,
        ),
        AlbertaField(
          height: heightTumourRow,
          width: 105.0,
          txt: '1_(≥2cm)_or_up_to_3_(≤3cm)',
          padding: EdgeInsets.all(8),
          //color: Colors.deepPurpleAccent,
        ),
        AlbertaField(
          height: heightTumourRow,
          width: 110.0,
          txt: '>_milan_criteria',
          padding: EdgeInsets.all(8),

          // color: Colors.black,
        ),
        AlbertaField(
          height: heightTumourRow,
          width: 85.0,
          txt: 'pvi_n1_m1',
          padding: EdgeInsets.all(8),

          //color: Colors.greenAccent,
        ),
        Container(
          height: heightTumourRow,
          width: 60.0,
          color: Colors.white,
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
          width: 15.0,
          color: yellowCpsColor,
        ),
        AlbertaHeader(
          height: cpsHeight,
          width: 75.0,
          upperCase: true,
          txt: 'child_pugh_class',
          //color: Colors.green,
        ),
        AlbertaField(
          height: cpsHeight,
          width: 80.0,
          color: yellowCpsColor,
          //isSelected: true,
          txt: 'a',
          shape: BoxShape.circle,
        ),
        Container(
          height: cpsHeight,
          width: 105.0,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              AlbertaField(
                height: cpsHeight,
                width: 35.0,
                color: yellowCpsColor,
                //isSelected: true,
                txt: 'b',
                shape: BoxShape.circle,
              ),
              AlbertaField(
                height: cpsHeight,
                width: 35.0,
                color: yellowCpsColor,
                //isSelected: true,
                txt: 'c',
                shape: BoxShape.circle,
              ),
            ],
          ),
        ),
        Container(
          height: cpsHeight,
          width: 110.0,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              AlbertaField(
                height: cpsHeight,
                width: 35.0,
                color: yellowCpsColor,
                //isSelected: true,
                txt: 'b8_9_c',
                shape: BoxShape.circle,
              ),
              AlbertaField(
                height: cpsHeight,
                width: 35.0,
                color: yellowCpsColor,
                //isSelected: true,
                txt: 'a_b7',
                shape: BoxShape.circle,
              ),
            ],
          ),
        ),
        Container(
          height: cpsHeight,
          width: 85.0,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 7.5,
              ),
              AlbertaField(
                height: cpsHeight,
                width: 35.0,
                color: yellowCpsColor,
                //isSelected: true,
                txt: 'a*',
                shape: BoxShape.circle,
              ),
              AlbertaField(
                height: cpsHeight,
                width: 35.0,
                color: yellowCpsColor,
                //isSelected: true,
                txt: 'b_c',
                shape: BoxShape.circle,
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: cpsHeight,
          width: 60,
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
          color: redClinicalColor,
        ),
        AlbertaHeader(
          height: clinicalHeight,
          width: 75.0,
          upperCase: true,
          txt: 'clinical_questions',
          //color: Colors.black,
        ),
        Column(
          children: <Widget>[
            _buildPortalRow(),
            _build01Row(),
            _buildNoRow(),
            _buildMainPvtRow(),
            _buildNoYesRow(),
          ],
        )
      ],
    );
  }

  Row _buildPortalRow() {
    var portalHeight = 35.0;
    return Row(
      children: <Widget>[
        AlbertaField(
          height: portalHeight,
          width: 80.0,
          //
          txt: 'portal_ht_and_or_bilirubin',
        ),
        Container(
          width: 105.0,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 15,
              ),
              AlbertaField(
                height: portalHeight,
                width: 45.0,
                color: Colors.orange,
                txt: 'lt_candidate?',
                padding: EdgeInsets.fromLTRB(0, 4, 1, 4),
              ),
              AlbertaField(
                height: portalHeight,
                width: 45.0,
                color: Colors.orange,
                txt: 'lt_candidate?',
                padding: EdgeInsets.fromLTRB(1, 4, 0, 4),
              ),
            ],
          ),
        ),
        Container(
          width: 195,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              AlbertaField(
                height: portalHeight,
                width: 110.0,
                txt: 'ecog_ps',
                padding: EdgeInsets.fromLTRB(48, 8, 1, 8),
                //color: Colors.cyan,
              ),


              AlbertaField(
                height: portalHeight,
                width: 85.0,
                color: Colors.pinkAccent,
                txt: 'ecog_ps',
                padding: EdgeInsets.fromLTRB(1, 8, 23, 8),

              ),
            ],
          ),
        ),
        Container(
          height: portalHeight,
          width: 60.0,
          color: Colors.white,
        )
      ],
    );
  }

  Row _build01Row() {
    var row01Height = 25.0;
    return Row(
      children: <Widget>[
        Container(
          height: row01Height,
          width: 185,
          color: Colors.white,
        ),
        Container(
          height: row01Height,
          width: 195,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                width: 44,
                color: Colors.white,
              ),
              AlbertaField(
                width: 35.0,
                height: row01Height,
                txt: '0_1',
                shape: BoxShape.circle,
                padding: EdgeInsets.zero,
              ),
              Container(
                width: 15,
                color: Colors.white,
              ),
              AlbertaField(
                width: 35.0,
                height: row01Height,
                txt: '>2',
                shape: BoxShape.circle,
                padding: EdgeInsets.zero,
              )
            ],
          ),
        ),
        /*Container(
          height: row01Height,
          width: 85,
          color: Colors.pinkAccent,
        ),*/
        Container(
          height: row01Height,
          width: 60,
          color: Colors.white,
        )
      ],
    );
  }

  _buildNoRow() {
    var rowNoHeight = 25.0;
    return Row(
      children: <Widget>[
        Container(
          height: rowNoHeight,
          width: 80,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(width: 10),
              AlbertaField(
                width: 25.0,
                height: rowNoHeight,
                shape: BoxShape.circle,
                txt: 'no',
                padding: EdgeInsets.zero,
              ),
              Container(
                width: 20,
                color: Colors.white,
              ),
              AlbertaField(
                width: 25.0,
                shape: BoxShape.circle,
                height: rowNoHeight,
                txt: 'yes',
                padding: EdgeInsets.zero,
              ),

            ],
          ),
        ),
        Container(
          height: rowNoHeight,
          width: 105,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              SizedBox(width: 20),
              AlbertaField(
                width: 25.0,
                height: rowNoHeight,
                shape: BoxShape.circle,
                txt: 'no',
                padding: EdgeInsets.zero,
              ),
              SizedBox(width: 3),
              AlbertaField(
                width: 25.0,
                shape: BoxShape.circle,
                height: rowNoHeight,
                txt: 'yes',
                padding: EdgeInsets.zero,
              ),

            ],
          ),

        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.only(right: 60),
          child: AlbertaField(
            height: rowNoHeight,
            width: 50.0,
            color: Colors.cyan,
            txt: 'no',
            shape: BoxShape.circle,
            padding: EdgeInsets.zero,
          ),
        ),
        Container(
          height: rowNoHeight,
          width: 85,
          color: Colors.pinkAccent,
        ),
        Container(
          height: rowNoHeight,
          width: 60,
          color: Colors.green,
        )
      ],
    );
  }

  _buildMainPvtRow() {
    var rowMainHeight = 25.0;
    return Row(
      children: <Widget>[
        Container(
          height: rowMainHeight,
          width: 80,
          color: Colors.brown,
        ),
        Container(
          height: rowMainHeight,
          width: 105,
          color: Colors.orange,
        ),
        Container(
          height: rowMainHeight,
          width: 110,
          color: Colors.cyan,
        ),
        Container(
          height: rowMainHeight,
          width: 85,
          color: Colors.pinkAccent,
        ),
        Container(
          height: rowMainHeight,
          width: 60,
          color: Colors.green,
        )
      ],
    );
  }

  _buildNoYesRow() {
    var rowNoYesHeight = 25.0;
    return Row(
      children: <Widget>[
        Container(
          height: rowNoYesHeight,
          width: 80,
          color: Colors.brown,
        ),
        Container(
          height: rowNoYesHeight,
          width: 105,
          color: Colors.orange,
        ),
        Container(
          height: rowNoYesHeight,
          width: 110,
          color: Colors.cyan,
        ),
        Container(
          height: rowNoYesHeight,
          width: 85,
          color: Colors.pinkAccent,
        ),
        Container(
          height: rowNoYesHeight,
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
          color: blueTreatmentColor,
        ),
        AlbertaHeader(
          height: treatmentHeight,
          width: 75.0,
          upperCase: true,
          txt: 'treatment',

          //color: Colors.green,
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
    var prognosisHeight = 30.0;
    return Row(
      children: <Widget>[
        Container(
          height: prognosisHeight,
          width: 15,
          color: greyPrognosisColor,
        ),
        AlbertaHeader(
          height: prognosisHeight,
          width: 75.0,
          upperCase: true,
          txt: 'prognosis',
          //color: Colors.purple,
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
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pointMode = ui.PointMode.polygon;
    final points = [
      Offset(50, 100),
      Offset(150, 75),
      Offset(250, 250),
      Offset(130, 200),
      Offset(270, 100),
    ];
    final paint = Paint()
      ..color = blueTreatmentColor
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
          Offset(100, 43),
          Offset(100, 70),
          Offset(280, 70),
          Offset(280, 44),
          Offset(276, 48),
          Offset(280, 44),
          Offset(284, 48),
        ],
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
