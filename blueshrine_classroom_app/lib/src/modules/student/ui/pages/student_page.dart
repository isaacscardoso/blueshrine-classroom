import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../models/student_model.dart';
import '../../../../repositories/student/student_repository.dart';
import '../../../../repositories/student/student_repository_impl.dart';
import '../../controllers/student_controller.dart';
import '../../enums/student_state_status.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  late final ReactionDisposer statusReactionDisposer;
  final studentController = Modular.get<StudentController>();

  String stateStatus = '(...)';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusReactionDisposer =
          reaction((_) => studentController.stateStatus, (status) async {
        switch (status) {
          case StudentStateStatus.initial:
            stateStatus = 'Inicial';
            break;
          case StudentStateStatus.loading:
            stateStatus = 'Carregando';
            break;
          case StudentStateStatus.loaded:
            stateStatus = 'Carregado';
            break;
          case StudentStateStatus.error:
            stateStatus = 'Erro';
            break;
          case StudentStateStatus.adding:
            stateStatus = 'Adicionando';
            break;
          case StudentStateStatus.updating:
            stateStatus = 'Atualizando';
            break;
        }
      });
      studentController.fetchAll();
    });
  }

  @override
  void dispose() {
    statusReactionDisposer();
    super.dispose();
  }

  void insert() {
    final StudentModel student = StudentModel(
      name: 'Isaac',
      description: 'Rei Azulado',
      isActive: true,
    );
    Modular.get<StudentRepositoryImpl>().insert(student);
  }

  void fetchAll() async {
    final students = await Modular.get<StudentRepositoryImpl>().fetchAll();
    for (var s in students) {
      print(
        'ID: ${s.id} - Name: ${s.name} - CreatedAt: ${s.createdAt} - UpdatedAt: ${s.updatedAt} Status: ${s.isActive}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classroom'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Observer(
                builder: (_) => Text('State Status: $stateStatus'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => fetchAll(),
                child: const Text('Fetch All'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => insert(),
                child: const Text('Insert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
