import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/services/services_locator.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/horizontal_dashed_widget.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_1.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_3.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';

class BillContentWidget extends StatelessWidget {
  const BillContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.blueColorEEE),
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(8),
              MoneyWidget1(
                  text: "اسم العميل",
                  value: SalesCubit.get(context)
                      .invoiceResponseModel!
                      .invoice
                      .customer
                      .name),
              verticalSpace(8),
              MoneyWidget1(
                  text: "السجل التجاري", value: AppConstant.commercialRegistry),
              verticalSpace(8),
              MoneyWidget1(text: "الرقم الضريبي", value: AppConstant.numberTax),
              verticalSpace(8),
            ],
          ) ,
        ),
        verticalSpace(16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: AppColors.blueColorEEE),
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(8),
              MoneyWidget3(
                  text: "اجمالي الفاتوره",
                  value:
                  "${AppConstant.currency} ${AppConstant.confirmRoundTo2Numbers(SalesCubit.get(context).invoiceResponseModel!.invoice.orderAmount + SalesCubit.get(context).invoiceResponseModel!.invoice.productsDiscount + SalesCubit.get(context).invoiceResponseModel!.invoice.extraDiscount)}"),
              verticalSpace(8),
              MoneyWidget3(
                  text: "خصم المنتج",
                  value:
                  "${AppConstant.currency} ${AppConstant.confirmRoundTo2Numbers(SalesCubit.get(context).invoiceResponseModel!.invoice.productsDiscount)}"),
              verticalSpace(8),
              MoneyWidget3(
                  text: "خصم اضافي",
                  value:
                  "${AppConstant.currency} ${AppConstant.confirmRoundTo2Numbers(SalesCubit.get(context).invoiceResponseModel!.invoice.extraDiscount)}"),

              verticalSpace(8),
              MoneyWidget3(
                  text: "الضريبة",
                  value: "${AppConstant.currency} 0"),
              verticalSpace(8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("الإجمالى",
                      maxLines: 1,
                      style: TextStyles
                          .font10GreyColor33Weight500),
                  Spacer(),
                  Text(
                      "${AppConstant.currency} ${AppConstant.confirmRoundTo2Numbers(SalesCubit.get(context).invoiceResponseModel!.invoice.orderAmount)}",
                      style: TextStyles
                          .font12greyColor33Weight600),
                ],
              ),
              verticalSpace(8),
            ],
          ) ,
        ),
        verticalSpace(16),




        verticalSpace(16),
      ],
    );
  }
}
