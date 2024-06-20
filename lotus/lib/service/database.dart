import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Database_LOTTUS {
  static final Database_LOTTUS _instance = Database_LOTTUS._internal();
  factory Database_LOTTUS() => _instance;
  static Database? _database;

  Database_LOTTUS._internal();

  // Método para obtener la instancia de la base de datos
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Inicializar la base de datos
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'lottus.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Crear las tablas necesarias si no existen
  Future _createDB(Database db, int version) async {
    // Tabla productos con clave foránea a categorias y marcas
    await db.execute('''
      CREATE TABLE productos (
        id INTEGER PRIMARY KEY,
        nombre TEXT,
        descripcion TEXT,
        precio REAL,
        stock INTEGER,
        categoria_id INTEGER,
        marca_id INTEGER,
        fecha_agregado TEXT,
        FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id),
        FOREIGN KEY (marca_id) REFERENCES marcas(marca_id)
      )
    ''');

    // Tabla categorias
    await db.execute('''
      CREATE TABLE categorias (
        categoria_id INTEGER PRIMARY KEY,
        nombre TEXT
      )
    ''');

    // Tabla marcas
    await db.execute('''
      CREATE TABLE marcas (
        marca_id INTEGER PRIMARY KEY,
        nombre TEXT
      )
    ''');

    // Tabla clientes
    await db.execute('''
      CREATE TABLE clientes (
        id_cliente INTEGER PRIMARY KEY,
        nombre TEXT,
        correo TEXT,
        direccion TEXT,
        telefono TEXT
      )
    ''');

    // Tabla pedidos con clave foránea a clientes
    await db.execute('''
      CREATE TABLE pedidos (
        pedido_id INTEGER PRIMARY KEY,
        cliente_id INTEGER,
        fecha_pedido TEXT,
        total_productos INTEGER,
        FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente)
      )
    ''');

    // Tabla detalle_pedidos con claves foráneas a pedidos y productos
    await db.execute('''
      CREATE TABLE detalle_pedidos (
        detalle_id INTEGER PRIMARY KEY,
        pedido_id INTEGER,
        producto_id INTEGER,
        cantidad INTEGER,
        precio_unitario REAL,
        FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
        FOREIGN KEY (producto_id) REFERENCES productos(id)
      )
    ''');
  }
}
