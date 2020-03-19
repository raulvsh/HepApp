import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:path_provider/path_provider.dart';

/*
class PDFNew extends StatefulWidget {
  @override
  _PDFNewState createState() => _PDFNewState();
}

class _PDFNewState extends State<PDFNew> {
  String pathPDF = "";
  String corruptedPathPDF = "";

  @override
  void initState() {
    super.initState();
    */ /*fromAsset('assets/corrupted.pdf', 'corrupted.pdf').then((f) {
      setState(() {
        corruptedPathPDF = f.path;
      });
    });*/ /*
    fromAsset('assets/HepAPP_M1C1.pdf', 'HepAPP_M3C12.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
    // createFileOfPdfUrl().then((f) {
    //   setState(() {
    //     pathPDF = f.path;
    //     print(pathPDF);
    //   });
    // });
  }

  Future<File> createFileOfPdfUrl() async {
    // final url =
    // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
    final url = "https://pdfkit.org/docs/guide.pdf";
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(context, 'chapters'),
      body: Center(child: Builder(
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              RaisedButton(
                child: Text("Open PDF"),
                onPressed: () {
                  if (pathPDF != null) {
                    abrirPDF();

                  }
                },
              ),
            ],
          );
        },
      )),
    );
  }


  abrirPDF(){
    print('pathpdf desde pdfnew $pathPDF');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFScreen(path: pathPDF),
      ),
    );

  }

}*/

class PDFScreen extends StatefulWidget {
  final String path;
  final String title;

/*
  String pathPDF = "";
*/

  PDFScreen({Key key, this.path, this.title}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    //cargarRuta();

  }

  Future<String> cargarRuta() async {
    //print (widget.path);
    fromAsset('assets/${widget.path}', widget.path).then((f) {
      pathPDF = f.path;
      /*print("f.path " + f.path);
      print("path pdf" + pathPDF);*/

      setState(() {

      });
      /*setState(() {
        pathPDF = f.path;
        //print("path pdf desde init ${pathPDF}");
        //print("f.path " + f.path);
      });*/
    });
    print("pathpdf desde cargarRuta $pathPDF");
    return pathPDF;
  }

  final Completer<PDFViewController> _controller =
  Completer<PDFViewController>();
  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      //print("dir path desde fromAsset ${dir.path}");
      //print("filename desde fromAsset $filename");

      //print("file completo desde fromAsset ${dir.path}/$filename");
      //print("asset desde fromasset: $asset");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
      pathPDF = "${dir.path}/$filename";
      //print("pathpdf completo desde fromasset ${pathPDF}");
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var rutaFinal = cargarRuta();
    print("pathpdf dentro de build: ${pathPDF}");
    //cargarRuta();
    return Scaffold(
      appBar: CustomAppBar(context, widget.title),
      drawer: MenuWidget(),
      body: Stack(
        children: <Widget>[
          /*Text(
            pathPDF,
            style: TextStyle(
              fontSize: 8,
            ),
          ),*/
          FutureBuilder(
              future: cargarRuta(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                //cargarRuta();
                if (snapshot.connectionState == ConnectionState.done) {
                  print("snapshot data " + snapshot.data);
                  return Stack(
                    children: <Widget>[
                      PDFView(
                        filePath: snapshot.data.toString(),
                      ),
                    ],
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print("snapshot data " + snapshot.data);
                  return Stack(
                    children: <Widget>[
                      PDFView(
                        filePath: snapshot.data.toString(),
                      ),
                    ],
                  );
                }


                else
                  return Column(children: <Widget>[
                    CircularProgressIndicator(),
                    Text(snapshot.connectionState.toString()),


                  ],);

                /*return PDFView(
                    //filePath: "/data/user/0/es.uva.tel.hepapp/app_flutter/HepAPP_M3C13.pdf",
                    //filePath: "/data/user/0/es.uva.tel.hepapp/app_flutter/HepAPP_Introduction.pdf",
                    //filePath: pathPDF,
                    filePath: snapshot.data,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: true,
                    pageFling: true,
                    defaultPage: currentPage,
                    fitPolicy: FitPolicy.HEIGHT,
                    onRender: (_pages) {
                      setState(() {
                        pages = _pages;
                        isReady = true;
                      });
                    },
                    onError: (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                      print(error.toString());
                    },
                    onPageError: (page, error) {
                      setState(() {
                        errorMessage = '$page: ${error.toString()}';
                      });
                      print('$page: ${error.toString()}');
                    },
                    onViewCreated: (PDFViewController pdfViewController) {
                      _controller.complete(pdfViewController);
                    },
                    onPageChanged: (int page, int total) {
                      print('page change: $page/$total');
                      setState(() {
                        currentPage = page;
                      });
                    },
                  );*/


                //print("snapshot tiene data " + pathPDF);

              }),

          /*FutureBuilder(
            future: cargarRuta(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot){
              if (snapshot.hasData)
              return PDFView(
               // filePath: "/data/user/0/es.uva.tel.hepapp/app_flutter/HepAPP_M3C13.pdf",
                filePath: pathPDF,
                enableSwipe: true,
                swipeHorizontal: true,
                autoSpacing: true,
                pageFling: true,
                defaultPage: currentPage,
                fitPolicy: FitPolicy.HEIGHT,
                onRender: (_pages) {
                  setState(() {
                    pages = _pages;
                    isReady = true;
                  });
                },
                onError: (error) {
                  setState(() {
                    errorMessage = error.toString();
                  });
                  print(error.toString());
                },
                onPageError: (page, error) {
                  setState(() {
                    errorMessage = '$page: ${error.toString()}';
                  });
                  print('$page: ${error.toString()}');
                },
                onViewCreated: (PDFViewController pdfViewController) {
                  _controller.complete(pdfViewController);
                },
                onPageChanged: (int page, int total) {
                  print('page change: $page/$total');
                  setState(() {
                    currentPage = page;
                  });
                },
              );
            },*/
          //child:
          /*PDFView(
              //filePath: "/data/user/0/es.uva.tel.hepapp/app_flutter/HepAPP_M3C13.pdf",
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: true,
              pageFling: true,
              defaultPage: currentPage,
              fitPolicy: FitPolicy.HEIGHT,
              onRender: (_pages) {
                setState(() {
                  pages = _pages;
                  isReady = true;
                });
              },
              onError: (error) {
                setState(() {
                  errorMessage = error.toString();
                });
                print(error.toString());
              },
              onPageError: (page, error) {
                setState(() {
                  errorMessage = '$page: ${error.toString()}';
                });
                print('$page: ${error.toString()}');
              },
              onViewCreated: (PDFViewController pdfViewController) {
                _controller.complete(pdfViewController);
              },
              onPageChanged: (int page, int total) {
                print('page change: $page/$total');
                setState(() {
                  currentPage = page;
                });
              },
            ),
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                )*/
        ],
      ),
      /* floatingActionButton: FutureBuilder<PDFViewController>(
        future: _controller.future,
        builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton.extended(
              label: Text("Go to ${pages ~/ 2}"),
              onPressed: () async {
                await snapshot.data.setPage(pages ~/ 2);
              },
            );
          }

          return Container();
        },
      ),*/
    );
  }
}
