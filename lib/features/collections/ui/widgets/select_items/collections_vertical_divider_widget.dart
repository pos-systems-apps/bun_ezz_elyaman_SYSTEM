import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';

class CollectionsVerticalDividerWidget extends StatelessWidget {
  const CollectionsVerticalDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.w,
      height: double.infinity,
      color: AppColors.blueColor89,
    );
  }
}
