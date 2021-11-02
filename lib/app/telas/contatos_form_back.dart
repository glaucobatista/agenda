import 'package:agenda/app/dominio/entidades/contato.dart';
import 'package:agenda/app/dominio/servicos/contato_servico.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class ContatosFormBack {
  Contato contato;
  var _servico = GetIt.I.get<ContatoServico>();
  bool _nomeEhValido;
  bool _emailEhValido;
  bool _telefoneEhvalido;

  bool get ehValido => _nomeEhValido && _emailEhValido && _telefoneEhvalido;

  // diferenciar novo com alteração
  ContatosFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    contato = (parameter == null) ? Contato() : parameter;
  }

  //salvar
  save() async {
    await _servico.save(contato);
  }

  //validações
  String validarNome(String nome) {
    try {
      _servico.validarNome(nome);
      _nomeEhValido = true;
      return null;
    } catch (e) {
      _nomeEhValido = false;
      return e.toString();
    }
  }

  String validarEmail(String email) {
    try {
      _servico.validarEmail(email);
      _emailEhValido = true;
      return null;
    } catch (e) {
      _emailEhValido = false;
      return e.toString();
    }
  }

  String validarTelefone(String telefone) {
    try {
      _servico.validarTelefone(telefone);
      _telefoneEhvalido = true;
      return null;
    } catch (e) {
      _telefoneEhvalido = false;
      return e.toString();
    }
  }
}
