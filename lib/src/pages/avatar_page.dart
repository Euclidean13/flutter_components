import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title  : Text('Avatar Page'),
        actions: [

          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pinimg.com/originals/32/94/fa/3294fade4d6b2c5aa65d74cc5c5fff48.jpg'),
              radius: 25.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child : CircleAvatar(
              child          : Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder   : AssetImage('assets/jar-loading.gif'),
          image         : NetworkImage('https://api.time.com/wp-content/uploads/2015/11/stan-lee-marvel.jpg'),
          fadeInDuration: Duration(milliseconds: 200)
        ),
      ),
    );
  }
}
