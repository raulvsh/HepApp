import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'PDFViewPage.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Module1Page extends StatefulWidget {
  @override
  _Module1PageState createState() => _Module1PageState();
}
class _Module1PageState extends State<Module1Page> {
  String assetPDFPath = "";

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

/*Devuelve objeto de tipo Future porque es una tarea de larga duración*/
  Future<File> getFileFromAsset(String asset) async {
    try {
      print('Asset: $asset');
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
      File file = File("${dir.path}/HepAPP_M1C1.pdf");
      /*Se añaden los bytes del PDF original al que acabo de crear*/
      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error al abrir el PDF CPS");
    }
  }

/*Construcción del Layout del menú principal*/
  @override
  Widget build(BuildContext context) {
    /*Material App which contains home:Scaffold and Scaffold has body*/
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*BARRA DE NAVEGACIÓN*/
        appBar: AppBar(
          title: Text("CPS"),
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: Builder(
            builder: (context) =>
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      height: 150.0,
                      child: Boton(
                        child: IconButton(
                          icon: Image.asset('assets/items/1_chapters.png'),

                          onPressed: () async {
                            await getFileFromAsset(
                                "assets/pdfs/HepAPP_M1C3.pdf").then((f) {
                              setState(() {
                                assetPDFPath = f.path;
                                print(assetPDFPath);
                              });
                            });
                            if (assetPDFPath != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PdfViewPage(path: assetPDFPath)));
                              //PdfViewPage(path: '/assets/pdfs/HepAPP_M1C3')));
                            }
                          },
                          iconSize: 60,
                        ),
                        text: 'CAPÍTULOS',
                      ),
                    ),


                  ],
                ),
          ),
        ),
      ),
    );
  }
}


/*Clase Boton creada para minimizar código*/
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
