import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // input text
  String _nombre = '';

  // input email
  String _email = '';

  // input date
  String _fecha = '';
  TextEditingController _inputFieldDateController = new TextEditingController();

  // dropdown
  List<String> _poderes = ['Volar', 'Fuerza', 'Rayos X'];
  String _opcionRenderizada = 'Fuerza';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Page')),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearInputEmail(),
            Divider(),
            _crearInputPassword(),
            Divider(),
            _crearInputDate(context),
            Divider(),
            _crearDropDown(),
            Divider(),
            _crearPersona(),
          ],
        ),
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // al entrar se hace focus al campo
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        // borde del input
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        // small text del lado inferior derecho del textfield
        counter: Text('letras: ${_nombre.length}'),
        // = a placeholder en inputs
        hintText: 'Nombre de la persona', labelText: 'Nombre',
        //  texto de ayuda debajo del input
        helperText: 'Sin apellido',
        // Icono dentro del input en la parte derecha
        suffixIcon: Icon(Icons.accessibility_new_outlined),
        // Icono del lado izq del input
        icon: Icon(Icons.verified_user),
      ),
      // cada vez que se ingrese un caracter
      onChanged: (valorDelInput) {
        setState(() => _nombre = valorDelInput);
      },
    );
  }

  Widget _crearInputEmail() {
    return TextField(
        // Convertir textInput a tipo email  u otros
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          counter: Text('email'),
          hintText: 'test@gmail.com',
          helperText: 'recuerde el formato',
          labelText: 'Email',
          suffixIcon: Icon(Icons.email),
          icon: Icon(Icons.alternate_email_sharp),
        ),
        onChanged: (valorDeInput) {
          setState(() => _email = valorDeInput);
        });
  }

  Widget _crearInputPassword() {
    return TextField(
      obscureText: true, // para que tenga formato password
      decoration: InputDecoration(
          // alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          counter: Text('password'),
          hintText: 'ingrese password segura',
          labelText: 'Password',
          helperText: 'No comparta su password',
          suffixIcon: Icon(Icons.enhanced_encryption_outlined),
          icon: Icon(Icons.zoom_out_map_outlined)),
    );
  }

  Widget _crearInputDate(BuildContext context) {
    return TextField(
      // para evitar que se abra el teclado
      enableInteractiveSelection: false,
      // controlador para setear datos en la fecha
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: 'Date',
          hintText: 'Fecha de entrega',
          counter: Text('Ingrese fecha'),
          suffixIcon: Icon(Icons.perm_contact_calendar_outlined),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _construirDatePicker(context);
      },
    );
  }

  _construirDatePicker(BuildContext context) async {
    // almacenar una fecha
    DateTime fechaSeleccionada = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2022),
        // Idioma
        locale: Locale('es', 'ES'));

    // si selecciono la fecha
    if (fechaSeleccionada != null) {
      setState(() {
        // Setea la propiedad
        _fecha = fechaSeleccionada.toString();
        // Setea el controlador del input date mostrando su valor en el campo de texto
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(child: Text(poder), value: poder));
    });

    return lista;
  }

  // like a select in html
  Widget _crearDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        // Se usa para que su contenido se expanda lo maximo posible
        Expanded(
          child: DropdownButton(
            // valor que se renderiza en pantalla
            value: _opcionRenderizada,
            items: getOpcionesDropdown(),
            onChanged: (opcionSeleccionada) {
              setState(() => _opcionRenderizada = opcionSeleccionada);
            },
          ),
        ),
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es $_nombre'),
      subtitle: Text('Email es $_email'),
    );
  }
}
