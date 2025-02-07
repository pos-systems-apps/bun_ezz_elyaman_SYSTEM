import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/reseat/ui/widgets/reseat_body_widget.dart';

class ReseatScreen extends StatelessWidget {
  const ReseatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(10),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    padding: EdgeInsets.all(8.r),
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0,
                              color:
                                  AppColors.blackColor.withValues(alpha: .1)),
                        ]),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.blueColor72,
                    ),
                  ),
                ),
                Spacer(flex: 1,),
                Text(
                  "الفاتوره",
                  style: TextStyles.font20BlueColorA4Weight600,
                ),
                Spacer(flex: 2,),
              ],
            ),
            verticalSpace(24),
            ReseatBodyWidget(),
          ],
        ),
      ),
    );
  }
}
