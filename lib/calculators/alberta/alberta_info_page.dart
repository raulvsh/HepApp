import 'package:flutter/material.dart';
import 'package:hepapp/calculators/widgets_calc/right_bottom_title.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:sized_context/sized_context.dart';

Color blueTreatmentColor = Color.fromARGB(255, 70, 146, 174);

class AlbertaInfoPage extends StatefulWidget {
  final String title;
  final List<String> subTitle;
  final Map<String, List<String>> content;

  const AlbertaInfoPage({
    Key key,
    this.title,
    this.subTitle,
    this.content,
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
    );
  }

  _buildBody() {
    List<Widget> listRows = [];
    listRows.add(_subTitle);
    listRows.add(_separator);
    widget.content.forEach((key, value) {
      listRows.add(_textRow(key, value));
    });
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            RightBottomTitle(
              title: widget.title,
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(0, 40, 10, 0),
            ),
          ],
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listRows,
            ),
          ),
        ),
      ],
    );
  }

  _textRow(String key, List<String> textList) {
    AppLocalizations aux = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 30 + 20 * textList.length.toDouble(),
            width: 15,
            color: Color.fromARGB(255, 210, 242, 245),
          ),

          Container(
            padding: EdgeInsets.only(left: 10),
            color: Colors.orange,
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

  _buildTextList(value) {
    AppLocalizations aux = AppLocalizations.of(context);
    List<Widget> listTxt = [];
    //print("value + value length " + value.toString() + value.length.toString());
    for (int i = 0; i < value.length; i++) {
      listTxt.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 2),
          width: context.widthPx - 45,

          color: Colors.red,
          child: //Row(
              //mainAxisSize: MainAxisSize.max,
              //children: <Widget>[
              Text(
            aux.tr(value[i]),
            style: TextStyle(
              color: Colors.black,
              //fontSize: 10
            ),
            textAlign: TextAlign.justify,
            maxLines: 3,
          ),
          //],
          //),
        ),
      );
    }
    return listTxt;
  }

  Widget get _subTitle {
    AppLocalizations aux = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.only(left: 25),
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
        margin: EdgeInsets.only(top: 5),
        width: context.widthPx,
        height: 2,
        color: Theme.of(context).primaryColor,
      );
}
