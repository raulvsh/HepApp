import 'package:flutter/material.dart';
import 'package:hepapp/pages/Podcasts/Podcasts1Page.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import 'Podcasts2Page.dart';
import 'Podcasts3Page.dart';

class PodcastsPageView extends StatefulWidget {
  @override
  _PodcastsPageViewState createState() => _PodcastsPageViewState();
}

class _PodcastsPageViewState extends State<PodcastsPageView> {
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuWidget(),
        body: PageView(
          controller: controller,
          children: <Widget>[
            Podcasts1Page(),
            Podcasts2Page(),
            Podcasts3Page(),
          ],
        ));
  }
}
