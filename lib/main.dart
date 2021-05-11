import 'package:flutter/material.dart';

// internacionalizacion
import 'package:flutter_localizations/flutter_localizations.dart';

// Rutas
import 'package:app_utilidad/src/routes/routes.dart';

import 'package:app_utilidad/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'), // English, no country code
          const Locale('es', 'ES'), // Spanish, no country code
        ],
        // rutas:
        initialRoute: '/', // ruta inicial
        routes: getAppRoutes(),
        // para rutas no regitradas se crearan dinamicamente y habra que decidir que hacer
        // con ellas
        onGenerateRoute: (RouteSettings settings) {
          // retorna alert page que es la pag por def
          return MaterialPageRoute(
              builder: (BuildContext context) => AlertPage());
        });
  }
}
