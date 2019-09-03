import 'package:flutter/material.dart';
import 'package:hepapp/vista/Calculators/AllCalcPageWidget.dart';
import 'package:hepapp/vista/Calculators/CLIPCalcPageWidget.dart';
import 'package:hepapp/vista/Calculators/ChildCalcPageWidget.dart';
import 'package:hepapp/vista/Calculators/MELDCalcPageWidget.dart';
import 'package:hepapp/vista/Calculators/OkudaCalcPageWidget.dart';
import 'package:hepapp/vista/CalculatorsPageWidget.dart';
import 'package:hepapp/vista/CardsPageWidget.dart';
import 'package:hepapp/vista/ChaptersPageWidget.dart';
import 'package:hepapp/vista/Figures/ChapterFigPageWidget.dart';
import 'package:hepapp/vista/Figures/DrawingFigPageWidget.dart';
import 'package:hepapp/vista/Figures/InteractiveFigPageWidget.dart';
import 'package:hepapp/vista/Figures/SchemesFigPageWidget.dart';
import 'package:hepapp/vista/Figures/TableFigPageWidget.dart';
import 'package:hepapp/vista/FiguresPageWidget.dart';
import 'package:hepapp/vista/InformationPageWidget.dart';
import 'package:hepapp/vista/PodcastsPageWidget.dart';
import 'package:hepapp/vista/PubMedPageWidget.dart';
import 'package:hepapp/vista/ResourcesPageWidget.dart';

import 'vista/HomePageWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final title = 'HepApp';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Quitar etiqueta de debug
      title: title,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 93, 188, 210),

        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.white),
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      //home: MyHomePage(title: title), //No usar home al usar routes
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // Ruta base, accedemos a HomePage.
        '/': (context) => HomePageWidget(),
        //Rutas desde la página principal, se definen aqui para poder acceder a ellas desde cualquier punto del programa
        '/Chapters': (context) => ChaptersPage(),
        '/Podcasts': (context) => PodcastsPage(),
        '/Cards': (context) => CardsPage(),
        '/Figures': (context) => FiguresPage(),
        '/Calculators': (context) => CalculatorsPage(),
        '/Resources': (context) => ResourcesPage(),
        '/PubMed': (context) => PubMedPage(),
        '/Information': (context) => InformationPage(),
        //Rutas de los distintos tipos de calculadora
        '/AllCalc': (context) => AllCalcPage(),
        '/ChildCalc': (context) => ChildCalcPage(),
        '/CLIPCalc': (context) => CLIPCalcPage(),
        '/MELDCalc': (context) => MELDCalcPage(),
        '/OkudaCalc': (context) => OkudaCalcPage(),
        //Rutas de los distintos apartados de Figures
        '/TableFig': (context) => TableFigPage(),
        '/ChapterFig': (context) => ChapterFigPage(),
        '/DrawingFig': (context) => DrawingFigPage(),
        '/InteractiveFig': (context) => InteractiveFigPage(),
        '/SchemesFig': (context) => SchemesFigPage(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Reservado para variables de estado, que se vayan actualizando
  //En principio la homepage no tiene ninguna

  /*int _counter = 0;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    //Se devuelve la página HomePage
    return Scaffold(
      body: HomePageWidget(),
    );
  }
}
