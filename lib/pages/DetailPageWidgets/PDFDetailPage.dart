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
    //loadPDF();
    showPDF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //showPDF();
    print('widget path desde pdfdetailpage ' + widget.path);
    return Scaffold(
      appBar: CustomAppBar(context, widget.title),
      drawer: MenuWidget(),

      /*Utilización de Stack por la propiedad de Overflow
      *y que llegue a mostrar el círculo de cargando encima
      * del propio PDF*/
      body: Stack(
        children: <Widget>[
          /*Widget utilizado gracias al plugin*/
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

  loadPDF() async {
    var assetPDFPath;
    await getFileFromAsset("assets/${widget.path}").then((f) {
      assetPDFPath = f.path;
      print("Asset pdf path " + assetPDFPath);
    });
  }


  showPDF() async {
    var assetPDFPath;
    await getFileFromAsset("assets/pdf/${widget.path}").then((f) {
      assetPDFPath = f.path;
      print("Asset pdf path " + assetPDFPath);
    });
    if (assetPDFPath != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PdfDetailPage(
                    path: assetPDFPath,
                    title: widget.title,
                  )));
    }
  }
}

/*Devuelve objeto de tipo Future porque es una tarea de larga duración*/

Future<File> getFileFromAsset(String asset) async {
  try {
    print('Asset pdfdetailpage getFilefromAsset: $asset');

//Al ser un método asíncrono es necesario poner el await

//directamente va a cargar el fichero PDF

    var data = await rootBundle.load(asset);
//Conversión del PDF a bytes, para ello llamamos al buffer

    var bytes = data.buffer.asUint8List();
//Obtención del directorio principal de las aplicaciones

    var dir = await getApplicationDocumentsDirectory();
/*Para mostrar un PDF dentro de la app es necesario crear un fichero,
      * al cuál le pasamos la ruta que acabo de obtener.
      * Este fichero en concreto será parte de la biblioteca de Entrada y salida*/

    //Este es el fichero que se lee, hay que pasárselo
    //File file = File("data/user/0/es.uva.tel.hepapp/app_flutter/HepAPP_M1C1.pdf");
    //File file = File(dir.path+'/'+asset);
    File file = File("${dir.path}/HepAPP_M1C1.pdf");
    print('asset antiguo funciona: ${dir.path}/HepAPP_M1C1.pdf');
    print('asset nuevo no funciona ' + dir.path + '/' + asset);
//Se añaden los bytes del PDF original al que acabo de crear

    File assetFile = await file.writeAsBytes(bytes);
    return assetFile;
  } catch (e) {
    print(e);
    throw Exception("Error al abrir el PDF ");
  }
}
