import 'package:flutter/material.dart';

import '../../../../models/student_model.dart';
import '../../controllers/student_controller.dart';

class CustomStudentDataTrailing extends StatelessWidget {
  final StudentModel student;
  final StudentController studentController;

  const CustomStudentDataTrailing({
    super.key,
    required this.student,
    required this.studentController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: () => studentController.edit(student),
          icon: const Icon(Icons.edit),
          color: Colors.blue,
          splashRadius: 22,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete),
          color: Colors.red,
          splashRadius: 22,
        ),
      ],
    );
  }
}
