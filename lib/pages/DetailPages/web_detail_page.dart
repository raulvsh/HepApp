import 'package:flutter/material.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WebDetailPage extends StatefulWidget {
  final String url;
  final title;

  const WebDetailPage({Key key, this.url, this.title}) : super(key: key);

  @override
  _WebDetailPageState createState() => _WebDetailPageState();
}

class _WebDetailPageState extends State<WebDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(widget.title),
      drawer: MenuWidget(),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
