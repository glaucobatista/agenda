import 'package:agenda/app/database/sqlite/conexao.dart';
import 'package:agenda/app/dominio/entidades/contato.dart';
import 'package:agenda/app/dominio/interfaces/contato_dao.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDaoImpl implements ContatoDao {
  Database _db;

  @override
  Future<List<Contato>> find() async {
    _db = await Conexao.get();
    List<Map<String, dynamic>> resultado = await _db.query('contato');
    List<Contato> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Contato(
          id: linha["id"],
          nome: linha["nome"],
          telefone: linha["telefone"],
          email: linha["email"],
          urlAvatar: linha["url_avatar"]);
    });
    return lista;
  }

  @override
  remove(dynamic id) async {
    _db = await Conexao.get();
    var sql = 'DELETE FROM contato WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Contato contato) async {
    _db = await Conexao.get();
    var sql;
    if (contato.id == null) {
      sql =
          'INSERT INTO contato(nome,telefone,email,url_avatar) VALUES (?,?,?,?)';
      _db.rawInsert(sql,
          [contato.nome, contato.telefone, contato.email, contato.urlAvatar]);
    } else {
      sql =
          'UPDATE contato SET nome = ?, telefone = ?, email = ?, url_avatar = ?, WHERE id=?';
      _db.rawUpdate(sql, [
        contato.nome,
        contato.telefone,
        contato.email,
        contato.urlAvatar,
        contato.id
      ]);
    }
  }
}
