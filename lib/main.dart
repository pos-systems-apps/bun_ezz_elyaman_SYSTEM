import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pos_system/core/services/bluetooth_service.dart';
import 'package:pos_system/my_app.dart';

import 'core/services/cache_helper.dart';
import 'core/services/check_network.dart';
import 'core/services/services_locator.dart';
import 'observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await EasyLocalization.ensureInitialized();
  await ServicesLocator.init();
  await BluetoothPermissionHandler.init(false);

  await CacheHelper.init();
  await MyConnectivity.initialise();
  Bloc.observer = Observer();

  // End locations
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('ar', 'EG'), // Arabic first
      Locale('en', 'US'), // English second
    ],
    saveLocale: true,
    startLocale: const Locale('ar', 'EG'),
    path: 'assets/languages',
    fallbackLocale: const Locale('ar', 'EG'),
    child: MyApp(),
  ));
}

///bank account delete pagination
///
