
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/features/button_navigation/logic/button_navigation_cubit.dart';
import 'package:pos_system/features/button_navigation/ui/button_navigation_screen.dart';

import '../../core/services/services_locator.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/login_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(getIt()),
                  child: LoginScreen(),
                ));

      case Routes.buttonNavigationScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ButtonNavigationCubit(),
                  child: ButtonNavigationScreen(),
                ));

      default:
        return null;
    }
  }
}
