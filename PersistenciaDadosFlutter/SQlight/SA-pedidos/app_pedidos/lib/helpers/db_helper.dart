import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/produto.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'produtos.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE produtos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            descricao TEXT,
            preco REAL,
            categoria TEXT
          )
          '''
        );
      },
    );
  }

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<void> insertProduto(Produto produto) async {
    final db = await getDatabase();
    await db.insert('produtos', produto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Produto>> getProdutos() async {
    final db = await getDatabase();
    final maps = await db.query('produtos');
    return List.generate(maps.length, (i) => Produto.fromMap(maps[i]));
  }
}
