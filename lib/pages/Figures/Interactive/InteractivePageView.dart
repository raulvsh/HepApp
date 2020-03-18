import 'package:flutter/material.dart';
import 'package:hepapp/pages/Figures/Interactive/InteractiveDetailPage.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';

class InteractivePageView extends StatefulWidget {
  final initialPage;

  InteractivePageView(this.initialPage);

  @override
  _InteractivePageViewState createState() => _InteractivePageViewState();
}

class _InteractivePageViewState extends State<InteractivePageView> {
  PageController controller;

  //título, imagen 1, imagen 2, texto 1, texto 2, ruta
  static var interactive = [
    [
      'interactive_1',
      'interactive/M1C1S2a.png',
      'interactive/M1C1S2b.png',
      'anatomy',
      'surface_anatomy'
    ], //'/InteractivePV'],
    [
      'interactive_2',
      'interactive/M1C1S2f.png',
      'interactive/M1C1S2g.png',
      'portal_circulation',
      'portal_hypertension'
    ], //'/InteractivePV'],
    [
      'interactive_3',
      'interactive/M1C1S3a.png',
      'interactive/M1C1S3b.png',
      'liver_histology',
      'acinus_lobule'
    ], //'/InteractivePV'],
    [
      'interactive_4',
      'interactive/M1C1S5a.png',
      'interactive/M1C1S5b.png',
      'bilirubin_metabolysm',
      'obstruction_jaundice'
    ], //'/InteractivePV'],
    [
      'interactive_5',
      'interactive/M2C8S2a.png',
      'interactive/M2C8S2b.png',
      'normal_copper_excretion',
      'wildon_disease'
    ], //'/InteractivePV'],
    [
      'interactive_6',
      'interactive/M2C9S2a.png',
      'interactive/M2C9S2b.png',
      'normal',
      'chronic_alcohol'
    ], //'/InteractivePV'],
    [
      'interactive_7',
      'interactive/M3C14S2b.png',
      'interactive/M3C14S2c.png',
      'ascites_pathogenesis',
      'treatment'
    ], // '/InteractivePV'],
    [
      'interactive_8',
      'interactive/M3C15S1a.png',
      'interactive/M3C15S1b.png',
      'explant',
      'transplant'
    ], // '/InteractivePV'],
  ];

  var numInteractive = interactive.length;

  @override
  void initState() {
    super.initState();

    controller = PageController(
      initialPage: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: controller,
          children: _buildChildren(),
        ));
  }

  List<Widget> _buildChildren() {
    List<Widget> widgets = [];
    for (int i = 0; i < numInteractive; i++) {
      widgets.add(InteractiveDetailPage(
          title: interactive[i][0],
          img1: interactive[i][1],
          img2: interactive[i][2],
          txt1: interactive[i][3],
          txt2: interactive[i][4],
          bottomSheet:
              BottomNavigationSheet(i, '/InteractivePV', numInteractive)));
    }

    return widgets;
  }
}
