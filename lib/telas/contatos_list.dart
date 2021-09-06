import 'package:agenda/app/my_app.dart';
import 'package:flutter/material.dart';

class ContatosList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(MyApp.CONTATOS_FORM);
            },
          )
        ],
      ),
      body: ListView(),
    );
  }
}
