import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/cash_invoice/data/models/cash_invoices_response_model.dart';
import 'package:intl/intl.dart' as intl;

class CashInvoiceItemWidget extends StatelessWidget {
  final CashInvoice item;

  const CashInvoiceItemWidget({required this.item, super.key});

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
            child: Text("ملخص الايصال",
                style: TextStyles.font16MainColorWeight500),
          ),
          verticalSpace(4),
          _itemTextWidget("رقم الفاتوره", " ${item.id}"),
          verticalSpace(4),
          _itemTextWidget("التاريخ",
              " ${intl.DateFormat("d MMMM yyyy h:mm:ss a", context.locale.languageCode).format(DateTime.parse(item.createdAt).toLocal())}"),
          verticalSpace(4),
          _itemTextWidget("اجمالي الفاتوره", " ${item.price}"),
          verticalSpace(4),
          _itemTextWidget("اسم المندوب", " ${item.sellerName}"),
          verticalSpace(4),
          _itemTextWidget("اسم العميل", " ${item.customerName}"),
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

  Text _itemTextWidget(String title, String value) {
    return Text.rich(
      textAlign: TextAlign.start,
      TextSpan(children: [
        TextSpan(
            text: title,
            style: TextStyles.font14GreyColor66Weight400
                .copyWith(color: AppColors.greyColor66.withValues(alpha: .5))),
        TextSpan(
            text: " : $value ", style: TextStyles.font14GreyColor66Weight400),
      ]),
    );
  }
}
