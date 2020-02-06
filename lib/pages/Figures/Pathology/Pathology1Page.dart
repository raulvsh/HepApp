import 'package:flutter/material.dart';
import 'package:hepapp/widgets/BottomNavigationSheet.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/FigureButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

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

  var numPathology1 = pathology1.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuWidget(),
        appBar: CustomAppBar(context, 'pathology_section_1'),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return _buildLayout(orientation);
          },
        ),
        bottomSheet:
            BottomNavigationSheet(0, '/PathologyPV', numPathologyPages));
  }

  _buildLayout(orientation) {
    final width = MediaQuery.of(context).size.width;
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
              ? EdgeInsets.symmetric(vertical: 2 * padding)
              : EdgeInsets.symmetric(vertical: 2 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildPathologyGridView(),
        ),
      ),
    );
  }

  _buildPathologyGridView() {
    List<Widget> widgets = [];
    for (int i = 0; i < numPathology1; i++) {
      widgets
          .add(FigureButton(context, pathology1[i], i)); //, MapsPageView(i)));
    }
    return widgets;
  }
}
