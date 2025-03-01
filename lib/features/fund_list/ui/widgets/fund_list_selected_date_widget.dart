import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/fund_list/logic/fund_list_cubit.dart';
import 'package:pos_system/features/fund_list/logic/fund_list_state.dart';

class FundListSelectedDateWidget extends StatelessWidget {
  const FundListSelectedDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FundListCubit, FundListState>(
      buildWhen: (previous, current) {
        return current is OnChangeDateState;
      },
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("من",
                      style: TextStyles.font10BlackColorWeight400),
                  verticalSpace(5),
                  GestureDetector(
                    onTap: () {
                      FundListCubit.get(context)
                          .selectDate(context, true);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 13.h),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(8.r),
                          border:
                          Border.all(color: AppColors.greyColorDB)),
                      child: Row(
                        children: [
                          SvgPicture.asset(ImageAsset.calenderIcon),
                          horizontalSpace(16),
                          Expanded(
                            child: Text(
                                _formatDate(FundListCubit.get(context)
                                    .selectedFromDate),
                                maxLines: 1,
                                style: TextStyles
                                    .font14BlackColorWeight400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            horizontalSpace(30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("الي",
                      style: TextStyles.font10BlackColorWeight400),
                  verticalSpace(5),
                  GestureDetector(
                    onTap: () {
                      FundListCubit.get(context)
                          .selectDate(context, false);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 13.h),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(8.r),
                          border:
                          Border.all(color: AppColors.greyColorDB)),
                      child: Row(
                        children: [
                          SvgPicture.asset(ImageAsset.calenderIcon),
                          horizontalSpace(16),
                          Expanded(
                            child: Text(
                                _formatDate(FundListCubit.get(context)
                                    .selectedToDate),
                                maxLines: 1,
                                style: TextStyles
                                    .font14BlackColorWeight400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
