import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/collections/logic/collections_cubit.dart';

class CollectionsButtonsWidget extends StatelessWidget {
  const CollectionsButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ButtonWidget(
              buttonHeight: 56.h,
              buttonWidth: double.infinity,
              buttonText: "الغاء",
              backGroundColor: AppColors.whiteColor,
              borderColor: AppColors.mainColor,
              borderRadius: 4.r,
              textStyle: TextStyles.font16MainColorWeight500,
              onPressed: () {
                CollectionsCubit.get(context).cancelCollection();
              }),
        ),
        horizontalSpace(20),
        Expanded(
          flex: 2,
          child: ButtonWidget(
              buttonHeight: 56.h,
              buttonWidth: double.infinity,
              buttonText: "إتمام الطلب",
              backGroundColor: AppColors.mainColor,
              borderColor: AppColors.mainColor,
              borderRadius: 4.r,
              textStyle: TextStyles.font16WhiteColorWeight500,
              onPressed: () {

                validateCollection(context);

              }),
        ),
      ],
    );
  }

  void validateCollection(BuildContext context) {
    if (CollectionsCubit.get(context).formKey.currentState!.validate()) {
      print("object");
      _collectionDoneWidget(context);
    }
  }
}

Future<dynamic> _collectionDoneWidget(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: true,
      barrierColor: AppColors.blackColor.withValues(alpha: .7),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r)),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    "تاكيد التحصيل ",
                    style: TextStyles.font18greyColor27Weight600,
                  ),
                  SizedBox(height: 20.h),
                  Lottie.asset(
                    ImageAsset.collectionDoneAnimation,
                    height: 170.h,
                    repeat: true,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 30.h),
                  ButtonWidget(
                      buttonHeight: 44.h,
                      buttonWidth: double.infinity,
                      borderRadius: 8.r,
                      buttonText: "تاكيد",
                      textStyle: TextStyles.font16WhiteColorWeight600,
                      backGroundColor: AppColors.mainColor,
                      borderColor: AppColors.mainColor,
                      onPressed: () {
                        ///
                      }),
                  SizedBox(height: 12.h),
                  ButtonWidget(
                      buttonHeight: 44.h,
                      buttonWidth: double.infinity,
                      borderRadius: 8.r,
                      backGroundColor: AppColors.whiteColor,
                      borderColor: AppColors.mainColor,
                      buttonText: "الغاء",
                      textStyle: TextStyles.font16MainColorWeight600,
                      onPressed: () {
                        context.pop();
                      }),
                  SizedBox(height: 20.h),
                ]),
          ),
        );
      });
}
