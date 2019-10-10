import 'package:flutter/material.dart';
import 'package:hepapp/vista/CustomWidgets.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {

  //Variables de clase, las que se usarán para pasar el estado

  var _formKey = GlobalKey<FormState>();

  String nameCity = "",
      name2;
  TextEditingController cPrincipal = TextEditingController();
  TextEditingController cSecundario = TextEditingController();

  double prueba = 0.0,
      resultado = 0.0;
  String mostrarResultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //No haría falta al no escribirse nunca

      appBar: CustomAppBar(context, "Cards", true),
      //u.showAppBar(context, "Cards"),
      body: _createCardsBody(),
    );
  }

  _createCardsBody() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              controller: cPrincipal,
              decoration: InputDecoration(
                labelText: "Introduce el primer número",
                hintText: "Primer número",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return "Por favor introduce número";
                }
              },
              /*onChanged: (String userInput) {
                setState(() {
                  this.mostrarResultado = _funcionExterna();
                });
              },*/
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: cSecundario,
                decoration: InputDecoration(
                  labelText: "Introduce el segundo número",
                  hintText: "Segundo número",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Por favor introduce número";
                  }
                },
                //con solo escribir, muestra lso resultados
                /*onChanged: (String userInput) {
                  setState(() {
                    this.mostrarResultado = _funcionExterna();
                  });
                },*/
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Center(
                child: Text(
                  this.mostrarResultado,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            RaisedButton(
              color: Theme
                  .of(context)
                  .primaryColorLight,
              textColor: Theme
                  .of(context)
                  .primaryColorDark,
              child: Text(
                'Calculate',
                textScaleFactor: 1.5,
              ),
              onPressed: () {
                setState(() {
                  if (_formKey.currentState.validate()) {
                    this.mostrarResultado = _funcionExterna();
                  }
                });
              },
            ),
            RaisedButton(
              color: Theme
                  .of(context)
                  .primaryColorDark,
              textColor: Theme
                  .of(context)
                  .primaryColorLight,
              child: Text(
                'Reset',
                textScaleFactor: 1.5,
              ),
              onPressed: () {
                setState(() {
                  _reset();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  String _funcionExterna() {
    debugPrint(
        "set State is called, this tells framwork to redraw the FavCity widget");
    nameCity = cPrincipal.text;
    name2 = cSecundario.text;

    double principal = double.parse(nameCity);
    double secundario = double.parse(name2);

    resultado = principal * secundario;
    //Cada vez que se actualiza el estado, se suman 2
    prueba += 2;

    String res =
        "$nameCity x $name2 = $resultado. \n Número de prueba: $prueba";
    return res;
  }

  void _reset() {
    cPrincipal.text = "";
    cSecundario.text = "";
    mostrarResultado = "";
  }
}
