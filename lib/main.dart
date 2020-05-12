import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hepapp/routes/route_generator.dart';
import 'package:hepapp/shared_preferences/user_settings.dart';

import 'lang/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Cargo las preferencias antes de correr la app
  final prefs = new UserSettings();
  await prefs.initPrefs();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final prefs = new UserSettings();

  final _supoortedLocales = [
    Locale('en', 'US'),
    Locale('es', 'ES'),
  ];

  final _localizationDelegates = [
    AppLocalizations.delegate, //Carga las traducciones desde el JSON
    GlobalMaterialLocalizations.delegate, //Localización de text báxico
    GlobalWidgetsLocalizations.delegate, //Localización de texto LTR/RTL
  ];

  Locale _localeResolutionCallback(locale, supportedLocales) {
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
          primaryColor: Color.fromARGB(255, 73, 195, 207),
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.white),
          ),
          scaffoldBackgroundColor: Color.fromARGB(255, 250, 250, 250),
          primaryIconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: Theme
              .of(context)
              .textTheme
              .apply(
            bodyColor: Color.fromARGB(255, 93, 188, 210),
          )),
      supportedLocales: _supoortedLocales,
      localizationsDelegates: _localizationDelegates,
      localeResolutionCallback: _localeResolutionCallback,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
