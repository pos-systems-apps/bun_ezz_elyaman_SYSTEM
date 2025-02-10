import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';

class StatisticsHalfRowWidget extends StatelessWidget {
  final String title;
  final Color color;
  final double width;
  final String money;
  final String icon;

  const StatisticsHalfRowWidget(
      {required this.title,
      required this.color,
      required this.width,
      required this.money,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 90.h,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.h),
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8.r),
      boxShadow: [
        BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 0,
            color: AppColors.blueColorE5.withValues(alpha: .1)),
      ]),
          child: Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
            height: 16.h,
            width: 16.w,
          ),
          horizontalSpace(3),
          Expanded(
              child: Text(
            title,
            maxLines: 2,
            style: TextStyles.font12BlackWeight500,
          ))
        ],
      ),
      Spacer(),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text(
            money,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyles.font16BlackWeight500,
          )),
          horizontalSpace(3),
          SvgPicture.asset(
            ImageAsset.statics2ICon,
            height: 16.h,
            width: 16.w,
          ),
          horizontalSpace(3),
        ],
      ),
      Spacer(),
    ],
          ),
        );
  }
}
