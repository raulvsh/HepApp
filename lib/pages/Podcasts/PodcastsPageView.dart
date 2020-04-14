import 'package:flutter/material.dart';
import 'package:hepapp/data/podcasts1.dart';
import 'package:hepapp/data/podcasts2.dart';
import 'package:hepapp/data/podcasts3.dart';

import '../CommonPageWithBottomNav.dart';

class PodcastsPageView extends StatefulWidget {

  final initialPage;

  PodcastsPageView(this.initialPage);


  @override
  _PodcastsPageViewState createState() => _PodcastsPageViewState();
}

class _PodcastsPageViewState extends State<PodcastsPageView> {
  PageController controller = PageController();


  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: controller,
          children: <Widget>[
            CommonPageWithBottomNav(
              title: 'podcasts_1',
              data: podcasts1,
              route: '/ModulePV',
            ),
            CommonPageWithBottomNav(
              title: 'podcasts_2',
              data: podcasts2,
              route: '/ModulePV',
            ),
            CommonPageWithBottomNav(
              title: 'podcasts_3',
              data: podcasts3,
              route: '/ModulePV',

            ),
            //Podcasts1Page(),
            //Podcasts2Page(),
            //Podcasts3Page(),
          ],
        ));
  }
}
