import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  Future<void> setColors(String main, String second) async {
    mainColor = Color(int.parse("0xFF$main"));
    secondColor = Color(int.parse("0xFF$second"));
  }

  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color greenColor = Colors.green;

  static Color mainColor = Color(0xFF37479d);
  static Color secondColor = Color(0xFFF5C31A);

  static Color blueColor72 = const Color(0xff1B1472);
  static Color blackColor17 = const Color(0xff121217);
  static Color greyColorDA = const Color(0xffD5D7DA);
  static Color greyColorF8 = const Color(0xffF8F8F8);
  static Color greyColor44 = const Color(0xff444444);
  static Color greyColor62 = const Color(0xff535862);
  static Color greyColorA3 = const Color(0xff8A8AA3);
  static Color greyColor67 = const Color(0xff676767);
  static Color greyColor27 = const Color(0xff181D27);
  static Color greyColor66 = const Color(0xff666666);
  static Color greyColorDB = const Color(0xffD1D1DB);
  static Color greyColor87 = const Color(0xff7F7B87);
  static Color greyColor33 = const Color(0xff333333);
  static Color greyColor82 = const Color(0xff828282);
  static Color greyColorA5 = const Color(0xffA5A5A5);
  static Color greyColorDC = const Color(0xffD8DADC);
  static Color greyColorBD = const Color(0xffBDBDBD);
  static Color blueColorF3 = const Color(0xffB6E0F3);
  static Color blueColorEEE = const Color(0xffEEEEEE);
  static Color blueColor74 = const Color(0xffC7FF74);
  static Color blueColor6F3 = const Color(0xffC9B6F3);
  static Color blueColorDE = const Color(0xffC3FFDE);
  static Color blueColorE5 = const Color(0xff4845E5);

  static Color blueColorE3 = const Color(0xffE2FAE3);
  static Color blueColorEE = const Color(0xffFAE2EE);
  static Color blueColorF7 = const Color(0xffD1ECF7);
  static Color blueColorA4 = const Color(0xff4553A4);

  static Color blueColor89 = const Color(0xff6C6C89);
  static Color blueColorEB = const Color(0xffFBC2EB);
  static Color blueColor1EE = const Color(0xffA6C1EE);
  static Color blueColor1ED = const Color(0xff7A8AED);
  static Color redColor = const Color(0xffFF0000);
  static Color greenColor00 = const Color(0xff41B800);

  static Color random1() {
    List<Color> colors = [
      blueColorF3,
      blueColorF7,
      blueColorEE,
      blueColorE3,
      blueColor6F3,
      blueColorDE
    ];
    int randomNumber = Random().nextInt(colors.length);
    return colors[randomNumber];
  }

  ///

  static Color darkBlueColor33 = const Color(0xff091133);
  static Color darkBlueColor7C = const Color(0xff192C7C);
  static Color darkBlueColor4B = const Color(0xff4B4B4B);
  static Color redColor00 = const Color(0xffB50200);
  static Color redColor36 = const Color(0xffFE3836);
  static Color redColor9F = const Color(0xffFFA09F);
  static Color redColor50 = const Color(0xffCD5250);
  static Color redColor92 = const Color(0xffFF9292);
  static Color redColor2 = const Color(0xffFF7675);
  static Color greyColorC7 = const Color(0xffC7C7C7);
  static Color grey2Color = const Color(0xffEFEFF0);
  static Color greyColorD9 = const Color(0xffD9D9D9);
  static Color greyColorC0 = const Color(0xffC0C0C0);
  static Color greyColor97 = const Color(0xff979797);
  static Color greyColorF5 = const Color(0xffF5F5F5);
  static Color greyColorE2 = const Color(0xffE4E2E2);
  static Color greyColorD4 = const Color(0xffD4D4D4);
}
