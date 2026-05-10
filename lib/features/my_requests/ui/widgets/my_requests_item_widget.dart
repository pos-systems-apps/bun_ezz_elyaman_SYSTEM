import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/my_requests/data/models/all_requests_response.dart';

class MyRequestsItemWidget extends StatelessWidget {
  final RequestModel item;

  const MyRequestsItemWidget({required this.item, super.key});

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
              "ملخص طلب",
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
            "نوع الطلب",
            item.typeLabel,
          ),

          verticalSpace(4),

          _itemTextWidget(
            "من تاريخ",
            item.startDate == null
                ? "-"
                : "${item.startDate!.year}-${item.startDate!.month.toString().padLeft(2, '0')}-${item.startDate!.day.toString().padLeft(2, '0')}",
          ),

          verticalSpace(4),

          _itemTextWidget(
            "إلى تاريخ",
            item.endDate == null
                ? "-"
                : "${item.endDate!.year}-${item.endDate!.month.toString().padLeft(2, '0')}-${item.endDate!.day.toString().padLeft(2, '0')}",
          ),

          verticalSpace(4),

          _itemTextWidget(
            "عدد الأيام",
            item.days.toString(),
          ),

          verticalSpace(4),

          _itemTextWidget(
            "سبب الطلب",
            item.reason ?? "-",
          ),

          verticalSpace(4),

          Text(
            item.statusLabel,
            style: _getStatusStyle(item.status),
          ),

          if (item.rejectionReason != null &&
              item.rejectionReason!.trim().isNotEmpty) ...[
            verticalSpace(4),
            _itemTextWidget(
              "سبب الرفض",
              item.rejectionReason ?? "-",
            ),
          ],

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
            text: " : $value",
            style: TextStyles.font14GreyColor66Weight400,
          ),
        ],
      ),
    );
  }

  TextStyle _getStatusStyle(String status) {
    if (status == "approved") {
      return TextStyles.font14greenColor3EWeight600;
    }

    if (status == "rejected") {
      return TextStyles.font14redColor000Weight600;
    }

    return TextStyles.font14GreyColor66Weight600.copyWith(
      color: AppColors.greyColor66.withValues(alpha: .5),
    );
  }}
