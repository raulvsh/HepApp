import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hepapp/widgets/HomeAppBar.dart';
import 'package:hepapp/widgets/HomeButton.dart';
import 'package:hepapp/widgets/PDFButton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final numHomeCategories = 8;

  var sectionTypesNames = [
    'Chapters',
    'Podcasts',
    'Cards',
    'Figures',
    'Calculators',
    'Resources',
    'PubMed',
    'Information',
  ];

  var sectionTypes = {
    'Chapters': ['chapters', '1_chapters.png', '/Chapters'],
    'Podcasts': ['podcasts', '2_podcasts.png', '/Podcasts'],
    'Cards': ['cards', '3_cards.png', '/Cards'],
    'Figures': ['figures', '4_figures.png', '/Figures'],
    'Calculators': ['calculators', '5_calculators.png', '/Calculators'],
    'Resources': ['resources', '6_resources.png', '/Resources'],
    'PubMed': ['pub_med', '7_pubmed.png', '/PubMed'],
    'Information': ['information', '8_information.png', '/Information'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: HomeAppBar(context),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
    );
  }

  _buildLayout(orientation) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    var padding = width / 100;

    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.red,
      child: FractionallySizedBox(
        widthFactor: orientation == Orientation.portrait ? 0.7 : 0.7,
        //Se puede personalizar el ancho en horizontal o vertical
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.symmetric(vertical: 3 * padding)
              : EdgeInsets.symmetric(vertical: padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildHomeGridView(),
        ),
      ),
    );
  }

  _buildHomeGridView() {
    var information = [
      'information',
      '8_information.png',
      'HepAPP_Introduction.pdf'
    ];

    List<Widget> widgets = [];
    //Introduzco un botón menos que el número de categorías, ya que el botón de información nos dirigirá directamente al PDF
    for (int i = 0; i < numHomeCategories - 1; i++) {
      widgets.add(HomeButton(context, sectionTypes[sectionTypesNames[i]]));
    }
    widgets.add(PDFButton(context, information, 'information'));

    return widgets;
  }
}
