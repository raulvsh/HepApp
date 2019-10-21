import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hepapp/widgets/CalcBottomBar.dart';
import 'package:hepapp/widgets/CustomAppBar.dart';
import 'package:hepapp/widgets/menu_widget.dart';

class OkudaCalcPage extends StatefulWidget {
  @override
  _OkudaCalcPageState createState() => _OkudaCalcPageState();
}

class _OkudaCalcPageState extends State<OkudaCalcPage> {

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
      appBar: CustomAppBar(
        context,
        "Calculators - Okuda",
        selScreenshot: true,
        selPartialSettings: true,
      ),
      drawer: MenuWidget(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.blue,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
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
      bottomSheet: CalcBottomBar("reseteo2"),
    );
  }

  Column buildLeftColumn() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        _buildFilaBilirrubina(),
        SizedBox(
          height: 10.0,
        ),
        _buildFilaAlbumina(),
        SizedBox(
          height: 10.0,
        ),
        _buildFilaAscitis(),
        SizedBox(
          height: 10.0,
        ),
        _buildFilaTumour(),
        SizedBox(
          height: 50.0,
        ),
        _buildOkudaButton(),
      ],
    );
  }

  Column buildRightColumn() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(70, 50, 70, 0),
          child: Placeholder(
            strokeWidth: 1.0,
            fallbackHeight: 150,
            fallbackWidth: 100,
          ),
        ),
        Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Okuda",
                style: TextStyle(
                  color: Colors.blueAccent[100],
                ),
              ),
            )),
      ],
    );
  }

  Container _buildOkudaButton() {
    return Container(
      width: 250,
      child: MaterialButton(
        //shape: CircularNotchedRectangle(),
        shape: OutlineInputBorder(),

        highlightElevation: 2,

        color: Color.fromARGB(255, 93, 188, 210),
        splashColor: Colors.redAccent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  AlertDialog(
                    content: Text("Cálculo de Okuda realizado"),
                  ));
        },
        height: 40,
        minWidth: 200,
        child: Center(
          child: Text("Calculate Okuda"),
        ),
      ),
    );
  }

  Row _buildFilaBilirrubina() {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.lightBlueAccent[100],
          width: 10.0,
          height: 20.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text("Bilirrubin"),
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
        Text("umoL/L"),
      ],
    );
  }

  Row _buildFilaAlbumina() {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.lightBlueAccent[100],
          width: 10.0,
          height: 20.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text("Albumin"),
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
        Text("g/L"),
      ],
    );
  }

  Row _buildFilaAscitis() {
    return Row(
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
          "Ascites",
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
      ],
    );
  }

  Row _buildFilaTumour() {
    return Row(
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
  }
}
