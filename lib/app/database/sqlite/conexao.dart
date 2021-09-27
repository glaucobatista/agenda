import 'package:agenda/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static Database _db;

  static Future<Database> get() async {
    if (_db == null) {
      var caminho = join(await getDatabasesPath(), 'agenda_contatos');
      _db = await openDatabase(
        caminho,
        version: 1,
        onCreate: (db, v) {
          db.execute(criarTabela);
          db.execute(inserirContato1);
          db.execute(inserirContato2);
          db.execute(inserirContato3);
        },
      );
    }
    return _db;
  }
}
