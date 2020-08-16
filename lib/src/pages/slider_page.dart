import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child  : Column(
          children: [
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label      : 'Tamaño de la imagen',
      // divisions  : 20,
      value      : _valorSlider,
      min        : 10.0,
      max        : 300.0,
      onChanged  : ( _bloquearCheck ) ? null : (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _checkBox() {

    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor) {

    //     setState(() {
    //       _bloquearCheck = valor;
    //     });

    //   },
    // );

    return CheckboxListTile(
      title    : Text('Bloquear slider'),
      value    : _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );

  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title    : Text('Bloquear slider'),
      value    : _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearImagen() {

    return Image(
      image: NetworkImage('https://i.pinimg.com/originals/17/02/d7/1702d7516cfda3b2c1e205a1ef1c1b4f.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }
}