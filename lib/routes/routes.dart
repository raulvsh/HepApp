import 'package:flutter/material.dart';
import 'package:hepapp/pages/Calculators/AllCalcPage.dart';
import 'package:hepapp/pages/Calculators/CLIPCalcPage.dart';
import 'package:hepapp/pages/Calculators/ChildCalcPage.dart';
import 'package:hepapp/pages/Calculators/MELDCalcPage.dart';
import 'package:hepapp/pages/Calculators/OkudaCalcPage.dart';
import 'package:hepapp/pages/CalculatorsPage.dart';
import 'package:hepapp/pages/Chapters/ChaptersPage.dart';
import 'package:hepapp/pages/Chapters/Module1Page.dart';
import 'package:hepapp/pages/Chapters/Module2Page.dart';
import 'package:hepapp/pages/Chapters/Module3Page.dart';
import 'package:hepapp/pages/Chapters/ModulePageView.dart';
import 'package:hepapp/pages/Figures/DrawingFigPage.dart';
import 'package:hepapp/pages/Figures/InteractiveFigPage.dart';
import 'package:hepapp/pages/Figures/MapsFigPage.dart';
import 'package:hepapp/pages/Figures/PathologyFig1Page.dart';
import 'package:hepapp/pages/Figures/SchemesFigPage.dart';
import 'package:hepapp/pages/Figures/TOCFigPage.dart';
import 'package:hepapp/pages/Figures/TOCPageView.dart';
import 'package:hepapp/pages/FiguresPage.dart';
import 'package:hepapp/pages/HomePage.dart';
import 'package:hepapp/pages/Podcasts/Podcasts1Page.dart';
import 'package:hepapp/pages/Podcasts/Podcasts2Page.dart';
import 'package:hepapp/pages/Podcasts/Podcasts3Page.dart';
import 'package:hepapp/pages/Podcasts/PodcastsPageView.dart';
import 'package:hepapp/pages/ResourcesPage.dart';
import 'package:hepapp/pages/settings_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
// Ruta base, accedemos a HomePage.
    '/': (context) => HomePage(),
//HomePageWidget(),
//Rutas desde la página principal, se definen aqui para poder acceder a ellas desde cualquier punto del programa
    '/Chapters': (context) => ChaptersPage(),
    '/PodcastsPV': (context) => PodcastsPageView(),
    //'/Cards': (context) => CardsPage(),
    '/Figures': (context) => FiguresPage(),
    '/Calculators': (context) => CalculatorsPage(),
    '/Resources': (context) => ResourcesPage(),
//1 - Rutas de los módulos de las secciones (Chapters)
    //'/ModulePV': (context) => ModulePageView(0),
    '/ModulePV1': (context) => ModulePageView(0),
    '/ModulePV2': (context) => ModulePageView(1),
    '/ModulePV3': (context) => ModulePageView(2),

    '/Module1Chap': (context) => Module1Page(),
    '/Module2Chap': (context) => Module2Page(),
    '/Module3Chap': (context) => Module3Page(),
//2 - Rutas de los podcasts
    '/Podcasts1': (context) => Podcasts1Page(),
    '/Podcasts2': (context) => Podcasts2Page(),
    '/Podcasts3': (context) => Podcasts3Page(),

    //'/PubMed': (context) => PubMedPage(),
    //'/Information': (context) => InformationPage(),
//4 - Rutas de los distintos apartados de Figures
    '/TableFig': (context) => TOCFigPage(),
    '/TOCPV1': (context) => TOCPageView(0),
    '/TOCPV2': (context) => TOCPageView(1),
    '/TOCPV3': (context) => TOCPageView(2),
    '/TOCPV4': (context) => TOCPageView(3),

    '/SchemesFig': (context) => SchemesFigPage(),
    '/MapsFig': (context) => MapsFigPage(),
    '/PathologyFig': (context) => PathologyFig1Page(),
    '/InteractiveFig': (context) => InteractiveFigPage(),
    '/DrawingFig': (context) => DrawingFigPage(),
//5 - Rutas de los distintos tipos de calculadora
    '/AllCalc': (context) => AllCalcPage(),
    '/ChildCalc': (context) => ChildCalcPage(),
    '/CLIPCalc': (context) => CLIPCalcPage(),
    '/MELDCalc': (context) => MELDCalcPage(),
    '/OkudaCalc': (context) => OkudaCalcPage(),


    //TODO borrar esta ruta, prueba de API
    //'/detalle': (context) => PeliculaDetalle(),
    '/settings': (context) => SettingsPage(),
  };
}
