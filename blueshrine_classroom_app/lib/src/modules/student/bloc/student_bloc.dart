import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/global/constants.dart';
import '../../../models/student_model.dart';
import '../../../repositories/student/student_repository.dart';

import './student_event.dart';
import './student_state.dart';

final class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository _studentRepository;
  var students = <StudentModel>[];

  StudentBloc(this._studentRepository) : super(Initial()) {
    on<Loading>((event, emit) => emit(Loaded(students: students)));
    on<Saving>((event, emit) => emit(Saved()));
    on<Deleting>((event, emit) => emit(Deleted()));
  }

  Stream<StudentState> mapEventToState(StudentEvent event) async* {
    if (event is Loading) {
      yield* _mapLoadingToState();
    } else if (event is Saving) {
      yield* _mapSavingToState(student: event.student);
    } else if (event is Deleting) {
      yield* _mapDeletingToState(studentId: event.student.id!);
    }
  }

  Stream<StudentState> _mapLoadingToState() async* {
    try {
      students = await _studentRepository.fetchAll();
      yield Loaded(students: students);
    } catch (e, s) {
      log(RepositoryErrorMessages.fetchAll.message, error: e, stackTrace: s);
      yield Error(message: RepositoryErrorMessages.fetchAll.message);
    }
  }

  Stream<StudentState> _mapSavingToState({
    required StudentModel student,
  }) async* {
    try {
      await _studentRepository.save(student);
      students = await _studentRepository.fetchAll();
      yield Saved();
      yield Loaded(students: students);
    } catch (e, s) {
      log(RepositoryErrorMessages.saving.message, error: e, stackTrace: s);
      yield Error(message: RepositoryErrorMessages.saving.message);
    }
  }

  Stream<StudentState> _mapDeletingToState({required int studentId}) async* {
    try {
      await _studentRepository.delete(studentId);
      students = await _studentRepository.fetchAll();
      yield Deleted();
      yield Loaded(students: students);
    } catch (e, s) {
      log(RepositoryErrorMessages.delete.message, error: e, stackTrace: s);
      yield Error(message: RepositoryErrorMessages.delete.message);
    }
  }
}
