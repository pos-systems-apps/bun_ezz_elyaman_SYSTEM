import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/features/add_customer/logic/add_customer_cubit.dart';
import 'package:pos_system/features/add_customer/ui/add_customer_screen.dart';
import 'package:pos_system/features/add_leave_request/logic/add_leave_request_cubit.dart';
import 'package:pos_system/features/add_leave_request/ui/add_leave_request_screen.dart';
import 'package:pos_system/features/add_my_request/logic/add_my_request_cubit.dart';
import 'package:pos_system/features/add_my_request/ui/add_my_request_screen.dart';
import 'package:pos_system/features/add_transfer_section/logic/add_transfer_section_cubit.dart';
import 'package:pos_system/features/add_transfer_section/ui/add_transfer_section_screen.dart';
import 'package:pos_system/features/all_courses/logic/all_courses_cubit.dart';
import 'package:pos_system/features/all_courses/ui/all_courses_screen.dart';
import 'package:pos_system/features/button_navigation/logic/button_navigation_cubit.dart';
import 'package:pos_system/features/button_navigation/ui/button_navigation_screen.dart';
import 'package:pos_system/features/cash_invoice/logic/cash_invoice_cubit.dart';
import 'package:pos_system/features/cash_invoice/ui/cash_invoice_screen.dart';
import 'package:pos_system/features/create_monthly_plan/logic/create_monthly_plan_cubit.dart';
import 'package:pos_system/features/create_monthly_plan/ui/create_monthly_plan_screen.dart';
import 'package:pos_system/features/create_visit/logic/create_visit_cubit.dart';
import 'package:pos_system/features/create_visit/ui/create_visit_screen.dart';
import 'package:pos_system/features/customers/logic/customers_cubit.dart';
import 'package:pos_system/features/customers/ui/customers_screen.dart';
import 'package:pos_system/features/fund_list/logic/fund_list_cubit.dart';
import 'package:pos_system/features/fund_list/ui/fund_list_screen.dart';
import 'package:pos_system/features/leave_requests/logic/leave_requests_cubit.dart';
import 'package:pos_system/features/leave_requests/ui/leave_requests_screen.dart';
import 'package:pos_system/features/my_requests/logic/my_requests_cubit.dart';
import 'package:pos_system/features/my_requests/ui/my_requests_screen.dart';
import 'package:pos_system/features/print_cash_invoice/logic/print_cash_invoice_cubit.dart';
import 'package:pos_system/features/print_cash_invoice/ui/electronic_cash_invoice_screen.dart';
import 'package:pos_system/features/print_invoice/logic/print_invoice_cubit.dart';
import 'package:pos_system/features/print_invoice/ui/electronic_invoice_screen.dart';
import 'package:pos_system/features/print_resources_invoices/logic/print_resources_invoices_cubit.dart';
import 'package:pos_system/features/print_resources_invoices/ui/electronic_resources_invoices_screen.dart';
import 'package:pos_system/features/recommendations_from_manager/logic/recommendations_from_manager_cubit.dart';
import 'package:pos_system/features/recommendations_from_manager/ui/recommendations_from_manager_screen.dart';
import 'package:pos_system/features/request_resources_invoices/logic/request_resources_invoices_cubit.dart';
import 'package:pos_system/features/request_resources_invoices/ui/request_resources_invoices_screen.dart';
import 'package:pos_system/features/required_visits_list/logic/required_visits_list_cubit.dart';
import 'package:pos_system/features/required_visits_list/ui/required_visits_list_screen.dart';
import 'package:pos_system/features/return_invoice/logic/return_invoice_cubit.dart';
import 'package:pos_system/features/return_invoice/ui/return_invoice_screen.dart';
import 'package:pos_system/features/return_resources_invoices/logic/return_resources_invoices_cubit.dart';
import 'package:pos_system/features/return_resources_invoices/ui/return_resources_invoices_screen.dart';
import 'package:pos_system/features/salary/logic/salary_cubit.dart';
import 'package:pos_system/features/salary/ui/salary_screen.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/ui/reseat_screen.dart';
import 'package:pos_system/features/sales_invoice/logic/sales_invoice_cubit.dart';
import 'package:pos_system/features/sales_invoice/ui/sales_invoice_screen.dart';
import 'package:pos_system/features/setting/logic/setting_cubit.dart';
import 'package:pos_system/features/setting/ui/setting_screen.dart';
import 'package:pos_system/features/splash/ui/splash_screen.dart';
import 'package:pos_system/features/transfers_section/logic/transfer_section_cubit.dart';
import 'package:pos_system/features/transfers_section/ui/transfer_section_screen.dart';
import 'package:pos_system/features/visits_carried_out/logic/visits_carried_out_cubit.dart';
import 'package:pos_system/features/visits_carried_out/ui/visits_carried_out_screen.dart';
import 'package:pos_system/features/zeroing_my_trips/logic/zeroing_my_trips_cubit.dart';
import 'package:pos_system/features/zeroing_my_trips/ui/zeroing_my_trips_screen.dart';

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
                  create: (context) => SalesCubit(getIt(), getIt(), getIt())
                    ..getCategories(),
                  child: BlocProvider(
                    create: (context) => ButtonNavigationCubit(),
                    child: ButtonNavigationScreen(),
                  ),
                ));

      case Routes.reseatScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<SalesCubit>.value(
                  value: SalesCubit.get(args['context']),
                  child: ReseatScreen(),
                ));
      case Routes.settingScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => LogOutCubit(getIt()),
                  child: SettingScreen(),
                ));

      case Routes.electronicInvoiceScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => PrintInvoiceCubit(getIt())
                    ..getInvoiceDetails(args['invoiceId']),
                  child: ElectronicInvoiceScreen(),
                ));
      case Routes.electronicCashInvoiceScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => PrintCashInvoiceCubit(getIt())
                    ..getCashInvoiceDetails(args['instalmentID']),
                  child: ElectronicCashInvoiceScreen(),
                ));
      case Routes.electronicResourcesInvoicesScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => PrintResourcesInvoicesCubit(getIt())
                    ..getInvoiceDetails(args['invoiceId']),
                  child: ElectronicResourcesInvoicesScreen(),
                ));
      // case Routes.createVisitScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (_) => CreateVisitCubit(getIt(), getIt()),
      //             child: CreateVisitScreen(),
      //           ));
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
      // case Routes.addTransferSectionScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (_) =>
      //                 AddTransferSectionCubit(getIt(), getIt())..getAccounts(),
      //             child: AddTransferSectionScreen(),
      //           ));
      // case Routes.transferSectionScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (_) =>
      //                 TransferSectionCubit(getIt())..getTransactionSection(),
      //             child: TransferSectionScreen(),
      //           ));
      // case Routes.fundListScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (_) => FundListCubit(getIt())..getFundList(),
      //             child: FundListScreen(),
      //           ));
      case Routes.visitsCarriedOutScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) =>
                      VisitsCarriedOutCubit(getIt())..getVisitsCarriedOut(),
                  child: VisitsCarriedOutScreen(),
                ));
      case Routes.salesInvoiceScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => SalesInvoiceCubit(getIt())..getInvoices(),
                  child: SalesInvoiceScreen(),
                ));
      case Routes.requestResourcesInvoicesScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => RequestResourcesInvoicesCubit(getIt())
                    ..getRequestResourcesInvoices(),
                  child: RequestResourcesInvoicesScreen(),
                ));
      case Routes.returnResourcesInvoicesScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => ReturnResourcesInvoicesCubit(getIt())
                    ..getRequestResourcesInvoices(),
                  child: ReturnResourcesInvoicesScreen(),
                ));
      case Routes.returnInvoiceScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) =>
                      ReturnInvoiceCubit(getIt())..getReturnInvoices(),
                  child: ReturnInvoiceScreen(),
                ));
      case Routes.leaveRequestsScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) =>
                      LeaveRequestsCubit(getIt())..getAllRequestsUrl(),
                  child: LeaveRequestsScreen(),
                ));
      case Routes.myRequestsScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => MyRequestsCubit(getIt())..getAllRequestsUrl(),
                  child: MyRequestsScreen(),
                ));
      case Routes.addMyRequestScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => AddMyRequestCubit(getIt()),
                  child: AddMyRequestScreen(),
                ));
      case Routes.addLeaveRequestScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => AddLeaveRequestCubit(getIt()),
                  child: AddLeaveRequestScreen(),
                ));
      case Routes.allCoursesScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => AllCoursesCubit(getIt())..getAllCourses(),
                  child: AllCoursesScreen(),
                ));
      case Routes.recommendationsFromManagerScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => RecommendationsFromManagerCubit(getIt())
                    ..getManagerRequests(),
                  child: RecommendationsFromManagerScreen(),
                ));
      case Routes.visitsListScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => RequiredVisitsListCubit(getIt())
                    ..getRequiredVisitorList(),
                  child: RequiredVisitsListScreen(),
                ));
      case Routes.cashInvoiceScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => CashInvoiceCubit(getIt())..getCashInvoice(),
                  child: CashInvoiceScreen(),
                ));
      // case Routes.createMonthlyPlanScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (_) => CreateMonthlyPlanCubit(getIt(), getIt()),
      //             child: CreateMonthlyPlanScreen(),
      //           ));
      case Routes.salaryScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) =>
                      SalaryCubit(getIt())..getSalary(args['context']),
                  child: SalaryScreen(),
                ));
      case Routes.zeroingMyTripsScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => ZeroingMyTripsCubit(getIt()),
                  child: ZeroingMyTripsScreen(),
                ));

      default:
        return null;
    }
  }
}
