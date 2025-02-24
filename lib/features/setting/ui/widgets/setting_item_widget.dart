import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';

class SettingItemWidget extends StatelessWidget {
  final String text;
  final String image;
  final Function onTap;
  final bool isRed;
  final bool isBig;

  const SettingItemWidget({
    required this.text,
    required this.image,
    required this.onTap,
    this.isRed = false,
    this.isBig = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: isBig ? 16.w : 6.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isRed
              ? AppColors.redColor39.withValues(alpha: .1)
              : AppColors.mainColor.withValues(alpha: .1),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28.r,
              backgroundColor: isRed
                  ? AppColors.redColor39.withValues(alpha: .16)
                  : AppColors.mainColor.withValues(alpha: .16),
              child: SvgPicture.asset(image,
                  color: isRed ? null : AppColors.mainColor),
            ),
            horizontalSpace(16),
            Expanded(
                child: Text(
              text,
              maxLines: 2,
              style: TextStyles.font16BlackColorWeight600,
            )),
          ],
        ),
      ),
    );
  }
}
