/*
import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../CommonGridPage.dart';

class Podcasts3Page extends StatefulWidget {
  @override
  _Podcasts3PageState createState() => _Podcasts3PageState();
}

class _Podcasts3PageState extends State<Podcasts3Page> {
  final numPodcastsPages = 3;

  static var podcasts3 = [
    [
      'podcast_17',
      'podcasts/podcast_17.png',
      'https://www.dropbox.com/s/d03bj3xffw1a0r4/HepAPP%202019%20Vodcast%2017%20Liver%20Cancer.mp4?dl=1',
      'Video',
    ],
    [
      'podcast_18',
      'podcasts/podcast_18.png',
      'https://www.dropbox.com/s/qpaxrhwtvu6mm28/HepAPP%202019%20Vodcast%2018%20Varices.mp4?dl=1',
      'Video',
    ],
    [
      'podcast_19',
      'podcasts/podcast_19.png',
      'https://www.dropbox.com/s/qyveytvyygy4u0e/HepAPP%202019%20Vodcast%2019%20Ascites.mp4?dl=1',
      'Video',
    ],
    [
      'podcast_20',
      'podcasts/podcast_20.png',
      'https://www.dropbox.com/s/yv69e362s0bw4lv/HepAPP%202019%20Vodcast%2020%20Encephalopathy%20and%20Other%20Complications.mp4?dl=1',
      'Video',
    ],
    [
      'podcast_21',
      'podcasts/podcast_21.png',
      'https://www.dropbox.com/s/b8pf53zqh8w2mg3/HepAPP%202019%20Vodcast%2021%20Liver%20Transplant.mp4?dl=1',
      'Video',
    ],
  ];

  var numPodcasts3 = podcasts3.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuWidget(),
        appBar: CustomAppBar(context, 'podcasts_3'),
        body: CommonGridPage(data: podcasts3),
        bottomSheet: BottomNavigationSheet(2, '/PodcastsPV', numPodcastsPages));
  }
}
*/
