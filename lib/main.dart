import 'package:app_donaciones/donativos.dart';
import 'package:app_donaciones/home_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // la primer pantalla es la home_page
      // importamos en la línea1
      home: HomePage(),
      // donde empieza la app
      // initialRoute: '/homePage',
      // // Mapa de rutas
      // routes: {
      //   '/homePage': (context) => HomePage(),
      //   'donativos': (context) => Donativos()
      // }
    );
  }
}