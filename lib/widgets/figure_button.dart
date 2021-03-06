import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:sized_context/sized_context.dart';

class FigureButton extends StatelessWidget {
  final BuildContext context;
  final List<String> type;
  final int page;

  FigureButton(this.context, this.type, [this.page]);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      child: GestureDetector(
        child: buildStack(),
        /*Solo se pasa específicamente el destino en las cadenas de texto de pathology
          porque es el único apartado que tiene más de 8 elementos.*/
        onTap: type[2] == '/PathologyDetailPV'
            ? () => Navigator.pushNamed(context, type[2],
                arguments: int.parse(type[3]))
            : () => Navigator.pushNamed(context, type[2], arguments: page),
      ),
    );
  }

  buildStack() {
    var aux = AppLocalizations.of(context);
    bool isTablet = context.diagonalInches >= 7;
    bool isLandscape = context.isLandscape;
    return Column(
      children: <Widget>[
        Container(
          height: context.heightPct(isLandscape ? 0.19 : 0.12),
          width: double.infinity,
          padding: isTablet
              ? EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0)
              : EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 0),
          child: Hero(
            tag: type[1],
            child: Image.asset(
              'assets/images/${type[1]}',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
            child: Center(
              child: Text(
                aux.tr(type[0]),
                softWrap: true,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: context.heightPct(isLandscape ? 0.022 : 0.014),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
