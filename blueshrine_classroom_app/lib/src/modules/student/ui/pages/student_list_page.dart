import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../controllers/student_controller.dart';
import '../../enums/student_state_status.dart';
import '../../student_routes.dart';
import './student_data_page.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage>
    with Loader, Messages {
  late final ReactionDisposer statusReactionDisposer;
  final studentController = Modular.get<StudentController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusReactionDisposer =
          reaction((_) => studentController.stateStatus, (status) async {
        switch (status) {
          case StudentStateStatus.initial:
            break;
          case StudentStateStatus.loading:
            showLoader();
            break;
          case StudentStateStatus.loaded:
            hideLoader();
            break;
          case StudentStateStatus.error:
            hideLoader();
            showError(studentController.errorMessage ?? '');
            break;
          case StudentStateStatus.adding:
            hideLoader();
            await Modular.to.pushNamed(
              StudentRoutes.studentForm,
            );
            studentController.fetchAll();
            break;
          case StudentStateStatus.updating:
            hideLoader();
            await Modular.to.pushNamed(
              StudentRoutes.studentForm,
              arguments: studentController.studentSelected?.id,
            );
            studentController.fetchAll();
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
      backgroundColor: Colors.grey[100]!,
      appBar: AppBar(
        title: const Text('Classroom'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.filter_list),
            splashRadius: 22,
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Observer(
            builder: (_) => ListView.builder(
              itemCount: studentController.students.length,
              itemBuilder: (context, index) {
                return StudentDataPage(
                  student: studentController.students[index],
                  studentController: studentController,
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => studentController.insert(),
        backgroundColor: Colors.green,
        child: const Icon(Icons.person_add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.black,
        child: IconTheme(
          data: const IconThemeData(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(width: 40),
              IconButton(
                icon: const Icon(Icons.home),
                splashRadius: 22,
                onPressed: () {},
              ),
              const SizedBox(width: 40),
              IconButton(
                icon: const Icon(Icons.list),
                splashRadius: 22,
                onPressed: () {},
              ),
              const SizedBox(width: 40),
              IconButton(
                icon: const Icon(Icons.checklist_rtl),
                splashRadius: 22,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
