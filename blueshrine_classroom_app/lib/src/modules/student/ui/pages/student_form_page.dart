import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StudentFormPage extends StatefulWidget {
  const StudentFormPage({super.key});

  @override
  State<StudentFormPage> createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  @override
  Widget build(BuildContext context) {
    final int? studentId = Modular.args.data;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${studentId != null ? 'Editar' : 'Adicionar'} Aluno',
        ),
      ),
      body: Container(),
    );
  }
}
