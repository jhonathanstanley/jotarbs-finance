import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database _db;
  static const String DB_NAME = 'jotarbsfinance.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    final documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Conta (id INTEGER PRIMARY KEY AUTOINCREMENT, descricao TEXT, saldo REAL)");

    await db.execute(
        "CREATE TABLE Movimentacao (id INTEGER PRIMARY KEY AUTOINCREMENT, data TEXT, type INTEGER, descricao TEXT, conta INTEGER, valor REAL)");
  }
}
