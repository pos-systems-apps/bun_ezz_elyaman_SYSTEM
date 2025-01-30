import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_white_theme.dart';
import 'core/utils/app_colors_white_theme.dart';
import 'core/utils/app_constant.dart';

class MyApp extends StatelessWidget {
  final String navigateWidget;

  const MyApp({required this.navigateWidget, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, snapshot) {
          language = context.locale.languageCode;
          return Container(
            color: AppColors.whiteColor,
            child: MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              title: "Pos_System",
              theme: themeData(),
              // locale: const Locale('ar', 'EG'),  // Set Arabic as fixed locale
              // darkTheme: ,
              // home: navigateWidget,
              initialRoute: navigateWidget,
              //     isLoggedInUser ? Routes.homeAppScreen : Routes.loginScreen,
              onGenerateRoute: RouteGenerator.generateRoute,
            ),
          );
        });
  }
}
