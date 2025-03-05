import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/salary/data/models/get_salary_response_model.dart';

class SalaryItemWidget extends StatelessWidget {
  final Salary item;

  const SalaryItemWidget({required this.item, super.key});

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
            child:
                Text("ملخص الراتب", style: TextStyles.font16MainColorWeight500),
          ),
          verticalSpace(4),
          _textItemWidget("رقم الراتب", "${item.id}"),
          verticalSpace(4),
          _textItemWidget("الاسم ", item.seller.name),
          verticalSpace(4),
          _textItemWidget("الاميل ", item.seller.email),
          verticalSpace(4),
          _textItemWidget("رقم الجوال ", item.seller.phone),
          verticalSpace(4),
          _textItemWidget("الراتب", item.salary),
          verticalSpace(4),
          _textItemWidget("عمولة", item.commission),
          verticalSpace(4),
          _textItemWidget("عدد الزيارات", item.numberOfVisitors),
          verticalSpace(4),
          _textItemWidget("نتائج الزيارات", item.resultOfVisitors),
          verticalSpace(4),
          _textItemWidget("رواتب الزيارات ", item.salaryOfVisitors),
          verticalSpace(4),
          _textItemWidget("كمية التحويلات ", item.transportAmount),
          verticalSpace(4),
          _textItemWidget("النقاط", item.score),
          verticalSpace(4),
          _textItemWidget("راتب شهر ", item.month),
          verticalSpace(4),
          _textItemWidget("الاجازات ", "${item.seller.holidays}"),
          verticalSpace(4),
          _textItemWidget("ملاحظة", item.note),
          verticalSpace(4),
          _textItemWidget("ملاحظة من المدير ", item.noteManager),
          verticalSpace(4),
          _textItemWidget("عدد ايام العمل", "${item.numberOfDays}"),
          verticalSpace(4),
          _textItemWidget("الخصومات", item.discount),
          verticalSpace(4),
          _textItemWidget("الاجمالي", item.total),
          verticalSpace(4),
          _textItemWidget("اخري", item.other),
          verticalSpace(4),
        ],
      ),
    );
  }

  Text _textItemWidget(String title, String value) {
    return Text.rich(
      textAlign: TextAlign.start,
      TextSpan(children: [
        TextSpan(
            text: title,
            style: TextStyles.font14GreyColor66Weight400
                .copyWith(color: AppColors.greyColor66.withValues(alpha: .5))),
        TextSpan(
            text: ": $value", style: TextStyles.font14GreyColor66Weight400),
      ]),
    );
  }
}
