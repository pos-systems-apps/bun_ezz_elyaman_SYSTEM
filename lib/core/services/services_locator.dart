import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:get_it/get_it.dart';
import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/features/collections/data/repo/collections_repo.dart';
import 'package:pos_system/features/collections/data/services/collections_service.dart';
import 'package:pos_system/features/reseat/data/repo/reseat_repo.dart';
import 'package:pos_system/features/reseat/data/services/reseat_service.dart';
import 'package:pos_system/features/sales/data/repo/sales_repo.dart';
import 'package:pos_system/features/sales/data/services/sales_service.dart';
import 'package:pos_system/features/splash/data/repo/splash_repo.dart';
import 'package:pos_system/features/splash/data/services/splash_service.dart';
import 'package:pos_system/features/statistics/data/repo/statistics_repo.dart';
import 'package:pos_system/features/statistics/data/services/statistics_service.dart';

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

    ///reseats
    getIt.registerLazySingleton<ReseatRepo>(() => ReseatRepo(getIt()));
    getIt.registerFactory<ReseatService>(
        () => ReseatService(apiConsumer: getIt()));


    ///constant
    getIt.registerLazySingleton<EndPoints>(() => EndPoints());
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
