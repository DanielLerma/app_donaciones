import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Donativos extends StatefulWidget {
  final double ? donativos;
  // tenemos que agregar al constructor ese atributo
  Donativos({Key? key, @required this.donativos}) : super(key: key);

  @override
  _Donativostate createState() => _Donativostate();
}

class _Donativostate extends State<Donativos> {

  @override
  Widget build(BuildContext context) {
    // línea para jalar args de la página anterior
    // var donativos = ModalRoute.of(context)?.settings.arguments;
    print('Donativos obtenidos: ${widget.donativos}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Donativos obtenidos'),
      ),
      body: Container()
    );
  }
}