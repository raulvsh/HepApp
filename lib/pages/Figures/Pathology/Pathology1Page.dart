/*
import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

import '../../CommonGridPage.dart';

//const String _documentPath = 'assets/HepM1C1.pdf';

class Pathology1Page extends StatefulWidget {
  @override
  _Pathology1PageState createState() => _Pathology1PageState();
}

class _Pathology1PageState extends State<Pathology1Page> {
  final numPathologyPages = 2;

  static var pathology1 = [
    [
      'pathology_1',
      'pathology/Pathology01_Normal_Histology.png',
      '/PathologyDetail'
    ],
    ['pathology_2', 'pathology/Pathology02_Cirrhosis.png', '/PathologyDetail'],
    ['pathology_3', 'pathology/Pathology03_PBC.png', '/PathologyDetail'],
    ['pathology_4', 'pathology/Pathology04_PSC.png', '/PathologyDetail'],
    [
      'pathology_5',
      'pathology/Pathology05_Cholestasis.png',
      '/PathologyDetail'
    ],
    ['pathology_6', 'pathology/Pathology06_Granuloma.png', '/PathologyDetail'],
    [
      'pathology_7',
      'pathology/Pathology07_Hemochromatosis.png',
      '/PathologyDetail'
    ],
    ['pathology_8', 'pathology/Pathology08_A1AT_def.png', '/PathologyDetail'],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(context, 'pathology_section_1'),
        drawer: MenuWidget(),

        body: CommonGridPage(data: pathology1, type: 'figure'),
        bottomSheet:
            BottomNavigationSheet(0, '/PathologyPV', numPathologyPages));
  }
}
*/
