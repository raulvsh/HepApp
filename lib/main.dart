import 'package:flutter/material.dart';

import 'vista/HomePageWidget.dart';
//import 'package:flutter_widget_guide/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final title = 'HepApp';

    return MaterialApp(
      debugShowCheckedModeBanner: true, //Quitar etiqueta de debug
      title: title,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 93, 188, 210),
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: AppBar(
            //iconTheme: IconThemeData(color: Colors.red),
            //shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),

            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(
              widget.title,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 14,
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'images/header4.png',
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(2),
                      child: Image.asset(
                        'images/hepapplogo.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: HomePageWidget(),
    );
  }
}
