import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:path_provider/path_provider.dart';

import 'PDFViewPage.dart';

const String _documentPath = 'assets/HepM1C1.pdf';

class Module1Page extends StatefulWidget {
  @override
  _Module1PageState createState() => _Module1PageState();
}

class _Module1PageState extends State<Module1Page> {
  String assetPDFPath = "";

  @override
  void initState() {
    super.initState();
//Se llama al método que construye el PDF
    //* La función then es similar a las Promises de JavaScript

    getFileFromAsset("/pdfs/HepAPP_M1C1.pdf").then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });
  }

//Devuelve objeto de tipo Future porque es una tarea de larga duración

  Future<File> getFileFromAsset(String asset) async {
    try {
//Al ser un método asíncrono es necesario poner el await

//directamente va a cargar el fichero PDF

      var data = await rootBundle.load(asset);
//Conversión del PDF a bytes, para ello llamamos al buffer

      var bytes = data.buffer.asUint8List();
//Obtención del directorio principal de las aplicaciones

      var dir = await getApplicationDocumentsDirectory();
//Para mostrar un PDF dentro de la app es necesario crear un fichero,
      // al cuál le pasamos la ruta que acabo de obtener.
      // Este fichero en concreto será parte de la biblioteca de Entrada y salida*/

      File file = File("${dir.path}/assets/pdfs/HepAPP_M1C1.pdf");
      print(dir.path);
//Se añaden los bytes del PDF original al que acabo de crear

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error al abrir el PDF CPS");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'module_1'),
      drawer: MenuWidget(),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            if (assetPDFPath != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PdfViewPage(path: assetPDFPath)));
            }
          },
          child: Text('prueba'),
        ),
      ),
    );
  }
}
