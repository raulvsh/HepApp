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
  //TODO tema entero de la app, definiendo sus estilos

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

