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
                            fontSize:
                            orientation == Orientation.portrait ? 16 : 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, type[2], arguments: page);
        },
      ),
    );
  }
}
