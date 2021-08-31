import 'package:app_donaciones/donativos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  double donacionesAcumuladas = 0.0;
  double total = 10000;
  double progress = 10.0;
  int? currentRadio;
  int? currentDropItem;
  var radioGroup = {0: 'Paypal', 1: 'Tarjeta'};
  // lista de items del dropdown
  var dropItemsGroup = {0: 100, 1: 350, 2: 850, 3: 1050, 4: 9999};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donaciones'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: radioGroupGenerator(),
            ),
          ),
          ListTile(
              title: Text('Cantidad a donar:'),
              trailing: DropdownButton(
                  items: dropDownItemGenerator(),
                  value: currentDropItem,
                  onChanged: (int? selected) {
                    currentDropItem = selected;
                    setState(() {});
                  })),
          LinearProgressIndicator(minHeight: 24, value: progress),
          MaterialButton(
              onPressed: () {
                // si es null -> suma 0
                donacionesAcumuladas += currentDropItem ?? 0;
                progress = donacionesAcumuladas / total;
                setState(() {});
              },
              child: Text('Donar'))
        ],
      ),
      // botón que va abajo a la derecha
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.text_format),
        onPressed: () {
          // Aquí es donde se navega a la next screen
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) {
                  return Donativos(donativos: donacionesAcumuladas);
                },
                // Navigator.of(context).pushNamed('/donativos'); -> otra manera de hacer rutas
                // para pasar argumentos/datos a otra pantalla
                settings: RouteSettings(arguments: donacionesAcumuladas)),
          );
        },
      ),
    );
  }

  dropDownItemGenerator() {
    return dropItemsGroup.entries
        .map(
          (dropDownElement) => DropdownMenuItem(
              value: dropDownElement.value,
              child: Text('${dropDownElement.value}')),
        )
        .toList();
  }

  radioGroupGenerator() {
    return radioGroup.entries
        .map((radioElement) => ListTile(
            leading: Radio(
                value: radioElement.key,
                groupValue: currentRadio,
                onChanged: (int? selected) {
                  currentRadio = selected;
                  setState(() {});
                }),
            title: Text('${radioElement.value}')))
        .toList();
  }
}
