import 'package:flutter/material.dart';
import 'package:hepapp/pages/CommonPages/common_grid_page.dart';
import 'package:hepapp/widgets/bottom_navigation_sheet.dart';
import 'package:hepapp/widgets/custom_appbar.dart';
import 'package:hepapp/widgets/drawer_menu.dart';

class CommonPageWithBottomNav extends StatefulWidget {
  final title;
  final data;
  final type;
  final route;
  final initialPage;
  final numPages;

  CommonPageWithBottomNav({
    this.title,
    this.data,
    this.type,
    this.route,
    this.initialPage,
    this.numPages,
  });

  @override
  _CommonPageWithBottomNavState createState() =>
      _CommonPageWithBottomNavState();
}

class _CommonPageWithBottomNavState extends State<CommonPageWithBottomNav> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(),
      appBar: CustomAppBar(context, widget.title),
      body: CommonGridPage(
        data: widget.data,
        type: widget.type,
      ),
      bottomSheet: BottomNavigationSheet(
          widget.initialPage, widget.route, widget.numPages),
    );
  }
}
