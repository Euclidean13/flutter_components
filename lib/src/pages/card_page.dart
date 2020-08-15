import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding : EdgeInsets.all(10.0),
        children: [
          _cadTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cadTipo1() {
    
    return Card(
      elevation: 10.0,
      shape    : RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          ListTile(
            leading : Icon(Icons.photo_album, color: Colors.blue),
            title   : Text('Soy el titulo de esta targeta'),
            subtitle: Text('Aquí estamos con la descripción de la tarjeta que quiero que vean para que tengan una idea de lo que quiero mostrarles.')
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children         : [
              FlatButton(
                child    : Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child    : Text('Ok'),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {

    final card = Container(
      child: Column(
        children: [

          FadeInImage(
            placeholder   : AssetImage('assets/jar-loading.gif'),
            image         : NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/000/246/312/original/mountain-lake-sunset-landscape-first-person-view.jpg'),
            fadeInDuration: Duration( milliseconds: 200 ),
            height        : 300.0,
            width         : 500.0,
            fit           : BoxFit.cover
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            child  : Text('No tengo idea de que poner')
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow   : <BoxShadow>[
          BoxShadow(
            color       : Colors.black26,
            blurRadius  : 10.0,
            spreadRadius: 2.0,
            offset      : Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child       : card,
      ),
    );

  }
}
