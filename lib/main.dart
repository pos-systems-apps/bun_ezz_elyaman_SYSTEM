import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/utils/app_strings.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/features/login/data/repo/login_repo.dart';
import 'package:pos_system/my_app.dart';

import 'config/routes/routes.dart';
import 'core/services/cache_helper.dart';
import 'core/services/check_network.dart';
import 'core/services/services_locator.dart';
import 'core/utils/app_constant.dart';
import 'core/utils/constant_keys.dart';
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await EasyLocalization.ensureInitialized();
  await ServicesLocator.init();
  await CacheHelper.init();
  await MyConnectivity.initialise();

  String navigationScreenRoute = Routes.loginScreen;
  await checkIfLoggedInUser();

  try {
    if (MyConnectivity.isOnline()) {
      LoginRepo(getIt()).appSetting().then((value) {
        value.fold((l) {
        }, (r) {
          AppConstant.setSettingFromApi(r);
        });
      });
    } else {
      navigationScreenRoute = Routes.loginScreen;
    }
  } catch (error) {
    print("error${error}");
  }


  if (isLoggedInUser == true) {
    navigationScreenRoute = Routes.buttonNavigationScreen;
  } else {
    navigationScreenRoute = Routes.loginScreen;
  }

  Bloc.observer = Observer();

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('ar', 'EG'), // Arabic first
      Locale('en', 'US'), // English second
    ],
    saveLocale: true,
    startLocale: const Locale('ar', 'EG'),
    path: 'assets/languages',
    fallbackLocale: const Locale('ar', 'EG'),
    child: MyApp(navigateWidget: navigationScreenRoute),
  ));
}

checkIfLoggedInUser() async {
  String? userToken =
      await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
