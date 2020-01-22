import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/PDFButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:path_provider/path_provider.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Module3Page extends StatefulWidget {
  @override
  _Module3PageState createState() => _Module3PageState();
}

class _Module3PageState extends State<Module3Page> {
  String assetPDFPath = "";

  final numChaptersModule1 = 6;

  var chapterTypesNames = [
    "Chapter10",
    "Chapter11",
    "Chapter12",
    "Chapter13",
    "Chapter14",
    "Chapter15",
  ];

  var chapterTypes = {
    "Chapter10": ['chapter_10', '1_chapters.png', 'HepAPP_M3C10.pdf'],
    "Chapter11": ['chapter_11', '1_chapters.png', 'HepAPP_M3C11.pdf'],
    "Chapter12": ['chapter_12', '1_chapters.png', 'HepAPP_M3C12.pdf'],
    "Chapter13": ['chapter_13', '1_chapters.png', 'HepAPP_M3C13.pdf'],
    "Chapter14": ['chapter_14', '1_chapters.png', 'HepAPP_M3C14.pdf'],
    "Chapter15": ['chapter_15', '1_chapters.png', 'HepAPP_M3C15.pdf'],
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'module_3'),
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
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/Module2Chap'),
          color: Color.fromARGB(255, 93, 188, 210),
        ),


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
          'module_3_chapter_${i + 10}'));
    }
    return widgets;
  }
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
    //File file = File("data/user/0/es.uva.tel.hepapp/app_flutter/HepAPP_M1C1.pdf");
    //File file = File(dir.path+'/'+asset);
    File file = File("${dir.path}/HepAPP_M1C1.pdf");
    //print('Dir Path del file ' + dir.path);
    /*Se añaden los bytes del PDF original al que acabo de crear*/
    File assetFile = await file.writeAsBytes(bytes);
    return assetFile;
  } catch (e) {
    print(e);
    throw Exception("Error al abrir el PDF CPS");
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
