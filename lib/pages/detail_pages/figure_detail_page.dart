import 'package:flutter/material.dart';
import 'package:hepapp/pages/widgets_navigation/bottom_navigation_sheet.dart';
import 'package:hepapp/pages/widgets_navigation/custom_appbar.dart';
import 'package:hepapp/pages/widgets_navigation/drawer_menu.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sized_context/sized_context.dart';

class FigureDetailPage extends StatefulWidget {
  final String url;
  final title;
  final BottomNavigationSheet bottomSheet;

  const FigureDetailPage({Key key, this.title, this.url, this.bottomSheet})
      : super(key: key);

  @override
  _FigureDetailPageState createState() => _FigureDetailPageState();
}

class _FigureDetailPageState extends State<FigureDetailPage> {
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
                height: isLandscape ? context.heightPx * 0.77 : null,
                width: !isLandscape ? context.widthPx : null,
                child: Card(
                  margin: EdgeInsets.all(15),
                  elevation: 5,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: context.widthPct(0.65),
                    ),
                    margin: EdgeInsets.all(10),
                    child: Hero(
                      tag: widget.url,
                      child: Image.asset(
                        'assets/images/${widget.url}',
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
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
}
