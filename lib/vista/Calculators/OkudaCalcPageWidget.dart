import 'package:flutter/material.dart';

class OkudaCalcPage extends StatefulWidget {
  @override
  _OkudaCalcPageState createState() => _OkudaCalcPageState();
}

class _OkudaCalcPageState extends State<OkudaCalcPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/Calculators');
                  }),
              IconButton(
                icon: Image.asset(
                  'images/homeicon.png',
                  width: 25,
                  height: 25,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              Text(
                "Calculators - Okuda",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      body: new Center(
        child: new Text("Some text"),
      ),
    );
  }
}
