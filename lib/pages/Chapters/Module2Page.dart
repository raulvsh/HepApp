import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/PDFButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:path_provider/path_provider.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Module2Page extends StatefulWidget {
  @override
  _Module2PageState createState() => _Module2PageState();
}

class _Module2PageState extends State<Module2Page> {
  String assetPDFPath = "";

  final numChaptersModule2 = 6;

  var chapterIndexMod2 = [
    "Chapter4",
    "Chapter5",
    "Chapter6",
    "Chapter7",
    "Chapter8",
    "Chapter9",

  ];

  var chapterInfoMod2 = {
    "Chapter4": ['chapter_4', '1_chapters.png', 'HepAPP_M2C4.pdf'],
    "Chapter5": ['chapter_5', '1_chapters.png', 'HepAPP_M2C5.pdf'],
    "Chapter6": ['chapter_6', '1_chapters.png', 'HepAPP_M2C6.pdf'],
    "Chapter7": ['chapter_7', '1_chapters.png', 'HepAPP_M2C7.pdf'],
    "Chapter8": ['chapter_8', '1_chapters.png', 'HepAPP_M2C8.pdf'],
    "Chapter9": ['chapter_9', '1_chapters.png', 'HepAPP_M2C9.pdf'],

  };

  @override
  void initState() {
    super.initState();

  }

/*Construcción del Layout del menú principal*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'module_2'),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
      bottomSheet: _buildBottomSheet(context),

    );
  }

  Row _buildBottomSheet(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color.fromARGB(255, 93, 188, 210),

          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/Module1Chap'),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          color: Color.fromARGB(255, 93, 188, 210),

          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/Module3Chap'),
        )

      ],
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
    for (int i = 0; i < numChaptersModule2; i++) {
      widgets.add(PDFButton(context, chapterInfoMod2[chapterIndexMod2[i]],
          'module_2_chapter_${i + 4}'));
    }
    return widgets;
  }

}


/*Devuelve objeto de tipo Future porque es una tarea de larga duración*/
Future<File> getFileFromAsset(String asset) async {
  try {
    //print('Asset: $asset');
    /*Al ser un método asíncrono es necesario poner el await*/
    /*directamente va a cargar el fichero PDF*/
    var data = await rootBundle.load(asset);
    /*Conversión del PDF a bytes, para ello llamamos al buffer*/
    var bytes = data.buffer.asUint8List();
    /*Obtención del directorio principal de las aplicaciones*/
    var dir = await getApplicationDocumentsDirectory();
    /*Para mostrar un PDF dentro de la app es necesario crear un fichero,
      * al cuál le pasamos la ruta que acabo de obtener.
      * Este fichero en concreto será parte de la biblioteca de Entrada y salida*/
    //Este es el fichero que se lee, hay que pasárselo
    //File file = File("data/user/0/es.uva.tel.hepapp/app_flutter/HepAPP_M1C1.pdf");
    //File file = File(dir.path+'/'+asset);
    File file = File("${dir.path}/HepAPP_M1C1.pdf");
    //print('Dir Path del file ' + dir.path);
    /*Se añaden los bytes del PDF original al que acabo de crear*/
    File assetFile = await file.writeAsBytes(bytes);
    return assetFile;
  } catch (e) {
    throw Exception("Error al abrir el PDF CPS");
  }
}

