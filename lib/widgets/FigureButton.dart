import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';

class FigureButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;
  final int page;

  //final Widget destWidget;

  FigureButton(this.context, this.type, [this.page]); //, this.destWidget);

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);
    var orientation;
    return Card(
      margin: EdgeInsets.all(4),
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            /*Image.asset(
              'assets/images/items/empty_button.png',
              //height: double.infinity,
              fit: BoxFit.cover,
              //width: double.infinity,
            ),*/
            Container(
              padding: EdgeInsets.all(7),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/${type[1]}',
                      height: orientation == Orientation.portrait ? 80 : 70,
                      fit: BoxFit.scaleDown,
                      /*width: double.infinity,*/
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        aux.tr(type[0]),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: orientation == Orientation.portrait
                              ? 16
                              : 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )

            /*SizedBox(
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
            ),*/
          ],
        ),
        onTap: //() => Navigator.pushNamed(context, type[2]),
            () {
          //print(type[1]);
          Navigator.pushNamed(context, type[2], arguments: page);
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

/*

class FigureButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;
  final int page;

  //final Widget destWidget;

  FigureButton(this.context, this.type, [this.page]); //, this.destWidget);

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
              child: Container(
                //color: Colors.red,
                child: Stack(children: <Widget>[

                  Opacity(
                    opacity: 1,
                    child: Image.asset(
                      'assets/images/items/empty_button.png',
                      height: double.infinity,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Opacity(
                    opacity: 1,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      child: Center(
                        child: Image.asset(
                          'assets/images/${type[1]}',
                          height: double.infinity,
                          fit: BoxFit.scaleDown,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    aux.tr(type[0]),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      //color: Color.fromARGB(255, 93, 188, 210),
                      fontSize: 16,
                    ),
                  ),

                ]),
              ),
            ),
            */
/*SizedBox(
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
            ),*/ /*

          ],
        ),
        onTap: //() => Navigator.pushNamed(context, type[2]),
            () {
          //print(type[1]);
          Navigator.pushNamed(context, type[2], arguments: page);
          */
/*Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => destWidget), //TOCPageView(0)),
          );*/ /*

        },
      ),
    );
  }
}
*/
