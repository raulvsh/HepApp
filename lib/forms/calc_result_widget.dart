import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:sized_context/sized_context.dart';

class CalcResultWidget extends StatefulWidget {
  final resultMap;
  final textAlignment;

  CalcResultWidget({
    this.resultMap,
    this.textAlignment,
  });

  @override
  _CalcResultWidgetState createState() => _CalcResultWidgetState();
}

class _CalcResultWidgetState extends State<CalcResultWidget> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = context.diagonalInches >= 7;

    return Container(
      width: isTablet ? 400 : 200,
      height: isTablet ? 200 : 170,
      //margin: EdgeInsets.fromLTRB(0, 30, 50, 0),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 210, 242, 245),
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buildResultList(widget.textAlignment),
      ),
      //),
    );
  }

  buildResultList(alignment) {
    AppLocalizations aux = AppLocalizations.of(context);
    List<Row> rowList = [];
    bool isTablet = context.diagonalInches >= 7;

    widget.resultMap.forEach(
          (key, value) {
        rowList.add(
          Row(
            mainAxisAlignment: alignment, //MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 8),
                child: Text(
                  aux.tr(key) + ": ",
                  //'${aux.tr(widget.resultList[i][0])}: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: calculateFontSize(widget.resultMap),
                    //isTablet ? 16 : 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                value,
                // widget.resultList[i][1],
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontSize: calculateFontSize(widget.resultMap),
                ),
              ),
            ],
          ),
        );
        /*if (widget.resultMap.length > 1) {
          rowList.add(Row(
            children: <Widget>[
              SizedBox(
                height: 10,
              )
            ],
          ));
        }*/
      },
    );
    return rowList;
  }

  calculateFontSize(resultMap) {
    bool isTablet = context.diagonalInches >= 7;
    if (resultMap.length > 3 && isTablet) {
      return 16.0;
    } else if (isTablet && resultMap.length <= 3) {
      return 22.0;
    } else
      return 12.0;
  }
}
