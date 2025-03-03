import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/add_leave_request/logic/add_leave_request_cubit.dart';
import 'package:pos_system/features/add_leave_request/logic/add_leave_request_state.dart';

class AddLeaveRequestSelectDateWidget extends StatelessWidget {
  const AddLeaveRequestSelectDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddLeaveRequestCubit, AddLeaveRequestState>(
      buildWhen: (previous, current) {
        return current is OnChangeDateState;
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AddLeaveRequestCubit.get(context).selectDate(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.greyColorDB)),
            child: Row(
              children: [
                SvgPicture.asset(ImageAsset.calenderIcon),
                horizontalSpace(16),
                Expanded(
                  child: Text(
                      _formatDate(
                          AddLeaveRequestCubit.get(context).selectedDate),
                      maxLines: 1,
                      style: TextStyles.font14BlackColorWeight400),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
