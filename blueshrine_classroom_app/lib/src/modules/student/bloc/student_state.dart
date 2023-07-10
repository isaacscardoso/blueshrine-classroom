import 'package:equatable/equatable.dart';

import '../../../models/student_model.dart';

sealed class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object?> get props => [];
}

final class Loaded extends StudentState {
  final List<StudentModel> students;

  const Loaded({required this.students});

  @override
  List<Object?> get props => [students];
}

final class Saved extends StudentState {}

final class Updated extends StudentState {}

final class Deleted extends StudentState {}

final class Error extends StudentState {
  final String message;

  const Error({required this.message});

  @override
  List<Object?> get props => [message];
}
