import 'package:flutter/material.dart';
import 'package:hepapp/pages/InformationPage.dart';
import 'package:hepapp/providers/menu_provider.dart';
import 'package:hepapp/utils/icono_string_util.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class PodcastsPage extends StatefulWidget {
  @override
  _PodcastsPageState createState() => _PodcastsPageState();
}

class _PodcastsPageState extends State<PodcastsPage> {
  String textoFuturo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: CustomAppBar(context, "Podcasts"),
      drawer: MenuWidget(),

      body: _lista(),

      // _buildPodcastsBody(),
    );
  }

  _buildPodcastsBody() {
    return Center(
      child: new Text("El contenido es as "),
    );
  }

  Widget _lista() {
    /*menuProvider.cargarData().then((opciones){
      print('_lista');
      print(opciones);
    });*/
    //print(menuProvider.opciones);
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [], //Lista vacía
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        print(snapshot.data);
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );

    /*return ListView(
      children: _listaItems(),
    );*/
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];


    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          final route =
          MaterialPageRoute(builder: (context) => InformationPage());
          Navigator.push(context, route);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
