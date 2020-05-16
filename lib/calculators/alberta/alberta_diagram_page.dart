import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';

import 'alberta_circle_field.dart';
import 'alberta_diagram_painter.dart';
import 'alberta_header.dart';
import 'alberta_square_field.dart';

Color blueTumourColor = Color.fromARGB(255, 68, 142, 179);
Color yellowCpsColor = Color.fromARGB(255, 229, 215, 95);
Color redClinicalColor = Color.fromARGB(255, 214, 85, 101);
Color blueTreatmentColor = Color.fromARGB(255, 85, 163, 188);
Color greyPrognosisColor = Color.fromARGB(255, 68, 103, 114);
double totalWidth = 530.0;
double totalHeight = 300.0;
bool isSelectedGlobal = false;

class AlbertaPage extends StatefulWidget {
  final isSelected;

  //final data;
  //final type;

  AlbertaPage({
    this.isSelected,
    //this.data,
    //this.type,
  });

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
                    painter: AlbertaDiagramPainter(),
                  ),
                ),
                /*Container(
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
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTitleRow() {
    var heightTitleRow = 15.0;
    print(isSelectedGlobal);
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
            isSelected: widget.isSelected[0],

            //color: Colors.red,
          ),
          AlbertaHeader(
            height: heightTitleRow,
            width: 80.0,
            txt: 'stage_0_very_early',
            isSelected: widget.isSelected[1],

            //color: Colors.yellow,
          ),
          AlbertaHeader(
            height: heightTitleRow,
            width: 105.0,
            //color: Colors.pink,
            txt: 'stage_a_early',
            isSelected: widget.isSelected[2],
          ),
          AlbertaHeader(
            height: heightTitleRow,
            width: 110.0,
            txt: 'stage_b_intermediate',
            isSelected: widget.isSelected[3],

            // color: Colors.orange,
          ),
          AlbertaHeader(
            height: heightTitleRow,
            width: 85.0,
            txt: 'stage_c_advanced',
            isSelected: widget.isSelected[4],

            //color: Colors.purple,
          ),
          AlbertaHeader(
            height: heightTitleRow,
            width: 60.0,
            txt: 'stage_d_end_stage',
            isSelected: widget.isSelected[5],

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
            isSelected: widget.isSelected[6],
            color: blueTumourColor,

            // padding: EdgeInsets.all(8),
            //color: Colors.green,
          ),
          AlbertaRectangleField(
            height: heightTumourRow,
            width: 105.0,
            txt: '1_(≥2cm)_or_up_to_3_(≤3cm)',
            isSelected: widget.isSelected[7],
            color: blueTumourColor,
            //padding: EdgeInsets.all(4),
            //color: Colors.deepPurpleAccent,
          ),
          AlbertaRectangleField(
            width: 110.0,
            txt: '>_milan_criteria',
            isSelected: widget.isSelected[8],
            color: blueTumourColor,
          ),
          AlbertaRectangleField(
            width: 85.0,
            txt: 'pvi_n1_m1',
            isSelected: widget.isSelected[9],
            color: blueTumourColor,
          ),
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
            width: 15.0,
            color: yellowCpsColor,
          ),
          AlbertaHeader(
            width: 75.0,
            upperCase: true,
            txt: 'child_pugh_class',
          ),
          AlbertaCircleField(
            width: 80.0,
            padding: EdgeInsets.all(5),
            txt: 'a',
            isSelected: widget.isSelected[10],
            color: yellowCpsColor,
          ),
          Container(
            width: 105.0,
            child: Row(
              children: <Widget>[
                SizedBox(width: 25),
                AlbertaCircleField(
                  width: 35.0,
                  isSelected: widget.isSelected[11],
                  color: yellowCpsColor,
                  padding: EdgeInsets.all(5),
                  txt: 'b',
                ),
                AlbertaCircleField(
                  width: 35.0,
                  isSelected: widget.isSelected[12],
                  color: yellowCpsColor,
                  padding: EdgeInsets.all(5),
                  txt: 'c',
                ),
              ],
            ),
          ),
          Container(
            width: 110.0,
            child: Row(
              children: <Widget>[
                SizedBox(width: 20),
                AlbertaCircleField(
                  height: cpsHeight,
                  width: 25.0,
                  isSelected: widget.isSelected[13],
                  color: yellowCpsColor,
                  txt: 'b8_9_c',
                ),
                SizedBox(width: 20),
                AlbertaCircleField(
                  height: cpsHeight,
                  width: 25.0,
                  isSelected: widget.isSelected[14],
                  color: yellowCpsColor,
                  txt: 'a_b7',
                ),
              ],
            ),
          ),
          Container(
            width: 85.0,
            child: Row(
              children: <Widget>[
                SizedBox(width: 7.5),
                AlbertaCircleField(
                  width: 35.0,
                  isSelected: widget.isSelected[15],
                  color: yellowCpsColor,
                  txt: 'a*',
                  padding: EdgeInsets.all(5),
                ),
                AlbertaCircleField(
                  height: cpsHeight,
                  width: 35.0,
                  isSelected: widget.isSelected[16],
                  color: yellowCpsColor,
                  padding: EdgeInsets.all(5),
                  txt: 'b_c',
                ),
              ],
            ),
          ),
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
      width: 440,
      child: Row(
        children: <Widget>[
          AlbertaRectangleField(
            height: portalHeight,
            width: 80.0,
            txt: 'portal_ht_and_or_bilirubin',
            padding: EdgeInsets.all(4),
            isSelected: widget.isSelected[17],
            color: redClinicalColor,
          ),
          Container(
            width: 105.0,
            child: Row(
              children: <Widget>[
                SizedBox(width: 15),
                AlbertaRectangleField(
                  height: portalHeight,
                  width: 45.0,
                  isSelected: widget.isSelected[18],
                  color: redClinicalColor,
                  txt: 'lt_candidate?',
                  padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                ),
                AlbertaRectangleField(
                  height: portalHeight,
                  width: 45.0,
                  isSelected: widget.isSelected[19],
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
                  isSelected: widget.isSelected[20],
                  color: redClinicalColor,
                ),
                AlbertaRectangleField(
                  height: portalHeight,
                  width: 85.0,
                  txt: 'ecog_ps',
                  padding: EdgeInsets.fromLTRB(0, 4, 23, 12),
                  isSelected: widget.isSelected[21],
                  color: redClinicalColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _build01Row() {
    var row01Height = 25.0;
    return Container(
      width: 440,
      child: Row(
        children: <Widget>[
          SizedBox(width: 185),
          Container(
            height: row01Height,
            width: 195,
            child: Row(
              children: <Widget>[
                SizedBox(width: 44),
                AlbertaCircleField(
                  width: 35.0,
                  height: row01Height,
                  txt: '0_1',
                  isSelected: widget.isSelected[22],
                  color: redClinicalColor,
                ),
                SizedBox(width: 15),
                AlbertaCircleField(
                  width: 35.0,
                  height: row01Height,
                  txt: '>2',
                  isSelected: widget.isSelected[23],
                  color: redClinicalColor,
                )
              ],
            ),
          ),
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
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                AlbertaCircleField(
                  width: 25.0,
                  height: rowNoHeight,
                  txt: 'no',
                  isSelected: widget.isSelected[24],
                  color: redClinicalColor,
                ),
                SizedBox(width: 20),
                AlbertaCircleField(
                  width: 25.0,
                  height: rowNoHeight,
                  txt: 'yes',
                  isSelected: widget.isSelected[25],
                  color: redClinicalColor,
                ),
              ],
            ),
          ),
          Container(
            height: rowNoHeight,
            width: 105,
            child: Row(
              children: <Widget>[
                SizedBox(width: 20),
                AlbertaCircleField(
                  width: 25.0,
                  height: rowNoHeight,
                  txt: 'no',
                  isSelected: widget.isSelected[26],
                  color: redClinicalColor,
                ),
                SizedBox(width: 5),
                AlbertaCircleField(
                  width: 25.0,
                  height: rowNoHeight,
                  txt: 'yes',
                  isSelected: widget.isSelected[27],
                  color: redClinicalColor,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          AlbertaCircleField(
            padding: EdgeInsets.only(right: 80),
            width: 110.0,
            txt: 'no',
            isSelected: widget.isSelected[28],
            color: redClinicalColor,
          ),
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
            isSelected: widget.isSelected[29],
            color: redClinicalColor,
            padding: EdgeInsets.fromLTRB(30, 4, 15, 4),
          ),
          AlbertaCircleField(
            height: rowMainPvtHeight,
            width: 85.0,
            txt: '0_2',
            isSelected: widget.isSelected[30],
            color: redClinicalColor,
            padding: EdgeInsets.only(right: 20),
          ),
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
            child: Row(
              children: <Widget>[
                SizedBox(width: 28),
                AlbertaCircleField(
                  width: 25.0,
                  height: rowNoYesHeight,
                  txt: 'no',
                  isSelected: widget.isSelected[31],
                  color: redClinicalColor,
                ),
                SizedBox(width: 20),
                AlbertaCircleField(
                  width: 25.0,
                  height: rowNoYesHeight,
                  txt: 'yes',
                  isSelected: widget.isSelected[32],
                  color: redClinicalColor,
                ),
              ],
            ),
          ),
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
          ),
          Container(
            height: treatmentHeight,
            width: 185,
            child: Column(
              children: <Widget>[
                Container(
                  width: 185,
                  height: 24,
                  child: Row(
                    children: <Widget>[
                      AlbertaRectangleField(
                        width: 90.0,
                        txt: 'resection',
                        padding: EdgeInsets.fromLTRB(4, 4, 2, 2),
                        isSelected: widget.isSelected[33],
                        color: blueTreatmentColor,
                      ),
                      AlbertaRectangleField(
                        width: 40.0,
                        txt: 'rfa',
                        padding: EdgeInsets.fromLTRB(2, 4, 2, 2),
                        isSelected: widget.isSelected[34],
                        color: blueTreatmentColor,
                      ),
                      AlbertaRectangleField(
                        height: 24.0,
                        width: 40.0,
                        txt: 'lt',
                        padding: EdgeInsets.fromLTRB(2, 4, 4, 2),
                        isSelected: widget.isSelected[35],
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
                  isSelected: widget.isSelected[41],
                  padding: EdgeInsets.fromLTRB(4, 2, 19, 4),
                )
              ],
            ),
          ),
          Container(
            height: treatmentHeight,
            width: 195,
            child: Column(
              children: <Widget>[
                Container(
                  width: 195,
                  height: 24,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 9),
                      AlbertaRectangleField(
                        width: 32.0,
                        height: 24.0,
                        txt: 'tare',
                        padding: EdgeInsets.fromLTRB(0, 4, 0, 2),
                        isSelected: widget.isSelected[36],
                        color: blueTreatmentColor,
                      ),
                      AlbertaRectangleField(
                        width: 32.0,
                        height: 24.0,
                        txt: 'tace',
                        padding: EdgeInsets.fromLTRB(0, 4, 0, 2),
                        isSelected: widget.isSelected[37],
                        color: blueTreatmentColor,
                      ),
                      AlbertaRectangleField(
                        width: 32.0,
                        height: 24.0,
                        txt: 'tare',
                        padding: EdgeInsets.fromLTRB(0, 4, 2, 2),
                        isSelected: widget.isSelected[38],
                        color: blueTreatmentColor,
                      ),
                      AlbertaRectangleField(
                        height: 24.0,
                        width: 80.0,
                        txt: 'sorafenib',
                        padding: EdgeInsets.fromLTRB(2, 4, 4, 2),
                        isSelected: widget.isSelected[39],
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
                  isSelected: widget.isSelected[42],
                  padding: EdgeInsets.fromLTRB(9, 2, 14, 4),
                )
              ],
            ),
          ),
          AlbertaRectangleField(
            height: treatmentHeight,
            width: 60.0,
            color: blueTreatmentColor,
            isSelected: widget.isSelected[40],
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
          ),
          AlbertaRectangleField(
            width: 185.0,
            height: prognosisHeight,
            txt: '5_year_survival',
            color: greyPrognosisColor,
            isSelected: widget.isSelected[43],
            padding: EdgeInsets.fromLTRB(4, 0, 19, 0),
          ),
          Container(
            width: 195,
            height: prognosisHeight,
            child: Row(
              children: <Widget>[
                SizedBox(width: 9),
                AlbertaRectangleField(
                  width: 96.0,
                  height: prognosisHeight,
                  txt: '~20_mo',
                  padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                  isSelected: widget.isSelected[44],
                  color: greyPrognosisColor,
                ),
                AlbertaRectangleField(
                  height: prognosisHeight,
                  width: 80.0,
                  txt: '~11_mo',
                  padding: EdgeInsets.fromLTRB(2, 0, 3, 0),
                  isSelected: widget.isSelected[45],
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
            isSelected: widget.isSelected[46],
          )
        ],
      ),
    );
  }
}
