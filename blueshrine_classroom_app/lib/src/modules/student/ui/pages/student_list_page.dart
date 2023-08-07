import 'package:blueshrine_classroom/src/modules/student/ui/pages/student_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';

import '../../../../models/student_model.dart';
import '../../bloc/student_bloc.dart';
import '../../bloc/student_event.dart';
import '../../bloc/student_state.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage>
    with Loader, Messages {
  final studentBloc = Modular.get<StudentBloc>();
  final StudentModel student = StudentModel(
    name: 'Isaac Cardoso Silva',
    email: 'isaacscardosoblues@gmail.com',
    phone: '37 999532728',
    monthlyPayment: 500.0,
    isActive: true,
  );

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     statusReactionDisposer =
  //         reaction((_) => studentController.stateStatus, (status) async {
  //       switch (status) {
  //         case StudentStateStatus.initial:
  //           break;
  //         case StudentStateStatus.loading:
  //           showLoader();
  //           break;
  //         case StudentStateStatus.loaded:
  //           hideLoader();
  //           break;
  //         case StudentStateStatus.error:
  //           hideLoader();
  //           showError(studentController.errorMessage ?? '');
  //           break;
  //         case StudentStateStatus.adding:
  //           hideLoader();
  //           await Modular.to.pushNamed(StudentRoutes.studentForm);
  //           //studentController.fetchAll();
  //           break;
  //         case StudentStateStatus.updating:
  //           hideLoader();
  //           await Modular.to.pushNamed(
  //             StudentRoutes.studentForm,
  //             arguments: studentController.studentSelected?.id,
  //           );
  //           //studentController.fetchAll();
  //           break;
  //       }
  //     });
  //   });
  // }

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
          child: BlocProvider(
            create: (context) => studentBloc,
            child: BlocBuilder<StudentBloc, StudentState>(
              builder: (context, state) {
                // return ListView.builder(
                //   itemCount: studentBloc.students.length,
                //   itemBuilder: (context, index) {
                //     return StudentDataPage(
                //       student: studentBloc.students[index],
                //       studentBloc: studentBloc,
                //     );
                //   },
                // );

                if (state is Initial) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Estado Inicial'),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () =>
                              studentBloc.add(Saving(student: student)),
                          child: const Text('Adicionar'),
                        ),
                      ],
                    ),
                  );
                } else if (state is Loaded) {
                  return ListView.builder(
                    itemCount: state.students.length,
                    itemBuilder: (context, index) {
                      return StudentDataPage(
                        student: state.students[index],
                        studentBloc: studentBloc,
                      );
                    },
                  );
                } else if (state is Saved) {
                  studentBloc.add(Loading());
                  return const Center();
                } else if (state is Deleted) {
                  return const Center(child: Text('Deletado'));
                } else if (state is Error) {
                  return const Center(child: Text('Erro'));
                } else {
                  return const Center(child: Text('Desconhecido'));
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
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
