import 'package:flutter/material.dart';
import 'package:hepapp/routes/routes.dart';

void main() => runApp(MyApp());

/*
En esta clase se define el título de la aplicación, el tema
y las rutas a las distintos apartados.
 */
class MyApp extends StatelessWidget {
  //TODO tema entero de la app, definiendo sus estilos, posible archivo styles.dart

  @override
  Widget build(BuildContext context) {
    final title = 'HepApp';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Quitar etiqueta de debug
      title: title,
      theme: ThemeData(
        //brightness: Brightness.dark, //Tema oscuro
        primaryColor: Color.fromARGB(255, 93, 188, 210),
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.white),
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
          textTheme: Theme
              .of(context)
              .textTheme
              .apply(
            bodyColor: Color.fromARGB(255, 93, 188, 210),
            //Color por defecto de all el texto
            displayColor: Colors.red,
          )
      ),
      initialRoute: '/',
      routes: getApplicationRoutes(),
    );
  }
}

