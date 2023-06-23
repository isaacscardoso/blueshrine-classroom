import 'package:flutter_modular/flutter_modular.dart';

import './modules/core/core_module.dart';
import './modules/student/student_module.dart';
import './app_routes.dart';

class AppModule extends Module {
  @override
  List<Module> get imports {
    return <Module>[
      CoreModule(),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return <ModularRoute>[
      ModuleRoute(
        AppRoutes.studentModule,
        module: StudentModule(),
        transition: TransitionType.fadeIn,
      )
    ];
  }
}
