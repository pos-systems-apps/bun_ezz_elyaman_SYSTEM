import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/app_text_field.dart';

class RequestedQuantityTextFieldWidget extends StatelessWidget {
  final TextEditingController selectRequestingQuantity;

  const RequestedQuantityTextFieldWidget(
      {required this.selectRequestingQuantity, super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: "الكميه المطلوبة",
      hintStyle: TextStyles.font14GreyColor87Weight400,
      textStyle: TextStyles.font14BlackColor17Weight500,
      controller: selectRequestingQuantity,
      backgroundColor: AppColors.whiteColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColorDB, width: 1.3),
          borderRadius: BorderRadius.circular(8.r)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColorDB, width: 1.3),
          borderRadius: BorderRadius.circular(8.r)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor, width: 1.3),
          borderRadius: BorderRadius.circular(8.r)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor, width: 1.3),
          borderRadius: BorderRadius.circular(8.r)),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "field".tr();
        }
        return null;
      },
      onchange: (String? value) {},
    );
  }
}
