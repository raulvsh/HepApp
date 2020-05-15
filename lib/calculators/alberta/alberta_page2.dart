import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';

import 'alberta_circle_field.dart';
import 'alberta_header.dart';
import 'alberta_square_field.dart';

Color blueTumourColor = Color.fromARGB(255, 68, 142, 179);
Color yellowCpsColor = Color.fromARGB(255, 229, 215, 95);
Color redClinicalColor = Color.fromARGB(255, 214, 85, 101);
Color blueTreatmentColor = Color.fromARGB(255, 85, 163, 188);
Color greyPrognosisColor = Color.fromARGB(255, 68, 103, 114);
double totalWidth = 530.0;
double totalHeight = 300.0;
bool isSelected = false;

class AlbertaPage2 extends StatefulWidget {
  //final title;
  //final data;
  //final type;

  /* AlbertaPage({
    this.title,
    this.data,
    this.type,
  });*/

  @override
  _AlbertaPage2State createState() => _AlbertaPage2State();
}

class _AlbertaPage2State extends State<AlbertaPage2> {
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
          //alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Stack(
              children: <Widget>[
                Container(
                  //color: Colors.pink.withAlpha(25),
                  height: totalHeight,
                  width: totalWidth,
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
                  height: totalHeight,
                  width: totalWidth,
                  child: CustomPaint(
                    size: Size(totalHeight, totalWidth),
                    painter: MyPainter(),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  height: totalHeight,
                  width: totalWidth,
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    //: EdgeInsets.all(5),

                    child: Text(
                      'ON/OFF',
                      style: TextStyle(fontSize: 10),
                    ),
                    onPressed: () {
                      isSelected = !isSelected;
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTitleRow() {
    var heightTitleRow = 15.0;
    print(isSelected);
    return Container(
      width: totalWidth,
      height: heightTitleRow,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          SizedBox(width: 15.0),
          /*Container(
            height: heightTitleRow,
            width: 15.0,
            color: Colors.white,
          ),*/
          AlbertaHeader(
            height: heightTitleRow,
            width: 75.0,
            txt: 'bclc',
            isSelected: isSelected,

            //color: Colors.red,
          ),
          AlbertaHeader(
            height: heightTitleRow,
            width: 80.0,
            txt: 'stage_0_very_early',
            isSelected: isSelected,

            //color: Colors.yellow,
          ),
          AlbertaHeader(
            height: heightTitleRow,
            width: 105.0,
            //color: Colors.pink,
            txt: 'stage_a_early',
            isSelected: isSelected,
          ),
          AlbertaHeader(
            height: heightTitleRow,
            width: 110.0,
            txt: 'stage_b_intermediate',
            isSelected: isSelected,

            // color: Colors.orange,
          ),
          AlbertaHeader(
            height: heightTitleRow,
            width: 85.0,
            txt: 'stage_c_advanced',
            isSelected: isSelected,

            //color: Colors.purple,
          ),
          AlbertaHeader(
            height: heightTitleRow,
            width: 60.0,
            txt: 'stage_d_end_stage',
            isSelected: isSelected,

            //color: Colors.blueGrey,
          )
        ],
      ),
    );
  }

  Container _buildSeparator() {
    return Container(
      height: 2,
      width: totalWidth,
      color: Color.fromARGB(255, 24, 125, 153),
    );
  }

  _buildTumourRow() {
    var heightTumourRow = 35.0;
    return Container(
      height: heightTumourRow,
      width: totalWidth,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            //height: heightTumourRow,
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
          AlbertaRectangleField(
            //height: heightTumourRow,
            width: 80.0,
            txt: '1_(≤2cm)',
            isSelected: isSelected,
            color: blueTumourColor,

            // padding: EdgeInsets.all(8),
            //color: Colors.green,
          ),
          AlbertaRectangleField(
            height: heightTumourRow,
            width: 105.0,
            txt: '1_(≥2cm)_or_up_to_3_(≤3cm)',
            isSelected: isSelected,
            color: blueTumourColor,
            //padding: EdgeInsets.all(4),
            //color: Colors.deepPurpleAccent,
          ),
          AlbertaRectangleField(
            //height: heightTumourRow,
            width: 110.0,
            txt: '>_milan_criteria',
            isSelected: isSelected,
            color: blueTumourColor,
            //padding: EdgeInsets.all(8),

            // color: Colors.black,
          ),
          AlbertaRectangleField(
            //height: heightTumourRow,
            width: 85.0,
            txt: 'pvi_n1_m1',
            isSelected: isSelected,
            color: blueTumourColor,
            //padding: EdgeInsets.all(8),

            //color: Colors.greenAccent,
          ),
          /*Container(
            height: heightTumourRow,
            width: 60.0,
            color: Colors.white,
          )*/
        ],
      ),
    );
  }

  _buildCpsRow() {
    var cpsHeight = 35.0;
    return Container(
      height: cpsHeight,
      width: totalWidth,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            //height: cpsHeight,
            width: 15.0,
            color: yellowCpsColor,
          ),
          AlbertaHeader(
            //height: cpsHeight,
            width: 75.0,
            upperCase: true,
            txt: 'child_pugh_class',
            //color: Colors.green,
          ),
          AlbertaCircleField(
            //height: cpsHeight,
            width: 80.0,
            //isSelected: true,
            padding: EdgeInsets.all(5),
            txt: 'a',
            isSelected: isSelected,
            color: yellowCpsColor,

            //shape: BoxShape.circle,
          ),
          Container(
            //height: cpsHeight,
            width: 105.0,
            //color: Colors.white,
            child: Row(
              children: <Widget>[
                SizedBox(width: 25),
                AlbertaCircleField(
                  //height: cpsHeight,
                  width: 35.0,
                  isSelected: isSelected,
                  color: yellowCpsColor,
                  //isSelected: true,
                  padding: EdgeInsets.all(5),

                  txt: 'b',
                  //shape: BoxShape.circle,
                ),
                AlbertaCircleField(
                  //height: cpsHeight,
                  width: 35.0,
                  isSelected: isSelected,
                  color: yellowCpsColor,
                  padding: EdgeInsets.all(5),

                  //isSelected: true,
                  txt: 'c',
                  //shape: BoxShape.circle,
                ),
              ],
            ),
          ),
          Container(
            //height: cpsHeight,
            width: 110.0,
            //color: Colors.white,
            child: Row(
              children: <Widget>[
                SizedBox(width: 20),
                AlbertaCircleField(
                  height: cpsHeight,
                  width: 25.0,
                  isSelected: isSelected,
                  color: yellowCpsColor,
                  //isSelected: true,
                  txt: 'b8_9_c',
                  //shape: BoxShape.circle,
                  //padding: EdgeInsets.zero,
                ),
                SizedBox(width: 20),
                AlbertaCircleField(
                  height: cpsHeight,
                  width: 25.0,
                  isSelected: isSelected,
                  color: yellowCpsColor,
                  //isSelected: true,
                  txt: 'a_b7',
                  //shape: BoxShape.circle,
                ),
              ],
            ),
          ),
          Container(
            //height: cpsHeight,
            width: 85.0,
            //color: Colors.white,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 7.5,
                ),
                AlbertaCircleField(
                  // height: cpsHeight,
                  width: 35.0,
                  isSelected: isSelected,
                  color: yellowCpsColor,
                  //isSelected: true,
                  txt: 'a*',
                  padding: EdgeInsets.all(5),

                  //shape: BoxShape.circle,
                ),
                AlbertaCircleField(
                  height: cpsHeight,
                  width: 35.0,
                  isSelected: isSelected,
                  color: yellowCpsColor,
                  padding: EdgeInsets.all(5),

                  //isSelected: true,
                  txt: 'b_c',
                  //shape: BoxShape.circle,
                ),
              ],
            ),
          ),
          /*Container(
            color: Colors.white,
            height: cpsHeight,
            width: 60,
          )*/
        ],
      ),
    );
  }

  _buildClinicalRow() {
    var clinicalHeight = 135.0;
    return Container(
      width: totalWidth,
      height: clinicalHeight,
      color: Colors.white,
      child: Row(
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
      ),
    );
  }

  _buildPortalRow() {
    var portalHeight = 35.0;
    return Container(
      //color: Colors.white,
      width: 440,
      child: Row(
        children: <Widget>[
          AlbertaRectangleField(
            height: portalHeight,
            width: 80.0,
            //
            txt: 'portal_ht_and_or_bilirubin',
            padding: EdgeInsets.all(4),
            isSelected: isSelected,
            color: redClinicalColor,
          ),
          Container(
            width: 105.0,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                AlbertaRectangleField(
                  height: portalHeight,
                  width: 45.0,
                  isSelected: isSelected,
                  color: redClinicalColor,
                  txt: 'lt_candidate?',
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                ),
                AlbertaRectangleField(
                  height: portalHeight,
                  width: 45.0,
                  isSelected: isSelected,
                  color: redClinicalColor,
                  txt: 'lt_candidate?',
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                ),
              ],
            ),
          ),
          Container(
            width: 195,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                AlbertaRectangleField(
                  height: portalHeight,
                  width: 110.0,
                  txt: 'ecog_ps',
                  padding: EdgeInsets.fromLTRB(48, 4, 0, 12),
                  isSelected: isSelected,
                  color: redClinicalColor,
                  //color: Colors.cyan,
                ),
                AlbertaRectangleField(
                  height: portalHeight,
                  width: 85.0,
                  //color: Colors.pinkAccent,
                  txt: 'ecog_ps',
                  padding: EdgeInsets.fromLTRB(0, 4, 23, 12),
                  isSelected: isSelected,
                  color: redClinicalColor,
                ),
              ],
            ),
          ),
          /*Container(
            height: portalHeight,
            width: 60.0,
            color: Colors.white,
          )*/
        ],
      ),
    );
  }

  _build01Row() {
    var row01Height = 25.0;
    return Container(
      width: 440,
      //color: Colors.white,
      child: Row(
        children: <Widget>[
          SizedBox(width: 185),
          /*Container(
            height: row01Height,
            width: 185,
            color: Colors.white,
          ),*/
          Container(
            height: row01Height,
            width: 195,
            //color: Colors.pinkAccent,
            child: Row(
              children: <Widget>[
                SizedBox(width: 44),
                /*Container(
                  width: 44,
                  color: Colors.white,
                ),*/
                AlbertaCircleField(
                  width: 35.0,
                  height: row01Height,
                  txt: '0_1',
                  isSelected: isSelected,
                  color: redClinicalColor,
                  //shape: BoxShape.circle,
                  // padding: EdgeInsets.zero,
                ),
                SizedBox(width: 15),
                AlbertaCircleField(
                  width: 35.0,
                  height: row01Height,
                  txt: '>2',
                  isSelected: isSelected,
                  color: redClinicalColor,
                  //shape: BoxShape.circle,
                  //padding: EdgeInsets.zero,
                )
              ],
            ),
          ),
          /*Container(
            height: row01Height,
            width: 85,
            color: Colors.pinkAccent,
          ),*/
          /*Container(
            height: row01Height,
            width: 60,
            color: Colors.white,
          )*/
        ],
      ),
    );
  }

  _buildNoRow() {
    var rowNoHeight = 25.0;
    return Container(
      width: 440,
      height: rowNoHeight,
      child: Row(
        children: <Widget>[
          Container(
            height: rowNoHeight,
            width: 80,
            //color: Colors.white,
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                AlbertaCircleField(
                  width: 25.0,
                  height: rowNoHeight,
                  //shape: BoxShape.circle,
                  txt: 'no',
                  isSelected: isSelected,
                  color: redClinicalColor,
                  //padding: EdgeInsets.zero,
                ),
                SizedBox(width: 20),
                /*Container(
                  width: 20,
                  color: Colors.white,
                ),*/
                AlbertaCircleField(
                  width: 25.0,
                  //shape: BoxShape.circle,
                  height: rowNoHeight,
                  txt: 'yes',
                  isSelected: isSelected,
                  color: redClinicalColor,
                  //padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          Container(
            height: rowNoHeight,
            width: 105,
            //color: Colors.white,
            child: Row(
              children: <Widget>[
                SizedBox(width: 20),
                AlbertaCircleField(
                  width: 25.0,
                  height: rowNoHeight,
                  //shape: BoxShape.circle,
                  txt: 'no',
                  isSelected: isSelected,
                  color: redClinicalColor,
                  //padding: EdgeInsets.zero,
                ),
                SizedBox(width: 5),
                AlbertaCircleField(
                  width: 25.0,
                  //shape: BoxShape.circle,
                  height: rowNoHeight,
                  txt: 'yes',
                  isSelected: isSelected,
                  color: redClinicalColor,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          // Container(
          //color: Colors.white,

          //padding: EdgeInsets.only(right: 60),
          //child:
          AlbertaCircleField(
            padding: EdgeInsets.only(right: 80),
            //height: rowNoHeight,
            width: 110.0,
            //color: Colors.cyan,
            txt: 'no',
            isSelected: isSelected,
            color: redClinicalColor,
            //shape: BoxShape.circle,
            //padding: EdgeInsets.zero,
          ),
          //),
          /*Container(
            height: rowNoHeight,
            width: 85,
            color: Colors.pinkAccent,
          ),
          Container(
            height: rowNoHeight,
            width: 60,
            color: Colors.green,
          )*/
        ],
      ),
    );
  }

  _buildMainPvtRow() {
    var rowMainPvtHeight = 25.0;
    return Container(
      width: 440,
      height: rowMainPvtHeight,
      child: Row(
        children: <Widget>[
          SizedBox(width: 80),
          SizedBox(width: 105),
          AlbertaRectangleField(
            height: rowMainPvtHeight,
            width: 110.0,
            txt: 'main_pvt?',
            isSelected: isSelected,
            color: redClinicalColor,
            padding: EdgeInsets.fromLTRB(30, 4, 15, 4),
            //color: Colors.cyan,
          ),
          AlbertaCircleField(
            height: rowMainPvtHeight,
            width: 85.0,
            txt: '0_2',
            isSelected: isSelected,
            color: redClinicalColor,
            padding: EdgeInsets.only(right: 20),
          ),
          /*Container(
            height: rowMainPvtHeight,
            width: 85,
            color: Colors.pinkAccent,
          ),*/
          /*Container(
            height: rowMainPvtHeight,
            width: 60,
            color: Colors.green,
          )*/
        ],
      ),
    );
  }

  _buildNoYesRow() {
    var rowNoYesHeight = 25.0;
    return Container(
      width: 440,
      height: rowNoYesHeight,
      child: Row(
        children: <Widget>[
          SizedBox(width: 80),
          SizedBox(width: 105),
          Container(
            height: rowNoYesHeight,
            width: 110,
            //color: Colors.white,
            child: Row(
              children: <Widget>[
                SizedBox(width: 28),
                AlbertaCircleField(
                  //padding: EdgeInsets.only(left: 20),
                  width: 25.0,
                  height: rowNoYesHeight,
                  //shape: BoxShape.circle,
                  txt: 'no',
                  isSelected: isSelected,
                  color: redClinicalColor,
                  //padding: EdgeInsets.zero,
                ),
                //SizedBox(width: 20),
                /*Container(
                  width: 20,
                  color: Colors.white,
                ),*/
                SizedBox(width: 20),
                AlbertaCircleField(
                  width: 25.0,
                  //shape: BoxShape.circle,
                  height: rowNoYesHeight,
                  txt: 'yes',
                  isSelected: isSelected,
                  color: redClinicalColor,
                  //padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          /*Container(
            height: rowNoYesHeight,
            width: 110,
            color: Colors.cyan,
          ),*/
          /*Container(
            height: rowNoYesHeight,
            width: 85,
            color: Colors.pinkAccent,
          ),
          Container(
            height: rowNoYesHeight,
            width: 60,
            color: Colors.green,
          )*/
        ],
      ),
    );
  }

  _buildTreatmentRow() {
    var treatmentHeight = 48.0;
    return Container(
      width: 530,
      height: treatmentHeight,
      color: Colors.white,
      child: Row(
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
            width: 185,
            //color: Colors.yellow,
            child: Column(
              children: <Widget>[
                Container(
                  width: 185,
                  height: 24,
                  //color: Colors.pinkAccent,
                  child: Row(
                    children: <Widget>[
                      AlbertaRectangleField(
                        width: 90.0,
                        txt: 'resection',
                        padding: EdgeInsets.fromLTRB(4, 4, 2, 2),
                        isSelected: isSelected,
                        color: blueTreatmentColor,
                      ),
                      AlbertaRectangleField(
                        width: 40.0,
                        txt: 'rfa',
                        padding: EdgeInsets.fromLTRB(2, 4, 2, 2),
                        isSelected: isSelected,
                        color: blueTreatmentColor,
                      ),
                      AlbertaRectangleField(
                        height: 24.0,
                        width: 40.0,
                        txt: 'lt',
                        padding: EdgeInsets.fromLTRB(2, 4, 4, 2),
                        isSelected: isSelected,
                        color: blueTreatmentColor,
                      )
                    ],
                  ),
                ),
                AlbertaRectangleField(
                  width: 185.0,
                  height: 24.0,
                  txt: 'curative_options',
                  color: blueTreatmentColor,
                  isSelected: isSelected,
                  padding: EdgeInsets.fromLTRB(4, 2, 19, 4),
                )
              ],
            ),
          ),
          /*Container(
            height: treatmentHeight,
            width: 105,
            color: Colors.pink,
          ),*/
          Container(
            height: treatmentHeight,
            width: 195,
            //color: Colors.yellow,
            child: Column(
              children: <Widget>[
                Container(
                  width: 195,
                  height: 24,
                  //color: Colors.pinkAccent,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 9),
                      AlbertaRectangleField(
                        width: 32.0,
                        height: 24.0,
                        txt: 'tare',
                        padding: EdgeInsets.fromLTRB(0, 4, 0, 2),
                        isSelected: isSelected,
                        color: blueTreatmentColor,
                      ),
                      AlbertaRectangleField(
                        width: 32.0,
                        height: 24.0,
                        txt: 'tace',
                        padding: EdgeInsets.fromLTRB(0, 4, 0, 2),
                        isSelected: isSelected,
                        color: blueTreatmentColor,
                      ),
                      AlbertaRectangleField(
                        width: 32.0,
                        height: 24.0,
                        txt: 'tare',
                        padding: EdgeInsets.fromLTRB(0, 4, 2, 2),
                        isSelected: isSelected,
                        color: blueTreatmentColor,
                      ),
                      AlbertaRectangleField(
                        height: 24.0,
                        width: 80.0,
                        txt: 'sorafenib',
                        padding: EdgeInsets.fromLTRB(2, 4, 4, 2),
                        isSelected: isSelected,
                        color: blueTreatmentColor,
                      )
                    ],
                  ),
                ),
                AlbertaRectangleField(
                  width: 195.0,
                  height: 24.0,
                  txt: 'palliative_options',
                  color: blueTreatmentColor,
                  isSelected: isSelected,
                  padding: EdgeInsets.fromLTRB(9, 2, 14, 4),
                )
              ],
            ),
          ),
          AlbertaRectangleField(
            height: treatmentHeight,
            width: 60.0,
            color: blueTreatmentColor,
            isSelected: isSelected,
            txt: 'best_supportive_care',
            padding: EdgeInsets.all(4),
          )
        ],
      ),
    );
  }

  _buildPrognosisRow() {
    var prognosisHeight = 30.0;
    return Container(
      width: totalWidth,
      color: Colors.white,
      child: Row(
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
          AlbertaRectangleField(
            width: 185.0,
            height: prognosisHeight,
            txt: '5_year_survival',
            color: greyPrognosisColor,
            isSelected: isSelected,
            padding: EdgeInsets.fromLTRB(4, 0, 19, 0),
          ),
          Container(
            width: 195,
            height: prognosisHeight,
            //color: Colors.pinkAccent,
            child: Row(
              children: <Widget>[
                SizedBox(width: 9),
                AlbertaRectangleField(
                  width: 96.0,
                  height: prognosisHeight,
                  txt: '~20_mo',
                  padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                  isSelected: isSelected,
                  color: greyPrognosisColor,
                ),
                AlbertaRectangleField(
                  height: prognosisHeight,
                  width: 80.0,
                  txt: '~11_mo',
                  padding: EdgeInsets.fromLTRB(2, 0, 3, 0),
                  isSelected: isSelected,
                  color: greyPrognosisColor,
                )
              ],
            ),
          ),
          AlbertaRectangleField(
            height: prognosisHeight,
            width: 60.0,
            color: greyPrognosisColor,
            txt: '~3_mo',
            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
            isSelected: isSelected,
          )
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pointMode = ui.PointMode.polygon;
    final p1 = Offset(50, 50);
    final p2 = Offset(250, 150);
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
    //canvas.drawLine(p1, p2, paint);

    //canvas.drawPoints(pointMode, arrow00, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
