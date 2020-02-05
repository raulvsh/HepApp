import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/FigureButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import 'SchemesPageView.dart';

class SchemesFigPage extends StatefulWidget {
  @override
  _SchemesFigPageState createState() => _SchemesFigPageState();
}

class _SchemesFigPageState extends State<SchemesFigPage> {
  static var Schemes = [
    ['scheme_1', 'schemes/Scheme 1 Jaundice.png', '/SchemesPV1'],
    ['scheme_2', 'schemes/Scheme 2 AbN Liver Tests.png', '/SchemesPV2'],
    ['scheme_3', 'schemes/Scheme 3 Hepatomegaly.png', '/SchemesPV3'],
    ['scheme_4', 'schemes/Scheme 4 Splenomegaly.png', '/SchemesPV4'],
    ['scheme_5', 'schemes/Scheme 5 Liver Mass.png', '/SchemesPV5'],
    ['scheme_6', 'schemes/Scheme 6 UGI Bleed.png', '/SchemesPV6'],
    ['scheme_7', 'schemes/Scheme 7 Abdominal Distention.png', '/SchemesPV7'],
    ['scheme_8', 'schemes/Scheme 8 Decreased LOC.png', '/SchemesPV8'],
  ];


  var numSchemes = Schemes.length;

  /*var schemesIndex = [
    "Scheme1",
    "Scheme2",
    "Scheme3",
    "Scheme4",
    "Scheme5",
    "Scheme6",
    "Scheme7",
    "Scheme8",
  ];

  var schemesInfo = {
    "Scheme1": ['scheme_1', 'schemes/Scheme 1 Jaundice.png', '/SchemesPV1'],
    "Scheme2": ['scheme_2', 'schemes/Scheme 2 AbN Liver Tests.png', '/SchemesPV2'],
    "Scheme3": ['scheme_3', 'schemes/Scheme 3 Hepatomegaly.png', '/SchemesPV3'],
    "Scheme4": ['scheme_4', 'schemes/Scheme 4 Splenomegaly.png', '/SchemesPV4'],
    "Scheme5": ['scheme_5', 'schemes/Scheme 5 Liver Mass.png', '/SchemesPV5'],
    "Scheme6": ['scheme_6', 'schemes/Scheme 6 UGI Bleed.png', '/SchemesPV6'],
    "Scheme7": ['scheme_7', 'schemes/Scheme 7 Abdominal Distention.png', '/SchemesPV7'],
    "Scheme8": ['scheme_8', 'schemes/Scheme 8 Decreased LOC.png', '/SchemesPV8'],
  };
*/
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'schemes'),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
    );
  }

  _buildLayout(orientation) {
    final width = MediaQuery.of(context).size.width;
    var padding = width / 100;

    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.lightBlueAccent,
      child: FractionallySizedBox(
        widthFactor: orientation == Orientation.portrait ? 0.7 : 0.7,
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.symmetric(vertical: 6 * padding)
              : EdgeInsets.symmetric(vertical: 3 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildModulesGridView(),
        ),
      ),
    );
  }

  _buildModulesGridView() {
    List<Widget> widgets = [];
    for (int i = 0; i < numSchemes; i++) {
      widgets.add(FigureButton(
          context, Schemes[i], SchemesPageView(i)));
    }
    return widgets;
  }
}
