import 'package:agenda/app/dominio/entidades/contato.dart';
import 'package:agenda/app/telas/contatos_list_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContatosList extends StatelessWidget {
  final _back = ContatosListBack();

  CircleAvatar circleAvatar(String url) {
    //operador ternário if
    return (Uri.tryParse(url).isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  Widget iconEditButton(Function quandoPressionado) {
    return IconButton(
        icon: Icon(Icons.edit),
        color: Colors.orange,
        onPressed: quandoPressionado);
  }

  Widget iconRemoveButton(BuildContext context, Function remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Tem certeza que deseja EXCLUIR?'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: remove,
                      ),
                    ],
                  ));
        });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Contatos'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _back.goToForm(context);
              },
            )
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Contato> lista = futuro.data;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var contato = lista[i];
                      // var avatar = CircleAvatar(
                      //   backgroundImage: NetworkImage(contato.urlAvatar),
                      // );
                      return ListTile(
                        leading: circleAvatar(contato.urlAvatar),
                        title: Text(contato.nome),
                        onTap: () {
                          _back.goToDetalhes(context, contato);
                        },
                        subtitle: Text(contato.telefone),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: <Widget>[
                              iconEditButton(() {
                                _back.goToForm(context, contato);
                              }),
                              iconRemoveButton(context, () {
                                _back.remover(contato.id);
                                Navigator.of(context).pop();
                              })
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
