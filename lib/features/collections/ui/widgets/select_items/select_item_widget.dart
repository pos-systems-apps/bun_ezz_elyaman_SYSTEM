import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/styles.dart';

class SelectItemWidget extends StatelessWidget {
  final String name;
  final bool isSelected;

  const SelectItemWidget(
      {required this.name, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 175.w,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: .5.h),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color:
                      isSelected ? AppColors.mainColor : AppColors.whiteColor,
                  width: isSelected ? 2 : 0))),
      child: Text(
        name,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: TextStyles.font14blueColor89rWeight400
            .copyWith(color: isSelected ? AppColors.mainColor : null),
      ),
    );
  }
}
