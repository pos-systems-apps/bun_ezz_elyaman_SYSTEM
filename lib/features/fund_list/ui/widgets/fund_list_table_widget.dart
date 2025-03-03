import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/fund_list/logic/fund_list_cubit.dart';
import 'package:pos_system/features/fund_list/ui/widgets/fund_list_shimmer_widget.dart';

class FundListTableWidget extends StatelessWidget {
  const FundListTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (FundListCubit.get(context).fundList.isEmpty) {
      return FundListShimmerWidget();
    } else {
      return Table(
        border: TableBorder.symmetric(
          inside: BorderSide(color: AppColors.greyColorDB),
        ),
        children: [
          TableRow(children: [
            SizedBox(
              height: 40.h,
              child: Center(
                child: Text(
                  'السند',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyles.font14BlackColorWeightBold,
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
              child: Center(
                child: Text(
                  'المبلغ',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyles.font14BlackColorWeightBold,
                ),
              ),
            ),
          ]),
          ...FundListCubit.get(context).fundList.map(
                (item) => TableRow(children: [
                  Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                      child: Text(
                        item.nameAr,
                        textAlign: TextAlign.center,
                        style: TextStyles.font14BlackColorWeight400,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                      child: Text(
                        item.value.toStringAsFixed(2),
                        textAlign: TextAlign.center,
                        style: TextStyles.font14BlackColorWeight400,
                      ),
                    ),
                  )
                ]),
              ),
        ],
      );
    }
  }
}
