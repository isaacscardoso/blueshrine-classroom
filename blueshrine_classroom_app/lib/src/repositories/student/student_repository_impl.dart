import '../../core/database/data_access_object.dart';
import '../../models/student_model.dart';
import './student_repository.dart';

final class StudentRepositoryImpl implements StudentRepository {
  final DataAccessObject _dao;

  const StudentRepositoryImpl(this._dao);

  @override
  Future<List<StudentModel>> fetchAll({String? name}) async {
    return await _dao.fetchAll(name) as List<StudentModel>;
  }

  @override
  Future<StudentModel> fetchById(int id) async {
    return await _dao.fetchById(id) as StudentModel;
  }

  @override
  Future<void> save(StudentModel student) async {
    await _dao.save(student);
  }

  @override
  Future<void> delete(int id) async {
    await _dao.delete(id);
  }

  @override
  Stream<List<StudentModel>> listenToData() async* {
    yield* _dao.listenToData();
  }
}
