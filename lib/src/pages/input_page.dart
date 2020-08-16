import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() =>  _InputPageState();
}

class _InputPageState extends State <InputPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding : EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration        : InputDecoration(
        border    : OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter   : Text('Letras ${_nombre.length}'),
        hintText  : 'Nombre de la persona',
        labelText : 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon      : Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );

  }

  Widget _crearEmail() {
    return TextField(
      // autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border    : OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText  : 'Email',
        labelText : 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon      : Icon(Icons.email),
      ),
      onChanged: (value) => setState(() {
        _email = value;
      })
    );
  }

  Widget _crearPassword() {

    return TextField(
      // autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
        border    : OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText  : 'Password',
        labelText : 'password',
        suffixIcon: Icon(Icons.lock_open),
        icon      : Icon(Icons.lock),
      ),
      onChanged: (value) => setState(() {
        _email = value;
      })
    );

  }

  Widget _crearFecha(BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border    : OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText  : 'Fecha de nacimiento',
        labelText : 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon      : Icon(Icons.calendar_today),
      ),
      onTap: (){
        
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      },
    );

  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context    : context,
      initialDate: new DateTime.now(),
      firstDate  : new DateTime(2019),
      lastDate   : new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }

  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(
        DropdownMenuItem(
          child: Text(poder),
          value: poder,
        )
      );
    });

    return lista;

  }

  Widget _crearDropdown() {

    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value    : _opcionSeleccionada,
            items    : getOpcionesDropdown(),
            onChanged: (opt){
              setState(() {
                _opcionSeleccionada = opt;
              });
            }
          ),
        )
      ],
    );

  }

  Widget _crearPersona() {

    return ListTile(
      title   : Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );

  }
}