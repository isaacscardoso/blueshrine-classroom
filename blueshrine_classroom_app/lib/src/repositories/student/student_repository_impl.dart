import '../../models/student_model.dart';
import './student_repository.dart';

class StudentRepositoryImpl implements StudentRepository {
  @override
  Future<List<StudentModel>> fetchAll(String? name) async {
    throw UnimplementedError();
  }

  @override
  Future<StudentModel> fetchById(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<void> save(StudentModel student) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int id) async {
    throw UnimplementedError();
  }
}
