import 'package:flutter/material.dart';
import 'package:hepapp/lang/app_localizations.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/WebViewButton.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class ResourcesPage extends StatefulWidget {
  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  //final peliculasProvider = PeliculasProvider();
  final numResources = 7;

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

  var resourcesTitles = [''];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //peliculasProvider.getPopulares();
    var aux = AppLocalizations.of(context);
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
              ? EdgeInsets.symmetric(vertical: 20 * padding)
              : EdgeInsets.symmetric(vertical: 4 * padding),
          primary: false,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          children: _buildChaptersGridView(),
        ),
      ),
    );
  }

  _buildChaptersGridView() {
    List<WebViewButton> widgets = [];
    for (int i = 0; i < numResources; i++) {
      widgets.add(WebViewButton(
        context,
        resourcesTypes[resourcesTypesNames[i]],
      ));
    }
    return widgets;
  }
/*_buildResourcesbody() {
    return Container(
      //color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context),
          ],
        ));
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return Container(
            //color: Colors.black,
            //height: 300,
            child: Column(
              children: <Widget>[
                Container(
                  //color: Colors.yellowAccent,
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Películas en Cartelera',
                    style: Theme
                        .of(context)
                        .textTheme
                        .title,
                  ),
                ),
                CardSwiper(
                  peliculas: snapshot.data,
                ),
              ],
            ),
          );
        } else {
          return Container(
            //height: 300,
            //color: Colors.red,
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  _footer(BuildContext context) {
    return Container(
      //color: Colors.pink,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            //color: Colors.yellowAccent,
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Películas Populares',
              style: Theme
                  .of(context)
                  .textTheme
                  .title,
            ),
          ),
          SizedBox(height: 5.0),
          StreamBuilder(
              stream: peliculasProvider.popularesStream,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return MovieHorizontal(
                    peliculas: snapshot.data,
                    siguientePagina: peliculasProvider.getPopulares,
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
                //snapshot.data?.forEach((p) => print(p.title));
                //print(snapshot.data);
                //return Container();
              }),
        ],
      ),
    );
  }*/
}
