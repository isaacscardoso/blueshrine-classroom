import 'package:flutter_modular/flutter_modular.dart';

import './ui/pages/student_list_page.dart';
import './ui/pages/student_form_page.dart';
import './controllers/student_controller.dart';
import './controllers/student_form_controller.dart';
import './bloc/student_bloc.dart';

class StudentModule extends Module {
  @override
  List<Bind> get binds {
    return <Bind<Object>>[
      Bind.lazySingleton((i) => StudentController(i())),
      Bind.lazySingleton((i) => StudentFormController(i())),
      Bind.lazySingleton((i) => StudentBloc(i())),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return <ModularRoute>[
      ChildRoute('/', child: (context, args) => const StudentListPage()),
      ChildRoute(
        '/form',
        child: (context, args) => const StudentFormPage(),
      ),
    ];
  }
}
