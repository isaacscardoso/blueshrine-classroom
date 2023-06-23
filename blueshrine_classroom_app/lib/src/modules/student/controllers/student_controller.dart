import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../core/global/constants.dart';
import '../../../models/student_model.dart';
import '../../../repositories/student/student_repository.dart';
import '../enums/student_state_status.dart';

part 'student_controller.g.dart';

class StudentController = StudentControllerBase with _$StudentController;

abstract class StudentControllerBase with Store {
  final StudentRepository _studentRepository;

  StudentControllerBase(this._studentRepository);

  @readonly
  var _stateStatus = StudentStateStatus.initial;

  @readonly
  var _students = <StudentModel>[];

  @readonly
  String? _errorMessage;

  @readonly
  String? _filteredName;

  @readonly
  bool? _filterEnabled;

  @readonly
  StudentModel? _studentSelected;

  @action
  Future<void> add() async {
    _stateStatus = StudentStateStatus.loading;
    await Future.delayed(Duration.zero);
    _studentSelected = null;
    _stateStatus = StudentStateStatus.adding;
  }

  @action
  Future<void> update(StudentModel student) async {
    _stateStatus = StudentStateStatus.loading;
    await Future.delayed(Duration.zero);
    _studentSelected = student;
    _stateStatus = StudentStateStatus.updating;
  }

  @action
  Future<void> fetchAll() async {
    try {
      _stateStatus = StudentStateStatus.loading;
      _students = await _studentRepository.fetchAll(name: _filteredName);
      _stateStatus = StudentStateStatus.loaded;
    } catch (e, s) {
      log(RepositoryErrorMessages.fetchAll.message, error: e, stackTrace: s);
      _stateStatus = StudentStateStatus.error;
      _errorMessage = RepositoryErrorMessages.fetchAll.message;
    }
  }

  @action
  Future<void> fetchById(String name) async {
    _filteredName = name;
    await fetchAll();
  }

  @action
  void changeFilter(bool? isEnabled) {
    _filterEnabled = isEnabled;
    fetchAll();
  }
}
