import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart' show Position;
import 'package:lottie/lottie.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/services/check_network.dart';
import 'package:pos_system/core/services/location_service.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/widgets/offline_alert_dialog.dart';
import 'package:pos_system/features/login/data/models/update_user_location_request.dart';
import 'package:pos_system/features/login/data/models/user_setting_response.dart';
import 'package:pos_system/features/login/data/repo/login_repo.dart';

import '../../login/data/models/system_setting_response.dart';

///if offline and go to login
///check app setting when login
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
      print("isLoggedInUser11${isLoggedInUser}");
      navigationScreenRoute = Routes.buttonNavigationScreen;
      await setupSetting();
    } else {
      isLoggedInUser = false;
      print("isLoggedInUser2222${isLoggedInUser}");
      navigationScreenRoute = Routes.loginScreen;
      await setupSetting();
    }
  }

  Future<void> setupSetting() async {
    if (MyConnectivity.isOnline()) {
      await getAppSettings();
    } else {
      OfflineAlertDialog();
      navigationScreenRoute = Routes.loginScreen;
    }
  }

  Future<void> getAppSettings() async {
    await LoginRepo(getIt()).systemSetting().then((value) async {
      await value.fold((l) {
        navigationScreenRoute = Routes.loginScreen;
      }, (r) async {
        await storeSettingFromApi(r);
        await LoginRepo(getIt()).userSetting().then((value) async {
          await value.fold((l) {
            navigationScreenRoute = Routes.loginScreen;
          }, (r) async {
            await userSettingFromApi(r);
            Position? position = await YourLocation.getCurrentLocation();
            await LoginRepo(getIt()).updateUseLocation(
                UpdateUserLocationRequest(
                    latitude: position?.latitude ?? 0,
                    longitude: position?.longitude ?? 0));
          });
        }).catchError((error) {
          navigationScreenRoute = Routes.loginScreen;
        });
      });
    }).catchError((error) {
      navigationScreenRoute = Routes.loginScreen;
    });
  }

  Future<void> storeSettingFromApi(SystemSettingResponse value) async {
    await CacheHelper.setSecuredString(
        ConstantKeys.saveLogoToShared, value.systemSettingResponseInfo.logo);
    await CacheHelper.setSecuredString(
        ConstantKeys.savePaginationNumberToShared,
        value.systemSettingResponseInfo.paginationNumber);
    await CacheHelper.setSecuredString(ConstantKeys.saveCurrencyToShared,
        value.systemSettingResponseInfo.currency);
    await CacheHelper.setSecuredString(ConstantKeys.saveShopNameToShared,
        value.systemSettingResponseInfo.shopName);
    await CacheHelper.setSecuredString(ConstantKeys.saveShopAddressToShared,
        value.systemSettingResponseInfo.shopAddress);
    await CacheHelper.setSecuredString(ConstantKeys.saveShopPhoneToShared,
        value.systemSettingResponseInfo.shopPhone);
    await CacheHelper.setSecuredString(ConstantKeys.saveShopEmailToShared,
        value.systemSettingResponseInfo.shopEmail);
    await CacheHelper.setSecuredString(ConstantKeys.saveFooterTextToShared,
        value.systemSettingResponseInfo.footerText);
    await CacheHelper.setSecuredString(ConstantKeys.saveCountryToShared,
        value.systemSettingResponseInfo.country);
    await CacheHelper.setSecuredString(ConstantKeys.saveStockLimitToShared,
        value.systemSettingResponseInfo.stockLimit);
    await CacheHelper.setSecuredString(ConstantKeys.saveTimeZoneToShared,
        value.systemSettingResponseInfo.timeZone);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveCommercialRegistryToShared,
        value.systemSettingResponseInfo.commercialRegistry);
    await CacheHelper.setSecuredString(ConstantKeys.saveNumberTaxToShared,
        value.systemSettingResponseInfo.numberTax);
    await CacheHelper.setSecuredString(ConstantKeys.saveMainColorToShared,
        value.systemSettingResponseInfo.mainColor);
    await CacheHelper.setSecuredString(ConstantKeys.saveSecondColorToShared,
        value.systemSettingResponseInfo.secondColor);
    await CacheHelper.setSecuredString(ConstantKeys.saveBaseURLToShared,
        value.systemSettingResponseInfo.baseURl);


    ///store app constant
    await getIt<AppConstant>().setAppConstantData(
        basUrl: value.systemSettingResponseInfo.baseURl,
        currencyNew: value.systemSettingResponseInfo.currency,
        shopLogoNew: value.systemSettingResponseInfo.logo,
        shopNameNew: value.systemSettingResponseInfo.shopName,
        shopAddressNew: value.systemSettingResponseInfo.shopAddress,
        shopPhoneNew: value.systemSettingResponseInfo.shopPhone,
        shopEmailNew: value.systemSettingResponseInfo.shopEmail,
        countryNew: value.systemSettingResponseInfo.country,
        timeZoneNew: value.systemSettingResponseInfo.timeZone,
        numberTaxNew: value.systemSettingResponseInfo.numberTax,
        commercialRegistryNew:
            value.systemSettingResponseInfo.commercialRegistry,);

    ///store app colors

    await getIt<AppColors>().setColors(
        value.systemSettingResponseInfo.mainColor
            .replaceAll("#", "")
            .toUpperCase(),
        value.systemSettingResponseInfo.secondColor
            .replaceAll("#", "")
            .toUpperCase());

    ///store app end points
    // await getIt<EndPoints>().setBaseUrl(value.settingResponseInfo.baseURl);
  }

  Future<void> userSettingFromApi(UserSettingResponse value) async {
    await CacheHelper.setSecuredString(
        ConstantKeys.saveMandoubeNameToShared,
        value.userSettingResponseInfo.firstName +
            value.userSettingResponseInfo.lastName);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveEmailToShared, value.userSettingResponseInfo.email);
    await CacheHelper.setSecuredString(
        ConstantKeys.savePhoneToShared, value.userSettingResponseInfo.phone);
    await CacheHelper.setSecuredString(
        ConstantKeys.saveImageToShared, value.userSettingResponseInfo.image);

   await CacheHelper.setSecuredString(
        ConstantKeys.saveDashBoardToShared, value.userSettingResponseInfo.dashboard.toString());

   await CacheHelper.setSecuredString(
        ConstantKeys.saveStockToShared, value.userSettingResponseInfo.stock.toString());


    await CacheHelper.setSecuredString(
        ConstantKeys.saveStoreToShared, value.userSettingResponseInfo.store.toString());
    await CacheHelper.setSecuredString(
        ConstantKeys.saveAdminToShared, value.userSettingResponseInfo.admin.toString());
    await CacheHelper.setSecuredString(
        ConstantKeys.savePosToShared, value.userSettingResponseInfo.pos.toString());
    await CacheHelper.setSecuredString(
        ConstantKeys.saveSalesToShared, value.userSettingResponseInfo.sales.toString());



    ///type == cash or credit or full
    await CacheHelper.setSecuredString(
        ConstantKeys.saveTypeToShared, value.userSettingResponseInfo.type);

    ///store user constant
    await getIt<AppConstant>().setUserConstantData(
      typeNew: value.userSettingResponseInfo.type );



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
