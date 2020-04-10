import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class CLIPCalcPage extends StatefulWidget {
  @override
  _CLIPCalcPageState createState() => _CLIPCalcPageState();
}

class _CLIPCalcPageState extends State<CLIPCalcPage> {

  final prefs = new PreferenciasUsuario();

//TODO hacerlo por métodos _build, queda MÁS ordenado, en clase APARTE crearFilas o algo así, reutilizable
  final filaAFP = Row(
    children: <Widget>[
      Container(
        color: Colors.lightBlueAccent[100],
        width: 10.0,
        height: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Text("AFP"),
      SizedBox(
        width: 10.0,
      ),
      //Futuro TextFormField
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Text("ug/L"),
    ],
  );
  final filaChild = Row(
    children: <Widget>[
      Container(
        color: Colors.lightBlueAccent[100],
        width: 10.0,
        height: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Text("Child Pugh Score", style: TextStyle(fontSize: 12),),
      SizedBox(
        width: 10.0,
      ),
      //Futuro TextFormField
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
    ],
  );
  final filaNumber = Row(
    children: <Widget>[
      Container(
        color: Colors.lightBlueAccent[100],
        //padding: EdgeInsets.all(50.0),
        width: 10.0,
        height: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Text(
        "Number of Tumours",
      ),
      SizedBox(
        width: 10.0,
      ),
      //Futuro TextFormField
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
    ],
  );
  final filaTumour = Row(
    children: <Widget>[
      Container(
        color: Colors.lightBlueAccent[100],
        width: 10.0,
        height: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Text("Tumour Extent %"),
      SizedBox(
        width: 10.0,
      ),
      //Futuro TextFormField
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
    ],
  );
  final pvt = Row(
    children: <Widget>[
      Container(
        color: Colors.lightBlueAccent[100],
        width: 10.0,
        height: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Text("PVT (Main Portal Vein Thrombosis)"),
      SizedBox(
        width: 10.0,
      ),
      //Futuro TextFormField
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Placeholder(
        fallbackWidth: 50.0,
        fallbackHeight: 20.0,
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(context, 'clip_staging_system', selScreenshot: true,
      ),
      drawer: MenuWidget(),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.blue,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: buildLeftColumn(),
            ),
            Expanded(
              flex: 1,
              child: buildRightColumn(),

              //buildRightColumn(),
            ),
          ],
        ),
      ),
      //bottomSheet: CalcBottomBar("reseteo"),

    )
    ;
  }

  Column buildLeftColumn() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        filaAFP,
        SizedBox(
          height: 10.0,
        ),
        filaChild,
        SizedBox(
          height: 10.0,
        ),
        filaNumber,
        SizedBox(
          height: 10.0,
        ),
        filaTumour,
        SizedBox(
          height: 10.0,
        ),
        pvt,
        SizedBox(
          height: 100.0,
        ),
        GestureDetector(
          child: Container(
            color: Colors.blue,
            height: 40.0,
            width: 200.0,
            child: Center(
              child: Text("Calculate CLIP"),
            ),
          ),
        )
      ],
    );
  }

  Column buildRightColumn() {
    return Column(
      children: <Widget>[
        // Expanded(
        //child:
        Container(
          padding: EdgeInsets.fromLTRB(25, 25, 25, 100),
          child: Placeholder(
            strokeWidth: 1.0,
            fallbackHeight: 100,
            fallbackWidth: 100,
          ),
          //),
        ),

        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text("CLIP",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.blueAccent[100],
                )),
          ),
        ),
      ],
    );
  }
}
