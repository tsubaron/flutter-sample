import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

final String tableBudgets = 'budgets';
final String columnId = '_id';
final String columnDate = 'date';
final String columnType = 'type';
final String columnTitle = 'title';
final String columnAmount = 'amount';

class Budgets {
  int id;
  String date;
  int type;
  String title;
  int amount;

  static final int typeIncome = 1;
  static final int typeDirectDebit = 2;
  static final int typeExpenditure = 3;
  static final int typeSavings = 4;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnDate: date,
      columnType: type,
      columnTitle: title,
      columnAmount: amount,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Budgets({
    this.id,
    this.date,
    this.type,
    this.title,
    this.amount,
  });

  Budgets.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    date = map[columnDate];
    type = map[columnType];
    title = map[columnTitle];
    amount = map[columnAmount];
  }
}

class BudgetsProvider {
  Database db;
  String path;

  BudgetsProvider() {
  }

  Future open() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, 'saving.db');
    db = await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableBudgets (
  $columnId integer primary key autoincrement,
  $columnDate text not null,
  $columnType integer not null,
  $columnTitle text,
  $columnAmount integer)
''');
    });
  }

  Future<Budgets> insert(Budgets budgets) async {
    budgets.id = await db.insert(tableBudgets, budgets.toMap());
    return budgets;
  }

  Future<Budgets> find(int id) async {
    List<Map> maps = await db.query(tableBudgets,
        columns: [columnId, columnDate, columnType, columnTitle, columnAmount],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Budgets.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableBudgets, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Budgets budgets) async {
    return await db.update(tableBudgets, budgets.toMap(),
        where: '$columnId = ?', whereArgs: [budgets.id]);
  }

  Future<int> countByDateAndType({String date, int type}) async {
    int count = Sqflite.firstIntValue(await db.rawQuery(
      '''SELECT COUNT(*) FROM $tableBudgets WHERE $columnDate = ? AND $columnType = ?''',
      [date, type]
    ));
    return count;
  }

  Future<List> getByDateAndType({String date, int type}) async {
    List<Map> maps = await db.query(tableBudgets,
        columns: [columnId, columnDate, columnType, columnTitle, columnAmount],
        where: '$columnDate = ? AND $columnType = ?',
        whereArgs: [date, type]);

    return maps;
  }

  Future close() async => db.close();
}