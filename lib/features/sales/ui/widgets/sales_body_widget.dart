import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/sales/ui/widgets/product_and_category_selected/categories_widget.dart';
import 'package:pos_system/features/sales/ui/widgets/product_and_category_selected/products_widget.dart';
import 'package:pos_system/features/sales/ui/widgets/sales_order_type/sales_order_types_widget.dart';
import 'package:pos_system/features/sales/ui/widgets/search_product_widget.dart';

class SalesBodyWidget extends StatelessWidget {
  const SalesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SalesOrderTypesWidget(),
                    verticalSpace(24),
                    SearchProductWidget(),
                    CategoriesWidget(),
                    verticalSpace(10),
                    ProductsWidget(),
                    verticalSpace(30),
                  ],
                ),
              ),
            ),
            ButtonWidget(
                buttonHeight: 48.h,
                buttonWidth: double.infinity,
                borderRadius: 6.r,
                buttonText: "اتمام الطلب",
                textStyle: TextStyles.font16WhiteColorWeight400,
                icon: Icons.arrow_forward_ios,
                iconColor: AppColors.whiteColor,
                backGroundColor: AppColors.mainColor,
                borderColor: AppColors.mainColor,
                onPressed: () {}),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
