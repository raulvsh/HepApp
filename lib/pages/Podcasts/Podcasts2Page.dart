import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/VideoButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Podcasts2Page extends StatefulWidget {
  @override
  _Podcasts2PageState createState() => _Podcasts2PageState();
}

class _Podcasts2PageState extends State<Podcasts2Page> {
  final numPodcastsPages = 3;

  static var Podcasts2 = [
    [
      'podcast_9',
      '2_podcasts.png',
      'https://www.dropbox.com/s/gk2iie5vbkqpwzd/HepAPP%202019%20Vodcast%2009%20Intrahepatic%20Cholestasis.mp4?dl=1'
    ],
    [
      'podcast_10',
      '2_podcasts.png',
      'https://www.dropbox.com/s/2fug88ehgrq7j2d/HepAPP%202019%20Vodcast%2010%20ABCs%20of%20Viral%20Hepatitis.mp4?dl=1'
    ],
    [
      'podcast_11',
      '2_podcasts.png',
      'https://www.dropbox.com/s/jiyv6xnfb4uwbtz/HepAPP%202019%20Vodcast%2011%20HBV%20and%20HCV.mp4?dl=1'
    ],
    [
      'podcast_12',
      '2_podcasts.png',
      'https://www.dropbox.com/s/tivjvsmfqwc1f1d/HepAPP%202019%20Vodcast%2012%20Alcohol%20and%20NAFLD.mp4?dl=1'
    ],
    [
      'podcast_13',
      '2_podcasts.png',
      'https://www.dropbox.com/s/kt1mrs9y5ur6ece/HepAPP%202019%20Vodcast%2013%20Genetic%20Liver%20Diseases.mp4?dl=1'
    ],
    [
      'podcast_14',
      '2_podcasts.png',
      'https://www.dropbox.com/s/2fze8q1d10nvem0/HepAPP%202019%20Vodcast%2014%20AIH%20and%20DILI.mp4?dl=1'
    ],
    [
      'podcast_15',
      '2_podcasts.png',
      'https://www.dropbox.com/s/2fze8q1d10nvem0/HepAPP%202019%20Vodcast%2014%20AIH%20and%20DILI.mp4?dl=1'
    ],
    [
      'podcast_16',
      '2_podcasts.png',
      'https://www.dropbox.com/s/kqlecvuk9tr16qq/HepAPP%202019%20Vodcast%2016%20Hepatosplenomegaly%20and%20Liver%20Masses.mp4?dl=1'
    ],


  ];

  var numPodcasts2 = Podcasts2.length;


  @override
  void initState() {
    super.initState();
  }

/*Construcción del Layout del menú principal*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'podcasts_2'),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
        bottomSheet: BottomNavigationSheet(1, '/PodcastsPV', numPodcastsPages));

  }

  _buildLayout(orientation) {
    final width = MediaQuery.of(context).size.width;
    var padding = width / 100;

    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.lightBlueAccent,
      child: FractionallySizedBox(
        widthFactor: orientation == Orientation.portrait ? 0.7 : 0.7,
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.symmetric(vertical: 2 * padding)
              : EdgeInsets.symmetric(vertical: 2 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildChaptersGridView(),
        ),
      ),
    );
  }

  _buildChaptersGridView() {
    List<Widget> widgets = [];
    for (int i = 0; i < numPodcasts2; i++) {
      widgets.add(VideoButton(context, Podcasts2[i]));
    }
    return widgets;
  }
}
