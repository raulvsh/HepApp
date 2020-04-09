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
    return Card(
      margin: EdgeInsets.all(4),
      child: GestureDetector(
        child: buildStack(),
        onTap: () {
          Navigator.pushNamed(context, type[2], arguments: page);
        },
      ),
    );
  }

  /* Stack buildStack(orientation, AppLocalizations aux) {
    return Stack(
      children: <Widget>[
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
                ),
              ),
              Expanded(
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      aux.tr(type[0]),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: orientation == Orientation.portrait ? 16 : 13,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }*/

  Stack buildStack() {
    var aux = AppLocalizations.of(context);
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 60),
          //color: Colors.red,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                'assets/images/${type[1]}',
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment(0, 0.7),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: FittedBox(
            child: Text(
              aux.tr(type[0]),
              maxLines: 2,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black, //Color.fromARGB(255, 93, 188, 210),
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
