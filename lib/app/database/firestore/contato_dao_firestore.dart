import 'package:agenda/app/dominio/entidades/contato.dart';
import 'package:agenda/app/dominio/interfaces/contato_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContatoDaoFirestore implements ContatoDao {
  CollectionReference colecaoContato;
  ContatoDaoFirestore() {
    colecaoContato = FirebaseFirestore.instance.collection('contato');
  }
  @override
  Future<List<Contato>> find() async {
    var result = await colecaoContato.get();
    return result.docs
        .map((doc) => Contato(
              id: doc.reference.id.toString(),
              nome: doc['nome'],
              email: doc['email'],
              telefone: doc['telefone'],
              urlAvatar: doc['urlAvatar'],
            ))
        .toList();
  }

  @override
  remove(id) {
    colecaoContato.doc(id).delete();
  }

  @override
  save(Contato contato) {
    colecaoContato.doc(contato.id).set({
      'nome': contato.nome,
      'email': contato.email,
      'telefone': contato.telefone,
      'urlAvatar': contato.urlAvatar
    });
  }
}
