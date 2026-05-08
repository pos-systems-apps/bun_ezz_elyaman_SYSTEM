import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/app_text_field.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/sales/data/entities/selected_product_class.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/sales_widgets/product_and_category_selected/sales_product_widget.dart';

class AllProductsAndSearchProductsWidget extends StatelessWidget {
  final bool isSearch;

  const AllProductsAndSearchProductsWidget({
    required this.isSearch,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = SalesCubit.get(context);

    final List<TripProductModel> products =
    isSearch ? cubit.searchProducts : cubit.products;

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1 / 1.8,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return GestureDetector(
          onTap: () async {
            if (product.availableQuantity <= 0) {
              ErrorAlertDialog.getDialog(context, "هذا المنتج غير متوفر");
              return;
            }

            final selectedProduct = SelectedProductClass(product: product);

            if (cubit.selectedProductsIsContainProduct(selectedProduct)) {
              cubit.removeProductFromSelectedProducts(selectedProduct);
            } else {
              final value = await _productSelectedDetailsWidget(
                context,
                GlobalKey<FormState>(),
                TextEditingController(),
                product,
              );

              if (value != null) {
                cubit.addProductToSelectedProducts(value);
              }
            }
          },
          child: SalesProductWidget(
            product: product,
            isSelected: cubit.selectedProductsIsContainProduct(
              SelectedProductClass(product: product),
            ),
          ),
        );
      },
    );
  }

  Future<SelectedProductClass?> _productSelectedDetailsWidget(
      BuildContext context,
      GlobalKey<FormState> formKey,
      TextEditingController quantityController,
      TripProductModel product,
      ) async {
    return await showModalBottomSheet<SelectedProductClass>(
      context: context,
      enableDrag: true,
      isDismissible: true,
      barrierColor: AppColors.blackColor.withOpacity(.7),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(bottom: context.viewInsetsBottom),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20.h),

                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        maxLines: 2,
                        style: TextStyles.font18greyColor27Weight600,
                      ),
                    ),
                    horizontalSpace(5),
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: AppColors.mainColor,
                          width: 1.6,
                        ),
                      ),
                      child: Text(
                        "${product.availableQuantity} ${product.unit?.symbol ?? ''}",
                        maxLines: 1,
                        style: TextStyles.font18greyColor27Weight600,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                Text(
                  "ادخل الكمية المطلوبة",
                  style: TextStyles.font14greyColor62Weight400,
                ),

                SizedBox(height: 30.h),

                Form(
                  key: formKey,
                  child: AppTextFormField(
                    hintText: "الكمية",
                    controller: quantityController,
                    hintStyle: TextStyles.font16BlackColorWeight400,
                    backgroundColor: AppColors.whiteColor,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    focusedBorder: _border(AppColors.blueColorEEE),
                    enabledBorder: _border(AppColors.blueColorEEE),
                    errorBorder: _border(AppColors.redColor00),
                    focusedErrorBorder: _border(AppColors.redColor00),
                    validator: (String? value) {
                      final double quantity =
                          double.tryParse(value ?? '') ?? 0;

                      if (quantity <= 0) {
                        return "";
                      }

                      if (quantity > product.availableQuantity) {
                        return "";
                      }

                      return null;
                    },
                    onchange: (String? value) {},
                    onTapOutside: () {},
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                ButtonWidget(
                  isLoading: false,
                  buttonHeight: 44.h,
                  buttonWidth: double.infinity,
                  borderRadius: 8.r,
                  buttonText: "تاكيد",
                  textStyle: TextStyles.font16WhiteColorWeight600,
                  backGroundColor: AppColors.mainColor,
                  borderColor: AppColors.mainColor,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final double quantity =
                          double.tryParse(quantityController.text) ?? 0;

                      Navigator.pop(
                        context,
                        SelectedProductClass(
                          product: product,
                          quantity: quantity,
                        ),
                      );
                    }
                  },
                ),

                SizedBox(height: 12.h),

                ButtonWidget(
                  isLoading: false,
                  buttonHeight: 44.h,
                  buttonWidth: double.infinity,
                  borderRadius: 8.r,
                  backGroundColor: AppColors.whiteColor,
                  borderColor: AppColors.mainColor,
                  buttonText: "الغاء",
                  textStyle: TextStyles.font16MainColorWeight600,
                  onPressed: () {
                    context.pop();
                  },
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(4.r),
    );
  }
}