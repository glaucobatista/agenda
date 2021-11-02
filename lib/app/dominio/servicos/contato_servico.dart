import 'package:agenda/app/dominio/entidades/contato.dart';
import 'package:agenda/app/dominio/exceptions/camada_excessoes.dart';
import 'package:get_it/get_it.dart';
import 'package:agenda/app/dominio/interfaces/contato_dao.dart';

class ContatoServico {
  var _dao = GetIt.I.get<ContatoDao>();

  save(Contato contato) {
    validarNome(contato.nome);
    validarEmail(contato.email);
    validarTelefone(contato.telefone);
    _dao.save(contato);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Contato>> find() {
    return _dao.find();
  }

  validarNome(String nome) {
    var min = 3;
    var max = 50;
    if (nome == null) {
      throw new CamadaExcessoes('O nome é obrigatório');
    } else if (nome.length < min) {
      throw new CamadaExcessoes(
          'O nome deve possuir pelo menos $min caracteres');
    } else if (nome.length > max) {
      throw new CamadaExcessoes('O nome deve possui no máximo $max caracteres');
    }
  }

  validarEmail(String email) {
    if (email == null) {
      throw new CamadaExcessoes('O e-mail é obrigatório');
    } else if (!email.contains('@')) {
      throw new CamadaExcessoes('O e-mail deve possuir @');
    }
  }

  validarTelefone(String telefone) {
    // var formato = RegExp(r'^\([1-9]{2}\)[9][6-9]{1}[0-9]{3}\-[0-9]{4}$');
    var formato = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');
    if (telefone == null) {
      throw new CamadaExcessoes('O telefone é obrigatório');
    } else if (!formato.hasMatch(telefone)) {
      throw new CamadaExcessoes(
          'Formato de telefone inválido use (99) 9 9999-9999');
    }
  }
}
