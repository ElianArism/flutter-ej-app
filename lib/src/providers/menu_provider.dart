import 'dart:convert'; // para parsear json

// Para leer Jsons planos
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider();

  Future<List<dynamic>> cargarData() async {
    // obtener datos (en forma de string) del json
    final data = await rootBundle.loadString('data/menu_opts.json');

    // Transformar json en string a map
    Map dataDesdeJson = json.decode(data);

    // cargar opciones
    opciones = dataDesdeJson['rutas'];

    // retornar opciones una vez cargadas
    return opciones;
  }
}

// para manejar una unica instancia
final menuProvider = new _MenuProvider();
