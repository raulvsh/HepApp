import 'package:flutter/material.dart';
import 'package:hepapp/pages/CommonGridPage.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class CommonPageWithBottomNav extends StatefulWidget {
  final title;
  final data;
  final type;
  final route;
  final initialPage;

  CommonPageWithBottomNav({
    this.title,
    this.data,
    this.type,
    this.route, this.initialPage,
  });

  @override
  _CommonPageWithBottomNavState createState() =>
      _CommonPageWithBottomNavState();
}

class _CommonPageWithBottomNavState extends State<CommonPageWithBottomNav> {
  var numPages = data.length;

  @override
  void initState() {
    super.initState();

    //_currentItemSelected = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    print("numpages commonpage with bottom nav $numPages");

    return Scaffold(
      drawer: MenuWidget(),
      appBar: CustomAppBar(context, widget.title),
      body: CommonGridPage(
        data: widget.data,
        type: widget.type,
      ),
      bottomSheet: BottomNavigationSheet(
          widget.initialPage, widget.route, numPages),
    );
  }
}
