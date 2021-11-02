import 'package:agenda/app/database/firestore/contato_dao_firestore.dart';
import 'package:agenda/app/dominio/interfaces/contato_dao.dart';
import 'package:agenda/app/dominio/servicos/contato_servico.dart';

import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContatoDao>(ContatoDaoFirestore());
  getIt.registerSingleton<ContatoServico>(ContatoServico());
}
