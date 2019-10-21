import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

/*class PubMedPage extends StatefulWidget {
  @override
  _PubMedPageState createState() => _PubMedPageState();
}

class _PubMedPageState extends State<PubMedPage> {



  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, "PubMed"),
      drawer: MenuWidget(),

      body: WebView(
        initialUrl: 'https://flutter.io',
        javascriptMode: JavascriptMode.unrestricted,
      ),

    );
  }
}*/

class PubMedPage extends StatefulWidget {
  @override
  _PubMedPageState createState() => _PubMedPageState();
}

class _PubMedPageState extends State<PubMedPage> {
  //Completer<WebViewController> _controller = Completer<WebViewController>();

  WebViewController _controller;
  final Set<String> _favorites = Set<String>();

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://www.ncbi.nlm.nih.gov/pubmed/",
      appBar: CustomAppBar(context, 'PubMed'),
      withZoom: true,
      withLocalStorage: true,
      displayZoomControls: true,
      withJavascript: true,
    );
  }
/*
  _bookmarkButton() {
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return FloatingActionButton(
            onPressed: () async {
              var url = await controller.data.currentUrl();
              _favorites.add(url);
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('Saved $url for later reading.')),
              );
            },
            child: Icon(Icons.favorite),
          );
        }
        return Container();
      },
    );
  }*/
}
