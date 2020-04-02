import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/widgets/ComboButton.dart';
import 'package:hepapp/widgets/HomeAppBar.dart';
import 'package:image_picker_saver/image_picker_saver.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*||título | imagen | ruta | tipo ||*/
  static var homeSections = [
    ['chapters', 'items/1_chapters.png', '/Chapters', 'Nav'],
    ['podcasts', 'items/2_podcasts.png', '/PodcastsPV', 'Nav'],

    ['cards', 'items/3_cards.png', 'https://cards.ucalgary.ca', 'Web'],
    ['figures', 'items/4_figures.png', '/Figures', 'Nav'],
    ['calculators', 'items/5_calculators.png', '/Calculators', 'Nav'],
    ['resources', 'items/6_resources.png', '/Resources', 'Nav'],

    [
      'pub_med',
      'items/7_pubmed.png',
      'https://www.ncbi.nlm.nih.gov/pubmed/',
      'Web'
    ],
    [
      'information',
      'items/8_information.png',
      'HepAPP_Introduction.pdf',
      'PDF'
    ],
  ];

  var numHomeSections = homeSections.length;
  static GlobalKey screen = GlobalKey();

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
      body: RepaintBoundary(
        key: screen,
        child: OrientationBuilder(
          builder: (context, orientation) {
            return _buildLayout(orientation);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: takeScreenShot,
        child: new Icon(Icons.add_to_home_screen),
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
      color: Color.fromARGB(255, 250, 250, 250),
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
    for (int i = 0; i < numHomeSections; i++) {
      widgets.add(ComboButton(context, homeSections[i], 0));
    }

    /*widgets.add(NavigationButton(context, homeSections[0]));
    widgets.add(NavigationButton(context, homeSections[1], 0));
    widgets.add(WebButton(context, homeSections[2]));

    widgets.add(NavigationButton(context, homeSections[3]));
    widgets.add(NavigationButton(context, homeSections[4]));
    widgets.add(NavigationButton(context, homeSections[5]));

    widgets.add(WebButton(context, homeSections[6]));
    widgets.add(PDFButton(context, homeSections[7], 'information'));
*/
    return widgets;
  }

  takeScreenShot() async {
    RenderRepaintBoundary boundary = screen.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage(pixelRatio: 3);
    ByteData byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    var filePath = await ImagePickerSaver.saveFile(
        fileData: byteData.buffer.asUint8List());
    print(filePath);
  }
}
