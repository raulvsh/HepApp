import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/PDFButton.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Module1Page extends StatefulWidget {
  @override
  _Module1PageState createState() => _Module1PageState();
}

class _Module1PageState extends State<Module1Page> {
  String assetPDFPath = "";
  final numModules = 3;

  static var ChaptersMod1 = [

    ['chapter_1', '1_chapters.png', 'HepAPP_M1C1.pdf'],
    ['chapter_2', '1_chapters.png', 'HepAPP_M1C2.pdf'],
    ['chapter_3', '1_chapters.png', 'HepAPP_M1C3.pdf'],

  ];

  var numChaptersModule1 = ChaptersMod1.length;

  /*var chapterIndexMod1 = [
    "Chapter1",
    "Chapter2",
    "Chapter3",
  ];

  var chapterInfoMod1 = {
    "Chapter1": ['chapter_1', '1_chapters.png', 'HepAPP_M1C1.pdf'],
    "Chapter2": ['chapter_2', '1_chapters.png', 'HepAPP_M1C2.pdf'],
    "Chapter3": ['chapter_3', '1_chapters.png', 'HepAPP_M1C3.pdf'],
  };*/

  @override
  void initState() {
    super.initState();
    /*Se llama al método que construye el PDF
    * La función then es similar a las Promises de JavaScript */
    //Aquí se pone el pdf a leer
    //pasarlo a cuando se pulsa
    /*getFileFromAsset("assets/pdfs/HepAPP_M1C1.pdf").then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

        //drawer: MenuWidget(),
        appBar: CustomAppBar(context, 'module_1'),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return _buildLayout(orientation);
          },
        ),
        //bottomSheet: _buildBottomSheet(context),
        bottomSheet: BottomNavigationSheet(0, '/ModulePV', numChaptersModule1));
  }

  /*Row _buildBottomSheet(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          color: Theme.of(context).primaryColor,

          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/ModulePV2'),
        )

      ],
    );
  }*/

  _buildLayout(orientation) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
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
              ? EdgeInsets.symmetric(vertical: 20 * padding)
              : EdgeInsets.symmetric(vertical: 4 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildChaptersGridView(),
        ),
      ),
    );
  }

  _buildChaptersGridView() {
    List<PDFButton> widgets = [];
    for (int i = 0; i < numChaptersModule1; i++) {
      widgets.add(PDFButton(context, ChaptersMod1[i],
          'module_1_chapter_${i + 1}'));
    }
    return widgets;
  }
}