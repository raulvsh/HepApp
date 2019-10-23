import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hepapp/widgets/HomeAppBar.dart';
import 'package:hepapp/widgets/HomeButton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final title = 'HepApp';
  final numHomeCategories = 8;

  var sectionTypesNames = [
    "Chapters",
    "Podcasts",
    "Cards",
    "Figures",
    "Calculators",
    "Resources",
    "PubMed",
    "Information",
    "Information2",
  ];

  var sectionTypes = {
    "Chapters": ['Chapters', '1_chapters.png', '/Chapters'],
    "Podcasts": ['Podcasts', '2_podcasts.png', '/Podcasts'],
    "Cards": ['Cards', '3_cards.png', '/Cards'],
    "Figures": ['Figures', '4_figures.png', '/Figures'],
    "Calculators": ['Calculators', '5_calculators.png', '/Calculators'],
    "Resources": ['Resources', '6_resources.png', '/Resources'],
    "PubMed": ['PubMed', '7_pubmed.png', '/PubMed'],
    "Information": ['Information', '8_information.png', '/Information'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: HomeAppBar(context, title),
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

  //Método para crear la lista de botones según, en vez de colocar los 8 botones directamente
  _buildHomeGridView() {
    List<HomeButton> widgets = [];

    for (int i = 0; i < numHomeCategories; i++) {
      widgets.add(HomeButton(context, sectionTypes[sectionTypesNames[i]]));
    }

    return widgets;
  }
}
