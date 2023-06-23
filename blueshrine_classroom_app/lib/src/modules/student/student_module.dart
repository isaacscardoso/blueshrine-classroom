import 'package:flutter_modular/flutter_modular.dart';

import './ui/pages/student_page.dart';
import './ui/pages/student_form_page.dart';
import './controllers/student_controller.dart';

class StudentModule extends Module {
  @override
  List<Bind> get binds {
    return <Bind<Object>>[
      Bind.lazySingleton((i) => StudentController(i())),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return <ModularRoute>[
      ChildRoute('/', child: (context, args) => const StudentPage()),
      ChildRoute(
        '/form',
        child: (context, args) => const StudentFormPage(),
      ),
    ];
  }
}
