import 'package:agenda/app/database/sqlite/dao/contato_dao_impl.dart';
import 'package:agenda/app/dominio/interfaces/contato_dao.dart';

import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContatoDao>(ContatoDaoImpl());
}
