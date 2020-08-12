import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sized_context/sized_context.dart';

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
  ScreenshotController screenShotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    bool isLandscape = context.isLandscape;
    return Screenshot(
      controller: screenShotController,
      child: Scaffold(
        appBar: CustomAppBar(
          widget.title,
          screenshotController: screenShotController,
        ),
        drawer: MenuWidget(),
        body: Stack(
          children: <Widget>[
            widget.bottomSheet,
            Center(
              heightFactor: 1,
              child: Container(
                height: isLandscape
                    ? context.heightPx * 0.75
                    : context.heightPx * 0.55,
                width: !isLandscape ? context.widthPx : null,
                child: InteractiveViewer(
                  child: Card(
                    margin: isLandscape
                        ? EdgeInsets.only(top: 10)
                        : EdgeInsets.all(15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(color: Colors.white, child: _buildImgStack()),
                        Container(
                            color: Colors.white, child: _buildTxtRow(context)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // bottomSheet: widget.bottomSheet,
      ),
    );
  }

  Stack _buildImgStack() {
    bool isLandscape = context.isLandscape;

    return Stack(
      children: <Widget>[
        Container(
          height: isLandscape ? context.heightPct(0.5) : null,
          margin: EdgeInsets.all(10),
          child: Hero(
            tag: widget.img1,
            child: Image.asset(
              'assets/images/${widget.img1}',
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          height: isLandscape ? context.heightPct(0.5) : null,
          margin: EdgeInsets.all(10),
          child: Opacity(
            opacity: opacityValue,
            child: Image.asset(
              'assets/images/${widget.img2}',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  Container _buildTxtRow(BuildContext context) {
    var aux = AppLocalizations.of(context);
    bool isLandscape = context.isLandscape;

    return Container(
      width: isLandscape ? context.widthPct(0.6) : context.widthPx,
      height: isLandscape ? context.heightPct(0.15) : null,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              aux.tr(widget.txt1),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: isLandscape
                    ? context.widthPct(0.015)
                    : context.heightPct(0.02),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Slider(
              value: opacityValue,
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Colors.lightBlue[0],
              min: 0.0,
              max: 1.0,
              divisions: 100,
              onChanged: (double value) {
                setState(() {
                  opacityValue = value;
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              aux.tr(widget.txt2),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: isLandscape
                    ? context.widthPct(0.015)
                    : context.heightPct(0.02),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
