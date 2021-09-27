import 'package:agenda/app/dominio/entidades/contato.dart';

abstract class ContatoDao {
  save(Contato contato);
  remove(int id);
  Future<List<Contato>> find();
}
