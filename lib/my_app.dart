import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/services/check_network.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/widgets/offline_alert_dialog.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_white_theme.dart';
import 'core/utils/app_colors_white_theme.dart';
import 'core/utils/app_constant.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // _listenToNetwork();
  }

  void _listenToNetwork() {
    // MyConnectivity.myStream.listen((event) {
    //   if (!MyConnectivity.isOnline()) {
    //     _showOfflineDialog();
    //   }
    // });
  }

  void _showOfflineDialog() {
    if (navigatorKey.currentContext == null) return;
    OfflineAlertDialog.getDialog();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, snapshot) {
          // getIt<AppConstant>().setLanguage(context.locale.languageCode);
          return Container(
            color: AppColors.whiteColor,
            child: MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              title: "Pos_System",
              theme: themeData(),
              initialRoute: Routes.splashScreen,
              onGenerateRoute: RouteGenerator.generateRoute,
            ),
          );
        });
  }
}
