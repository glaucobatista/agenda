import 'package:agenda/app/dominio/entidades/contato.dart';
import 'package:agenda/app/telas/contatos_detalhes_back.dart';
import 'package:flutter/material.dart';

class ContatosDetalhes extends StatelessWidget {
  mostrarErroModal(BuildContext context) {
    var alerta = AlertDialog(
      title: Text('Atenção!'),
      content: Text('Não foi possível encontrar um APP para abrir.'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alerta;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContatoDetalhesBack(context);
    Contato contato = _back.contato;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var radius = width / 3;
        // var height = constraints.biggest.height;
        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(40),
            children: [
              (Uri.tryParse(contato.urlAvatar).isAbsolute)
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(contato.urlAvatar),
                      radius: radius,
                    )
                  : CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: width / 2,
                      ),
                      radius: radius,
                    ),
              Center(
                child: Text(
                  '${contato.nome}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Telefone'),
                  subtitle: Text('${contato.telefone}'),
                  trailing: Container(
                    width: width / 4,
                    child: Row(
                      children: [
                        IconButton(
                            color: Colors.blue,
                            icon: Icon(Icons.message),
                            onPressed: () {
                              _back.launchSMS(mostrarErroModal);
                            }),
                        IconButton(
                            color: Colors.blue,
                            icon: Icon(Icons.phone),
                            onPressed: () {
                              _back.launchTelefone(mostrarErroModal);
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('E-mail'),
                  onTap: () {
                    _back.launchEmail(mostrarErroModal);
                  },
                  subtitle: Text('${contato.email}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
