import 'package:flutter/material.dart';
import 'package:hepapp/pages/Podcasts/Podcasts1Page.dart';

import 'Podcasts2Page.dart';
import 'Podcasts3Page.dart';

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
            Podcasts1Page(),
            Podcasts2Page(),
            Podcasts3Page(),
          ],
        ));
  }
}
