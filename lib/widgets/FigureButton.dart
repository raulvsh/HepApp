import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';

class FigureButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;
  final Widget destWidget;

  FigureButton(this.context, this.type, this.destWidget);

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    return Container(
      margin: EdgeInsets.all(4),
      child: GestureDetector(
        child: Column(
          children: <Widget>[
            Expanded(

              child: Image.asset(
                //'assets/images/toc/TOC1.png'

                'assets/images/${type[1]}',
                height: 100,
                fit: BoxFit.scaleDown,
                //alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment(0, 0.7),
              padding: EdgeInsets.only(bottom: 0),
              //alignment: Alignment(0, 0.7),
              child: Text(
                aux.tr(type[0]),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 93, 188, 210),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        onTap: //() => Navigator.pushNamed(context, type[2]),
            () {
          print(type[1]);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => destWidget), //TOCPageView(0)),
          );
        },
      ),
    );
  }
}
