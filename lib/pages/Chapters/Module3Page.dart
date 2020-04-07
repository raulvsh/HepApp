import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../CommonGridPage.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Module3Page extends StatefulWidget {
  @override
  _Module3PageState createState() => _Module3PageState();
}

class _Module3PageState extends State<Module3Page> {
  String assetPDFPath = "";
  final numModules = 3;

  static var chaptersMod3 = [
    ['chapter_10', 'items/1_chapters.png', 'HepAPP_M3C10.pdf', 'PDF'],
    ['chapter_11', 'items/1_chapters.png', 'HepAPP_M3C11.pdf', 'PDF'],
    ['chapter_12', 'items/1_chapters.png', 'HepAPP_M3C12.pdf', 'PDF'],
    ['chapter_13', 'items/1_chapters.png', 'HepAPP_M3C13.pdf', 'PDF'],
    ['chapter_14', 'items/1_chapters.png', 'HepAPP_M3C14.pdf', 'PDF'],
    ['chapter_15', 'items/1_chapters.png', 'HepAPP_M3C15.pdf', 'PDF'],
  ];

  var numChaptersModule3 = chaptersMod3.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca
        drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'module_3'),
        body: CommonGridPage(data: chaptersMod3),


        /*OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),*/
        bottomSheet: BottomNavigationSheet(2, '/ModulePV', numModules));


  }

/* _buildLayout(orientation) {
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
    List<Widget> widgets = [];
    for (int i = 0; i < numChaptersModule3; i++) {
      widgets.add(ComboButton(context, chaptersMod3[i]));
      */ /*widgets.add(PDFButton(context, ChaptersMod3[i],
          'module_3_chapter_${i + 10}'));*/ /*
    }
    return widgets;
  }*/
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
