import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:expense_tracker/models/person.dart';

class DatabaseProvider {
  late Database _database;

  Future open() async {
    if (_database == null) {
      _database = await _initDatabase();
    }
  }

  Future<Database> _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, "persons.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE persons(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          firstName TEXT,
          lastName TEXT
        )
      ''');
    });
  }

  Future<int> insertPerson(Person person) async {
    await open();
    return await _database.insert('persons', person.toMap());
  }

  Future<List<Person>> getPersons() async {
    await open();
    List<Map<String, dynamic>> maps = await _database.query('persons');
    return List.generate(maps.length, (i) {
      return Person.fromMap(maps[i]);
    });
  }
}
