import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../controllers/student_controller.dart';
import '../../enums/student_state_status.dart';
import '../../student_routes.dart';

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
            Modular.to.pushNamed(
              StudentRoutes.studentForm,
            );
            break;
          case StudentStateStatus.updating:
            Modular.to.pushNamed(
              StudentRoutes.studentForm,
              arguments: studentController.studentSelected?.id,
            );
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
              ElevatedButton(
                onPressed: () => studentController.add(),
                child: const Text('Adicionar Aluno'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Editar Aluno'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
