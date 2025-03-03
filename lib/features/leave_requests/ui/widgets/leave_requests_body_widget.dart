import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/leave_requests/logic/leave_requests_cubit.dart';
import 'package:pos_system/features/leave_requests/logic/leave_requests_state.dart';
import 'package:pos_system/features/leave_requests/ui/widgets/leave_requests_item_widget.dart';
import 'package:pos_system/features/my_requests/ui/widgets/my_requests_shimmer_widget.dart';

class LeaveRequestsBodyWidget extends StatelessWidget {
  const LeaveRequestsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(26),
            ButtonWidget(
                isLoading: false,
                // isLoading: state is OnCreateVisitLoadingState,
                buttonHeight: 56.h,
                buttonText: " انشاء طلب اجازة",
                borderRadius: 4.r,
                backGroundColor: AppColors.mainColor,
                borderColor: AppColors.mainColor,
                textStyle: TextStyles.font16WhiteColorWeight500,
                onPressed: () {
                  context.pushNamed(Routes.addLeaveRequestScreen).then((_) {
                    LeaveRequestsCubit.get(context).getAllRequestsUrl();
                  });
                }),
            verticalSpace(32),
            Center(
                child: Text("الطلبات السابقه",
                    style: TextStyles.font20MainColorWeight600)),
            verticalSpace(16),
            BlocBuilder<LeaveRequestsCubit, LeaveRequestsState>(
              buildWhen: (previous, current) {
                return current is OnGetMyRequestsLoadingState ||
                    current is OnGetMyRequestsSuccessState ||
                    current is OnGetMyRequestsErrorState ||
                    current is OnGetMyRequestsCatchErrorState;
              },
              builder: (context, state) {
                if (LeaveRequestsCubit.get(context).leaveRequestData.isEmpty &&
                    state is OnGetMyRequestsLoadingState) {
                  return MyRequestsShimmerWidget();
                } else if (LeaveRequestsCubit.get(context)
                        .leaveRequestData
                        .isEmpty &&
                    state is! OnGetMyRequestsLoadingState) {
                  return Column(
                    children: [
                      Image.asset(ImageAsset.notFoundImage),
                      verticalSpace(24),
                      Text(
                        "لا يوجد بايانات",
                        style: TextStyles.font20MainColorWeightBold,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: LeaveRequestsCubit.get(context)
                        .leaveRequestData
                        .map((item) => LeaveRequestsItemWidget(item: item))
                        .toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
