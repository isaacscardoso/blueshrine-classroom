import '../../models/student_model.dart';

abstract interface class StudentRepository {
  Future<List<StudentModel>> fetchAll({String? name});

  Future<StudentModel> fetchById(int id);

  Future<void> save(StudentModel student);

  Future<void> delete(int id);

  Stream<List<StudentModel>> listenToData();
}
