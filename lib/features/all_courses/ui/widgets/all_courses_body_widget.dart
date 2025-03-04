import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/all_courses/logic/all_courses_cubit.dart';
import 'package:pos_system/features/all_courses/logic/all_courses_state.dart';
import 'package:pos_system/features/all_courses/ui/widgets/all_courses_item_widget.dart';
import 'package:pos_system/features/my_requests/ui/widgets/my_requests_shimmer_widget.dart';

class AllCoursesBodyWidget extends StatelessWidget {
  const AllCoursesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCoursesCubit, AllCoursesState>(
      buildWhen: (previous, current) {
        return current is OnGetAllCoursesLoadingState ||
            current is OnGetAllCoursesSuccessState ||
            current is OnGetAllCoursesErrorState ||
            current is OnGetAllCoursesCatchErrorState;
      },
      builder: (context, state) {
        if (AllCoursesCubit.get(context).allCourses.isEmpty &&
            state is OnGetAllCoursesLoadingState) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MyRequestsShimmerWidget(),
            ),
          );
        } else if (AllCoursesCubit.get(context).allCourses.isEmpty &&
            state is! OnGetAllCoursesLoadingState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAsset.notFoundImage),
                verticalSpace(24),
                Text(
                  "لا يوجد بايانات",
                  style: TextStyles.font20MainColorWeightBold,
                ),
              ],
            ),
          );
        } else {
          return Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: AllCoursesCubit.get(context)
                    .allCourses
                    .map((item) => AllCoursesItemWidget(item: item))
                    .toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
