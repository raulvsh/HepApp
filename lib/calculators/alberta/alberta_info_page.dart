import 'package:flutter/material.dart';
import 'package:hepapp/calculators/widgets_calc/right_bottom_title.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/pages/widgets_navigation/bottom_navigation_sheet.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:sized_context/sized_context.dart';

class AlbertaInfoPage extends StatefulWidget {
  final String title;
  final List<String> subTitle;
  final Map<String, List<String>> content;
  final route;
  final initialPage;
  final numPages;

  const AlbertaInfoPage({
    Key key,
    this.title,
    this.subTitle,
    this.content,
    this.route,
    this.initialPage,
    this.numPages,
  }) : super(key: key);

  @override
  _AlbertaInfoPageState createState() => _AlbertaInfoPageState();
}

class _AlbertaInfoPageState extends State<AlbertaInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('calculator'),
      body: _buildBody(),
      bottomSheet: BottomNavigationSheet(
          widget.initialPage, widget.route, widget.numPages),
    );
  }

  _buildBody() {
    List<Widget> listRows = [];
    listRows.add(_subTitle);
    listRows.add(_separator);
    widget.content.forEach((key, value) {
      listRows.add(_textRow(key, value));
    });
    return SingleChildScrollView(
      child: Container(
        //color: Colors.amber,
        width: context.widthPx,
        //height: context.heightPct(2.1),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 60),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: listRows,
              ),
            ),
            Container(
              height: 200,
              width: context.widthPx,
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  RightBottomTitle(
                    title: widget.title,
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.fromLTRB(0, 40, 10, 0),
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }

  _textRow(String key, List<String> textList) {
    AppLocalizations aux = AppLocalizations.of(context);
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10), //right: 32),
      color: Color.fromARGB(255, 210, 242, 245),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(width: 15),

          Container(
            padding: EdgeInsets.only(left: 10, right: 30),
            width: context.widthPx - 25,
            color: Color.fromARGB(255, 250, 250, 250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  aux.tr(key),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildTextList(textList),
                ),
              ],
            ),
          ),

          //Text(content[key][1]),
        ],
      ),
    );
  }

  _buildTextList(textList) {
    AppLocalizations aux = AppLocalizations.of(context);
    List<Widget> listTxt = [];
    for (int i = 0; i < textList.length; i++) {
      listTxt.add(
        textList[i] != 'sorafenib_data_table'
            ? Text(
                aux.tr(textList[i]),
                style: TextStyle(color: Colors.black, height: 1.5
                    //fontSize: 10
                    ),
                textAlign: TextAlign.justify,
                maxLines: 4,
              )
            : _buildSoranefibTable(),
      );
    }
    return listTxt;
  }

  _buildSoranefibTable() {
    String imgRoute = '';
    AppLocalizations
        .of(context)
        .locale
        .toString() == 'es_ES'
        ? imgRoute = 'assets/images/calc/tabla_sorafenib_es_ES.png' :
    imgRoute = 'assets/images/calc/tabla_sorafenib_en_US.png';

    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Image.asset(imgRoute,));
  }

  Widget get _subTitle {
    AppLocalizations aux = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
      child: Row(
        children: <Widget>[
          Text(
            aux.tr(widget.subTitle[0]),
            style: TextStyle(
              color: Color.fromARGB(255, 70, 146, 174),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            aux.tr(widget.subTitle[1]),
            style: TextStyle(
              color: Color.fromARGB(255, 70, 146, 174),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _separator => Container(
    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        width: context.widthPx,
        height: 2,
        color: Theme.of(context).primaryColor,
      );


}
