import 'package:flutter/material.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/WebButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class ResourcesPage extends StatefulWidget {
  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  static var resources = [
    ['casl', '6_resources.png', 'https://www.hepatology.ca/?page_id=941'],
    [
      'aasld',
      '6_resources.png',
      'https://www.aasld.org/publications/practice-guidelines-0'
    ],
    [
      'easl',
      '6_resources.png',
      'https://www.easl.eu/research/our-contributions/clinical-practice-guidelines '
    ],
    [
      'acg',
      '6_resources.png',
      'https://gi.org/clinical-guidelines/clinical-guidelines-sortable-list/ '
    ],
    ['aga', '6_resources.png', 'https://www.gastro.org/guidelines '],
    [
      'ilca',
      '6_resources.png',
      'https://ilca-online.org/guidelines-for-the-diagnosis-and-management-of-intrahepatic-cholangiocarcinoma/'
    ],
    ['lindsay', '6_resources.png', 'http://lindsay.ucalgary.ca/'],
  ];

  var numResources = resources.length;

  /*final numResources = 7;

  var resourcesTypesNames = [
    "CASL",
    "AASLD",
    "EASL",
    "ACG",
    "AGA",
    "ILCA",
    "Lindsay",
  ];

  var resourcesTypes = {
    "CASL": [
      'casl',
      '6_resources.png',
      'https://www.hepatology.ca/?page_id=941'
    ],
    "AASLD": [
      'aasld',
      '6_resources.png',
      'https://www.aasld.org/publications/practice-guidelines-0'
    ],
    "EASL": [
      'easl',
      '6_resources.png',
      'https://www.easl.eu/research/our-contributions/clinical-practice-guidelines '
    ],
    "ACG": [
      'acg',
      '6_resources.png',
      'https://gi.org/clinical-guidelines/clinical-guidelines-sortable-list/ '
    ],
    "AGA": ['aga', '6_resources.png', 'https://www.gastro.org/guidelines '],
    "ILCA": [
      'ilca',
      '6_resources.png',
      'https://ilca-online.org/guidelines-for-the-diagnosis-and-management-of-intrahepatic-cholangiocarcinoma/'
    ],
    "Lindsay": ['lindsay', '6_resources.png', 'http://lindsay.ucalgary.ca/'],
  };

  var resourcesTitles = [''];*/

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
      //TODO volver a poner appbar custom
      /*CustomAppBar(context, "Resources"),*/

      body: OrientationBuilder(
        builder: (context, orientation) {
          return _buildLayout(orientation);
        },
      ),
    );
  }

  _buildLayout(orientation) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    var padding = width / 100;

    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Colors.lightBlueAccent,
      child: FractionallySizedBox(
        widthFactor: orientation == Orientation.portrait ? 0.7 : 0.7,
        alignment: Alignment.center,
        child: GridView.count(
          padding: orientation == Orientation.portrait
              ? EdgeInsets.symmetric(vertical: 3 * padding)
              : EdgeInsets.symmetric(vertical: padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildChaptersGridView(),
        ),
      ),
    );
  }

  _buildChaptersGridView() {
    List<WebButton> widgets = [];
    for (int i = 0; i < numResources; i++) {
      widgets.add(
        WebButton(
          context,
          resources[i],
        ),
      );
    }
    return widgets;
  }
}
