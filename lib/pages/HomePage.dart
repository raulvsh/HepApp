import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hepapp/widgets/HomeAppBar.dart';
import 'package:hepapp/widgets/NavigationButton.dart';
import 'package:hepapp/widgets/PDFButton.dart';
import 'package:hepapp/widgets/WebButton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final numHomeCategories = 8;

  var sectionsIndex = [
    'Chapters',
    'Podcasts',
    'Cards',
    'Figures',
    'Calculators',
    'Resources',
    'PubMed',
    'Information',
  ];

  var sectionsInfo = {
    'Chapters': ['chapters', '1_chapters.png', '/Chapters'],
    'Podcasts': ['podcasts', '2_podcasts.png', '/PodcastsPV1'],
    'Cards': ['cards', '3_cards.png', 'https://cards.ucalgary.ca'],
    'Figures': ['figures', '4_figures.png', '/Figures'],
    'Calculators': ['calculators', '5_calculators.png', '/Calculators'],
    'Resources': ['resources', '6_resources.png', '/Resources'],
    'PubMed': [
      'pub_med',
      '7_pubmed.png',
      'https://www.ncbi.nlm.nih.gov/pubmed/'
    ],

    //'PubMed': ['pub_med', '7_pubmed.png', '/PubMed'],
    'Information': [
      'information',
      '8_information.png',
      'HepAPP_Introduction.pdf'
    ],
  };


  /*var pubmed = [
    //https://www.ncbi.nlm.nih.gov/pubmed/
    'pub_med', '7_pubmed.png', 'https://www.ncbi.nlm.nih.gov/pubmed/',
  ];

  var information = [
    'information', '8_information.png','HepAPP_Introduction.pdf',
  ];*/



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


    List<Widget> widgets = [];
    //Introduzco un botón menos que el número de categorías, ya que el botón de información nos dirigirá directamente al PDF
    /*for (int i = 0; i < numHomeCategories - 2; i++) {
      widgets.add(HomeButton(context, sectionTypes[sectionTypesNames[i]]));
    }*/
    widgets.add(NavigationButton(context, sectionsInfo[sectionsIndex[0]]));
    widgets.add(NavigationButton(context, sectionsInfo[sectionsIndex[1]]));
    widgets.add(WebButton(context, sectionsInfo[sectionsIndex[2]]));
    widgets.add(NavigationButton(context, sectionsInfo[sectionsIndex[3]]));
    widgets.add(NavigationButton(context, sectionsInfo[sectionsIndex[4]]));
    widgets.add(NavigationButton(context, sectionsInfo[sectionsIndex[5]]));

    widgets.add(WebButton(context, sectionsInfo[sectionsIndex[6]]));
    widgets.add(
        PDFButton(context, sectionsInfo[sectionsIndex[7]], 'information'));

    return widgets;
  }
}
