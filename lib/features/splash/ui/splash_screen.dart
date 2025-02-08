import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/services/check_network.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/widgets/offline_alert_dialog.dart';
import 'package:pos_system/features/login/data/repo/login_repo.dart';

import '../../login/data/models/setting_response.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedInUser = false;
  String navigationScreenRoute = Routes.loginScreen;

  @override
  void initState() {
    super.initState();
    navigationSetting();
  }

  Future<void> navigationSetting() async {
    await checkIfLoggedInUser().then((_) {
      context.pushReplacementNamed(navigationScreenRoute);
    });
  }

  Future<void> checkIfLoggedInUser() async {
    String? userToken =
        await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared);
    if (!userToken.isNullOrEmpty()) {
      isLoggedInUser = true;
      navigationScreenRoute = Routes.buttonNavigationScreen;
      await setupSetting();
    } else {
      isLoggedInUser = false;
      navigationScreenRoute = Routes.loginScreen;
    }
  }

  Future<void> setupSetting() async {
    if (MyConnectivity.isOnline()) {
      await appSetting();
    } else {
      OfflineAlertDialog();
      navigationScreenRoute = Routes.loginScreen;
    }
  }

  Future<void> appSetting() async {
    await LoginRepo(getIt()).appSetting().then((value) async {
      await value.fold((l) {
        navigationScreenRoute = Routes.loginScreen;
      }, (r) async {
        await setSettingFromApi(r);
        navigationScreenRoute = Routes.buttonNavigationScreen;
      });
    }).catchError((error) {
      navigationScreenRoute = Routes.loginScreen;
    });
  }

  Future<void> setSettingFromApi(SettingResponse value) async {
    await CacheHelper.setSecuredString(
        ConstantKeys.saveLogoToShared, value.settingResponseInfo.logo);
    await CacheHelper.setSecuredString(
        ConstantKeys.savePaginationNumberToShared,
        value.settingResponseInfo.paginationNumber);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveCurrencyToShared, value.settingResponseInfo.currency);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveShopNameToShared, value.settingResponseInfo.shopName);
    await CacheHelper.setSecuredString(ConstantKeys.saveShopAddressToShared,
        value.settingResponseInfo.shopAddress);
    await CacheHelper.setSecuredString(ConstantKeys.saveShopPhoneToShared,
        value.settingResponseInfo.shopPhone);
    await CacheHelper.setSecuredString(ConstantKeys.saveShopEmailToShared,
        value.settingResponseInfo.shopEmail);
    await CacheHelper.setSecuredString(ConstantKeys.saveFooterTextToShared,
        value.settingResponseInfo.footerText);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveCountryToShared, value.settingResponseInfo.country);
    await CacheHelper.setSecuredString(ConstantKeys.saveStockLimitToShared,
        value.settingResponseInfo.stockLimit);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveTimeZoneToShared, value.settingResponseInfo.timeZone);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveCommercialRegistryToShared,
        value.settingResponseInfo.commercialRegistry);
    await CacheHelper.setSecuredString(ConstantKeys.saveNumberTaxToShared,
        value.settingResponseInfo.numberTax);
    await CacheHelper.setSecuredString(ConstantKeys.saveMainColorToShared,
        value.settingResponseInfo.mainColor);
    await CacheHelper.setSecuredString(ConstantKeys.saveSecondColorToShared,
        value.settingResponseInfo.secondColor);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveBaseURLToShared, value.settingResponseInfo.baseURl);
    await EndPoints.setBaseUrl(value.settingResponseInfo.baseURl);
    await EndPoints.getBaseUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Lottie.asset(
          ImageAsset.loadingAnimation,
          height: 170.h,
          repeat: true,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
