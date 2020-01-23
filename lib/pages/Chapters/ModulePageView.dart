import 'package:flutter/material.dart';
import 'package:hepapp/widgets/menu_widget.dart';

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
        //appBar: CustomAppBar(context, "Figures - Schemes"),
        drawer: MenuWidget(),
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
