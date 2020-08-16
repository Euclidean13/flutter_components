import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title                     : 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),    
      ],
      initialRoute              : '/',
      routes                    : getApplicationRoutes(),
      onGenerateRoute           : (RouteSettings settings) {
        // When the route is not defined by default executes onGenerateRoute
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
