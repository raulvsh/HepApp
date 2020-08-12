import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sized_context/sized_context.dart';

class PdfDetailPage extends StatefulWidget {
  final String path;
  final title;

  const PdfDetailPage({Key key, this.path, this.title}) : super(key: key);

  @override
  _PdfDetailPageState createState() => _PdfDetailPageState();
}

class _PdfDetailPageState extends State<PdfDetailPage> {
  bool pdfReady = false;
  ScreenshotController pdfScreenshotController = ScreenshotController();
  Orientation _lastScreenOrientation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _lastScreenOrientation = MediaQuery.of(context).orientation;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape = context.isLandscape;
    bool isTablet = context.diagonalInches >= 7;

    if (_lastScreenOrientation != null &&
        _lastScreenOrientation != MediaQuery.of(context).orientation) {
      //Si se ha cambiado de orientación, se recarga la página completa
      Future.delayed(Duration(microseconds: 100), _repushViewer);
    }

    return Screenshot(
      controller: pdfScreenshotController,
      child: Scaffold(
        appBar: CustomAppBar(
          widget.title,
          selScreenshot: false,
        ),
        drawer: MenuWidget(),
        body: Center(
          child: Container(
            width: isLandscape /*&& !isTablet*/
                ? context.widthPct(0.5)
                : context.widthPx,
            child: Stack(
              children: <Widget>[
                PDFView(
                  filePath: widget.path,
                  autoSpacing: true,
                  enableSwipe: true,
                  pageSnap: true,
                  swipeHorizontal: true,
                  nightMode: false,
                  onError: (e) {
                    print(e);
                  },
                  onRender: (_pages) {
                    setState(() {
                      pdfReady = true;
                    });
                  },

                  onPageChanged: (int page, int total) {
                    setState(() {});
                  },
                  onPageError: (page, e) {},
                ),
                !pdfReady
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : Offstage()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _repushViewer() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PdfDetailPage(
              path: widget.path,
              title: widget.title,
            ),
      ),
    );
  }
}

Future<File> getFileFromAsset(String asset) async {
  try {
    var data = await rootBundle.load(asset);
    //Conversión del PDF a bytes, para ello llamamos al buffer
    var bytes = data.buffer.asUint8List();
    //Obtención del directorio principal de las aplicaciones
    var dir = await getApplicationDocumentsDirectory();
    /*Para mostrar un PDF dentro de la app es necesario crear un fichero,
      * al cuál le pasamos la ruta que acabo de obtener.
      * Este fichero en concreto será parte de la biblioteca de Entrada y salida*/
    String fileName = asset.split("/")[2];
    File file = File("${dir.path}/$fileName");
    //Se añaden los bytes del PDF original al que acabo de crear
    File assetFile = await file.writeAsBytes(bytes);
    return assetFile;
  } catch (e) {
    print(e);
    throw Exception("Error al abrir el PDF ");
  }
}
