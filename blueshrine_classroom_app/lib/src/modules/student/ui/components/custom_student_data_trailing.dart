import 'package:flutter/material.dart';

class CustomStudentDataTrailing extends StatelessWidget {
  const CustomStudentDataTrailing({super.key});

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
