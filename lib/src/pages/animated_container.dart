import 'package:flutter/material.dart';

// Uso el random
import 'dart:math' show Random;

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(9.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated container')),
      body: Center(

          // Para generar animaciones en vez se usa AnimatedContainer
          child: AnimatedContainer(
        duration: Duration(seconds: 1),
        // curves son distintos flows para los efectos
        curve: Curves.fastLinearToSlowEaseIn,
        width: _width,
        height: _height,
        // estilos para el container
        decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_to_home_screen_rounded),
        onPressed: _cambiarForma,
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();

    setState(() {
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _borderRadius = BorderRadius.circular(random.nextInt(400).toDouble());
    });
  }
}
