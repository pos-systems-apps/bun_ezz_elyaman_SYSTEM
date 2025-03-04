import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/my_requests/ui/widgets/my_requests_shimmer_widget.dart';
import 'package:pos_system/features/recommendations_from_manager/logic/recommendations_from_manager_cubit.dart';
import 'package:pos_system/features/recommendations_from_manager/logic/recommendations_from_manager_state.dart';
import 'package:pos_system/features/recommendations_from_manager/ui/widgets/recommendation_from_manager_item_widget.dart';

class RecommendationsFromManagerBodyWidget extends StatelessWidget {
  const RecommendationsFromManagerBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsFromManagerCubit, RecommendationsFromManagerState>(
      buildWhen: (previous, current) {
        return current is OnGetManagerRequestsLoadingState ||
            current is OnGetManagerRequestsSuccessState ||
            current is OnGetManagerRequestsErrorState ||
            current is OnGetManagerRequestsCatchErrorState;
      },
      builder: (context, state) {
        if (RecommendationsFromManagerCubit.get(context)
                .managerOrders
                .isEmpty &&
            state is OnGetManagerRequestsLoadingState) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: MyRequestsShimmerWidget(),
            ),
          );
        } else if (RecommendationsFromManagerCubit.get(context)
                .managerOrders
                .isEmpty &&
            state is! OnGetManagerRequestsLoadingState) {
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
                children: RecommendationsFromManagerCubit.get(context)
                    .managerOrders
                    .map((item) =>
                        RecommendationFromManagerItemWidget(item: item))
                    .toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
