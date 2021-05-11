import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  // Lista
  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  // Scroll
  ScrollController _scrollController = new ScrollController();

  // al inicializar el state
  @override
  void initState() {
    super.initState();
    _agregar10();

    // scroll
    // se activa cada que se mueve el scroll
    _scrollController.addListener(() {
      // cada vez que se llegue al final de la pag vuelve a agregar 10 elementos
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listassss'),
        ),
        // = que column o row pero este pone encima de otro a los elementos
        body: Stack(
          children: [
            _crearLista(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearLista() {
    return
        // Para refrescar la pagina al hacer scroll hacia arriba
        RefreshIndicator(
            child:
                // Renderiza los elementos conforme sea necesario
                // se usa cuando no se sabe cuantos elementos tendra una lista o si son demasiados
                ListView.builder(
              // controlador del scroll para poder moverlo a voluntad
              controller: _scrollController,

              // numero maximo de elementos
              itemCount: _listaNumeros.length,
              // necesita una asociacion para ir creando un widget conforme se agreguen elementos a la lista
              // En este momento se crea el contexto del widget
              itemBuilder: (BuildContext context, int index) {
                // para obtener el numero de la posicion index de la lista
                final image = _listaNumeros[index];

                return FadeInImage(
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage(
                        'https://picsum.photos/500/300/?image=$image'));
              },
            ),
            onRefresh: obtenerPag1);
  }

  // cuando se realiza el on refresh
  Future<Null> obtenerPag1() async {
    await Timer(Duration(seconds: 2), () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    // para cancelar bien el proceso
    return Future.delayed(Duration(seconds: 2));
  }

  _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
      setState(() {});
    }
  }

  // traer imagenes
  Future _fetchData() async {
    // simular delay antes de traer imagenes
    _isLoading = true;
    setState(() {});

    // settimeout
    return new Timer(Duration(seconds: 2), responseFromApi);
  }

  void responseFromApi() {
    _isLoading = false;

    // mover scroll cuando se carguen nuevas imagenes
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _agregar10();
  }

  // eliminar el evento de scroll al salir de la pag (on destroy)
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  _crearLoading() {
    if (_isLoading) {
      // crear widget de loading
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
