import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hepapp/routes/routes.dart';
import 'package:hepapp/shared_preferences/preferencias_usuario.dart';

import 'lang/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  final prefs = new PreferenciasUsuario();


  final _supoortedLocales = [
    Locale('en', 'US'),
    Locale('es', 'ES'),
  ];

  final /*Iterable<localizationDelegates>*/ _localizationDelegates = [
    AppLocalizations.delegate, //Carga las traducciones desde el JSON
    GlobalMaterialLocalizations.delegate, //Localización de text báxico
    GlobalWidgetsLocalizations.delegate, //Localización de texto LTR/RTL
  ];

   Locale _localeResolutionCallback (locale, supportedLocales) {
     //Compruebo si el idioma del dispositivo está soportado
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    //Si no está soportado, devuelvo el primer idioma (inglés)
    return supportedLocales.first;
   }

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
      supportedLocales: _supoortedLocales,
      localizationsDelegates: _localizationDelegates,
      localeResolutionCallback: _localeResolutionCallback,
      initialRoute: '/',
      //prefs.ultimaPagina,
      routes: getApplicationRoutes(
      )

      ,
    );
  }
}

