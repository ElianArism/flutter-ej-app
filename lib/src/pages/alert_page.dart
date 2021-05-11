import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Page')),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_sharp),
        // Volver a la pagina anterior
        onPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          onPressed: () => _mostrarAlert(context),
          style: ElevatedButton.styleFrom(
              primary: Colors.red[300], // da el background al btn
              shape: StadiumBorder() // da el border radius
              ),
        ),
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    //  config modal
    showDialog(
      context: context,
      barrierDismissible:
          true, // poder cerrar el modal dando click fuera de el);

      // Builder construye y renderiza el modal que va a mostrarse
      builder: (context) {
        return AlertDialog(
          title: Text('Titulo'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: Column(
            // controlar que tamaño toma una columna
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido de la columna de la alerta'),
              FlutterLogo(size: 100.0),
            ],
          ),
          // Botones
          actions: [
            TextButton(
                // cerrar modal
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar')),
            TextButton(
                // cerrar modal
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Ok'))
          ],
        );
      },
    );
  }
}
