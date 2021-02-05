import 'package:jotarbs_finance/model/conta.dart';
import 'package:jotarbs_finance/helpers/db.helper.dart';

class ContaHelper {
  DBHelper con = new DBHelper();

  //Método para inserir uma nova conta
  Future<int> addConta(Conta conta) async {
    var dbClient = await con.db;
    int res = await dbClient.insert("Conta", conta.toMap());
    return res;
  }

  //Método para deletar conta
  Future<int> removeConta(int conta) async {
    var dbClient = await con.db;
    int res =
        await dbClient.rawDelete('DELETE FROM Conta where id = ?', [conta]);

    return res;
  }

  //Método para retornar todas as contas
  Future<List<Conta>> getAll() async {
    var dbclient = await con.db;
    var res = await dbclient.query('Conta');

    List<Conta> list =
        res.isNotEmpty ? res.map((c) => Conta.fromMap(c)).toList() : null;

    return list;
  }
}
