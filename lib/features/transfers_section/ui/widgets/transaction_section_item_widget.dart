import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/transfers_section/data/models/transaction_section_response_model.dart';

class TransactionSectionItemWidget extends StatelessWidget {
  final TransactionSectionResponseModel item;

  const TransactionSectionItemWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.blueColorEEE),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text("ملخص التحويل",
                style: TextStyles.font16MainColorWeight500),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "السعر",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": ${item.amount.toStringAsFixed(2)}",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "الملاحظة",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": ${item.note}",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          if (item.active)
            Text("تم الموافقه علي التحويل",
                style: TextStyles.font14greenColor3EWeight600),
          if (item.active) verticalSpace(4),
          if (!item.active)
            Text("قيد الانتظار",
                style: TextStyles.font14GreyColor66Weight600.copyWith(
                    color: AppColors.greyColor66.withValues(alpha: .5))),
          if (!item.active) verticalSpace(4),
        ],
      ),
    );
  }
}
