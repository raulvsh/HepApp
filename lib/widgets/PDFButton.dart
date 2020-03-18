import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/pages/DetailPageWidgets/PDFDetailPage.dart';
import 'package:path_provider/path_provider.dart';

class PDFButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;
  final String title;

  PDFButton(this.context, this.type, this.title);

  var assetPDFPath;

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(4),
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/items/${type[1]}',
            ),
            Container(
              alignment: Alignment(0, 0.7),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: FittedBox(
                child: Text(
                  aux.tr(type[0]),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black, //Color.fromARGB(255, 93, 188, 210),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: //showPDF("assets/${type[2]}"),
            () async {
          await getFileFromAsset("assets/${type[2]}").then((f) {
            assetPDFPath = f.path;
            //print("Asset pdf path " + assetPDFPath);
          });
          if (assetPDFPath != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PdfDetailPage(
                      path: assetPDFPath,
                      title: title,
                    )));
          }
        },
      ),
    );
  }

/*showPDF(String route) async {
    await getFileFromAsset(route).then((f) {
      assetPDFPath = f.path;
      //print("Asset pdf path " + assetPDFPath);
    });
    if (assetPDFPath != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PdfDetailPage(
                    path: assetPDFPath,
                    title: title,
                  )));
    }
  }*/
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
