import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/salary/logic/salary_cubit.dart';
import 'package:pos_system/features/salary/logic/salary_state.dart';
import 'package:pos_system/features/salary/ui/widgets/salary_item_widget.dart';
import 'package:pos_system/features/salary/ui/widgets/salary_shimmer_widget.dart';

class SalaryBodyWidget extends StatelessWidget {
  const SalaryBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocBuilder<SalaryCubit, SalaryState>(
          buildWhen: (previous, current) {
            return current is OnGetSalaryLoadingState ||
                current is OnGetSalarySuccessState ||
                current is OnGetSalaryErrorState ||
                current is OnGetSalaryCatchErrorState;
          },
          builder: (context, state) {
            if (SalaryCubit.get(context).salary.isEmpty &&
                state is OnGetSalaryLoadingState) {
              return SalaryShimmerWidget();
            } else if (SalaryCubit.get(context)
                    .salary
                    .isEmpty &&
                state is! OnGetSalaryLoadingState) {
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
                children: SalaryCubit.get(context)
                    .salary
                    .map((item) => SalaryItemWidget(item: item))
                    .toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
