import 'package:app_utilidad/src/utils/string_icon_util.dart';
import 'package:flutter/material.dart';

import 'package:app_utilidad/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes')),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    // Crear un future Builder a partir de la promesa (future) que se maneja para obtener opciones
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      // El builder maneja los estados del future (la promesa)
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          // Snapshot.data tiene los datos provenientes del future
          children: _crearItemsLista(context, snapshot.data),
        );
      },
    );
  }

  List<Widget> _crearItemsLista(context, List<dynamic> opciones) {
    final List<Widget> widgetsOpciones = [];

    // Otra forma de recorrer datos
    opciones.forEach((opcion) {
      // widget que se agregara a la lista
      final widgetTemporal = ListTile(
        title: Text(opcion['texto']),
        leading: getIcon(opcion['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent),
        onTap: () {
          /* ==== PRIMER MANERA DE MANEJAR RUTAS ==== 
  
            // Dependiendo el contexto te envia al alertPage
              final route = MaterialPageRoute(builder: (context) => AlertPage());
            // Enviar a otras paginas
              Navigator.push(context, route);
          
          */

          // Segunda forma de manejar rutas (definiendolas en main)
          Navigator.pushNamed(context, opcion['ruta']);
        },
      );

      // agregar widgets a la lista
      widgetsOpciones..add(widgetTemporal)..add(Divider());
    });

    return widgetsOpciones;
  }
}
