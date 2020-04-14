/*
import 'package:flutter/material.dart';
import 'package:hepapp/pages/CommonGridPage.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class ChaptersPage extends StatefulWidget {
  @override
  _ChaptersPageState createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  static var modules = [
    ['module_1', 'items/9_modules.png', '/ModulePV', 'Nav'],
    ['module_2', 'items/9_modules.png', '/ModulePV', 'Nav'],
    ['module_3', 'items/9_modules.png', '/ModulePV', 'Nav'],
    ['references', 'items/9_modules.png', 'HepAPP_References.pdf', 'PDF'],
  ];

  var numModules = modules.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      drawer: MenuWidget(),
      appBar: CustomAppBar(context, 'chapters'),
      body: CommonGridPage(data: modules),
    );
  }
}
*/
