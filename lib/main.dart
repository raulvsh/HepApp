import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'vista/SquareHomeWidget.dart';
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
  bool _isBorderEnabled = false;
  var _actionIcon = Icons.border_all;
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  List<String> litems = ["1", "2", "Third", "4"];

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
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: PreferredSize(
            preferredSize: Size.fromHeight(30),
            child: AppBar(
              //iconTheme: IconThemeData(color: Colors.red),
              //shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),

              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(
                widget.title,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 18,
                ),
              ),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(70.0),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: Colors.white),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(

                        image: AssetImage('/images/goma_borrar.png'),
                        fit: BoxFit.fitWidth,

                      ),
                    ),
                    height: 60.0,
                    padding: EdgeInsets.all(3),
                    alignment: Alignment.center,
                    //child: Image.asset('images/hepapplogo.png',
                    //fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
          )),
      body: SquareHomeWidget(),
    );
  }
}
