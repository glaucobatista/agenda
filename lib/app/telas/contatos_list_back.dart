import 'package:agenda/app/dominio/entidades/contato.dart';
import 'package:agenda/app/dominio/servicos/contato_servico.dart';
import 'package:agenda/app/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contatos_list_back.g.dart';

class ContatosListBack = _ContatosListBack with _$ContatosListBack;

abstract class _ContatosListBack with Store {
  var _service = GetIt.I.get<ContatoServico>();
//Lista de contatos
  @observable
  Future<List<Contato>> list;

//Método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ContatosListBack() {
    refreshList();
  }

//Método para chamar o form salvar/alterar

  goToForm(BuildContext context, [Contato contato]) {
    Navigator.of(context)
        .pushNamed(MyApp.CONTATOS_FORM, arguments: contato)
        .then(refreshList);
  }

//excluir
  remover(int id) {
    _service.remove(id);
    refreshList();
  }
}
