import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/search_widget.dart';
import 'package:pos_system/features/customers/logic/customers_cubit.dart';

class CustomersSearchUserWidget extends StatelessWidget {
  const CustomersSearchUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Timer? _delay;
    return SearchWidget(
      hintText: "ابحث عن عميل",
      hintStyle: TextStyles.font14GreyColor87Weight400,
      textStyle: TextStyles.font14BlackColorWeight400,
      controller: CustomersCubit.get(context).searchUserController,
      backgroundColor: AppColors.whiteColor,
      contentPadding:
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SvgPicture.asset(ImageAsset.searchICon),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColors.greyColorDB, width: 1.3),
          borderRadius: BorderRadius.circular(8.r)),
      enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColors.greyColorDB, width: 1.3),
          borderRadius: BorderRadius.circular(8.r)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor, width: 1.3),
          borderRadius: BorderRadius.circular(8.r)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor, width: 1.3),
          borderRadius: BorderRadius.circular(8.r)),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "field".tr();
        }
        return null;
      },
      onchange: (String? value) {
        if (_delay?.isActive ?? false) {
          _delay!.cancel();
        }
        _delay = Timer(Duration(seconds: 1), () {
          CustomersCubit.get(context).getUsers();
        });
      },
    );
  }
}
