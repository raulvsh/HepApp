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
              flex: 2,
              child: Image.asset(
                //'assets/images/toc/TOC1.png'

                'assets/images/${type[1]}',
                height: 100,
                fit: BoxFit.scaleDown,

                //fit: BoxFit.scaleDown,
                //alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 1,
              child: Container(
                //alignment: Alignment(0, 0),
                //padding: EdgeInsets.all(1),
                //alignment: Alignment(0, 0.7),
                child: Text(
                  aux.tr(type[0]),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    //color: Color.fromARGB(255, 93, 188, 210),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: //() => Navigator.pushNamed(context, type[2]),
            () {
          //print(type[1]);
          Navigator.pushNamed(context, type[2],
              arguments: 2); //actualizar arguments según toque
          /*Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => destWidget), //TOCPageView(0)),
          );*/
        },
      ),
    );
  }
}
