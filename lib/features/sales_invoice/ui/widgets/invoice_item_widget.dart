import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/sales_invoice/data/models/get_invoices_response_model.dart';
import 'package:intl/intl.dart' as intl;

class InvoiceItemWidget extends StatelessWidget {
  final InvoiceModel item;

  const InvoiceItemWidget({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isReturnInvoice = item.isReturnInvoice;

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
            child: Text(
              isReturnInvoice ? "ملخص المرتجع" : "ملخص الفاتوره",
              style: TextStyles.font16MainColorWeight500,
            ),
          ),

          verticalSpace(4),

          _itemTextWidget(
            isReturnInvoice ? "رقم المرتجع" : "رقم الفاتوره",
            item.invoiceNumber,
          ),

          verticalSpace(4),

          _itemTextWidget(
            "التاريخ",
            item.date == null
                ? "-"
                : intl.DateFormat(
              "d MMMM yyyy h:mm:ss a",
              context.locale.languageCode,
            ).format(item.date!.toLocal()),
          ),

          verticalSpace(4),

          _itemTextWidget(
            "اسم العميل",
            item.customer?.name ?? "-",
          ),

          verticalSpace(4),

          _itemTextWidget(
            isReturnInvoice ? "حالة المرتجع" : "نوع الفاتوره",
            item.statusLabel,
          ),

          verticalSpace(4),

          _itemTextWidget(
            isReturnInvoice ? "اجمالي المرتجع" : "اجمالي الفاتوره",
            item.subtotal.toStringAsFixed(2),
          ),

          if (!isReturnInvoice) ...[
            verticalSpace(4),
            _itemTextWidget(
              "الضريبه",
              item.taxAmount.toStringAsFixed(2),
            ),

            verticalSpace(4),
            _itemTextWidget(
              "المبلغ المدفوع",
              item.paidAmount.toStringAsFixed(2),
            ),

            verticalSpace(4),
            _itemTextWidget(
              "المبلغ المتبقي",
              item.remainingAmount.toStringAsFixed(2),
            ),

            verticalSpace(4),
            _itemTextWidget(
              "خصم",
              item.discountAmount.toStringAsFixed(2),
            ),

            verticalSpace(4),
            _itemTextWidget(
              "طريقه الدفع",
              item.paymentMethodLabel ?? "-",
            ),
          ],

          if (isReturnInvoice) ...[
            verticalSpace(4),
            _itemTextWidget(
              "قيمة الاسترداد",
              item.refundAmount.toStringAsFixed(2),
            ),
          ],

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
              context.pushNamed(
                Routes.electronicInvoiceScreen,
                arguments: {
                  "invoiceId": item.id,
                  "type": isReturnInvoice ? 7 : 4,
                },
              );
            },
          ),

          verticalSpace(4),
        ],
      ),
    );
  }

  Text _itemTextWidget(String title, String value) {
    return Text.rich(
      textAlign: TextAlign.start,
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyles.font14GreyColor66Weight400.copyWith(
              color: AppColors.greyColor66.withValues(alpha: .5),
            ),
          ),
          TextSpan(
            text: " : $value ",
            style: TextStyles.font14GreyColor66Weight400,
          ),
        ],
      ),
    );
  }
}