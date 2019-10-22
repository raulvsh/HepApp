import 'package:flutter/material.dart';
import 'package:hepapp/routes/routes.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

void main() async {
  //Cargo las preferencias antes de correr la app
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

/*
En esta clase se define el título de la aplicación, el tema
y las rutas a las distintos apartados.
 */
class MyApp extends StatelessWidget {
  //TODO tema entero de la app, definiendo sus estilos, posible archivo styles.dart

  final prefs = new PreferenciasUsuario();

  /* TODO hacer traducciones

  final _supoortedLocales = [
    Locale('en', 'US'),
    Locale('sk', 'SK'),
  ];
  final Iterable<localizationDelegates> _localizationDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

   Locale _localeResolutionCallback (locale, supportedLocales) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }*/

  @override
  Widget build(BuildContext context) {
    final title = 'HepApp';


    return MaterialApp(
      debugShowCheckedModeBanner: false,

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
      /*TODO HACER TRADUCCIONES **********
    supportedLocales: _supoortedLocales,
    localizationsDelegates: _localizationDelegates,
    localeResolutionCallback: _localeResolutionCallback,*/
      initialRoute: '/',
      //prefs.ultimaPagina,
      routes: getApplicationRoutes(
      )
      ,
    );
  }
}

