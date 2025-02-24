import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/features/button_navigation/logic/button_navigation_cubit.dart';
import 'package:pos_system/features/button_navigation/ui/button_navigation_screen.dart';
import 'package:pos_system/features/invoice/logic/invoice_cubit.dart';
import 'package:pos_system/features/invoice/ui/electronic_invoice_screen.dart';
import 'package:pos_system/features/invoice/ui/print_invoice_screen.dart';
import 'package:pos_system/features/sales/ui/reseat_screen.dart';
import 'package:pos_system/features/setting/ui/setting_screen.dart';
import 'package:pos_system/features/splash/ui/splash_screen.dart';

import '../../core/services/services_locator.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/login_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());

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
      // case Routes.reseatScreen:
      //   return MaterialPageRoute(builder: (_) => ReseatScreen());
      case Routes.settingScreen:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case Routes.electronicInvoiceScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => InvoiceCubit(getIt()),
                  child: ElectronicInvoiceScreen(),
                ));
      case Routes.printInvoiceScreen:
        return MaterialPageRoute(builder: (_) => PrintInvoiceScreen());
      default:
        return null;
    }
  }
}
