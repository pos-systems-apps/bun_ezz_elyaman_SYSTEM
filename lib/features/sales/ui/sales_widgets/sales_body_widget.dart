import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';
import 'package:pos_system/features/sales/ui/reseat_screen.dart';
import 'package:pos_system/features/sales/ui/sales_widgets/product_and_category_selected/sales_categories_widget.dart';
import 'package:pos_system/features/sales/ui/sales_widgets/product_and_category_selected/all_sales_products_widget.dart';
import 'package:pos_system/features/sales/ui/sales_widgets/sales_order_type/sales_order_types_widget.dart';
import 'package:pos_system/features/sales/ui/sales_widgets/search_product_widget.dart';

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
                    SalesCategoriesWidget(),
                    verticalSpace(10),
                    AllSalesProductsWidget(),
                    verticalSpace(30),
                  ],
                ),
              ),
            ),
            BlocBuilder<SalesCubit, SalesState>(
              buildWhen: (previous, current) {
                return current is OnChangeSelectedProductState;
              },
              builder: (context, state) {
                return ButtonWidget(
                    isLoading: false,
                    buttonHeight: 48.h,
                    buttonWidth: double.infinity,
                    borderRadius: 6.r,
                    buttonText: "اتمام الطلب",
                    textStyle: TextStyles.font16WhiteColorWeight400,
                    icon: Icons.arrow_forward_ios,
                    iconColor: AppColors.whiteColor,
                    backGroundColor: AppColors.mainColor,
                    borderColor: AppColors.mainColor,
                    onPressed: () {
                      if (SalesCubit.get(context).selectedProducts.isEmpty) {
                        ErrorAlertDialog.getDialog(
                            context, "لم يتم اختيار منتجات ");
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider<SalesCubit>.value(
                              value: SalesCubit.get(context),
                              child: ReseatScreen(),
                            ),
                          ),
                        );
                      }
                    });
              },
            ),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
