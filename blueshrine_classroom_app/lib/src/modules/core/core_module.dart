import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/student/student_repository.dart';
import '../../repositories/student/student_repository_impl.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds {
    return <Bind<Object>>[
      Bind.lazySingleton<StudentRepository>(
        (i) => StudentRepositoryImpl(),
        export: true,
      ),
    ];
  }
}
