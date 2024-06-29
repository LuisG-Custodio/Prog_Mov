import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'tryout.db');
    return await openDatabase(
      path,
      version: 2, // Increment the version number here
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL,
        birthDate TEXT NOT NULL
      )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Implement migration logic here if needed
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE users ADD COLUMN birthDate TEXT NOT NULL');
    }
  }

  Future<int> insertUser(Map<String, dynamic> row) async {
    try {
      Database db = await database;
      return await db.insert('users', row);
    } catch (e) {
      print("Error inserting user: $e");
      return 0;
    }
  }

  Future<Map<String, dynamic>?> getUser(
      String username, String password) async {
    try {
      Database db = await database;
      List<Map<String, dynamic>> results = await db.query(
        'users',
        where: 'username = ? AND password = ?',
        whereArgs: [username, password],
      );
      if (results.isNotEmpty) {
        return results.first;
      }
      return null;
    } catch (e) {
      print("Error getting user: $e");
      return null;
    }
  }
}
