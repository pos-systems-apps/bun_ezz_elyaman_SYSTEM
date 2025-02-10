import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/extentions.dart';

import 'package:pos_system/core/utils/styles.dart';

class SettingAppBarWidget extends StatelessWidget {
  const SettingAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 2.h),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
      ),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.arrow_back,
                    color: AppColors.mainColor, size: 20.r),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              "الاعدادات",
              style: TextStyles.font20WhiteColorWeight700,
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
