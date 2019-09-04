import 'package:flutter/material.dart';
//import 'package:hepapp/vista/HomePageWidget.dart';


class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                "Information",
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pushNamed(context, '/CLIPCalc'),
          child: Text('CLIP Calculator'),

        ),
      ),
    );
  }


}
