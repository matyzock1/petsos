import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'formulario1': (BuildContext context) => const FormularioScreen(),
    'formulario2': (BuildContext context) => const Formulario2Screen(),
  };

  static Route<dynamic> onGenerateRoute(settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
