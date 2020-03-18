import 'package:flutter/material.dart';
import 'package:hepapp/pages/Calculators/AllCalcPage.dart';
import 'package:hepapp/pages/Calculators/CLIPCalcPage.dart';
import 'package:hepapp/pages/Calculators/ChildCalcPage.dart';
import 'package:hepapp/pages/Calculators/MELDCalcPage.dart';
import 'package:hepapp/pages/Calculators/OkudaCalcPage.dart';
import 'package:hepapp/pages/CalculatorsPage.dart';
import 'package:hepapp/pages/Chapters/ChaptersPage.dart';
import 'package:hepapp/pages/Chapters/ModulePageView.dart';
import 'package:hepapp/pages/DetailPageWidgets/PDFDetailPage.dart';
import 'package:hepapp/pages/DetailPageWidgets/WebDetailPage.dart';
import 'package:hepapp/pages/Figures/Drawing/DrawingPage.dart';
import 'package:hepapp/pages/Figures/Drawing/DrawingPageView.dart';
import 'package:hepapp/pages/Figures/Interactive/InteractivePage.dart';
import 'package:hepapp/pages/Figures/Interactive/InteractivePageView.dart';
import 'package:hepapp/pages/Figures/Maps/MapsDetailPageView.dart';
import 'package:hepapp/pages/Figures/Maps/MapsPage.dart';
import 'package:hepapp/pages/Figures/Pathology/PathologyDetailPageView.dart';
import 'package:hepapp/pages/Figures/Pathology/PathologyPageView.dart';
import 'package:hepapp/pages/Figures/Schemes/SchemesDetailPageView.dart';
import 'package:hepapp/pages/Figures/Schemes/SchemesPage.dart';
import 'package:hepapp/pages/Figures/TOC/TOCDetailPageView.dart';
import 'package:hepapp/pages/Figures/TOC/TOCFigPage.dart';
import 'package:hepapp/pages/FiguresPage.dart';
import 'package:hepapp/pages/HomePage.dart';
import 'package:hepapp/pages/Podcasts/PodcastsPageView.dart';
import 'package:hepapp/pages/ResourcesPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/Chapters':
        return MaterialPageRoute(builder: (_) => ChaptersPage());
      case '/PodcastsPV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => PodcastsPageView(initialPage));
      case '/Figures':
        return MaterialPageRoute(builder: (_) => FiguresPage());
      case '/Calculators':
        return MaterialPageRoute(builder: (_) => CalculatorsPage());
      case '/Resources':
        return MaterialPageRoute(builder: (_) => ResourcesPage());
      case '/ModulePV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => ModulePageView(initialPage));
      case '/References':
        return MaterialPageRoute(
            builder: (context) {
              return PdfDetailPage(
                path: 'assets/HepAPP_References.pdf',
                title: 'references',
              );
            }

          /*   (context) async {
              await getFileFromAsset("assets/${type[2]}").then((f) {
                assetPDFPath = f.path;
                //print("Asset pdf path " + assetPDFPath);
              });
              if (assetPDFPath != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PdfDetailPage(
                              path: assetPDFPath,
                              title: title,
                            )));
              }
            },*/

          /*(context) =>
                PdfDetailPage(
                  path: 'assets/HepAPP_References.pdf',
                  title: 'references',
                )*/


        );
      case '/Web':
        var url = settings.arguments as List<String>;
        print('url $url');
        return MaterialPageRoute(
            builder: (context) =>
                WebDetailPage(
                  url: url[0],
                  title: url[1],
                )
        );

      case '/TableFig':
        return MaterialPageRoute(builder: (_) => TOCFigPage());
      case '/TOCPV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => TOCDetailPageView(initialPage));

      case '/SchemesFig':
        return MaterialPageRoute(builder: (_) => SchemesPage());
      case '/SchemesPV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => SchemesDetailPageView(initialPage));

      case '/MapsFig':
        return MaterialPageRoute(builder: (_) => MapsPage());
      case '/MapsPV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => MapsDetailPageView(initialPage));

      case '/PathologyFig':
        return MaterialPageRoute(builder: (_) => PathologyPageView(0));
      case '/PathologyPV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => PathologyPageView(initialPage));
      case '/PathologyDetail':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => PathologyDetailPage(initialPage));

      case '/InteractiveFig':
        return MaterialPageRoute(builder: (_) => InteractivePage());
      case '/InteractivePV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => InteractivePageView(initialPage));

      case '/DrawingFig':
        return MaterialPageRoute(builder: (_) => DrawingPage());
      case '/DrawingPV':
        var initialPage = settings.arguments as int;
/*
        return MaterialPageRoute(builder: (_) => DrawingPage());
*/

        return MaterialPageRoute(
            builder: (_) => DrawingPageView(initialPage));

      case '/AllCalc':
        return MaterialPageRoute(builder: (_) => AllCalcPage());
      case '/ChildCalc':
        return MaterialPageRoute(builder: (_) => ChildCalcPage());
      case '/CLIPCalc':
        return MaterialPageRoute(builder: (_) => CLIPCalcPage());
      case '/MELDCalc':
        return MaterialPageRoute(builder: (_) => MELDCalcPage());
      case '/OkudaCalc':
        return MaterialPageRoute(builder: (_) => OkudaCalcPage());




      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

/*

    '/PathologyFig': (context) => PathologyFig1Page(),
    '/InteractiveFig': (context) => InteractiveFigPage(),
    '/DrawingFig': (context) => DrawingFigPage(),

    '/AllCalc': (context) => AllCalcPage(),
    '/ChildCalc': (context) => ChildCalcPage(),
    '/CLIPCalc': (context) => CLIPCalcPage(),
    '/MELDCalc': (context) => MELDCalcPage(),
    '/OkudaCalc': (context) => OkudaCalcPage(),*/
