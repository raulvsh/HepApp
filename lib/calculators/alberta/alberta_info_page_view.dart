import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/data/rfa.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import 'alberta_info_page.dart';

class AlbertaInfoPageView extends StatefulWidget with Observable {
  final initialPage;
  final data;

  AlbertaInfoPageView({Key key, this.initialPage, this.data}) : super(key: key);

  @override
  AlbertaInfoPageViewState createState() => AlbertaInfoPageViewState();
}

class AlbertaInfoPageViewState extends State<AlbertaInfoPageView>
    with Observable {
  final prefs = UserSettings();
  final units = Units();
  PageController controller;

  @override
  void initState() {
    controller = PageController(
      initialPage: widget.initialPage,
    );
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = context.diagonalInches >= 7;
    var numPages = widget.data.length;

    if (!isTablet)
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);

    List<Widget> widgets = [];
    for (int i = 0; i < numPages; i++) {
      widgets.add(
        AlbertaInfoPage(
          title: 'early_stage_rfa',
          subTitle: [
            'early_stage_hepatocellular_carcinoma',
            'definitions_goals_recommendations'
          ],
          content: rfa,
          initialPage: i,
          numPages: numPages,
          route: '/AlbertaInfoPage',
        ),

        /*CommonPageWithBottomNav(
          title: widget.data[i][0],
          data: widget.data[i][1],
          route: widget.data[i][2],
          initialPage: widget.data[i][3],
          type: widget.type,
          numPages: numPages,
        ),*/
      );
    }

    return Scaffold(
      body: PageView(
        controller: controller,
        children: widgets,
      ),
    );

    /*return PageView(
      controller: controller,
      //physics: NeverScrollableScrollPhysics(),

      children: <Widget>[
        AlbertaInfoPage(
          title: 'early_stage_rfa',
          subTitle: [
            'early_stage_hepatocellular_carcinoma',
            'definitions_goals_recommendations'
          ],
          content: rfa,
          initialPage: 0,
          numPages: 6,
          route: '/AlbertaInfoPage',
        ),
        AlbertaInfoPage(
          title: 'intermediate_stage_tare',
          subTitle: [
            'intermediate_stage_hepatocellular_carcinoma',
            'definitions_goals_recommendations'
          ],
          content: tare,
          initialPage: 1,
          numPages: 6,
          route: '/AlbertaInfoPage',
        ),
        AlbertaInfoPage(
          title: 'intermediate_stage_tace',
          subTitle: [
            'intermediate_stage_hepatocellular_carcinoma',
            'definitions_goals_recommendations'
          ],
          content: tace,
          initialPage: 2,
          numPages: 6,
          route: '/AlbertaInfoPage',
        ),
        AlbertaInfoPage(
          title: 'advanced_stage_sorafenib',
          subTitle: [
            'advanced_stage_hepatocellular_carcinoma',
            'definitions_goals_recommendations'
          ],
          content: sorafenib,
          initialPage: 3,
          numPages: 6,
          route: '/AlbertaInfoPage',
        ),
        AlbertaInfoPage(
          title: 'advanced_stage_sbrt',
          subTitle: [
            'advanced_stage_hepatocellular_carcinoma',
            'definitions_goals_recommendations'
          ],
          content: sbrt,
          initialPage: 4,
          numPages: 6,
          route: '/AlbertaInfoPage',
        ),

        AlbertaInfoPage(
          title: 'terminal_stage_best_supportive_care',
          subTitle: [
            'terminal_stage_hepatocellular_carcinoma',
            'definitions_goals_recommendations'
          ],
          content: bestSupportiveCare,
          initialPage: 5,
          numPages: 6,
          route: '/AlbertaInfoPage',
        ),
        //AlbertaInfoPage(title: 'close', content: 'contenido 2'),
      ],
    );*/
  }
}
