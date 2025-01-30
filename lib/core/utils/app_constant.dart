


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
