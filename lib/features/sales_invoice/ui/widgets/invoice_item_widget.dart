import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';

class InvoiceItemWidget extends StatelessWidget {
  const InvoiceItemWidget({super.key});

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
            child: Text("ملخص الفاتوره",
                style: TextStyles.font16MainColorWeight500),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "رقم الفاتوره",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": 7458ا",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "التاريخ",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": 27 نوفبير 2025  12:55م",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "نوع الفاتوره",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: ": بيع", style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "اجمالي الفاتوره",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: " : 2355.5",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "ضربيه",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: " : 000", style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "خصم",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: " : 0000",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "المبلغ المدفوع ",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: " : 15546",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(4),
          Text.rich(
            textAlign: TextAlign.start,
            TextSpan(children: [
              TextSpan(
                  text: "طريقه الدفع ",
                  style: TextStyles.font14GreyColor66Weight400.copyWith(
                      color: AppColors.greyColor66.withValues(alpha: .5))),
              TextSpan(
                  text: " : بنك ",
                  style: TextStyles.font14GreyColor66Weight400),
            ]),
          ),
          verticalSpace(16),
          ButtonWidget(
              isLoading: false,
              buttonHeight: 40.h,
              buttonText: "عرض",
              borderRadius: 4.r,
              backGroundColor: AppColors.mainColor,
              borderColor: AppColors.mainColor,
              textStyle: TextStyles.font16WhiteColorWeight500,
              onPressed: () {
                // AddCustomerCubit.get(context).clearAddCustomerData();
              }),
          verticalSpace(4),
        ],
      ),
    );
  }
}
