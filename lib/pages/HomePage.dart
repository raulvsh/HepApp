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
  /*||título | imagen | ruta | tipo ||*/
  static var homeSections = [
    ['chapters', '1_chapters.png', '/Chapters'],
    ['podcasts', '2_podcasts.png', '/PodcastsPV'],
    ['cards', '3_cards.png', 'https://cards.ucalgary.ca'],
    //['cards', '3_cards.png', '/Web', 'https://cards.ucalgary.ca'],

    ['figures', '4_figures.png', '/Figures'],
    ['calculators', '5_calculators.png', '/Calculators'],
    ['resources', '6_resources.png', '/Resources'],
    ['pub_med', '7_pubmed.png', '/Web', 'https://www.ncbi.nlm.nih.gov/pubmed/'],
    ['information', '8_information.png', 'HepAPP_Introduction.pdf'],
  ];


  var numHomeSections = homeSections.length;





  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 93, 188, 210),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness:  Brightness.light,
    ));*/

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
    //Guardado para cuando se combinen los botones en un mismo widget
    /*for (int i = 0; i < numHomeCategories - 2; i++) {
      widgets.add(HomeButton(context, sectionTypes[sectionTypesNames[i]]));
    }*/
    widgets.add(NavigationButton(context, homeSections[0]));
    widgets.add(NavigationButton(context, homeSections[1], 0));
    widgets.add(WebButton(context, homeSections[2]));
    // widgets.add(NavigationButton(context, homeSections[2], [homeSections[2][3], homeSections[2][0]]));

    widgets.add(NavigationButton(context, homeSections[3]));
    widgets.add(NavigationButton(context, homeSections[4]));
    widgets.add(NavigationButton(context, homeSections[5]));
    // widgets.add(NavigationButton(context, homeSections[6], [homeSections[6][3], homeSections[6][0]]));

    widgets.add(WebButton(context, homeSections[6]));
    widgets.add(
        PDFButton(context, homeSections[7], 'information'));

    return widgets;
  }
}
