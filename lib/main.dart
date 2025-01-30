import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_system/core/utils/extentions.dart';
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

  String navigationScreenRoute;
  await checkIfLoggedInUser();

  navigationScreenRoute = Routes.loginScreen;
  // String? token = await CacheHelper.getSecuredString(AppStrings.saveTokenToShared);
  // bool onBoardingWatch =
      // await CacheHelper.getBool(AppStrings.saveIsOnBoardingToShared);
  // if (onBoardingWatch == true) {
  //   navigationScreenRoute = Routes.boardingScreen;
  // } else {
    // if (isLoggedInUser == true) {
    //   navigationScreenRoute = Routes.boardingScreen;
    // } else {
    // navigationScreenRoute = Routes.onBoardingScreen1;
    // }
  // }

  Bloc.observer = Observer();

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('ar', 'EG'),  // Arabic first
      Locale('en', 'US'),  // English second
    ],
    saveLocale: true,
    startLocale: const Locale('ar', 'EG'),
    path: 'assets/languages',
    fallbackLocale: const Locale('ar', 'EG'),
    child: MyApp(navigateWidget: navigationScreenRoute),
  ));
}


checkIfLoggedInUser() async {
  String? userToken =await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
