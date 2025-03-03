import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/transfers_section/ui/widgets/transaction_section_shimmer_widget.dart';
import 'package:pos_system/features/visits_carried_out/logic/visits_carried_out_cubit.dart';
import 'package:pos_system/features/visits_carried_out/logic/visits_carried_out_state.dart';
import 'package:pos_system/features/visits_carried_out/ui/widgets/visits_carried_out_item_widget.dart';

class VisitsCarriedOutBodyWidget extends StatelessWidget {
  const VisitsCarriedOutBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitsCarriedOutCubit, VisitsCarriedOutState>(
      buildWhen: (previous, current) {
        return current is OnGetVisitsCarriedOutLoadingState ||
            current is OnGetVisitsCarriedOutSuccessState ||
            current is OnGetVisitsCarriedOutErrorState ||
            current is OnGetVisitsCarriedOutCatchErrorState;
      },
      builder: (context, state) {
        if (VisitsCarriedOutCubit.get(context).visitListCarriedOuts.isEmpty &&
            state is OnGetVisitsCarriedOutLoadingState) {
          return Expanded(child: TransactionSectionShimmerWidget());
        } else if (VisitsCarriedOutCubit.get(context)
                .visitListCarriedOuts
                .isEmpty &&
            state is! OnGetVisitsCarriedOutLoadingState) {
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
                children: VisitsCarriedOutCubit.get(context)
                    .visitListCarriedOuts
                    .map((item) => VisitsCarriedOutItemWidget(
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
