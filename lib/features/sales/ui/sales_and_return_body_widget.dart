import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/app_text_field.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/core/widgets/loading_widget.dart';
import 'package:pos_system/features/print_invoice/ui/widgets/invoice_shimmer_widget.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';
import 'package:pos_system/features/sales/ui/reseat_screen.dart';
import 'package:pos_system/features/sales/ui/return_section_widget/bill_content_widget.dart';
import 'package:pos_system/features/sales/ui/return_section_widget/bill_id_text_field_widget.dart';
import 'package:pos_system/features/sales/ui/return_section_widget/search_bill_widget.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/sales_widgets/product_and_category_selected/all_sales_products_widget.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/sales_widgets/product_and_category_selected/sales_categories_widget.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/sales_widgets/sales_order_type/sales_order_types_widget.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/sales_widgets/search_product_widget.dart';

class SalesAndReturnBodyWidget extends StatelessWidget {
  const SalesAndReturnBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesState>(
      buildWhen: (previous, current) {
        return current is OnChangeOrderTypeSelectState;
      },
      builder: (context, state) {
        if (SalesCubit.get(context).selectedOrderType.id == 4) {
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
                            if (SalesCubit.get(context)
                                .selectedProducts
                                .isEmpty) {
                              ErrorAlertDialog.getDialog(
                                  context, "لم يتم اختيار منتجات ");
                            } else {
                              context.pushNamed(Routes.reseatScreen,
                                  arguments: {"context": context});
                            }
                          });
                    },
                  ),
                  verticalSpace(40),
                ],
              ),
            ),
          );
        } else {
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
                          SearchBillWidget(),
                          verticalSpace(24),
                          BlocBuilder<SalesCubit, SalesState>(
                            buildWhen: (previous, current) {
                              return current is OnGetInvoiceDetailsLoadingState ||
                                  current is OnGetInvoiceDetailsErrorState ||
                                  current
                                      is OnGetInvoiceDetailsCatchErrorState ||
                                  current is OnGetInvoiceDetailsSuccessState;
                            },
                            builder: (context, state) {
                              if (SalesCubit.get(context)
                                          .invoiceResponseModel ==
                                      null &&
                                  state is OnGetInvoiceDetailsLoadingState) {
                                return Center(child: LoadingWidget(color:  AppColors.mainColor),);
                              } else if (SalesCubit.get(context)
                                          .invoiceResponseModel ==
                                      null &&
                                  state is! OnGetInvoiceDetailsLoadingState) {
                                return Lottie.asset(
                                  ImageAsset.notFoundAnimation,
                                  height: 210.h,
                                  repeat: true,
                                  fit: BoxFit.fitHeight,
                                );
                              } else {
                                return BillContentWidget();
                              }
                            },
                          ),
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
                            if (SalesCubit.get(context)
                                .selectedProducts
                                .isEmpty) {
                              ErrorAlertDialog.getDialog(
                                  context, "لم يتم اختيار منتجات ");
                            } else {
                              context.pushNamed(Routes.reseatScreen,
                                  arguments: {"context": context});
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
      },
    );
  }
}
