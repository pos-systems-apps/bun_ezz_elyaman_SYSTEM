import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/services/check_network.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/features/login/data/models/setting_response.dart';

import 'app_colors_white_theme.dart';

bool isLoggedInUser = false;
String language = "";

class AppConstant {
  static toast(String message, Color colors) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: colors,
      textColor: AppColors.whiteColor,
      fontSize: 16.0.sp,
    );
  }

  static setSettingFromApi(SettingResponse value) async {
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

    EndPoints.baseUrl =
        await CacheHelper.getSecuredString(ConstantKeys.saveBaseURLToShared) ??
            "";
  }

  static showBoxToBeOnline(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('No Internet'),
        content: const Text('You are offline. Please check your connection.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
// static String getMonthName(int monthNumber) {
//    if (monthNumber < 1 || monthNumber > 12) {
//      return 'Invalid month';
//    }
//
//    List<String> monthNames = [
//      'January', 'February', 'March', 'April', 'May', 'June',
//      'July', 'August', 'September', 'October', 'November', 'December'
//    ];
//
//    return monthNames[monthNumber - 1];
//  }
//
// static void openUrl(String webUrl) async {
//   final String url = webUrl;
//   if (await canLaunchUrl(Uri.parse(url))) {
//     await launchUrl(Uri.parse(url));
//   } else {
//     throw "Could not launch $url";
//   }
// }

// static Future getLocationFromCoordinates(
//     double latitude, double longitude) async {
//   try {
//     if (latitude != 0 && longitude != 0) {
//       List<Placemark> placeMarks = await placemarkFromCoordinates(
//         latitude,
//         longitude,
//       );
//       if (placeMarks != null && placeMarks.isNotEmpty) {
//         Placemark placeMark = placeMarks[0];
//         String address =
//             '${placeMark.thoroughfare} , ${placeMark.administrativeArea!.replaceAll("Governorate", "")},${placeMark.country!}';
//         await CacheHelper.setData(
//             ConstantKeys.saveAddressToShared, address.toString());
//       }
//     }
//   } catch (e) {
//     // print('Error retrieving location: $e');
//   }
//   // return 'Location not found';
// }
}
