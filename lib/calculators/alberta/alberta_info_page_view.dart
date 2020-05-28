import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          title: widget.data[i][0],
          //'early_stage_rfa',
          subTitle: [
            widget.data[i][1], //'early_stage_hepatocellular_carcinoma',
            widget.data[i][2], //'definitions_goals_recommendations'
          ],
          content: widget.data[i][3],
          //rfa,
          initialPage: i,
          numPages: numPages,
          route: '/AlbertaInfoPage',
        ),
      );
    }

    return Scaffold(
      body: PageView(
        controller: controller,
        children: widgets,
      ),
    );
  }
}
