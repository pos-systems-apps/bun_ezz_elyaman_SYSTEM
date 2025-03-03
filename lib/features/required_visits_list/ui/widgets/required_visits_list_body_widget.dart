import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/required_visits_list/logic/required_visits_list_cubit.dart';
import 'package:pos_system/features/required_visits_list/logic/required_visits_list_state.dart';
import 'package:pos_system/features/required_visits_list/ui/widgets/required_visits_list_item_widget.dart';
import 'package:pos_system/features/transfers_section/ui/widgets/transaction_section_shimmer_widget.dart';

class RequiredVisitsListBodyWidget extends StatelessWidget {
  const RequiredVisitsListBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequiredVisitsListCubit, RequiredVisitsListState>(
      buildWhen: (previous, current) {
        return current is OnGetRequiredVisitorListLoadingState ||
            current is OnGetRequiredVisitorListSuccessState ||
            current is OnGetRequiredVisitorListErrorState ||
            current is OnGetRequiredVisitorListCatchErrorState;
      },
      builder: (context, state) {
        if (RequiredVisitsListCubit.get(context).requiredVisitors.isEmpty &&
            state is OnGetRequiredVisitorListLoadingState) {
          return Expanded(child: TransactionSectionShimmerWidget());
        } else if (RequiredVisitsListCubit.get(context)
                .requiredVisitors
                .isEmpty &&
            state is! OnGetRequiredVisitorListLoadingState) {
          return Center(
            child: Column(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: RequiredVisitsListCubit.get(context)
                    .requiredVisitors
                    .map((item) => RequiredVisitsListItemWidget(
                          item: item,
                        ))
                    .toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
