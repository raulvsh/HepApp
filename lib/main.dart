import 'package:flutter/material.dart';
import 'package:hepapp/vista/Calculators/AllCalcPage.dart';
import 'package:hepapp/vista/Calculators/CLIPCalcPage.dart';
import 'package:hepapp/vista/Calculators/ChildCalcPage.dart';
import 'package:hepapp/vista/Calculators/MELDCalcPage.dart';
import 'package:hepapp/vista/Calculators/OkudaCalcPage.dart';
import 'package:hepapp/vista/CalculatorsPage.dart';
import 'package:hepapp/vista/CardsPage.dart';
import 'package:hepapp/vista/ChaptersPage.dart';
import 'package:hepapp/vista/Figures/ChapterFigPage.dart';
import 'package:hepapp/vista/Figures/DrawingFigPage.dart';
import 'package:hepapp/vista/Figures/InteractiveFigPage.dart';
import 'package:hepapp/vista/Figures/SchemesFigPage.dart';
import 'package:hepapp/vista/Figures/TableFigPage.dart';
import 'package:hepapp/vista/FiguresPage.dart';
import 'package:hepapp/vista/InformationPage.dart';
import 'package:hepapp/vista/PodcastsPage.dart';
import 'package:hepapp/vista/PubMedPage.dart';
import 'package:hepapp/vista/ResourcesPage.dart';

import 'vista/HomePage.dart';

void main() => runApp(MyApp());

/*
En esta clase se define el título de la aplicación, el tema
y las rutas a las distintos apartados.
 */
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
        //brightness: Brightness.dark, //Tema oscuro
        primaryColor: Color.fromARGB(255, 93, 188, 210),
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.white),
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
          textTheme: Theme
              .of(context)
              .textTheme
              .apply(
            bodyColor: Color.fromARGB(255, 93, 188, 210),
            //Color por defecto de all el texto
            displayColor: Colors.red,
          )
      ),
      //home: MyHomePage(title: title), //No usar home al usar routes
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // Ruta base, accedemos a HomePage.
        '/': (context) => HomePage(),
        //HomePageWidget(),
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
/*
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

    //Se devuelve el widget de la página HomePage
    return Scaffold(
      body: HomePageWidget(),
    );
  }
}*/
