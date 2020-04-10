import 'package:flutter/material.dart';

import 'Module1Page.dart';
import 'Module2Page.dart';
import 'Module3Page.dart';

class ModulePageView extends StatefulWidget {
  final initialPage;

  ModulePageView(this.initialPage);

  @override
  _ModulePageViewState createState() => _ModulePageViewState();
}

class _ModulePageViewState extends State<ModulePageView> {
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: controller,
          children: <Widget>[
            Module1Page(),
            Module2Page(),
            Module3Page(),
          ],
        ));
  }
}
