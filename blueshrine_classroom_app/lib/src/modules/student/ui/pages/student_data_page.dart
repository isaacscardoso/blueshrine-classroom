import 'package:flutter/material.dart';

import '../../../../models/student_model.dart';
import '../../controllers/student_controller.dart';
import '../components/custom_student_data_trailing.dart';

class StudentDataPage extends StatelessWidget {
  final StudentModel student;
  final StudentController studentController;

  const StudentDataPage({
    super.key,
    required this.student,
    required this.studentController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(student.name),
        subtitle: Text(student.email),
        trailing: CustomStudentDataTrailing(
          student: student,
          studentController: studentController,
        ),
      ),
    );
  }
}
