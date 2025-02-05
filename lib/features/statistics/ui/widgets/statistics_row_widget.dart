import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';

class StatisticsRowWidget extends StatelessWidget {
  final String title;
  final String money;
  final Color color;
  final String icon;

  const StatisticsRowWidget({
    required this.title,
    required this.money,
    required this.color,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
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
                maxLines: 1,
                style: TextStyles.font16GreyColor33Weight500,
              ))
            ],
          ),
          Text(
            money,
            textAlign: TextAlign.end,
            maxLines: 1,
            style: TextStyles.font16GreyColor33Weight400,
          ),
        ],
      ),
    );
  }
}
