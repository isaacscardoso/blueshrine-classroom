import 'package:equatable/equatable.dart';

import '../../../models/student_model.dart';

sealed class StudentEvent extends Equatable {
  const StudentEvent();

  @override
  List<Object?> get props => [];
}

final class Loading extends StudentEvent {}

final class Saving extends StudentEvent {
  final StudentModel student;

  const Saving({required this.student});

  @override
  List<Object?> get props => [student];
}

final class Deleting extends StudentEvent {
  final StudentModel student;

  const Deleting({required this.student});

  @override
  List<Object?> get props => [student];
}
