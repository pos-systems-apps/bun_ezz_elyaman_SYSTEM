import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/app_text_field.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/sales/data/entities/percent_types_class.dart';
import 'package:pos_system/features/sales/data/entities/selected_product_class.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';

class MoneyAndDiscountsWidget extends StatelessWidget {
  const MoneyAndDiscountsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.blueColorEEE),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ادخل نسبه الخصم", style: TextStyles.font14GreyColor33Weight400),
          verticalSpace(8),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: DropdownMenu<PercentTypesClass>(
                    hintText: "نوع الخصم",
                    textStyle: TextStyles.font14GreyColorA5Weight400,
                    menuStyle: MenuStyle(
                      backgroundColor:
                          WidgetStateProperty.all(AppColors.whiteColor),
                    ),
                    onSelected: (PercentTypesClass? value) {},
                    dropdownMenuEntries: AppConstant.percentTypes
                        .map((item) => DropdownMenuEntry(
                              value: item,
                              label: item.nameAr,
                            ))
                        .toList()),
              ),
              horizontalSpace(7),
              Expanded(
                flex: 1,
                child: AppTextFormField(
                    hintText: "",
                    hintStyle: TextStyles.font14GreyColorA5Weight400,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.blueColorEEE,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.blueColorEEE,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    validator: (String? value) {},
                    keyboardType: TextInputType.number),
              ),
              horizontalSpace(7),
              Expanded(
                flex: 1,
                child: ButtonWidget(
                    isLoading: false,
                    buttonText: "إضافة",
                    backGroundColor: AppColors.whiteColor,
                    borderColor: AppColors.mainColor,
                    borderRadius: 4,
                    textStyle: TextStyles.font14MainColorWeight400,
                    onPressed: () {}),
              ),
            ],
          ),
          verticalSpace(16),
          BlocBuilder<SalesCubit, SalesState>(
            buildWhen: (previous, current) {
              return current is OnChangeSelectedProductState;
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ملخص الطلب",
                      style: TextStyles.font14GreyColor33Weight400),
                  verticalSpace(16),
                  _moneyWidget(
                      "اجمالي الفاتوره",
                      ReseatSelectedProducts(
                              selectedProducts: SalesCubit.get(context).selectedProducts)
                          .getTotalReseat()
                          .toStringAsFixed(2)),
                  verticalSpace(16),
                  _moneyWidget("خصم المنتج", "122"),
                  verticalSpace(16),
                  _moneyWidget("خصم اضافي", "122"),
                  verticalSpace(16),
                  _moneyWidget("ضريبه القيمه المضافه", "122"),
                  verticalSpace(16),
                  Divider(color: AppColors.blueColorEEE),
                  verticalSpace(16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("الإجمالى",
                              maxLines: 1,
                              style: TextStyles.font16GreyColor33Weight500),
                          verticalSpace(4),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "الاسعار شاملة للضريبة ",
                              style: TextStyles.font14GreyColorA5Weight400,
                            ),
                            TextSpan(
                              text: "*",
                              style: TextStyles.font14RedColorWeight400,
                            ),
                          ])),
                        ],
                      )),
                      Text("122", style: TextStyles.font16GreyColor33Weight500),
                    ],
                  ),
                ],
              );
            },
          ),
          verticalSpace(16),
        ],
      ),
    );
  }

  Row _moneyWidget(String text, String money) {
    return Row(
      children: [
        Expanded(
            child: Text(text,
                maxLines: 2, style: TextStyles.font15GreyColor66Weight400)),
        Text(money, style: TextStyles.font15GreyColor66Weight400),
      ],
    );
  }
}
