import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  // Slider
  double _valorRenderizadoDelSlider = 100.0;

  // Check
  bool bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            _crearImagen(),
          ],
        ),
      ),
    );
  }

  // un Slider en flutter es un progress bar movible
  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo[800],
      label: 'Size de la imagen',
      // divisions: 20,
      min: 10.0,
      max: 400.0,
      value: _valorRenderizadoDelSlider,

      // con null los wigets que dependen de ese valor se deshabilitan
      // Si bloquear check es true OnChanged tendra el valor null, sino
      onChanged: (bloquearCheck)
          ? null
          : (valorSlider) {
              setState(() => _valorRenderizadoDelSlider = valorSlider);
            },
    );
  }

  Widget _crearImagen() {
    return Expanded(
      child: Image(
          image: NetworkImage(
              'https://i.pinimg.com/736x/f3/7b/7e/f37b7ec0dfd5ddc618df2d20012927c0.jpg'),
          width: _valorRenderizadoDelSlider,
          fit: BoxFit.contain),
    );
  }

  Widget _crearCheckBox() {
    // *** 1era Forma (SOLO CHECKBOX) ***

    // return Checkbox(
    //     value: bloquearCheck,
    //     onChanged: (valor) {
    //       setState(() => bloquearCheck = valor);
    //     });

    // *** 2da Forma mas estilizable ***

    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: bloquearCheck,
        onChanged: (valor) {
          setState(() => bloquearCheck = valor);
        });
  }

  // Switch es gemelo en funcionalidad del checkox pero con un estilo diferente
  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slider'),
        value: bloquearCheck,
        onChanged: (valor) {
          setState(() => bloquearCheck = valor);
        });
  }
}
