
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:pos_system/features/sales/data/entities/order_type_class.dart';
import 'package:pos_system/features/sales/data/entities/percent_types_class.dart';
import 'package:pos_system/features/sales/data/entities/unit_of_measure_class.dart';
import 'package:pos_system/features/splash/data/models/pay_class.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_colors_white_theme.dart';

class AppConstant {
  static String language = "";
  static String baseUrl = "";
  static String currency = "";
  static String shopLogo = "";
  static String shopName = "";
  static String shopAddress = "";
  static String shopPhone = "";
  static String shopEmail = "";
  static String country = "";
  static String timeZone = "";
  static String numberTax = "";
  static String commercialRegistry = "";
  static String cash = "0";
  static String shabaka = "0";
  static String agel = "0";

  Future<void> setAppConstantData({
    required String basUrl,
    required String currencyNew,
    required String shopLogoNew,
    required String shopNameNew,
    required String shopAddressNew,
    required String shopPhoneNew,
    required String shopEmailNew,
    required String countryNew,
    required String timeZoneNew,
    required String numberTaxNew,
    required String commercialRegistryNew,
    required String cashNew,
    required String shabakaNew,
    required String agelNew,
  }) async {
    print("setAppConstantData");
    baseUrl = basUrl;
    currency = currencyNew;
    shopLogo = shopLogoNew;
    shopName = shopNameNew;
    shopAddress = shopAddressNew;
    shopPhone = shopPhoneNew;
    shopEmail = shopEmailNew;
    country = countryNew;
    timeZone = timeZoneNew;
    numberTax = numberTaxNew;
    commercialRegistry = commercialRegistryNew;
    cash = cashNew;
    shabaka = shabakaNew;
    agel = agelNew;
    print("baseUrl ${baseUrl}");
    pays = [
      PayClass(id: 1, nameAr: "كاش", nameEn: "cash", isShown: getCash() == "1"),
      PayClass(
          id: 2,
          nameAr: "شبكة",
          nameEn: "shabaka",
          isShown: getShabake() == "1"),
      PayClass(id: 3, nameAr: "اجل", nameEn: "agel", isShown: getAgel() == "1"),
    ];
  }

  void setLanguage(String value) {
    language = value;
  }

  String getLanguage() {
    return language;
  }

  String getLCurrency() {
    return currency;
  }

  String getShopLogo() {
    return shopLogo;
  }

  String getShopName() {
    return shopName;
  }

  String getShopAddress() {
    return shopAddress;
  }

  String getShopPhone() {
    return shopPhone;
  }

  String getShopEmail() {
    return shopEmail;
  }

  String getCountry() {
    return country;
  }

  String getTimeZone() {
    return timeZone;
  }

  String getNumberTax() {
    return numberTax;
  }

  String getCommercialRegistry() {
    return commercialRegistry;
  }

  static String getCash() {
    return cash;
  }

  static String getShabake() {
    return shabaka;
  }

  static String getAgel() {
    return agel;
  }

  static String getBaseUrl() {
    return baseUrl;
  }

  List<PayClass> pays = [];
  static List<UnitMeasure> measureUnits = [
    UnitMeasure(id: 1, nameAr: "كبري", nameEn: 'Big'),
    UnitMeasure(id: 0, nameAr: 'صغري', nameEn: 'Small'),
  ];

  static List<OrderTypeClass> orderTypes = [
    OrderTypeClass(id: 4, nameAr: "فاتورة مبيعات ", nameEn: "Sales invoice"),
    OrderTypeClass(id: 7, nameAr: "فاتورة مرتجعات ", nameEn: "Return invoice"),
  ];
  static List<PercentTypesClass> percentTypes = [
    PercentTypesClass(id: 1, nameAr: "كمية", nameEn: "Amount"),
    PercentTypesClass(id: 2, nameAr: "نسبة مئوية", nameEn: "Percentage"),
  ];

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

  static double getDiscountForProduct(
      String discountType, double productPrice, double discount) {
    if (discountType == "percent") {
      return productPrice - (discount * productPrice) / 100;
    } else {
      return productPrice - discount;
    }
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

  static String confirmRoundTo2Numbers(double number) {
    return number.toStringAsFixed(2);
  }

  static Map<String, int> requestsType = {
    "orders_from_manager": 0,
    "my_orders": 1,
    "leave_orders": 2,
  };

  static void openUrl(String webUrl) async {
    final String url = webUrl;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Could not launch $url";
    }
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

  static Future<String> getLocationFromCoordinates(
      double latitude, double longitude) async {
    try {
      if (latitude != 0 && longitude != 0) {
        List<Placemark> placeMarks = await placemarkFromCoordinates(
          latitude,
          longitude,
        );
        if (placeMarks != null && placeMarks.isNotEmpty) {
          Placemark placeMark = placeMarks[0];
          String address =
              '${placeMark.thoroughfare} , ${placeMark.administrativeArea!.replaceAll("Governorate", "")},${placeMark.country!}';
          return address;
        }
      }
    } catch (e) {
      return "";
      // print('Error retrieving location: $e');
    }
    return "";
    // return 'Location not found';
  }
}
