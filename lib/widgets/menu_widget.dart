import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';

/*

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var aux = AppLocalizations.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          */
/*

          ListTile(
            title: Container(
              padding: EdgeInsets.only(top: 25),
              child: Image.asset(
                'assets/images/hepapplogo.png',
                width: 100,
                height: 100,
              ),
            ),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home, color: Theme.of(context).primaryColor),
            title: Text(
              aux.tr('home'),
            ),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          ExpansionTile(
            title: ListTile(
              leading: Image.asset(
                'assets/images/menu/1_chapters.png',
                height: 25,
                width: 25,
                fit: BoxFit.scaleDown,
              ),
              title: Text(
                aux.tr('chapters'),
              ),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, '/Chapters'),
            ),
            children: <Widget>[
              ListTile(
                leading: Image.asset(
                  'assets/images/menu/1_chapters.png',
                  height: 25,
                  width: 25,
                  fit: BoxFit.scaleDown,
                ),
                title: Text(
                  aux.tr('module_1'),
                ),
                onTap: () =>
                    Navigator.pushReplacementNamed(context, '/Chapters'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          ListTile(
            title: Container(
              padding: EdgeInsets.only(top: 25),
              child: Image.asset(
                'assets/images/hepapplogo.png',
                width: 75,
                height: 75,
              ),
            ),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 110),
            child: Divider(thickness: 0.75,),
          ),
          Padding(
            padding: EdgeInsets.only(top: 119),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  MenuItem(data[index], context),

              itemCount: data.length,
            ),
          ),
        ],
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Item {
  const Item(this.image, this.title, this.route,
      [this.children = const <Item>[]]);

  final String image;
  final String title;
  final List route;

  final List<Item> children;
}

// Data to display.
const List<Item> data = <Item>[
  /*Item(
    'assets/images/hepapplogo.png',
    'app_title',
    ['/', 0],
  ),*/
  Item(
    'assets/images/menu/0_home.png',
    'home',
    ['/', 0],
  ),
  Item(
    'assets/images/menu/1_chapters.png',
    'chapters',
    ['/Chapters'],
    <Item>[
      Item(
        'assets/images/menu/9_modules.png',
        'module_1',
        ['/ModulePV', 0],
      ),
      Item(
        'assets/images/menu/9_modules.png',
        'module_2',
        ['/ModulePV', 1],
      ),
      Item(
        'assets/images/menu/9_modules.png',
        'module_3',
        ['/ModulePV', 2],
      ),
      //TODO hacer lo mismo que web para pdf

      Item(
        'assets/images/menu/9_modules.png',
        'references',
        ['/References', 0],
      ),
    ],
  ),
  Item(
    'assets/images/menu/2_podcasts.png',
    'podcasts',
    ['/PodcastsPV', 0],
  ),
  Item(
    'assets/images/menu/3_cards.png',
    'cards',
    [
      '/Web',
      ['https://cards.ucalgary.ca', 'cards']
    ],
  ),
  Item(
    'assets/images/menu/4_figures.png',
    'figures',
    ['/Figures'],
    <Item>[
      Item(
        'assets/images/menu/4_figures.png',
        'table_contents',
        ['/TableFig', 0],
      ),
      Item(
        'assets/images/menu/4_figures.png',
        'schemes',
        ['/SchemesFig', 0],
      ),
      Item(
        'assets/images/menu/4_figures.png',
        'maps',
        ['/MapsFig', 0],
      ),
      Item(
        'assets/images/menu/4_figures.png',
        'pathology',
        ['/PathologyFig', 0],
      ),
      Item(
        'assets/images/menu/4_figures.png',
        'interactive_figures',
        ['/InteractiveFig', 0],
      ),
      Item(
        'assets/images/menu/4_figures.png',
        'drawing',
        ['/DrawingFig', 0],
      ),
    ],
  ),
  Item(
    'assets/images/menu/5_calculators.png',
    'calculators',
    ['/Calculators'],
    <Item>[
      Item(
        'assets/images/menu/5_calculators.png',
        'all_algorithms',
        ['/AllCalc', 0],
      ),
      Item(
        'assets/images/menu/5_calculators.png',
        'child_pugh_score',
        ['/ChildCalc', 0],
      ),
      Item(
        'assets/images/menu/5_calculators.png',
        'meld',
        ['/MELDCalc', 0],
      ),
      Item(
        'assets/images/menu/5_calculators.png',
        'okuda_staging_system',
        ['/OkudaCalc', 0],
      ),
      Item(
        'assets/images/menu/5_calculators.png',
        'clip_staging_system',
        ['/CLIPCalc', 0],
      ),
    ],
  ),
  Item(
    'assets/images/menu/6_resources.png',
    'resources',
    ['/Resources'],
    <Item>[
      Item(
        'assets/images/menu/6_resources.png',
        'casl',
        [
          '/Web',
          ['https://www.hepatology.ca/?page_id=941', 'casl']
        ],
      ),
      Item(
        'assets/images/menu/6_resources.png',
        'aasld',
        [
          '/Web',
          ['https://www.aasld.org/publications/practice-guidelines-0', 'aasld']
        ],
      ),
      Item(
        'assets/images/menu/6_resources.png',
        'easl',
        [
          '/Web',
          [
            'https://www.easl.eu/research/our-contributions/clinical-practice-guidelines ',
            'easl'
          ]
        ],
      ),
      Item(
        'assets/images/menu/6_resources.png',
        'acg',
        [
          '/Web',
          [
            'https://gi.org/clinical-guidelines/clinical-guidelines-sortable-list/ ',
            'acg'
          ]
        ],
      ),
      Item(
        'assets/images/menu/6_resources.png',
        'aga',
        [
          '/Web',
          ['https://www.gastro.org/guidelines ', 'aga']
        ],
      ),
      Item(
        'assets/images/menu/6_resources.png',
        'ilca',
        [
          '/Web',
          [
            'https://ilca-online.org/guidelines-for-the-diagnosis-and-management-of-intrahepatic-cholangiocarcinoma/',
            'ilca'
          ]
        ],
      ),
      Item(
        'assets/images/menu/5_calculators.png',
        'lindsay',
        [
          '/Web',
          ['http://lindsay.ucalgary.ca/', 'lindsay']
        ],
      ),
    ],
  ),
  Item(
    'assets/images/menu/7_pubmed.png',
    'pub_med',
    [
      '/Web',
      ['https://www.ncbi.nlm.nih.gov/pubmed/', 'pub_med']
    ],
  ),
  //TODO hacer lo mismo que web para pdf
  Item(
    'assets/images/menu/8_information.png',
    'information',
    ['/References', 0],
  ),
];

// Muestra un item. Si tiene hijos, se muestra un ExpansionTile
class MenuItem extends StatelessWidget {
  const MenuItem(this.entry, this.context);

  final BuildContext context;
  final Item entry;

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }

  Widget _buildTiles(Item root) {
    var aux = AppLocalizations.of(context);

    if (root.children.isEmpty)
      return ListTile(
          contentPadding: EdgeInsets.only(left: 32),
          leading: Image.asset(
            root.image,
            height: 25,
            width: 25,
            fit: BoxFit.scaleDown,
          ),
          title: Text(
            aux.tr(root.title),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              root.route[0],
              arguments: root.route[1],
            );
          }

      );
    return ExpansionTile(

      title: _buildIndividualTile(root),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  Widget _buildIndividualTile(Item root) {
    var aux = AppLocalizations.of(context);

    return ListTile(
      //contentPadding: EdgeInsets.all(0),
      leading: Image.asset(
        root.image,
        height: 25,
        width: 25,
        fit: BoxFit.scaleDown,
      ),
      title: Text(
        aux.tr(root.title),
      ),
      onTap: () =>
          Navigator.pushReplacementNamed(
            context,
            root.route[0],
            //arguments: root.route[1] != null ? root.route[1] : 0,
      ),
    );
  }
}
