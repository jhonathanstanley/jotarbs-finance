import 'package:jotarbs_finance/helpers/db.helper.dart';
import 'package:jotarbs_finance/model/movimentacao.dart';

class MovimentacaoHelper {
  DBHelper con = DBHelper();

  Future<int> addMovimentacao(Movimentacao movimentacao) async {
    var dbClient = await con.db;
    int res = await dbClient.insert('Movimentacao', movimentacao.toMap());
  }

  Future<int> removeMovimentaco(int id) async {
    var dbClient = await con.db;
    int res =
        await dbClient.rawDelete('DELETE FROM Movimentacao WHERE id = ?', [id]);
    return res;
  }

  Future<List<Movimentacao>> getAll() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Movimentacao');

    List<Movimentacao> list = res.isNotEmpty
        ? res.map((c) => Movimentacao.fromMap(c)).toList()
        : null;

    return list;
  }
}
