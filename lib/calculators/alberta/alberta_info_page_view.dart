import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/data/best_supportive_care.dart';
import 'package:hepapp/data/rfa.dart';
import 'package:hepapp/data/sbrt.dart';
import 'package:hepapp/data/sorafenib.dart';
import 'package:hepapp/data/tace.dart';
import 'package:hepapp/data/tare.dart';
import 'package:hepapp/data/units.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';
import 'package:observable/observable.dart';
import 'package:sized_context/sized_context.dart';

import 'alberta_info_page.dart';

class AlbertaInfoPageView extends StatefulWidget with Observable {
  final initialPage;

  AlbertaInfoPageView({Key key, this.initialPage}) : super(key: key);

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
      initialPage: 3, //widget.initialPage,
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
    if (!isTablet)
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);

    return PageView(
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
        ),
        AlbertaInfoPage(
          title: 'intermediate_stage_tare',
          subTitle: [
            'intermediate_stage_hepatocellular_carcinoma',
            'definitions_goals_recommendations'
          ],
          content: tare,
        ),
        AlbertaInfoPage(
          title: 'intermediate_stage_tace',
          subTitle: [
            'intermediate_stage_hepatocellular_carcinoma',
            'definitions_goals_recommendations'
          ],
          content: tace,
        ),
        AlbertaInfoPage(
          title: 'advanced_stage_sorafenib',
          subTitle: [
            'advanced_stage_hepatocellular_carcinoma',
            'definitions_goals_recommendations'
          ],
          content: sorafenib,
        ),
        AlbertaInfoPage(
          title: 'advanced_stage_sbrt',
          subTitle: [
            'advanced_stage_hepatocellular_carcinoma',
            'definitions_goals_recommendations'
          ],
          content: sbrt,
        ),

        AlbertaInfoPage(
          title: 'terminal_stage_best_supportive_care',
          subTitle: [
            'terminal_stage_hepatocellular_carcinoma',
            'definitions_goals_recommendations'
          ],
          content: bestSupportiveCare,
        ),
        //AlbertaInfoPage(title: 'close', content: 'contenido 2'),
      ],
    );
  }
}
