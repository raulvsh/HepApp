import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';

class InteractiveDetailPage extends StatefulWidget {
  final String img1;
  final String img2;
  final String txt1;
  final String txt2;

  final title;
  final bottomSheet;

  const InteractiveDetailPage(
      {Key key,
      this.title,
      this.img1,
      this.bottomSheet,
      this.img2,
      this.txt1,
      this.txt2})
      : super(key: key);

  @override
  _InteractiveDetailPageState createState() => _InteractiveDetailPageState();
}

class _InteractiveDetailPageState extends State<InteractiveDetailPage> {
  var opacityValue = 0.0; //Valor incial de la opacidad

  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);

    return Scaffold(
      appBar: CustomAppBar(context, widget.title),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                width: 300,
                height: 300,

                child: Image.asset(
                  'assets/images/${widget.img1}',
                ),

                //child: Image.asset('assets/images/interactive/M1C1S2a.png'),
              ),
              Container(
                width: 300,
                height: 300,
                margin: EdgeInsets.all(10),
                child: Opacity(
                  opacity: opacityValue,
                  child: Image.asset('assets/images/${widget.img2}'),
                ),
              ),
            ],
          ),
          Container(
            //margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Text(aux.tr(widget.txt1)),
                Expanded(
                  //Slider indicador del valor de la opacidad
                  child: Slider(
                    value: opacityValue,
                    activeColor: Colors.orange,
                    inactiveColor: Colors.lightBlue[0],
                    min: 0.0,
                    max: 1.0,
                    divisions: 100,
                    label: "${opacityValue.abs()}",
                    onChanged: (double value) {
                      setState(() {
                        opacityValue = value;
                      });
                    },
                  ),
                ),
                Text(aux.tr(widget.txt2)),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: widget.bottomSheet,
    );
  }
}
