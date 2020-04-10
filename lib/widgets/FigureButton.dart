import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:sized_context/sized_context.dart';

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

  Stack buildStack() {
    var aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 55),
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
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: FittedBox(
            child: Text(
              aux.tr(type[0]),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black, //Color.fromARGB(255, 93, 188, 210),
                fontSize: isTablet ? 18 : 16,
              ),
            ),
          ),
        ),

      ],
    );
  }
}
