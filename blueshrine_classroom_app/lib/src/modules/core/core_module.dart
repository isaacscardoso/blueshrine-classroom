import 'package:flutter_modular/flutter_modular.dart';

import '../../core/database/data_access_object.dart';
import '../../core/database/isar_database_helper.dart';
import '../../repositories/student/student_repository.dart';
import '../../repositories/student/student_repository_impl.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds {
    return <Bind<Object>>[
      Bind.lazySingleton<DataAccessObject>(
        (i) => IsarDatabaseHelper(),
        export: true,
      ),
      Bind.lazySingleton<StudentRepository>(
        (i) => StudentRepositoryImpl(i()),
        export: true,
      ),
    ];
  }
}
