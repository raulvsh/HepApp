import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/PDFButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:path_provider/path_provider.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Module1Page extends StatefulWidget {
  @override
  _Module1PageState createState() => _Module1PageState();
}

class _Module1PageState extends State<Module1Page> {
  String assetPDFPath = "";

  final numChaptersModule1 = 3;

  var chapterTypesNames = [
    "Chapter1",
    "Chapter2",
    "Chapter3",
  ];

  var chapterTypes = {
    "Chapter1": ['chapter_1', '1_chapters.png', 'HepAPP_M1C1.pdf'],
    "Chapter2": ['chapter_2', '1_chapters.png', 'HepAPP_M1C2.pdf'],
    "Chapter3": ['chapter_3', '1_chapters.png', 'HepAPP_M1C3.pdf'],

  };

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

      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'module_1'),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
      bottomSheet: _buildBottomSheet(context),
    );

    /*return Scaffold(
      appBar: CustomAppBar(context, 'module_1'),
      body:
              Container(
                height: 150.0,
                child: Boton(
                  child: IconButton(
                    icon: Image.asset('assets/items/1_chapters.png'),
                    onPressed: () async {
                      //Este es el que se lee, hay que pasárselo por referencia
                      await getFileFromAsset("assets/$nombrePDF")
                          .then((f) {
                        //setState(() {
                          assetPDFPath = f.path;
                          print("Asset pdf path " + assetPDFPath);
                        //});
                      });
                      if (assetPDFPath != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PdfViewPage(path: assetPDFPath)));
                      }
                    },
                    iconSize: 60,
                  ),
                  text: 'CAPÍTULOS',
                ),
              ),


    );*/
  }

  Row _buildBottomSheet(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          color: Color.fromARGB(255, 93, 188, 210),

          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/Module2Chap'),
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
    for (int i = 0; i < numChaptersModule1; i++) {
      widgets.add(PDFButton(context, chapterTypes[chapterTypesNames[i]],
          'module_1_chapter_${i + 1}'));
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
