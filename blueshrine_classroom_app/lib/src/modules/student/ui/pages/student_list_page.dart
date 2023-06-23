import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../models/student_model.dart';
import '../../controllers/student_controller.dart';
import '../../enums/student_state_status.dart';
import '../../student_routes.dart';
import './student_data_page.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
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

  final StudentModel student1 = StudentModel(
    id: 1,
    name: 'Isaac',
    email: 'isaac@gmail.com',
    phone: '(37) 9 9953-2728',
    monthlyPayment: 300.0,
    isActive: true,
  );
  final StudentModel student2 = StudentModel(
    id: 2,
    name: 'Moema',
    email: 'moema@gmail.com',
    phone: '(37) 9 9942-7716',
    monthlyPayment: 300.0,
    isActive: true,
  );

  final students = <StudentModel>[];

  @override
  Widget build(BuildContext context) {
    students.addAll([student1, student2]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Classroom'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[100]!,
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              return StudentDataPage(
                student: students[index],
                studentController: studentController,
              );
            },
          ),
        ),
      ),
    );
  }
}
