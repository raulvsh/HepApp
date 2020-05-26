import 'package:flutter/material.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:screenshot/screenshot.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WebDetailPage extends StatefulWidget {
  final String url;
  final title;

  const WebDetailPage({Key key, this.url, this.title}) : super(key: key);

  @override
  _WebDetailPageState createState() => _WebDetailPageState();
}

class _WebDetailPageState extends State<WebDetailPage> {
  ScreenshotController webScreenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: webScreenshotController,
      child: Scaffold(
        appBar: CustomAppBar(
          widget.title,
          screenshotController: webScreenshotController,
        ),
        drawer: MenuWidget(),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
