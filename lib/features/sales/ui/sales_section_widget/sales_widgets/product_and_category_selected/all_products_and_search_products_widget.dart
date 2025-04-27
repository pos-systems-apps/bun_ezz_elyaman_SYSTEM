import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/app_text_field.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/sales/data/entities/order_type_class.dart';
import 'package:pos_system/features/sales/data/entities/selected_product_class.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/sales_widgets/product_and_category_selected/sales_product_widget.dart';

class AllProductsAndSearchProductsWidget extends StatelessWidget {
  final bool isSearch;

  const AllProductsAndSearchProductsWidget({required this.isSearch, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        controller: SalesCubit.get(context).categoryProductsScrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 1 / 1.8,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: isSearch
            ? SalesCubit.get(context).searchProducts.length
            : SalesCubit.get(context).products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              if ((isSearch
                      ? SalesCubit.get(context).searchProducts[index].quantity
                      : SalesCubit.get(context).products[index].quantity) ==
                  0.0) {
                ErrorAlertDialog.getDialog(context, "هذا المنتج غير متوفر");
              } else {
                if (SalesCubit.get(context).selectedProductsIsContainProduct(
                    SelectedProductClass(
                        product: isSearch
                            ? SalesCubit.get(context).searchProducts[index]
                            : SalesCubit.get(context).products[index]))) {
                  ///item found remove it
                  ///
                  SalesCubit.get(context).removeProductFromSelectedProducts(
                      SelectedProductClass(
                          product: isSearch
                              ? SalesCubit.get(context).searchProducts[index]
                              : SalesCubit.get(context).products[index]));
                } else {
                  ///item not found add it
                  ///
                  await _productSelectedDetailsWidget(
                          context,
                          GlobalKey(),
                          TextEditingController(),
                          TextEditingController(),
                          isSearch
                              ? SalesCubit.get(context).searchProducts[index]
                              : SalesCubit.get(context).products[index],
                          SalesCubit.get(context).selectedOrderType)
                      .then((value) {
                    if (value != null) {
                      SalesCubit.get(context)
                          .addProductToSelectedProducts(value);
                    }
                  });
                }
              }
            },
            child: SalesProductWidget(
                product: isSearch
                    ? SalesCubit.get(context).searchProducts[index]
                    : SalesCubit.get(context).products[index],
                isSelected: SalesCubit.get(context)
                    .selectedProductsIsContainProduct(SelectedProductClass(
                        product: isSearch
                            ? SalesCubit.get(context).searchProducts[index]
                            : SalesCubit.get(context).products[index]))),
          );
        });
  }

  Future<SelectedProductClass?> _productSelectedDetailsWidget(
      BuildContext context,
      GlobalKey<FormState> formKEy,
      TextEditingController bigItemController,
      TextEditingController smallItemController,
      Product product,
      OrderTypeClass selectedOrderType) async {
    return await showModalBottomSheet<SelectedProductClass>(
        context: context,
        enableDrag: true,
        isDismissible: true,
        barrierColor: AppColors.blackColor.withValues(alpha: .7),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          int bigQuantity = product.quantity.toInt();
          int smallQuantity =
              ((product.quantity - bigQuantity) * product.unitValue).toInt();
          return Container(
            padding: EdgeInsets.only(bottom: context.viewInsetsBottom),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r)),
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
                            context.locale.languageCode == "ar"
                                ? product.nameAr
                                : product.nameEn,
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
                                color: AppColors.mainColor, width: 1.6),
                          ),
                          child: Text(
                            product.quantity.toStringAsFixed(1),
                            maxLines: 1,
                            style: TextStyles.font18greyColor27Weight600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "ادخل الكميه المطلوبه",
                      style: TextStyles.font14greyColor62Weight400,
                    ),
                    SizedBox(height: 30.h),

                    ///
                    ///
                    Center(
                      child: Form(
                        key: formKEy,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///decimal part
                            Spacer(
                              flex: 2,
                            ),
                            Expanded(
                                flex: 1,
                                child: AppTextFormField(
                                  hintText: smallQuantity.toString(),
                                  controller: smallItemController,
                                  hintStyle:
                                      TextStyles.font16BlackColorWeight400,
                                  backgroundColor: AppColors.whiteColor,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 14.h),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.blueColorEEE,
                                      width: 1.3,
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.blueColorEEE,
                                      width: 1.3,
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.redColor00,
                                      width: 1.3,
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.redColor00,
                                      width: 1.3,
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  validator: (String? value) {
                                    if (value != null &&
                                        ((int.tryParse(bigItemController.text
                                                    .toString()) ??
                                                0) >
                                            bigQuantity) &&
                                        ((int.tryParse(value.toString()) ?? 0) >
                                            smallQuantity)) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  onchange: (String? value) {},
                                  onTapOutside: () {},
                                  keyboardType: TextInputType.number,
                                )),
                            Text("\t.\t",
                                style: TextStyles.font48greyColor27Weight700),
                            Expanded(
                                flex: 1,
                                child: AppTextFormField(
                                  hintText: bigQuantity.toString(),
                                  controller: bigItemController,
                                  hintStyle:
                                      TextStyles.font16BlackColorWeight400,
                                  backgroundColor: AppColors.whiteColor,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 14.h),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.blueColorEEE,
                                      width: 1.3,
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.blueColorEEE,
                                      width: 1.3,
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.redColor00,
                                      width: 1.3,
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.redColor00,
                                      width: 1.3,
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  validator: (String? value) {
                                    if (value != null &&
                                        ((int.tryParse(value.toString()) ?? 0) >
                                            bigQuantity)) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  onchange: (String? value) {},
                                  onTapOutside: () {},
                                  keyboardType: TextInputType.number,
                                )),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ),

                    ///
                    ///

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
                          if (formKEy.currentState!.validate()) {
                            Navigator.pop(
                                context,
                                SelectedProductClass(
                                  product: product,
                                  maxValueCounter:
                                      (int.tryParse(bigItemController.text) ??
                                          bigQuantity),
                                  minValueCounter:
                                      smallItemController.text.isEmpty
                                          ? smallQuantity
                                          : (int.tryParse(smallItemController
                                                      .text[0]) ??
                                                  smallQuantity)
                                              .floor(),
                                ));
                          }
                        }),
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
                        }),
                    SizedBox(height: 20.h),
                  ]),
            ),
          );
        });
  }
}
