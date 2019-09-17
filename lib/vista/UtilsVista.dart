import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils extends StatelessWidget {
  final sectionTypes = {
    "Chapters": ['Chapters', 'chapters.png', '/Chapters'],
    "Podcasts": ['Podcasts', 'podcasts.png', '/Podcasts'],
    "Cards": ['Cards', 'cards.png', '/Cards'],
    "Figures": ['Figures', 'figures.png', '/Figures'],
    "Calculators": ['Calculators', 'calculators.png', '/Calculators'],
    "Resources": ['Resources', 'resources.png', '/Resources'],
    "PubMed": ['PubMed', 'pubmed.png', '/PubMed'],
    "Information": ['Information', 'information.png', '/Information'],
  };

  final calculatorTypes = {
    "All": ['All Algorithms', 'calculators.png', '/AllCalc'],
    "Child": ['Child Pugh Score', 'calculators.png', '/ChildCalc'],
    "MELD": ['MELD', 'calculators.png', '/MELDCalc'],
    "Okuda": ['Okuda Staging System', 'calculators.png', '/OkudaCalc'],
    "CLIP": ['CLIP Staging System', 'calculators.png', '/CLIPCalc'],
  };

  final figureTypes = {
    "TableOfContents": ['Table of Contents', 'figures.png', '/TableFig'],
    "Schemes": ['Schemes', 'figures.png', '/SchemesFig'],
    "Interactive": ['Interactive Figures', 'figures.png', '/InteractiveFig'],
    "Chapter": ['Chapter Figures', 'figures.png', '/ChapterFig'],
    "Drawing": ['Drawing', 'figures.png', '/DrawingFig'],
  };

  @override
  Widget build(BuildContext context) {
    return null;
  }

  Widget showAppBar(
    BuildContext context,
    String title,
  ) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      //centerTitle: false,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
      title: Container(
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        padding: EdgeInsets.all(0),
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'images/arrowthickleft.png',
                      width: 22,
                      height: 22,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
            IconButton(
              icon: Image.asset(
                'images/homeicon.png',
                width: 22,
                height: 22,
              ),
              onPressed: () => Navigator.pushNamed(context, '/'),
            ),
            Text(
              title,
              style: TextStyle(
                //color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showHomeButton(context, sectionType, orientation) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: orientation == Orientation.portrait ? 120 : 120,
        height: orientation == Orientation.portrait ? 120 : 120,
        child: FlatButton(
          padding: EdgeInsets.all(2),
          child: Stack(
            children: <Widget>[
              Image.asset(
                'images/${sectionTypes[sectionType][1]}',
              ),
              Center(
                child: Align(
                  alignment: Alignment(0, 0.7),
                  child: Text(
                    sectionTypes[sectionType][0],
                    style: TextStyle(
                      color: Color.fromARGB(255, 93, 188, 210),
                      fontSize: orientation == Orientation.portrait ? 16 : 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          onPressed: () =>
              Navigator.pushNamed(context, sectionTypes[sectionType][2]),
        ),
      ),
    );
  }

//Se pasa la orientación por si se necesita posteriormente
  Widget showCalcButton(context, calculatorType, orientation) {
    return
      FittedBox(
        fit: BoxFit.fill,
        child: Container(
          padding: EdgeInsets.all(1.5),
          width: 120,
          height: 120,
          child: GestureDetector(

            //padding: EdgeInsets.all(5),
            child: Stack(
              //alignment: Alignment.bottomLeft,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    //Podría ser fija al ser común, pero se deja por si se quiere poner un icono distinto a cada algoritmo
                    'images/${calculatorTypes[calculatorType][1]}',
                  ),
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0, 0.7),
                    child: Text(
                      calculatorTypes[calculatorType][0],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 93, 188, 210),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () =>
                Navigator.pushNamed(
                    context, calculatorTypes[calculatorType][2]),
          ),
        ),
      );
  }

/*Se pasa la orientación por si se necesita posteriormente
* Se hacen distintos métodos por si queremos cambiar la disposición o el tamaño de los iconos de Home, Calculators o Figures por separado
*/
  Widget showFigureButton(context, figureType, orientation) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Container(
        padding: EdgeInsets.all(1.5),

        width: 120,
        height: 120,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Image.asset(
                //Podría ser fija al ser común, pero se deja por si se quiere poner un icono distinto a cada elemento
                'images/${figureTypes[figureType][1]}',
              ),
              Align(
                  alignment: Alignment(0, 0.7),
                  child: Text(
                    figureTypes[figureType][0],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 93, 188, 210),
                      fontSize: 16,
                    ),

                ),
              ),
            ],
          ),
          onTap: () =>
              Navigator.pushNamed(context, figureTypes[figureType][2]),
        ),
      ),
    );
  }
}
