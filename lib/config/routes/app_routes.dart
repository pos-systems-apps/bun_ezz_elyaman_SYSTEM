import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/features/add_customer/logic/add_customer_cubit.dart';
import 'package:pos_system/features/add_customer/ui/add_customer_screen.dart';
import 'package:pos_system/features/button_navigation/logic/button_navigation_cubit.dart';
import 'package:pos_system/features/button_navigation/ui/button_navigation_screen.dart';
import 'package:pos_system/features/create_visit/logic/create_visit_cubit.dart';
import 'package:pos_system/features/create_visit/ui/create_visit_screen.dart';
import 'package:pos_system/features/customers/logic/customers_cubit.dart';
import 'package:pos_system/features/customers/ui/customers_screen.dart';
import 'package:pos_system/features/invoice/logic/invoice_cubit.dart';
import 'package:pos_system/features/invoice/ui/electronic_invoice_screen.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/ui/reseat_screen.dart';
import 'package:pos_system/features/setting/ui/setting_screen.dart';
import 'package:pos_system/features/splash/ui/splash_screen.dart';
import 'package:pos_system/features/transfer_section/logic/transfer_section_cubit.dart';
import 'package:pos_system/features/transfer_section/ui/transfer_section_screen.dart';

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

      case Routes.reseatScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<SalesCubit>.value(
                  value: SalesCubit.get(args['context']),
                  child: ReseatScreen(),
                ));
      case Routes.settingScreen:
        return MaterialPageRoute(builder: (_) => SettingScreen());

      case Routes.electronicInvoiceScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => InvoiceCubit(getIt())
                    ..getInvoiceDetails(args['invoiceId']),
                  child: ElectronicInvoiceScreen(),
                ));
      case Routes.createVisitScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => CreateVisitCubit(getIt(), getIt()),
                  child: CreateVisitScreen(),
                ));
      case Routes.customersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => CustomersCubit(getIt())..getUsers(),
                  child: CustomersScreen(),
                ));
      case Routes.addCustomerScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => AddCustomerCubit(getIt()),
                  child: AddCustomerScreen(),
                ));
      case Routes.transferSectionScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => TransferSectionCubit(getIt()),
                  child: TransferSectionScreen(),
                ));

      // case Routes.printInvoiceScreen:
      //   return MaterialPageRoute(builder: (_) => PrintInvoiceScreen());
      default:
        return null;
    }
  }
}
