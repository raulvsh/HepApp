import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/VideoButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Podcasts3Page extends StatefulWidget {
  @override
  _Podcasts3PageState createState() => _Podcasts3PageState();
}

class _Podcasts3PageState extends State<Podcasts3Page> {
  final numPodcasts3 = 5;
  final numPodcastsPages = 3;
  var podcastIndex3 = [
    "Podcast17",
    "Podcast18",
    "Podcast19",
    "Podcast20",
    "Podcast21",
  ];

  var podcastInfo3 = {
    "Podcast17": [
      'podcast_17',
      '2_podcasts.png',
      'https://www.dropbox.com/s/d03bj3xffw1a0r4/HepAPP%202019%20Vodcast%2017%20Liver%20Cancer.mp4?dl=1'
    ],
    "Podcast18": [
      'podcast_18',
      '2_podcasts.png',
      'https://www.dropbox.com/s/qpaxrhwtvu6mm28/HepAPP%202019%20Vodcast%2018%20Varices.mp4?dl=1'
    ],
    "Podcast19": [
      'podcast_19',
      '2_podcasts.png',
      'https://www.dropbox.com/s/qyveytvyygy4u0e/HepAPP%202019%20Vodcast%2019%20Ascites.mp4?dl=1'
    ],
    "Podcast20": [
      'podcast_20',
      '2_podcasts.png',
      'https://www.dropbox.com/s/yv69e362s0bw4lv/HepAPP%202019%20Vodcast%2020%20Encephalopathy%20and%20Other%20Complications.mp4?dl=1'
    ],
    "Podcast21": [
      'podcast_21',
      '2_podcasts.png',
      'https://www.dropbox.com/s/b8pf53zqh8w2mg3/HepAPP%202019%20Vodcast%2021%20Liver%20Transplant.mp4?dl=1'
    ],
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //No haría falta al no escribirse nunca

      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'podcasts_3'),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
        bottomSheet: BottomNavigationSheet(2, '/PodcastsPV', numPodcastsPages));

  }

  /*Row _buildBottomSheet(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/PodcastsPV2'),
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }*/

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
    for (int i = 0; i < numPodcasts3; i++) {
      widgets.add(VideoButton(context, podcastInfo3[podcastIndex3[i]]));
    }
    return widgets;
  }
}
