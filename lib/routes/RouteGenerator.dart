import 'package:flutter/material.dart';
import 'package:hepapp/data/calculators.dart';
import 'package:hepapp/data/draws.dart';
import 'package:hepapp/data/figures.dart';
import 'package:hepapp/data/interactive.dart';
import 'package:hepapp/data/maps.dart';
import 'package:hepapp/data/modules.dart';
import 'package:hepapp/data/modules_page_view.dart';
import 'package:hepapp/data/pathology_1.dart';
import 'package:hepapp/data/pathology_2.dart';
import 'package:hepapp/data/pathology_page_view.dart';
import 'package:hepapp/data/podcasts_page_view.dart';
import 'package:hepapp/data/resources.dart';
import 'package:hepapp/data/schemes.dart';
import 'package:hepapp/data/tocs.dart';
import 'package:hepapp/forms/child_pugh_score/cps_form.dart';
import 'package:hepapp/forms/clip/clip_form.dart';
import 'package:hepapp/forms/complete/clinical_form.dart';
import 'package:hepapp/forms/complete/diagnostic_form.dart';
import 'package:hepapp/forms/complete/laboratory_form.dart';
import 'package:hepapp/forms/complete/results_form.dart';
import 'package:hepapp/forms/complete/summary_form.dart';
import 'package:hepapp/forms/meld/meld_form.dart';
import 'package:hepapp/forms/okuda/okuda_form.dart';
import 'package:hepapp/pages/CommonPages/CommonPage.dart';
import 'package:hepapp/pages/DetailPages/VideoDetailPage.dart';
import 'package:hepapp/pages/DetailPages/WebDetailPage.dart';
import 'package:hepapp/pages/HomePage.dart';
import 'package:hepapp/pages/PageViews/CommonDetailPageView.dart';
import 'package:hepapp/pages/PageViews/CommonPageView.dart';
import 'package:hepapp/pages/PageViews/DrawingPageView.dart';
import 'package:hepapp/pages/PageViews/InteractiveDetailPageView.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/Chapters':
        return MaterialPageRoute(
            builder: (_) =>
                CommonPage(
                  title: 'chapters',
                  data: modules,
                ));

      case '/PodcastsMain':
        return MaterialPageRoute(
            builder: (_) =>
                CommonPageView(
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
        return MaterialPageRoute(
          builder: (context) =>
              VideoDetailPage(
                url: arguments[0],
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
        var initialPage = settings.arguments as int;

        return MaterialPageRoute(
            builder: (_) =>
                CommonDetailPageView(
                  initialPage: initialPage,
                  data: pathology1 + pathology2,
                  route: '/PathologyDetailPV',
                ));

      case '/PathologyDetail':
        var initialPage = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) =>
                CommonDetailPageView(
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

      case '/AllDiagnosticCalc':
        return MaterialPageRoute(builder: (_) => DiagnosticForm());
      case '/AllLaboratoryCalc':
        var formBloc = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => LaboratoryForm(formBloc: formBloc,));
      case '/AllClinicalCalc':
        return MaterialPageRoute(builder: (_) => ClinicalForm());
      case '/AllResultsCalc':
        return MaterialPageRoute(builder: (_) => ResultsForm());
      case '/AllSummaryCalc':
        return MaterialPageRoute(builder: (_) => SummaryForm());

      case '/ChildCalc':
        return MaterialPageRoute(builder: (_) => CpsForm());
      case '/CLIPCalc':
        return MaterialPageRoute(builder: (_) => ClipForm());
      case '/MELDCalc':
        return MaterialPageRoute(builder: (_) => MeldForm());
      case '/OkudaCalc':
        return MaterialPageRoute(builder: (_) => OkudaForm());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
