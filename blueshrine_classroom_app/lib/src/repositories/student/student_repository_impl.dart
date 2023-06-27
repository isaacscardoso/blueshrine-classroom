import 'package:sqflite/sqflite.dart';

import '../../core/database/database_helper.dart';
import '../../models/student_model.dart';
import './student_repository.dart';

final class StudentRepositoryImpl implements StudentRepository {
  final _table = 'students';

  @override
  Future<List<StudentModel>> fetchAll({String? name}) async {
    final Database db = await DatabaseHelper.instance.database;
    final students = await db.query(_table);
    return students.map<StudentModel>((s) => StudentModel.fromMap(s)).toList();
  }

  @override
  Future<StudentModel> fetchById(int id) async {
    final Database db = await DatabaseHelper.instance.database;
    final student = await db.query(
      _table,
      where: '`id` = ?',
      whereArgs: [id],
    );
    return StudentModel.fromMap(student[0]);
  }

  @override
  Future<void> insert(StudentModel student) async {
    final Database db = await DatabaseHelper.instance.database;
    final String sqlInsert = '''
      INSERT INTO $_table 
        (`name`, `description`, `status`)
      VALUES
        (?, ?, ?)
    ''';
    await db.rawInsert(sqlInsert, [
      student.name,
      student.description,
      student.isActive,
    ]);
  }

  @override
  Future<void> edit(StudentModel student) async {
    final Database db = await DatabaseHelper.instance.database;
    final String sqlUpdate = '''
      UPDATE $_table SET
        `name` = ?,
        `description` = ?,
        `status` = ?
      WHERE `id` = ?
    ''';
    await db.rawInsert(sqlUpdate, [
      student.name,
      student.description,
      student.isActive,
      student.id,
    ]);
  }

  @override
  Future<void> delete(int id) async {
    final Database db = await DatabaseHelper.instance.database;
    await db.delete(_table, where: '`id` = ?', whereArgs: [id]);
  }
}
