import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._();

  static DatabaseHelper get instance {
    _instance ??= DatabaseHelper._();
    return _instance!;
  }

  Future<Database> get database async {
    return _database ?? await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'bsclassroom.db'),
      version: 1,
      onCreate: _onCreate,
    );
    return database;
  }

  Future<void> _onCreate(Database database, int version) async {
    await database.execute(_studentsTable);
  }

  String get _studentsTable => '''
    CREATE TABLE IF NOT EXISTS `students` (
      `id` INTEGER PRIMARY KEY AUTOINCREMENT,
      `name` VARCHAR(60) NOT NULL,
      `description` TEXT,
      `status` INTEGER,
      `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
  ''';
}
