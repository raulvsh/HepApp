/*
import 'package:flutter/material.dart';
import 'package:hepapp/pages/InformationPage.dart';
import 'package:hepapp/providers/menu_provider.dart';
import 'package:hepapp/utils/icono_string_util.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';
import 'package:custom_radio/custom_radio.dart';

class CustomRadioButtonUtils extends StatefulWidget{
  @override
  _CustomRadioButtonUtilsState createState() => _CustomRadioButtonUtilsState();
  String radioValue = 'First';
  final String title = '';


}


class _CustomRadioButtonUtilsState extends State<CustomRadioButtonUtils> with SingleTickerProviderStateMixin {

  _CustomRadioButtonUtilsState() {
    customBuilder = (BuildContext context, List<dynamic> animValues, Function updateState, String value) {
      return GestureDetector(
        onTap: () {
          setState(() {
            widget.radioValue = value;
          });
        },
        child: Container(
          width: double.infinity,
          height: animValues[0] * 40 + 60,
          color: animValues[1],
          child: Center(
              child: Text(
                  value
              )
          ),
        ),
      );
    };
    simpleBuilder = (BuildContext context, List<double> animValues, Function updateState, String value) {
      final alpha = (animValues[0] * 255).toInt();
      return GestureDetector(
          onTap:  () {
            setState(() {
              widget.radioValue = value;
            });
          },
          child: Container(
              padding: EdgeInsets.all(32.0),
              margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 12.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor.withAlpha(alpha),
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withAlpha(255 - alpha),
                    width: 4.0,
                  )
              ),
              child: Text(
                value,
                style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20.0),
              )
          )
      );
    };
    dynamicBuilder = (BuildContext context, List<dynamic> animValues, Function updateState, String value) {
      return GestureDetector(
          onTap: () {
            setState(() {
              widget.radioValue = value;
            });
          },
          child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
              padding: EdgeInsets.all(32.0 + animValues[0] * 12.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: animValues[1],
                  border: Border.all(
                      color: animValues[2],
                      width: 2.0
                  )
              ),
              child: Text(
                value,
                style: Theme.of(context).textTheme.body1.copyWith(
                    fontSize: 20.0,
                    color: animValues[2]
                ),
              )
          )
      );
    };
  }

  RadioBuilder<String, dynamic> customBuilder;
  RadioBuilder<String, double> simpleBuilder;
  RadioBuilder<String, dynamic> dynamicBuilder;

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 100),
        vsync: this
    );
    _animation = CurvedAnimation(
        parent: _controller,
        curve: Curves.ease
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }



}

*/
/*

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

      appBar: CustomAppBar(context, 'podcasts'),
      drawer: MenuWidget(),

      body: //_lista(),

       _buildPodcastsBody(),
    );
  }

  _buildPodcastsBody() {
    return Center(
      child: new Text("El contenido es as "),
    );
  }

  Widget _lista() {
    */ /*
*/
/*

*/ /*

*/
/*menuProvider.cargarData().then((opciones){
      print('_lista');
      print(opciones);
    });*/ /*
*/
/*
*/ /*

*/
/*

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

    */ /*
*/
/*

*/ /*

*/
/*return ListView(
      children: _listaItems(),
    );*/ /*
*/
/*
*/ /*

*/
/*

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
*/ /*
*/
/*

*/
