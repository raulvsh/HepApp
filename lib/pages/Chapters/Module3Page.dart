import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/PDFButton.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Module3Page extends StatefulWidget {
  @override
  _Module3PageState createState() => _Module3PageState();
}

class _Module3PageState extends State<Module3Page> {
  String assetPDFPath = "";
  final numModules = 3;

  static var ChaptersMod3 = [
    ['chapter_10', '1_chapters.png', 'HepAPP_M3C10.pdf'],
    ['chapter_11', '1_chapters.png', 'HepAPP_M3C11.pdf'],
    ['chapter_12', '1_chapters.png', 'HepAPP_M3C12.pdf'],
    ['chapter_13', '1_chapters.png', 'HepAPP_M3C13.pdf'],
    ['chapter_14', '1_chapters.png', 'HepAPP_M3C14.pdf'],
    ['chapter_15', '1_chapters.png', 'HepAPP_M3C15.pdf'],
  ];

  var numChaptersModule3 = ChaptersMod3.length;


  /* var chapterIndexMod3 = [
    "Chapter10",
    "Chapter11",
    "Chapter12",
    "Chapter13",
    "Chapter14",
    "Chapter15",
  ];

  var chapterInfoMod3 = {
    "Chapter10": ['chapter_10', '1_chapters.png', 'HepAPP_M3C10.pdf'],
    "Chapter11": ['chapter_11', '1_chapters.png', 'HepAPP_M3C11.pdf'],
    "Chapter12": ['chapter_12', '1_chapters.png', 'HepAPP_M3C12.pdf'],
    "Chapter13": ['chapter_13', '1_chapters.png', 'HepAPP_M3C13.pdf'],
    "Chapter14": ['chapter_14', '1_chapters.png', 'HepAPP_M3C14.pdf'],
    "Chapter15": ['chapter_15', '1_chapters.png', 'HepAPP_M3C15.pdf'],
  };*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

        //drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'module_3'),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
        bottomSheet: BottomNavigationSheet(2, '/ModulePV', numModules));


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
    for (int i = 0; i < numChaptersModule3; i++) {
      widgets.add(PDFButton(context, ChaptersMod3[i],
          'module_3_chapter_${i + 10}'));
    }
    return widgets;
  }
}

/*

*/
/*Clase Boton creada para minimizar código*/ /*

class Boton extends StatelessWidget {
  final Widget child;
  final String text;

  const Boton({
    Key key,
    @required this.child,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            this.child,
            SizedBox(height: 8),
            Text(
              this.text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
*/
