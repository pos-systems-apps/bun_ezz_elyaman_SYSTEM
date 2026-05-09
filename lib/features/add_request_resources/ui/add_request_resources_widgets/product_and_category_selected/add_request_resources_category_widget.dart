import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/cached_network_image.dart';
import 'package:pos_system/features/sales/data/models/category_response.dart';

class AddRequestResourcesCategoryWidget extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;

  const AddRequestResourcesCategoryWidget({
    required this.category,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      width: 80.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.mainColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 0,
              color: AppColors.blackColor.withValues(alpha: .1),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: CachedNetworkImageWidget(
                  imgUrl:
                      EndPoints.getImageFromApi("category/${category.image}"),
                  radius: 0)),
          verticalSpace(4),
          Text(
            category.name,
            maxLines: 1,
            style: TextStyles.font12BlackColorWeight400.copyWith(
              color: isSelected ? AppColors.whiteColor : null,
            ),
          ),
        ],
      ),
    );
  }
}
