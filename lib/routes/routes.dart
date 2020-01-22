import 'package:flutter/material.dart';
import 'package:hepapp/pages/Calculators/AllCalcPage.dart';
import 'package:hepapp/pages/Calculators/CLIPCalcPage.dart';
import 'package:hepapp/pages/Calculators/ChildCalcPage.dart';
import 'package:hepapp/pages/Calculators/MELDCalcPage.dart';
import 'package:hepapp/pages/Calculators/OkudaCalcPage.dart';
import 'package:hepapp/pages/CalculatorsPage.dart';
import 'package:hepapp/pages/CardsPage.dart';
import 'package:hepapp/pages/Chapters/Module1Page.dart';
import 'package:hepapp/pages/Chapters/Module2Page.dart';
import 'package:hepapp/pages/Chapters/Module3Page.dart';
import 'package:hepapp/pages/ChaptersPage.dart';
import 'package:hepapp/pages/Figures/ChapterFigPage.dart';
import 'package:hepapp/pages/Figures/DrawingFigPage.dart';
import 'package:hepapp/pages/Figures/InteractiveFigPage.dart';
import 'package:hepapp/pages/Figures/SchemesFigPage.dart';
import 'package:hepapp/pages/Figures/TableFigPage.dart';
import 'package:hepapp/pages/FiguresPage.dart';
import 'package:hepapp/pages/HomePage.dart';
import 'package:hepapp/pages/InformationPage.dart';
import 'package:hepapp/pages/Podcasts/Podcasts1Page.dart';
import 'package:hepapp/pages/Podcasts/Podcasts2Page.dart';
import 'package:hepapp/pages/Podcasts/Podcasts3Page.dart';
import 'package:hepapp/pages/ResourcesPage.dart';
import 'package:hepapp/pages/settings_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
// Ruta base, accedemos a HomePage.
    '/': (context) => HomePage(),
//HomePageWidget(),
//Rutas desde la página principal, se definen aqui para poder acceder a ellas desde cualquier punto del programa
    '/Chapters': (context) => ChaptersPage(),
    '/Podcasts1': (context) => Podcasts1Page(),
    '/Podcasts2': (context) => Podcasts2Page(),
    '/Podcasts3': (context) => Podcasts3Page(),

    '/Cards': (context) => CardsPage(),
    '/Figures': (context) => FiguresPage(),
    '/Calculators': (context) => CalculatorsPage(),
    '/Resources': (context) => ResourcesPage(),
    //'/PubMed': (context) => PubMedPage(),
    '/Information': (context) => InformationPage(),
//Rutas de los módulos de las secciones (Chapters)
    '/Module1Chap': (context) => Module1Page(),
    '/Module2Chap': (context) => Module2Page(),
    '/Module3Chap': (context) => Module3Page(),
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

    //TODO borrar esta ruta, prueba de API
    //'/detalle': (context) => PeliculaDetalle(),
    '/settings': (context) => SettingsPage(),
  };
}
