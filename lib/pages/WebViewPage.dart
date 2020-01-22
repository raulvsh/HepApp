import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final title;

  const WebViewPage({Key key, this.url, this.title}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: CustomAppBar(context, widget.title),
      url: widget.url,
      withZoom: true,
      withLocalStorage: true,
      displayZoomControls: false,
      withJavascript: true,
    );
  }
}
