import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class Schemes1Page extends StatelessWidget {
  final PageController controlador;

  Schemes1Page(this.controlador);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'schemes'),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                child: Text("Next"),
                onPressed: () => controlador.animateToPage(1,
                    duration: Duration(milliseconds: 500), curve: Curves.ease),
              ),
              RaisedButton(
                child: Text("Página 2"),
                onPressed: () => controlador.animateToPage(2,
                    duration: Duration(milliseconds: 500), curve: Curves.ease),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
