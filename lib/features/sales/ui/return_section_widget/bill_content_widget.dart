import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_title_widget_2.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_1.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/money_widget_3.dart';
import 'package:pos_system/features/sales/data/entities/returned_product_class.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';
import 'package:pos_system/features/sales/ui/return_section_widget/products_widget.dart';

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
          child: Column(
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
              // MoneyWidget1(
              //     text: "السجل التجاري", value: AppConstant.commercialRegistry),
              // verticalSpace(8),
              // MoneyWidget1(text: "الرقم الضريبي", value: AppConstant.numberTax),
              verticalSpace(8),
            ],
          ),
        ),
        verticalSpace(16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: AppColors.blueColorEEE),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(8),
              MoneyWidget3(
                  text: "اجمالي الفاتوره",
                  value:
                      " 'جنيه'  ${AppConstant.confirmRoundTo3Numbers(SalesCubit.get(context).invoiceResponseModel!.invoice.orderAmount + SalesCubit.get(context).invoiceResponseModel!.invoice.productsDiscount + SalesCubit.get(context).invoiceResponseModel!.invoice.extraDiscount - SalesCubit.get(context).invoiceResponseModel!.invoice.totalTax)}"),
              verticalSpace(8),
              MoneyWidget3(
                  text: "خصم المنتج",
                  value:
                      " 'جنيه'  ${AppConstant.confirmRoundTo3Numbers(SalesCubit.get(context).invoiceResponseModel!.invoice.productsDiscount)}"),
              verticalSpace(8),
              MoneyWidget3(
                  text: "خصم اضافي",
                  value:
                      " 'جنيه'  ${AppConstant.confirmRoundTo3Numbers(SalesCubit.get(context).invoiceResponseModel!.invoice.extraDiscount)}"),
              verticalSpace(8),
              MoneyWidget3(
                  text: "الضريبة",
                  value:
                      " 'جنيه'  ${AppConstant.confirmRoundTo3Numbers(SalesCubit.get(context).invoiceResponseModel!.invoice.totalTax)}"),
              verticalSpace(8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("الإجمالى",
                      maxLines: 1,
                      style: TextStyles.font10GreyColor33Weight500),
                  Spacer(),
                  Text(
                      " 'جنيه'  ${AppConstant.confirmRoundTo3Numbers(SalesCubit.get(context).invoiceResponseModel!.invoice.orderAmount)}",
                      style: TextStyles.font12greyColor33Weight600),
                ],
              ),
              verticalSpace(8),
            ],
          ),
        ),
        verticalSpace(16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: AppColors.blueColorEEE),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: MoneyTitleWidget2()),
                  horizontalSpace(16),
                ],
              ),
              verticalSpace(8),
              ...SalesCubit.get(context)
                  .invoiceResponseModel!
                  .invoice
                  .details
                  .map((item) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductsWidget(
                              product: item,
                              text: item.nameAr,
                              quantity: item.quantity.toStringAsFixed(2),
                              measure:   AppConstant.measureUnits[1].name ,
                              price: ReturnedProductClass()
                                  .getProductTotalPrice(
                                      item).toStringAsFixed(3)),
                          verticalSpace(8),
                        ],
                      )),
            ],
          ),
        ),
        verticalSpace(16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: AppColors.blueColorEEE),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(8),
              BlocBuilder<SalesCubit, SalesState>(
                buildWhen: (previous, current) {
                  return current is OnChangeSelectedReturnProductState;
                },
                builder: (context, state) {
                  return MoneyWidget3(
                      text: "اجمالي المرتجع",
                      value:
                          " 'جنيه'  ${ReturnedProductClass()
                              .getTotalPriceReturnedProducts(
                              SalesCubit.get(context).selectedReturnProducts,)
                              .toStringAsFixed(3)}");

                },
              ),
              verticalSpace(8),

            ],
          ),
        ),

        //all data about the discount
        verticalSpace(16),
      ],
    );
  }
}
