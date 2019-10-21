import 'package:flutter/material.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import 'Schemes/Schemes1Page.dart';
import 'Schemes/Schemes2Page.dart';
import 'Schemes/Schemes3Page.dart';


class SchemesFigPage extends StatefulWidget {
  @override
  _SchemesFigPageState createState() => _SchemesFigPageState();
}

class _SchemesFigPageState extends State<SchemesFigPage> {
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CustomAppBar(context, "Figures - Schemes"),
        drawer: MenuWidget(),
        body: PageView(
          controller: controller,
          children: <Widget>[
            Schemes1Page(controller),
            Schemes2Page(),
            Schemes3Page(),

            Container(
              color: Colors.cyan,
            ),
            Container(
              color: Colors.deepPurple,
            ),
          ],
        )
    );
  }
}
