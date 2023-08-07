import 'package:flutter/material.dart';

import '../../../../models/student_model.dart';
import '../../bloc/student_bloc.dart';

class CustomStudentDataTrailing extends StatelessWidget {
  final StudentModel student;
  final StudentBloc studentBloc;

  const CustomStudentDataTrailing({
    super.key,
    required this.student,
    required this.studentBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: () {},
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
