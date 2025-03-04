import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/all_courses/data/models/all_courses_response_model.dart';
import 'package:pos_system/features/all_courses/logic/all_courses_cubit.dart';
import 'package:pos_system/features/all_courses/logic/all_courses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCoursesItemWidget extends StatelessWidget {
  final CourseDataModel item;

  const AllCoursesItemWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.blueColorEEE),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text("الكورس", style: TextStyles.font16MainColorWeight500),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "رقم الكورس ",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": ${item.id}",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "اسم الكورس",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": ${item.name}",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          GestureDetector(
            onTap: () {
              AppConstant.openUrl(item.link);
            },
            child: Text.rich(
              textAlign: TextAlign.start,
              TextSpan(children: [
                TextSpan(
                    text: "لينك الكورس",
                    style: TextStyles.font14GreyColor66Weight400.copyWith(
                        color: AppColors.greyColor66.withValues(alpha: .5))),
                TextSpan(
                    text: ": ${item.link}",
                    style: TextStyles.font14BlueColorWeight400),
              ]),
            ),
          ),
          verticalSpace(16),
          if (item.image != null)
            Center(
              child: Text("تم اكمال الكورس",
                  style: TextStyles.font14greenColor3EWeight600),
            ),
          if (item.image == null)
            BlocBuilder<AllCoursesCubit, AllCoursesState>(
              buildWhen: (previous, current) {
                return current is OnCompleteCourseLoadingState ||
                    current is OnCompleteCourseSuccessState ||
                    current is OnCompleteCourseErrorState ||
                    current is OnCompleteCourseCatchErrorState;
              },
              builder: (context, state) {
                return ButtonWidget(
                    isLoading: (state is OnCompleteCourseLoadingState &&
                        item.id == AllCoursesCubit.get(context).courseID),
                    buttonHeight: 40.h,
                    buttonText: "رفع الشهاده ",
                    borderRadius: 4.r,
                    backGroundColor: AppColors.mainColor,
                    borderColor: AppColors.mainColor,
                    textStyle: TextStyles.font16WhiteColorWeight500,
                    onPressed: () {
                      if (state is! OnCompleteCourseLoadingState) {
                        AllCoursesCubit.get(context).uploadImages(item.id);
                      }
                    });
              },
            ),
        ],
      ),
    );
  }
}
