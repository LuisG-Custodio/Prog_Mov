import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'models/user_profile.dart'; // Asegúrate de importar tu modelo de datos

class DatabaseHelper {
  static Database _database;
  static const String _dbName = 'profile.db';
  static const String _tableName = 'profiles';

  // Método para obtener la instancia de la base de datos
  Future<Database> get database async {
    if (_database != null) return _database;

    // Si _database es null, inicialízalo
    _database = await initDatabase();
    return _database;
  }

  // Método para inicializar la base de datos
  Future<Database> initDatabase() async {
    // Obtiene el directorio de almacenamiento local
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);

    // Abre la base de datos (crea si no existe)
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // Crea la tabla
      await db.execute('''
        CREATE TABLE $_tableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          firstName TEXT,
          lastName TEXT,
          middleName TEXT,
          phone TEXT,
          email TEXT
        )
      ''');
    });
  }

  // Método para insertar un nuevo perfil en la base de datos
  Future<int> insertUserProfile(UserProfile userProfile) async {
    final db = await database;
    return await db.insert(_tableName, userProfile.toMap());
  }

  // Implementa métodos para actualizar, eliminar y consultar perfiles según sea necesario
  // Ejemplo de método para obtener todos los perfiles
  Future<List<UserProfile>> getAllProfiles() async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(maps.length, (i) {
      return UserProfile(
        id: maps[i]['id'],
        firstName: maps[i]['firstName'],
        lastName: maps[i]['lastName'],
        middleName: maps[i]['middleName'],
        phone: maps[i]['phone'],
        email: maps[i]['email'],
      );
    });
  }
}
