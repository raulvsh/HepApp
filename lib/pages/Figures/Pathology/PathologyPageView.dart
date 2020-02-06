import 'package:flutter/material.dart';
import 'package:hepapp/pages/Figures/Pathology/Pathology1Page.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import 'Pathology2Page.dart';

class PathologyPageView extends StatefulWidget {
  final initialPage;

  PathologyPageView(this.initialPage);

  @override
  _PathologyPageViewState createState() => _PathologyPageViewState();
}

class _PathologyPageViewState extends State<PathologyPageView> {
  PageController controller = PageController();

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
        drawer: MenuWidget(),
        body: PageView(
          controller: controller,
          children: <Widget>[
            Pathology1Page(),
            Pathology2Page(),
          ],
        ));
  }
}
