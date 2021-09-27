import 'package:agenda/app/database/sqlite/dao/contato_dao_impl.dart';
import 'package:agenda/app/dominio/entidades/contato.dart';
import 'package:agenda/app/my_app.dart';
import 'package:flutter/material.dart';

class ContatosList extends StatelessWidget {
  final lista = [
    {
      'nome': 'Glauco',
      'telefone': '(63)992646390',
      'avatar':
          'https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png'
    },
    {
      'nome': 'Iza',
      'telefone': '(63)92912857',
      'avatar':
          'https://cdn.pixabay.com/photo/2014/04/03/10/32/user-310807_960_720.png'
    },
    {
      'nome': 'Gleison',
      'telefone': '(63)992123456',
      'avatar':
          'https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png'
    },
  ];

  Future<List<Contato>> _buscarDados() async {
    return ContatoDaoImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscarDados(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<Contato> lista = futuro.data;
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
              body: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, i) {
                  var contato = lista[i];
                  var avatar = CircleAvatar(
                    backgroundImage: NetworkImage(contato.urlAvatar),
                  );
                  return ListTile(
                    leading: avatar,
                    title: Text(contato.nome),
                    subtitle: Text(contato.telefone),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.edit), onPressed: null),
                          IconButton(icon: Icon(Icons.delete), onPressed: null)
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Scaffold();
          }
        });
  }
}
