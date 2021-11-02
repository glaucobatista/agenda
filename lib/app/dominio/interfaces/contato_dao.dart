import 'package:agenda/app/dominio/entidades/contato.dart';

abstract class ContatoDao {
  save(Contato contato);
  remove(dynamic id);
  Future<List<Contato>> find();
}
