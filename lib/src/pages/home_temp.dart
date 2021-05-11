import 'package:flutter/material.dart';

class HomePageTemporal extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Componentes Temporal')),
        body: ListView(children: _deOpciones_aWidgets_corto()));
  }

  // *** Forma larga ***
  // retorna lista de widgets
  List<Widget> _deOpciones_aWidgets() {
    List<Widget> lista = [];

    for (var opt in opciones) {
      // crear widget
      final tempWidget = ListTile(title: Text(opt));

      // Añadir widget a la lista
      lista..add(tempWidget)..add(Divider()); // ".." referencia a la lista
    }
    return lista;
  }

  // *** Forma corta ***
  // Retorna lista de widgets
  List<Widget> _deOpciones_aWidgets_corto() {
    // mapear lista para crear widget por cada item
    return opciones.map((String opt) {
      return Column(children: [
        ListTile(
            title: Text(opt),
            subtitle: Text('Subtitulo'),
            leading: Icon(Icons.adb_sharp),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {}),
        Divider()
      ]);
    }).toList();
  }
}
