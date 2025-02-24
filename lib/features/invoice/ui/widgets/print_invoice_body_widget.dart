import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/horizontal_dashed_widget.dart';
import 'package:pos_system/features/invoice/ui/widgets/money_title_widget_2.dart';
import 'package:pos_system/features/invoice/ui/widgets/money_widget_1.dart';
import 'package:pos_system/features/invoice/ui/widgets/money_widget_2.dart';
import 'package:pos_system/features/invoice/ui/widgets/money_widget_3.dart';

class PrintInvoiceBodyWidget extends StatelessWidget {
  const PrintInvoiceBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImageAsset.logoImage,
                height: 66.h,
                width: 80.w,
                fit: BoxFit.cover,
              ),
              verticalSpace(10),
              Text(
                "الثلاثاء 28 يناير 2025 , 13:45:28",
                style: TextStyles.font10BlackColorWeight400,
              ),
              verticalSpace(10),
              HorizontalDashedWidget(width: 4, space: 4),
              verticalSpace(16),
              MoneyWidget1(text: "اسم المندوب", value: "احمد خطاب"),
              verticalSpace(8),
              MoneyWidget1(text: "كود العربه", value: "احمد خطاب"),
              verticalSpace(8),
              MoneyWidget1(text: "كود المندوب", value: "احمد خطاب"),
              verticalSpace(8),
              MoneyWidget1(text: "اسم العميل", value: "برست كتكوت الطازج"),
              verticalSpace(8),
              MoneyWidget1(text: "طريقه الدفع", value: "مرتجع"),
              verticalSpace(16),
              HorizontalDashedWidget(width: 4, space: 4),
              verticalSpace(16),
              MoneyTitleWidget2(),
              verticalSpace(8),
              MoneyWidget2(
                  text: "عصير صان توب 200 ملي ",
                  quantity: "01",
                  measure: "كبري",
                  price: "80:00"),
              verticalSpace(8),
              MoneyWidget2(
                  text: "عصير صان توب 200 ملي ",
                  quantity: "01",
                  measure: "كبري",
                  price: "80:00"),
              verticalSpace(8),
              MoneyWidget2(
                  text: "عصير صان توب 200 ملي ",
                  quantity: "01",
                  measure: "كبري",
                  price: "80:00"),
              verticalSpace(8),
              MoneyWidget2(
                  text: "عصير صان توب 200 ملي ",
                  quantity: "01",
                  measure: "كبري",
                  price: "80:00"),
              verticalSpace(24),
              HorizontalDashedWidget(width: 4, space: 4),
              verticalSpace(16),
              Row(
                children: [
                  Text("ملخص الطلب",
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: TextStyles.font10GreyColor78Weight400),
                ],
              ),
              verticalSpace(8),
              MoneyWidget3(text: "اجمالي الفاتوره", value: "145 رس"),
              verticalSpace(8),
              MoneyWidget3(text: "خصم المنتج", value: "145 رس"),
              verticalSpace(8),
              MoneyWidget3(text: "خصم اضافي", value: "145 رس"),
              verticalSpace(8),
              MoneyWidget3(text: "ضريبه القيمه المضافه", value: "145 رس"),
              verticalSpace(30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("الإجمالى",
                          maxLines: 1,
                          style: TextStyles.font10GreyColor33Weight500),
                      verticalSpace(4),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "الاسعار شاملة للضريبة ",
                          style: TextStyles.font10GreyColorA5Weight400,
                        ),
                        TextSpan(
                          text: "*",
                          style: TextStyles.font14RedColorWeight400,
                        ),
                      ])),
                    ],
                  )),
                  Text("145 رس", style: TextStyles.font12greyColor33Weight600),
                ],
              ),
              verticalSpace(24),
              ButtonWidget(
                  isLoading: false,
                  buttonHeight: 48.h,
                  borderRadius: 10.r,
                  buttonText: "طباعه",
                  backGroundColor: AppColors.mainColor,
                  textStyle: TextStyles.font14WhiteColorWeight500,
                  onPressed: () {
///
                    ///
                  }),

              verticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }
}
