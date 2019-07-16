import 'package:flutter/material.dart';

class PodcastsPage extends StatefulWidget {
  @override
  _PodcastsPageState createState() => _PodcastsPageState();
}

class _PodcastsPageState extends State<PodcastsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Module Podcasts"),
      ),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
