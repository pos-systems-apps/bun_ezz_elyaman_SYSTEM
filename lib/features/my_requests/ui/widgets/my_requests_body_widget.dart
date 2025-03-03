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
import 'package:pos_system/features/my_requests/logic/my_requests_cubit.dart';
import 'package:pos_system/features/my_requests/logic/my_requests_state.dart';
import 'package:pos_system/features/my_requests/ui/widgets/my_requests_item_widget.dart';
import 'package:pos_system/features/my_requests/ui/widgets/my_requests_shimmer_widget.dart';

class MyRequestsBodyWidget extends StatelessWidget {
  const MyRequestsBodyWidget({super.key});

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
                buttonHeight: 56.h,
                buttonText: "انشاء طلب",
                borderRadius: 4.r,
                backGroundColor: AppColors.mainColor,
                borderColor: AppColors.mainColor,
                textStyle: TextStyles.font16WhiteColorWeight500,
                onPressed: () {
                  context.pushNamed(Routes.addMyRequestScreen).then((_){
                    MyRequestsCubit.get(context).getAllRequestsUrl();
                  });
                }),
            verticalSpace(32),
            Center(
                child: Text("الطلبات السابقه",
                    style: TextStyles.font20MainColorWeight600)),
            verticalSpace(16),
            BlocBuilder<MyRequestsCubit, MyRequestsState>(
              buildWhen: (previous, current) {
                return current is OnGetMyRequestsLoadingState ||
                    current is OnGetMyRequestsSuccessState ||
                    current is OnGetMyRequestsErrorState ||
                    current is OnGetMyRequestsCatchErrorState;
              },
              builder: (context, state) {
                if (MyRequestsCubit.get(context).requestData.isEmpty &&
                    state is OnGetMyRequestsLoadingState) {
                  return MyRequestsShimmerWidget();
                } else if (MyRequestsCubit.get(context).requestData.isEmpty &&
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
                    children: MyRequestsCubit.get(context)
                        .requestData
                        .map((item) => MyRequestsItemWidget(item: item))
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
