import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:path_provider/path_provider.dart';

/*Código correspondiente para mostrar el PDF en la aplicación
* y construcción del layout correspondiente*/
class PdfDetailPage extends StatefulWidget {
  final String path;
  final title;

  const PdfDetailPage({Key key, this.path, this.title}) : super(key: key);

  @override
  _PdfDetailPageState createState() => _PdfDetailPageState();
}

class _PdfDetailPageState extends State<PdfDetailPage> {
  //int _totalPages = 0;
  //int _currentPage = 0;
  bool pdfReady = false;

  //PDFViewController _pdfViewController;
  @override
  Future<void> initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print('widget path desde pdfdetailpage ' + widget.path);
    return Scaffold(
      appBar: CustomAppBar(context, widget.title),
      drawer: MenuWidget(),
      body: Stack(
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
                //_totalPages = _pages;
                pdfReady = true;
              });
            },
            /*onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },*/
            onPageChanged: (int page, int total) {
              setState(() {});
            },
            onPageError: (page, e) {},
          ),
          /*Si el PDF no se ha cargado aún que muestre el icono de cargando
          * si está cargado pinta un Widget inexistente*/
          !pdfReady
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Offstage()
        ],
      ),
      /*Botones de navegación dentro del PDF, página anterior y siguiente*/
      /*floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _currentPage > 0
              ? FloatingActionButton.extended(
            backgroundColor: Colors.red,
            label: Text("Go to ${_currentPage - 1 + 3}"),
            onPressed: () {
              _currentPage -= 1;
              _pdfViewController.setPage(_currentPage);
            },
          )
              : Offstage(),
          _currentPage + 1 < _totalPages
              ? FloatingActionButton.extended(
            backgroundColor: Colors.green,
            label: Text("Go to ${_currentPage + 1}"),
            onPressed: () {
              _currentPage += 1;
              _pdfViewController.setPage(_currentPage);
            },
          )
              : Offstage(),
        ],
      ),*/
    );
  }
}

Future<File> getFileFromAsset(String asset) async {
  try {
    //print('Asset pdfdetailpage getFilefromAsset: $asset');
    var data = await rootBundle.load(asset);
    //Conversión del PDF a bytes, para ello llamamos al buffer
    var bytes = data.buffer.asUint8List();
    //Obtención del directorio principal de las aplicaciones
    var dir = await getApplicationDocumentsDirectory();
    /*Para mostrar un PDF dentro de la app es necesario crear un fichero,
      * al cuál le pasamos la ruta que acabo de obtener.
      * Este fichero en concreto será parte de la biblioteca de Entrada y salida*/

    //File file = File("${dir.path}/HepAPP_M1C1.pdf"); //funciona
    //Se separa el nombre del asset y se guarda el nombre de archivo
    String fileName = asset.split("/")[2];
    File file = File("${dir.path}/$fileName");

    //print('asset antiguo funciona: ${dir.path}/HepAPP_M1C1.pdf');
    //print('asset nuevo no funciona ' + dir.path + '/' + fileName);
    //Se añaden los bytes del PDF original al que acabo de crear
    File assetFile = await file.writeAsBytes(bytes);
    return assetFile;
  } catch (e) {
    print(e);
    throw Exception("Error al abrir el PDF ");
  }
}
