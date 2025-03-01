import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:get_it/get_it.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/add_customer/data/repo/add_customer_repo.dart';
import 'package:pos_system/features/add_customer/data/services/add_customer_service.dart';
import 'package:pos_system/features/add_transfer_section/data/repo/add_transfer_section_repo.dart';
import 'package:pos_system/features/add_transfer_section/data/services/add_transfer_section_service.dart';
import 'package:pos_system/features/all_courses/data/repo/all_courses_repo.dart';
import 'package:pos_system/features/all_courses/data/services/all_courses_service.dart';
import 'package:pos_system/features/cash_invoice/data/repo/cash_invoice_repo.dart';
import 'package:pos_system/features/cash_invoice/data/services/cash_invoice_service.dart';
import 'package:pos_system/features/collections/data/repo/collections_repo.dart';
import 'package:pos_system/features/collections/data/services/collections_service.dart';
import 'package:pos_system/features/create_visit/data/repo/create_visit_repo.dart';
import 'package:pos_system/features/create_visit/data/services/create_visit_service.dart';
import 'package:pos_system/features/fund_list/data/repo/fund_list_repo.dart';
import 'package:pos_system/features/fund_list/data/services/fund_list_service.dart';
import 'package:pos_system/features/invoice/data/repo/invoice_repo.dart';
import 'package:pos_system/features/invoice/data/services/invoice_service.dart';
import 'package:pos_system/features/leave_requests/data/repo/leave_requests_repo.dart';
import 'package:pos_system/features/leave_requests/data/services/leave_requests_service.dart';
import 'package:pos_system/features/my_requests/data/repo/my_requests_repo.dart';
import 'package:pos_system/features/my_requests/data/services/my_requests_service.dart';
import 'package:pos_system/features/my_requests/logic/my_requests_cubit.dart';
import 'package:pos_system/features/recommendations_from_manager/data/repo/recommendations_from_manager_repo.dart';
import 'package:pos_system/features/recommendations_from_manager/data/services/recommendations_from_manager_service.dart';
import 'package:pos_system/features/return_invoice/data/repo/return_invoice_repo.dart';
import 'package:pos_system/features/return_invoice/data/services/return_invoice_service.dart';

import 'package:pos_system/features/sales/data/repo/sales_repo.dart';
import 'package:pos_system/features/sales/data/services/sales_service.dart';
import 'package:pos_system/features/sales_invoice/data/repo/sales_invoice_repo.dart';
import 'package:pos_system/features/sales_invoice/data/services/sales_invoice_service.dart';
import 'package:pos_system/features/splash/data/repo/splash_repo.dart';
import 'package:pos_system/features/splash/data/services/splash_service.dart';
import 'package:pos_system/features/statistics/data/repo/statistics_repo.dart';
import 'package:pos_system/features/statistics/data/services/statistics_service.dart';
import 'package:pos_system/features/transfers_section/data/repo/transfer_section_repo.dart';
import 'package:pos_system/features/transfers_section/data/services/transfer_section_service.dart';
import 'package:pos_system/features/visits_list/data/repo/visits_list_repo.dart';
import 'package:pos_system/features/visits_list/data/services/visits_list_service.dart';

import '../../features/login/data/repo/login_repo.dart';
import '../../features/login/data/services/login_service.dart';
import '../api/api_consumer.dart';
import '../api/app_interceptor.dart';
import '../api/http_consumer.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  static Future<void> init() async {
    ///login
    getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
    getIt.registerFactory<LoginService>(
        () => LoginService(apiConsumer: getIt()));

    ///splash
    getIt.registerLazySingleton<SplashRepo>(() => SplashRepo(getIt()));
    getIt.registerFactory<SplashService>(
        () => SplashService(apiConsumer: getIt()));

    ///statics
    getIt.registerLazySingleton<StatisticsRepo>(() => StatisticsRepo(getIt()));
    getIt.registerFactory<StatisticsService>(
        () => StatisticsService(apiConsumer: getIt()));

    ///collections
    getIt
        .registerLazySingleton<CollectionsRepo>(() => CollectionsRepo(getIt()));
    getIt.registerFactory<CollectionsService>(
        () => CollectionsService(apiConsumer: getIt()));

    ///sales
    getIt.registerLazySingleton<SalesRepo>(() => SalesRepo(getIt()));
    getIt.registerFactory<SalesService>(
        () => SalesService(apiConsumer: getIt()));

    ///invoice
    getIt.registerLazySingleton<InvoiceRepo>(() => InvoiceRepo(getIt()));
    getIt.registerFactory<InvoiceService>(
        () => InvoiceService(apiConsumer: getIt()));

    ///setting

    ///create visit
    getIt
        .registerLazySingleton<CreateVisitRepo>(() => CreateVisitRepo(getIt()));
    getIt.registerFactory<CreateVisitService>(
        () => CreateVisitService(apiConsumer: getIt()));

    ///add user
    getIt
        .registerLazySingleton<AddCustomerRepo>(() => AddCustomerRepo(getIt()));
    getIt.registerFactory<AddCustomerService>(
        () => AddCustomerService(apiConsumer: getIt()));

    ///add transfers sections
    getIt.registerLazySingleton<AddTransferSectionRepo>(
        () => AddTransferSectionRepo(getIt()));
    getIt.registerFactory<AddTransferSectionService>(
        () => AddTransferSectionService(apiConsumer: getIt()));

    /// transfers sections
    getIt.registerLazySingleton<TransferSectionRepo>(
        () => TransferSectionRepo(getIt()));
    getIt.registerFactory<TransferSectionService>(
        () => TransferSectionService(apiConsumer: getIt()));

    ///fund list
    getIt.registerLazySingleton<FundListRepo>(
        () => FundListRepo(getIt()));
    getIt.registerFactory<FundListService>(
        () => FundListService(apiConsumer: getIt()));
    ///sales invoice
    getIt.registerLazySingleton<SalesInvoiceRepo>(
            () => SalesInvoiceRepo(getIt()));
    getIt.registerFactory<SalesInvoiceService>(
            () => SalesInvoiceService(apiConsumer: getIt()));
    ///return invoice
    getIt.registerLazySingleton<ReturnInvoiceRepo>(
            () => ReturnInvoiceRepo(getIt()));
    getIt.registerFactory<ReturnInvoiceService>(
            () => ReturnInvoiceService(apiConsumer: getIt()));

    ///my requests
    getIt.registerLazySingleton<MyRequestsRepo>(
            () => MyRequestsRepo(getIt()));
    getIt.registerFactory<MyRequestsService>(
            () => MyRequestsService(apiConsumer: getIt()));

    ///leave requests
    getIt.registerLazySingleton<LeaveRequestsRepo>(
            () => LeaveRequestsRepo(getIt()));
    getIt.registerFactory<LeaveRequestsService>(
            () => LeaveRequestsService(apiConsumer: getIt()));

    ///all courses
    getIt.registerLazySingleton<AllCoursesRepo>(
            () => AllCoursesRepo(getIt()));
    getIt.registerFactory<AllCoursesService>(
            () => AllCoursesService(apiConsumer: getIt()));

    ///all courses
    getIt.registerLazySingleton<RecommendationsFromManagerRepo>(
            () => RecommendationsFromManagerRepo(getIt()));
    getIt.registerFactory<RecommendationsFromManagerService>(
            () => RecommendationsFromManagerService(apiConsumer: getIt()));

    ///visit list
    getIt.registerLazySingleton<VisitsListRepo>(
            () => VisitsListRepo(getIt()));
    getIt.registerFactory<VisitsListService>(
            () => VisitsListService(apiConsumer: getIt()));

    ///Cash Invoice
    getIt.registerLazySingleton<CashInvoiceRepo>(
            () => CashInvoiceRepo(getIt()));
    getIt.registerFactory<CashInvoiceService>(
            () => CashInvoiceService(apiConsumer: getIt()));

    ///constant
    // getIt.registerLazySingleton<EndPoints>(() => EndPoints());
    getIt.registerLazySingleton<AppConstant>(() => AppConstant());
    getIt.registerLazySingleton<AppColors>(() => AppColors());

    ///core

    getIt.registerLazySingleton<AppInterceptor>(() => AppInterceptor());

    getIt.registerLazySingleton<ApiConsumer>(() => HttpConsumer(getIt()));
    getIt.registerLazySingleton(() => http.Client());

    ///shared secure
    FlutterSecureStorage secureStorage = FlutterSecureStorage();
    getIt.registerLazySingleton(() => secureStorage);
  }
}
