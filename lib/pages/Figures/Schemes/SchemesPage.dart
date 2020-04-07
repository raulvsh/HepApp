import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../../CommonGridPage.dart';

class SchemesPage extends StatefulWidget {
  @override
  _SchemesPageState createState() => _SchemesPageState();
}

class _SchemesPageState extends State<SchemesPage> {


  static var schemes = [
    ['jaundice', 'schemes/Scheme_1_Jaundice.png', '/SchemesPV'],
    ['abn_liver_tests', 'schemes/Scheme_2_AbN_Liver_Tests.png', '/SchemesPV'],
    ['hepatomegaly', 'schemes/Scheme_3_Hepatomegaly.png', '/SchemesPV'],
    ['splenomegaly', 'schemes/Scheme_4_Splenomegaly.png', '/SchemesPV'],
    ['liver_mass', 'schemes/Scheme_5_Liver_Mass.png', '/SchemesPV'],
    ['ugi_bleed', 'schemes/Scheme_6_UGI_Bleed.png', '/SchemesPV'],
    [
      'abdominal_distention',
      'schemes/Scheme_7_Abdominal_Distention.png',
      '/SchemesPV7'
    ],
    ['decreased_loc', 'schemes/Scheme_8_Decreased_LOC.png', '/SchemesPV8'],
  ];

  var numSchemes = schemes.length;

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
      body: CommonGridPage(data: schemes, type: 'figure'),

      /*OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),*/
    );
  }

/*_buildLayout(orientation) {
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
          context, schemes[i], i)); //, SchemesPageView(i)));
    }
    return widgets;
  }*/
}
