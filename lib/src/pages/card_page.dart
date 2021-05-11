import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final _urlImg =
      'https://www.elagoradiario.com/wp-content/uploads/2021/02/Estaci%C3%B3n-Espacial-Internacional-1140x600.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card Page')),
      body: ListView(
          // padding recibe un Edgeinsets que maneja los valores numericos del padding
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardTIpo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
            _cardTIpo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
            _cardTIpo1(),
            SizedBox(height: 30.0),
            _cardTipo2(),
          ]),
    );
  }

  _cardTIpo1() {
    // tarjetas
    return Card(
      elevation: 10.0, // controlar como se proyecta el box shadow
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)), // manejar border radius
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Title Card'),
            subtitle: Text('Subtitle'),
          ),
          Row(
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {},
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    return Card(
      clipBehavior: Clip
          .antiAlias, // ayuda a que nada de la tarjeta se salga del contenido de la misma
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0)), // manejar border radius
      child: Column(
        children: <Widget>[
          // imagenes
          // FadeInImage es un widget que renderiza una img por def hasta que la img de verdad este disponible
          FadeInImage(
            placeholder: AssetImage(
                'assets/jar-loading.gif'), // AssetImg para recursos estaticos
            image: NetworkImage(_urlImg), //Network Img para recursos externos
            fadeInDuration: Duration(milliseconds: 200),
            height: 200.0, // heigth fijo
            fit: BoxFit.cover, // cubre todo el ancho
          ),
          Container(
            child: Text('Nuevo mensaje'),
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    );

    /* *** OTRA FORMA DE ARREGLARLO POR SI EN ALGUN MOMENTO EL ClipBehavior no funcionase *** */
    /*
      final card = Container(
        clipBehavior: Clip
            .antiAlias, // ayuda a que nada de la tarjeta se salga del contenido de la misma
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0)), // manejar border radius
        child: Column(
          children: <Widget>[
            // imagenes
            // FadeInImage es un widget que renderiza una img por def hasta que la img de verdad este disponible
            FadeInImage(
              placeholder: AssetImage(
                  'assets/jar-loading.gif'), // AssetImg para recursos estaticos
              image: NetworkImage(_urlImg), //Network Img para recursos externos
              fadeInDuration: Duration(milliseconds: 200),
              height: 200.0, // heigth fijo
              fit: BoxFit.cover, // cubre todo el ancho
            ),
            Container(
              child: Text('Nuevo mensaje'),
              padding: EdgeInsets.all(10.0),
            ),
          ],
        ),
      );

      return Container(child: ClipRRect(child: card BorderRadius: BorderRadius.circular(20.0)), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)))
    */
  }
}
