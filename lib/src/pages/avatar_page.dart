import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          // avatar 1
          Container(
              margin: EdgeInsets.only(
                right: 10,
              ),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbGTXA_jr9Y-jq3tPLhTA4WT7JErvpLkwtuQ&usqp=CAU'))),

          // avatar 2
          Container(
            margin: EdgeInsets.only(right: 10),
            // para hcer el tipico circulo de avatars
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown[400],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,

      // Body
      body: Center(
          child: FadeInImage(
        image: NetworkImage(
            'https://fotografias-neox.atresmedia.com/clipping/cmsimages01/2017/04/07/8DCC1DD1-AE5F-4B30-B21A-E3F143E8C779/58.jpg'),
        placeholder: AssetImage('assets/jar-loading.gif'),
      )),
    );
  }
}
