import 'package:flutter/material.dart';
import 'package:hepapp/pages/CommonGridPage.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class ResourcesPage extends StatefulWidget {
  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  static var resources = [
    [
      'casl',
      'resources/casl.png',
      'https://www.hepatology.ca/?page_id=941',
      'Web',
    ],
    [
      'aasld',
      'resources/aasld.png',
      'https://www.aasld.org/publications/practice-guidelines-0',
      'Web',
    ],
    [
      'easl',
      'resources/easl.png',
      'https://www.easl.eu/research/our-contributions/clinical-practice-guidelines',
      'Web',
    ],
    [
      'acg',
      'resources/acg.png',
      'https://gi.org/clinical-guidelines/clinical-guidelines-sortable-list/ ',
      'Web',
    ],
    [
      'aga',
      'resources/aga.png',
      'https://www.gastro.org/guidelines ',
      'Web',
    ],
    [
      'ilca',
      'resources/ilca.png',
      'https://ilca-online.org/guidelines-for-the-diagnosis-and-management-of-intrahepatic-cholangiocarcinoma/',
      'Web',
    ],
    [
      'lindsay',
      'resources/lindsay_atlas.png',
      'http://lindsay.ucalgary.ca/',
      'Web'
    ],
  ];

  //var numResources = resources.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: CustomAppBar(context, "resources"),

      drawer: MenuWidget(),

      body: CommonGridPage(data: resources),
    );
  }
}
