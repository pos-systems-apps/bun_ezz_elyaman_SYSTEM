import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/styles.dart';

class FundListTableWidget extends StatelessWidget {
  const FundListTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
        TableRow(children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'اجمالي المبيعات الكاش',
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                "123",
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'اجمالي المبيعات الكاش',
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                "123",
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'اجمالي المبيعات الكاش',
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                "123",
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'اجمالي المبيعات الكاش',
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                "123",
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'اجمالي المبيعات الكاش',
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                "123",
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'اجمالي المبيعات الكاش',
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                "123",
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'اجمالي المبيعات الكاش',
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                "123",
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'اجمالي المبيعات الكاش',
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                "123",
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'اجمالي المبيعات الكاش',
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                "123",
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'اجمالي المبيعات الكاش',
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                "123",
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'اجمالي المبيعات الكاش',
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                "123",
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
        ]),
        TableRow(children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                'اجمالي المبيعات الكاش',
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                "123",
                textAlign: TextAlign.center,
                style: TextStyles.font14BlackColorWeight400,
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
