import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/VideoButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Podcasts1Page extends StatefulWidget {
  @override
  _Podcasts1PageState createState() => _Podcasts1PageState();
}

class _Podcasts1PageState extends State<Podcasts1Page> {
  final numPodcasts1 = 8;
  final numPodcastsPages = 3;
  var podcastIndex1 = [
    "Podcast1",
    "Podcast2",
    "Podcast3",
    "Podcast4",
    "Podcast5",
    "Podcast6",
    "Podcast7",
    "Podcast8",
  ];

  var podcastInfo1 = {
    "Podcast1": [
      'podcast_1',
      '2_podcasts.png',
      'https://www.dropbox.com/s/reqiaun8rtajsr9/HepAPP%202019%20Vodcast%2001%20Introduction.mp4?dl=1'
    ],
    "Podcast2": [
      'podcast_2',
      '2_podcasts.png',
      'https://www.dropbox.com/s/bs0iajins97uuq2/HepAPP%202019%20Vodcast%2002%20Anatomy.mp4?dl=1'
    ],
    "Podcast3": [
      'podcast_3',
      '2_podcasts.png',
      'https://www.dropbox.com/s/q1obxaridhz21dq/HepAPP%202019%20Vodcast%2003%20Cell%20Biology.mp4?dl=1'
    ],
    "Podcast4": [
      'podcast_4',
      '2_podcasts.png',
      'https://www.dropbox.com/s/t8bndhxxx9bhdt2/HepAPP%202019%20Vodcast%2004%20History.mp4?dl=1'
    ],
    "Podcast5": [
      'podcast_5',
      '2_podcasts.png',
      'https://www.dropbox.com/s/o2gpoo3f42f3g7z/HepAPP%202019%20Vodcast%2005%20Physical%20Exam.mp4?dl=1'
    ],
    "Podcast6": [
      'podcast_6',
      '2_podcasts.png',
      'https://www.dropbox.com/s/awstx5kf830xbej/HepAPP%202019%20Vodcast%2006%20Investigations.mp4?dl=1'
    ],
    "Podcast7": [
      'podcast_7',
      '2_podcasts.png',
      'https://www.dropbox.com/s/5zl25a04iw7dprk/HepAPP%202019%20Vodcast%2007%20Pathology.mp4?dl=1'
    ],
    "Podcast8": [
      'podcast_8',
      '2_podcasts.png',
      'https://www.dropbox.com/s/8g9egqsu8do56lw/HepAPP%202019%20Vodcast%2008%20Extrahepatic%20Cholestasis.mp4?dl=1'
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
      appBar: CustomAppBar(context, 'podcasts_1'),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
        bottomSheet: BottomNavigationSheet(0, '/PodcastsPV', numPodcastsPages));

  }

  /*Row _buildBottomSheet(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          color: Theme.of(context).primaryColor,
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/PodcastsPV2'),
        )
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
    for (int i = 0; i < numPodcasts1; i++) {
      widgets.add(VideoButton(context, podcastInfo1[podcastIndex1[i]]));
    }
    return widgets;
  }
}
