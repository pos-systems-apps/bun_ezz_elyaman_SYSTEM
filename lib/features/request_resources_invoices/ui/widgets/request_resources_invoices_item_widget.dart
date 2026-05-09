import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/request_resources_invoices/data/models/get_resources_invoices_response_model.dart';
import 'package:intl/intl.dart' as intl;

class RequestResourcesInvoicesItemWidget extends StatelessWidget {
  final ResourceInvoiceModel item;

  const RequestResourcesInvoicesItemWidget({required this.item, super.key});

  @override
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
            child: Text(
              "ملخص طلب الحجز",
              style: TextStyles.font16MainColorWeight500,
            ),
          ),

          verticalSpace(4),

          _itemTextWidget(
            "رقم الطلب",
            item.id.toString(),
          ),

          verticalSpace(4),

          _itemTextWidget(
            "التاريخ",
            item.createdAt == null
                ? "-"
                : intl.DateFormat(
              "d MMMM yyyy h:mm:ss a",
              context.locale.languageCode,
            ).format(item.createdAt!.toLocal()),
          ),

          verticalSpace(4),

          _itemTextWidget(
            "رقم الرحلة",
            item.trip?.tripNumber ?? "-",
          ),

          verticalSpace(4),

          _itemTextWidget(
            "حالة الطلب",
            item.statusLabel,
          ),

          if (item.customerName != null) ...[
            verticalSpace(4),
            _itemTextWidget(
              "اسم العميل",
              item.customerName ?? "-",
            ),
          ],

          if (item.customerPhone != null) ...[
            verticalSpace(4),
            _itemTextWidget(
              "رقم العميل",
              item.customerPhone ?? "-",
            ),
          ],

          if (item.customerAddress != null) ...[
            verticalSpace(4),
            _itemTextWidget(
              "عنوان العميل",
              item.customerAddress ?? "-",
            ),
          ],

          if (item.notes != null) ...[
            verticalSpace(4),
            _itemTextWidget(
              "ملاحظات",
              item.notes ?? "-",
            ),
          ],

          verticalSpace(12),

          Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  "اسم المنتج",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyles.font10GreyColor78Weight400,
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 2,
                child: Text(
                  "الكمية",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyles.font10GreyColor78Weight400,
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 2,
                child: Text(
                  "الوحدة",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyles.font10GreyColor78Weight400,
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 2,
                child: Text(
                  "السعر",
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyles.font10GreyColor78Weight400,
                ),
              ),
            ],
          ),

          verticalSpace(4),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: item.items.map(
                  (element) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _itemsData(
                      element.product?.name ?? "-",
                      element.quantity.toStringAsFixed(2),
                      element.unit?.name ?? "-",
                      element.unitPrice.toStringAsFixed(2),
                    ),
                    verticalSpace(4),
                  ],
                );
              },
            ).toList(),
          ),

          verticalSpace(8),

          _itemTextWidget(
            "الإجمالي",
            item.items.fold<double>(
              0,
                  (sum, element) => sum + element.subtotal,
            ).toStringAsFixed(2),
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
              context.pushNamed(
                Routes.electronicResourcesInvoicesScreen,
                arguments: {"invoiceId": item.id},
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

  Row _itemsData(String name, String stock, String balance, String price) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(name,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyles.font10GreyColor33Weight500),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Text(stock,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyles.font10BlackColorWeight500),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Text(balance,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyles.font10BlackColorWeight500),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Text(price,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyles.font10BlackColorWeight500),
        ),
      ],
    );
  }
}
