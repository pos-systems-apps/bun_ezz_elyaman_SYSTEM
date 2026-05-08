import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/app_text_field.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/print_invoice/data/models/invoice_response_model.dart';
import 'package:pos_system/features/sales/data/entities/returned_product_class.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';

class ProductsWidget extends StatelessWidget {
  final InvoiceItemModel product;
  final String text;
  final String quantity;
  final String measure;
  final String price;

  const ProductsWidget({
    required this.text,
    required this.product,
    required this.quantity,
    required this.measure,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            text,
            textAlign: TextAlign.start,
            maxLines: 3,
            style: TextStyles.font10GreyColor33Weight500,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            quantity,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: TextStyles.font10BlackColorWeight500,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            measure,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: TextStyles.font10BlackColorWeight500,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            price,
            textAlign: TextAlign.start,
            maxLines: 1,
            style: TextStyles.font10BlackColorWeight500,
          ),
        ),
        BlocBuilder<SalesCubit, SalesState>(
          buildWhen: (previous, current) {
            return current is OnChangeSelectedReturnProductState;
          },
          builder: (context, state) {
            final cubit = SalesCubit.get(context);

            final selectedReturnProduct = SelectedReturnProductClass(
              product: product,
            );

            final bool isSelected =
            cubit.selectedReturnedProductsIsContainProduct(
              selectedReturnProduct,
            );

            return GestureDetector(
              onTap: () async {
                if (isSelected) {
                  cubit.removeProductFromSelectedReturnProducts(
                    selectedReturnProduct,
                  );
                } else {
                  final value = await _productSelectedReturnWidget(
                    context,
                    GlobalKey<FormState>(),
                    TextEditingController(),
                    product,
                  );

                  if (value != null) {
                    cubit.addProductToSelectedReturnProducts(value);
                  }
                }
              },
              child: Container(
                height: 16.r,
                width: 16.r,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: isSelected ? AppColors.mainColor : AppColors.whiteColor,
                  border: Border.all(
                    color: AppColors.mainColor,
                    width: 2.w,
                  ),
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: AppColors.whiteColor,
                  size: 12.r,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Future<SelectedReturnProductClass?> _productSelectedReturnWidget(
      BuildContext context,
      GlobalKey<FormState> formKey,
      TextEditingController returnItemQuantityController,
      InvoiceItemModel product,
      ) async {
    return await showModalBottomSheet<SelectedReturnProductClass>(
      context: context,
      enableDrag: true,
      isDismissible: true,
      barrierColor: AppColors.blackColor.withValues(alpha: .7),
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
                        product.product?.name ?? "-",
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
                        "${product.quantity.toStringAsFixed(2)} ${product.unit?.name ?? ''}",
                        maxLines: 1,
                        style: TextStyles.font18greyColor27Weight600,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                Text(
                  "ادخل كمية المرتجع",
                  style: TextStyles.font14greyColor62Weight400,
                ),

                SizedBox(height: 30.h),

                Center(
                  child: Form(
                    key: formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),
                        Expanded(
                          flex: 2,
                          child: AppTextFormField(
                            textAlign: TextAlign.center,
                            hintText: product.quantity.toStringAsFixed(2),
                            controller: returnItemQuantityController,
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
                              final double returnQuantity =
                                  double.tryParse(value ?? '') ?? 0;

                              if (returnQuantity <= 0) {
                                return "";
                              }

                              if (returnQuantity > product.quantity) {
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
                        const Spacer(flex: 2),
                      ],
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
                      Navigator.pop(
                        context,
                        SelectedReturnProductClass(
                          product: product,
                          returnQuantity: double.tryParse(
                            returnItemQuantityController.text,
                          ) ??
                              product.quantity,
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