import 'package:flutter/material.dart';
import 'package:hepapp/calculators/alberta/alberta_diagram_page.dart';
import 'package:hepapp/calculators/alberta/alberta_info_page_view.dart';
import 'package:hepapp/calculators/child_pugh_score/cps_form.dart';
import 'package:hepapp/calculators/clip/clip_form.dart';
import 'package:hepapp/calculators/complete/complete_form.dart';
import 'package:hepapp/calculators/meld/meld_form.dart';
import 'package:hepapp/calculators/okuda/okuda_form.dart';
import 'package:hepapp/data/calculators/alberta_info_page_view.dart';
import 'package:hepapp/data/calculators/calculators.dart';
import 'package:hepapp/data/chapters/modules.dart';
import 'package:hepapp/data/chapters/modules_page_view.dart';
import 'package:hepapp/data/figures/draws.dart';
import 'package:hepapp/data/figures/figures.dart';
import 'package:hepapp/data/figures/interactive.dart';
import 'package:hepapp/data/figures/maps.dart';
import 'package:hepapp/data/figures/pathology_1.dart';
import 'package:hepapp/data/figures/pathology_2.dart';
import 'package:hepapp/data/figures/pathology_page_view.dart';
import 'package:hepapp/data/figures/schemes.dart';
import 'package:hepapp/data/figures/tocs.dart';
import 'package:hepapp/data/podcasts/podcasts_page_view.dart';
import 'package:hepapp/data/resources.dart';
import 'package:hepapp/pages/common_pages/common_page.dart';
import 'package:hepapp/pages/detail_pages/video_detail_page.dart';
import 'package:hepapp/pages/detail_pages/web_detail_page.dart';
import 'package:hepapp/pages/home_page.dart';
import 'package:hepapp/pages/page_views/common_detail_page_view.dart';
import 'package:hepapp/pages/page_views/common_page_view.dart';
import 'package:hepapp/pages/page_views/drawing_page_view.dart';
import 'package:hepapp/pages/page_views/interactive_detail_page_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/Chapters':
        return MaterialPageRoute(
            builder: (_) => CommonPage(
                  title: 'chapters',
                  data: modules,
                ));

      case '/PodcastsMain':
        return MaterialPageRoute(
            builder: (_) => CommonPageView(
                  initialPage: 0,
                  data: podcastsPageView,
                ));

      case '/PodcastsPV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) =>
                CommonPageView(
                  initialPage: initialPage,
                  data: podcastsPageView,
                ));

      case '/Figures':
        return MaterialPageRoute(
            builder: (_) =>
                CommonPage(
                  title: 'figures',
                  data: figures,
                ));

      case '/Calculators':
        return MaterialPageRoute(
            builder: (_) =>
                CommonPage(
                  title: 'calculators',
                  data: calculators,
                ));

      case '/Resources':
        return MaterialPageRoute(
            builder: (_) =>
                CommonPage(
                  title: 'resources',
                  data: resources,
                ));

      case '/ModulePV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) =>
                CommonPageView(
                  initialPage: initialPage,
                  data: modulesPageView,
                ));

      case '/Web':
        var arguments = settings.arguments as List<String>;
        return MaterialPageRoute(
          builder: (context) =>
              WebDetailPage(
                url: arguments[0],
                title: arguments[1],
              ),
        );

      case '/Video':
        var arguments = settings.arguments as List<String>;
        print("arguments " + arguments.toString());
        return MaterialPageRoute(
          builder: (context) =>
              VideoDetailPage(
                index: arguments[0],
                title: arguments[1],
              ),
        );

      case '/TableFig':
        return MaterialPageRoute(
            builder: (_) =>
                CommonPage(
                  title: 'table_contents',
                  data: tocs,
                  type: 'figure',
                ));

      case '/TOCPV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) =>
                CommonDetailPageView(
                  initialPage: initialPage,
                  data: tocs,
                  route: '/TOCPV',
                ));

      case '/SchemesFig':
        return MaterialPageRoute(
            builder: (_) =>
                CommonPage(
                  title: 'schemes',
                  data: schemes,
                  type: 'figure',
                ));

      case '/SchemesPV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) =>
                CommonDetailPageView(
                  initialPage: initialPage,
                  data: schemes,
                  route: '/SchemesPV',
                ));

      case '/MapsFig':
        return MaterialPageRoute(
            builder: (_) =>
                CommonPage(
                  title: 'maps',
                  data: maps,
                  type: 'figure',
                ));

      case '/MapsPV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) =>
                CommonDetailPageView(
                  initialPage: initialPage,
                  data: maps,
                  route: '/MapsPV',
                ));

      case '/PathologyMain':
        return MaterialPageRoute(
            builder: (_) =>
                CommonPageView(
                    initialPage: 0, data: pathologyPageView, type: 'figure'));

      case '/PathologyPV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) =>
                CommonPageView(
                    initialPage: initialPage,
                    data: pathologyPageView,
                    type: 'figure'));

      case '/PathologyDetailPV':
        int initialPage = settings.arguments; //int.parse(settings.arguments);
        return MaterialPageRoute(
            builder: (_) => CommonDetailPageView(
                  initialPage: initialPage,
                  data: pathology1 + pathology2,
                  route: '/PathologyDetailPV',
                ));

      case '/InteractiveFig':
        return MaterialPageRoute(
          builder: (_) =>
              CommonPage(
                title: 'interactive_figures',
                data: interactive,
                type: 'figure',
              ),
        );

      case '/InteractivePV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => InteractiveDetailPageView(initialPage));

      case '/DrawingFig':
        return MaterialPageRoute(
            builder: (_) =>
                CommonPage(
                  title: 'drawing',
                  data: draws,
                  type: 'figure',
                ));

      case '/DrawingPV':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => DrawingPageView(initialPage));

      case '/CompleteCalc':
        return MaterialPageRoute(builder: (_) => CompleteForm(initialPage: 0));

      case '/CompletePage':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => CompleteForm(initialPage: initialPage));

      case '/ChildCalc':
        return MaterialPageRoute(builder: (_) => CpsForm());
      case '/CLIPCalc':
        return MaterialPageRoute(builder: (_) => ClipForm());
      case '/MELDCalc':
        return MaterialPageRoute(builder: (_) => MeldForm());
      case '/OkudaCalc':
        return MaterialPageRoute(builder: (_) => OkudaForm());
      case '/AlbertaDiagram':
        var coloredFields = settings.arguments as List<bool>;
        return MaterialPageRoute(
            builder: (_) => AlbertaPage(
                  isSelected: coloredFields,
                ));
      case '/AlbertaInfoPage':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) =>
                AlbertaInfoPageView(
                  initialPage: initialPage,
                  data: albertaInfoPageView,
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
