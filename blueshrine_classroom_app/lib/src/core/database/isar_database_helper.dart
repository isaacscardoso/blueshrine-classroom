import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/student_model.dart';
import './data_access_object.dart';

class IsarDatabaseHelper implements DataAccessObject {
  late Future<Isar> _isarDB;

  IsarDatabaseHelper() {
    _isarDB = _initDatabase();
  }

  Future<Isar> _initDatabase() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return Isar.open(
        [StudentModelSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<List<T>> fetchAll<T>(String? name) async {
    final database = await _isarDB;
    return database.studentModels.where().findAll() as Future<List<T>>;
  }

  @override
  Future<T> fetchById<T>(int id) async {
    final database = await _isarDB;
    return database.studentModels.get(id) as Future<T>;
  }

  @override
  Future<void> save<T>(T data) async {
    final database = await _isarDB;
    database.writeTxn(() async {
      database.studentModels.put(data as StudentModel);
    });
  }

  @override
  Future<void> delete(int id) async {
    final database = await _isarDB;
    database.writeTxn(() async {
      database.studentModels.delete(id);
    });
  }

  @override
  Stream<List<T>> listenToData<T>() async* {
    final database = await _isarDB;
    yield* database.studentModels.where().watch(fireImmediately: true)
        as Stream<List<T>>;
  }
}
