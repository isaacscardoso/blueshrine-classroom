import 'package:flutter_modular/flutter_modular.dart';

import './student_page.dart';

class StudentModule extends Module {
  @override
  List<Bind> get binds {
    return <Bind<Object>>[];
  }

  @override
  List<ModularRoute> get routes {
    return <ModularRoute>[
      ChildRoute('/', child: (context, args) => const StudentPage()),
    ];
  }
}
