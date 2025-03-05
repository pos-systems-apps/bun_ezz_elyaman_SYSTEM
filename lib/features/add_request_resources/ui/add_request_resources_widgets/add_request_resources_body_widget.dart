import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/add_request_resources_search_product_widget.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/add_resources_type/select_add_resources_types_widget.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/product_and_category_selected/add_request_resources_categories_widget.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/product_and_category_selected/add_request_resources_products_widget.dart';

class AddRequestResourcesBodyWidget extends StatelessWidget {
  const AddRequestResourcesBodyWidget({super.key});

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
                    SelectAddResourcesTypesWidget(),
                    verticalSpace(24),
                    AddRequestResourcesSearchProductWidget(),
                    AddRequestResourcesCategoriesWidget(),
                    verticalSpace(10),
                    AddRequestResourcesProductsWidget(),
                    verticalSpace(30),
                  ],
                ),
              ),
            ),
            // BlocBuilder<SalesCubit, SalesState>(
            //   buildWhen: (previous, current) {
            //     return current is OnChangeSelectedProductState;
            //   },
            //   builder: (context, state) {
            //     return ButtonWidget(
            //         isLoading: false,
            //         buttonHeight: 48.h,
            //         buttonWidth: double.infinity,
            //         borderRadius: 6.r,
            //         buttonText: "اتمام الطلب",
            //         textStyle: TextStyles.font16WhiteColorWeight400,
            //         icon: Icons.arrow_forward_ios,
            //         iconColor: AppColors.whiteColor,
            //         backGroundColor: AppColors.mainColor,
            //         borderColor: AppColors.mainColor,
            //         onPressed: () {
            //           if (SalesCubit.get(context).selectedProducts.isEmpty) {
            //             ErrorAlertDialog.getDialog(
            //                 context, "لم يتم اختيار منتجات ");
            //           } else {
            //             context.pushNamed(Routes.reseatScreen,
            //                 arguments: {"context": context});
            //           }
            //         });
            //   },
            // ),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
