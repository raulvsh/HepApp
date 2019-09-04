import 'package:flutter/material.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  //Variables de clase, las que se usarán para pasar el estado
  String nameCity = "";

  @override
  Widget build(BuildContext context) {
    String texto = "";

    return Scaffold(
      appBar: _createCardsAppBar(),
      body: _createCardsBody(),
    );
  }

  _createCardsAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
      title: Container(
        child: Row(
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(2),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'images/arrowthickleft.png',
                    width: 25,
                    height: 25,
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
              onPressed: () => Navigator.pushNamed(context, '/'),
            ),
            IconButton(
              icon: Image.asset(
                'images/homeicon.png',
                width: 25,
                height: 25,
              ),
              onPressed: () => Navigator.pushNamed(context, '/'),
            ),
            Text(
              "Cards",
            ),
          ],
        ),
      ),
    );
  }

  _createCardsBody() {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            onSubmitted: (String userInput) {
              setState(() {
                debugPrint(
                    "set State is called, this tells framwork to redraw the FavCity widget");
                nameCity = userInput;
              });
            },
          ),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "Tu ciudad favorita es $nameCity",
                style: TextStyle(fontSize: 20.0),
              ))
        ],
      ),
    );
  }
}
