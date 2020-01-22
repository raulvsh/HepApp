import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';

/*Código correspondiente para mostrar el PDF en la aplicación
* y construcción del layout correspondiente*/
class PdfViewPage extends StatefulWidget {

  final String path;
  final title;

  const PdfViewPage({Key key, this.path, this.title}) : super(key: key);

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {


  //int _totalPages = 0;
  //int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(context, widget.title),

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
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
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