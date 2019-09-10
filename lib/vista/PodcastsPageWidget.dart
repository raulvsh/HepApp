import 'package:flutter/material.dart';
import 'package:hepapp/vista/UtilsVista.dart';

class PodcastsPage extends StatefulWidget {
  @override
  _PodcastsPageState createState() => _PodcastsPageState();
}

class _PodcastsPageState extends State<PodcastsPage> {
  Utils u = new Utils();

  String textoFuturo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: u.showAppBar(context, "Podcasts"),

      body: _buildPodcastsBody(),
    );
  }

  _buildPodcastsBody() {
    return Center(

      child: new Text("El contenido es as "),
    );
  }


}
