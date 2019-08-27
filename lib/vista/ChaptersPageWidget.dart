import 'package:flutter/material.dart';

class ChaptersPage extends StatefulWidget {
  @override
  _ChaptersPageState createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
                    Navigator.pushNamed(context, '/');
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
                "Chapters",
              ),
            ],
          ),
        ),
      ),
      body: Center(
        //TODO: Hacer recuperación de datos de internet
        child: new Text("Some text"),
      ),
    );
  }
}
