import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

//import './app_routes.dart';

class AppWidget extends StatelessWidget {
  late final GlobalKey<NavigatorState> _navigatorKey;

  AppWidget({super.key}) {
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    //Modular.setInitialRoute(AppRoutes.studentModule);
    Modular.setNavigatorKey(_navigatorKey);

    return MaterialApp.router(
      title: 'Blueshrine Classroom',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
