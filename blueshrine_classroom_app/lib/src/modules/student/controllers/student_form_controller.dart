import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../core/global/constants.dart';
import '../../../models/student_model.dart';
import '../../../repositories/student/student_repository.dart';
import '../enums/student_form_state_status.dart';

part 'student_form_controller.g.dart';

class StudentFormController = StudentFormControllerBase
    with _$StudentFormController;

abstract class StudentFormControllerBase with Store {
  final StudentRepository _studentRepository;

  @readonly
  var _stateStatus = StudentFormStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  StudentModel? _studentModel;

  StudentFormControllerBase(this._studentRepository);

  @action
  Future<void> save({
    required String name,
    required String email,
    required String phone,
    required double monthlyPayment,
    String? description,
  }) async {
    try {
      _stateStatus = StudentFormStateStatus.loading;
      if (_studentModel?.id == null) {
        final student = StudentModel(
          name: name,
          email: email,
          phone: phone,
          monthlyPayment: monthlyPayment,
          description: description,
          isActive: _studentModel?.isActive ?? true,
        );
        await _studentRepository.insert(student);
      } else {
        final student = StudentModel(
          id: _studentModel?.id,
          name: name,
          email: email,
          phone: phone,
          monthlyPayment: monthlyPayment,
          description: description,
          isActive: _studentModel?.isActive ?? true,
        );
        await _studentRepository.edit(student);
      }
      _stateStatus = StudentFormStateStatus.saved;
    } catch (e, s) {
      log(RepositoryErrorMessages.insert.message, error: e, stackTrace: s);
      _stateStatus = StudentFormStateStatus.error;
      _errorMessage = RepositoryErrorMessages.insert.message;
    }
  }

  @action
  Future<void> loadData(int? id) async {
    try {
      _stateStatus = StudentFormStateStatus.loading;
      _studentModel = null;
      if (id != null) _studentModel = await _studentRepository.fetchById(id);
      _stateStatus = StudentFormStateStatus.loaded;
    } catch (e, s) {
      log(RepositoryErrorMessages.fetchAll.message, error: e, stackTrace: s);
      _stateStatus = StudentFormStateStatus.errorOnLoad;
      _errorMessage = RepositoryErrorMessages.fetchAll.message;
    }
  }

  @action
  Future<void> delete() async {
    try {
      _stateStatus = StudentFormStateStatus.loading;
      if (_studentModel != null && _studentModel!.id != null) {
        await _studentRepository.delete(_studentModel!.id!);
        _stateStatus = StudentFormStateStatus.deleted;
      }
      await Future.delayed(Duration.zero);
      _stateStatus = StudentFormStateStatus.error;
      _errorMessage = RepositoryErrorMessages.notFound.message;
    } catch (e, s) {
      log(RepositoryErrorMessages.delete.message, error: e, stackTrace: s);
      _stateStatus = StudentFormStateStatus.error;
      _errorMessage = RepositoryErrorMessages.delete.message;
    }
  }
}
