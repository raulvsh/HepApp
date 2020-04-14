/*
import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../CommonGridPage.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Podcasts2Page extends StatefulWidget {
  @override
  _Podcasts2PageState createState() => _Podcasts2PageState();
}

class _Podcasts2PageState extends State<Podcasts2Page> {
  final numPodcastsPages = 3;

  static var podcasts2 = [
    [
      'podcast_9',
      'podcasts/podcast_9.png',
      'https://www.dropbox.com/s/gk2iie5vbkqpwzd/HepAPP%202019%20Vodcast%2009%20Intrahepatic%20Cholestasis.mp4?dl=1',
      'Video',
    ],
    [
      'podcast_10',
      'podcasts/podcast_10.png',
      'https://www.dropbox.com/s/2fug88ehgrq7j2d/HepAPP%202019%20Vodcast%2010%20ABCs%20of%20Viral%20Hepatitis.mp4?dl=1',
      'Video',
    ],
    [
      'podcast_11',
      'podcasts/podcast_11.png',
      'https://www.dropbox.com/s/jiyv6xnfb4uwbtz/HepAPP%202019%20Vodcast%2011%20HBV%20and%20HCV.mp4?dl=1',
      'Video',
    ],
    [
      'podcast_12',
      'podcasts/podcast_12.png',
      'https://www.dropbox.com/s/tivjvsmfqwc1f1d/HepAPP%202019%20Vodcast%2012%20Alcohol%20and%20NAFLD.mp4?dl=1',
      'Video',
    ],
    [
      'podcast_13',
      'podcasts/podcast_13.png',
      'https://www.dropbox.com/s/kt1mrs9y5ur6ece/HepAPP%202019%20Vodcast%2013%20Genetic%20Liver%20Diseases.mp4?dl=1',
      'Video',
    ],
    [
      'podcast_14',
      'podcasts/podcast_14.png',
      'https://www.dropbox.com/s/2fze8q1d10nvem0/HepAPP%202019%20Vodcast%2014%20AIH%20and%20DILI.mp4?dl=1',
      'Video',
    ],
    [
      'podcast_15',
      'podcasts/podcast_15.png',
      'https://www.dropbox.com/s/o29clr1t7m0vltf/HepAPP%202019%20Vodcast%2015%20ALF.mp4?dl=1',
      'Video',
    ],
    [
      'podcast_16',
      'podcasts/podcast_16.png',
      'https://www.dropbox.com/s/kqlecvuk9tr16qq/HepAPP%202019%20Vodcast%2016%20Hepatosplenomegaly%20and%20Liver%20Masses.mp4?dl=1',
      'Video',
    ],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: MenuWidget(),
        appBar: CustomAppBar(context, 'podcasts_2'),
        body: CommonGridPage(data: podcasts2),
        bottomSheet: BottomNavigationSheet(1, '/PodcastsPV', numPodcastsPages));
  }
}
*/
