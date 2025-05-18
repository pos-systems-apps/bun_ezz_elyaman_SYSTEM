// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pos_system/core/api/end_points.dart';
// import 'package:pos_system/core/utils/app_colors_white_theme.dart';
// import 'package:pos_system/core/utils/app_constant.dart';
// import 'package:pos_system/core/utils/spacing.dart';
// import 'package:pos_system/core/utils/styles.dart';
// import 'package:pos_system/core/widgets/app_text_field.dart';
// import 'package:pos_system/core/widgets/cached_network_image.dart';
// import 'package:pos_system/features/sales/data/entities/selected_product_class.dart';
// import 'package:pos_system/features/sales/logic/sales_cubit.dart';
//
// class ProductSelectedWidget extends StatelessWidget {
//   final SelectedProductClass selectedProduct;
//
//   const ProductSelectedWidget({required this.selectedProduct, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//     TextEditingController productController = TextEditingController(
//         text:
//             "${selectedProduct.maxValueCounter}.${selectedProduct.minValueCounter}");
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//       margin: EdgeInsets.symmetric(vertical: 8.h),
//       decoration: BoxDecoration(
//         color: AppColors.whiteColor,
//         borderRadius: BorderRadius.circular(4.r),
//         border: Border.all(color: AppColors.blueColorEEE),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Container(
//                 height: 80.h,
//                 width: 73.w,
//                 decoration: BoxDecoration(
//                   color: AppColors.whiteColor,
//                   borderRadius: BorderRadius.circular(4.r),
//                   border: Border.all(color: AppColors.blueColorEEE),
//                 ),
//                 child: CachedNetworkImageWidget(
//                     imgUrl: EndPoints().getImageFromApi(
//                         "product/${selectedProduct.product.image}"),
//                     radius: 4.r),
//               ),
//               horizontalSpace(16),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       context.locale.languageCode == "ar"
//                           ? selectedProduct.product.nameAr
//                           : selectedProduct.product.nameEn,
//                       maxLines: 2,
//                       style: TextStyles.font16GreyColor33Weight500,
//                     ),
//                     Row(
//                       children: [
//                         if (selectedProduct.product.discount == 0)
//                           Text(
//                             "${AppConstant.currency} ${selectedProduct.product.sellingPrice.toStringAsFixed(2)}",
//                             style: TextStyles.font14GreyColor66Weight400,
//                           ),
//                         horizontalSpace(4),
//                         if (selectedProduct.product.discount != 0)
//                           Text(
//                             selectedProduct.product.sellingPrice
//                                 .toStringAsFixed(2),
//                             style:
//                                 TextStyles.font14GreyColor66Weight400.copyWith(
//                               decoration: TextDecoration.lineThrough,
//                             ),
//                           ),
//                         horizontalSpace(4),
//                         if (selectedProduct.product.discount != 0)
//                           Text(
//                             "${AppConstant.currency}${AppConstant.getProductPriceAfterDiscount(selectedProduct.product.discountType, selectedProduct.product.sellingPrice, selectedProduct.product.discount).toStringAsFixed(2)}",
//                             style: TextStyles.font14GreyColor66Weight400
//                                 .copyWith(color: AppColors.greenColor),
//                           ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               horizontalSpace(10),
//               GestureDetector(
//                 onTap: () {
//                   SalesCubit.get(context)
//                       .removeProductFromSelectedProducts(selectedProduct);
//                 },
//                 child: Container(
//                   height: 28.r,
//                   width: 28.r,
//                   decoration: BoxDecoration(
//                     color: AppColors.greyColorF8,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.close,
//                     color: AppColors.greyColor44,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           verticalSpace(8),
//           Divider(color: AppColors.blueColorEEE),
//           verticalSpace(8),
//           Form(
//             key: formKey,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Spacer(
//                   flex: 1,
//                 ),
//                 Expanded(
//                     flex: 2,
//                     child: AppTextFormField(
//                       hintText: "",
//                       controller: productController,
//                       hintStyle: TextStyles.font16BlackColorWeight400,
//                       backgroundColor: AppColors.whiteColor,
//                       contentPadding:
//                           EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: AppColors.blueColorEEE,
//                           width: 1.3,
//                         ),
//                         borderRadius: BorderRadius.circular(4.r),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: AppColors.blueColorEEE,
//                           width: 1.3,
//                         ),
//                         borderRadius: BorderRadius.circular(4.r),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: AppColors.redColor00,
//                           width: 1.3,
//                         ),
//                         borderRadius: BorderRadius.circular(4.r),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: AppColors.redColor00,
//                           width: 1.3,
//                         ),
//                         borderRadius: BorderRadius.circular(4.r),
//                       ),
//                       validator: (String? value) {
//                         if (value != null &&
//                             ((double.tryParse(value.toString()) ?? 0) >
//                                 selectedProduct.product.quantity) &&
//                             SalesCubit.get(context).selectedOrderType.id ==
//                                 AppConstant.orderTypes[0].id) {
//                           return "notAvailable".tr();
//                         }
//                         return null;
//                       },
//                       onchange: (String? value) {},
//                       onTapOutside: () {
//                         if (productController.text.isEmpty) {
//                           productController.text =
//                               "${selectedProduct.maxValueCounter}.${selectedProduct.minValueCounter}";
//                         }
//                       },
//                       keyboardType:
//                           TextInputType.numberWithOptions(decimal: true),
//                     )),
//                 horizontalSpace(14),
//                 GestureDetector(
//                   onTap: () {
//                     validateProductQuantity(
//                         context, productController, formKey);
//                   },
//                   child: Container(
//                       padding: EdgeInsets.all(4.r),
//                       decoration: BoxDecoration(
//                         color: AppColors.whiteColor,
//                         borderRadius: BorderRadius.circular(4.r),
//                         border: Border.all(color: AppColors.blueColorEEE),
//                       ),
//                       child: Icon(
//                         Icons.check,
//                         color: AppColors.blackColor,
//                         size: 20.r,
//                       )),
//                 ),
//                 const Spacer(flex: 1),
//                 Container(
//                   padding: EdgeInsets.all(8.r),
//                   decoration: BoxDecoration(
//                     color: AppColors.whiteColor,
//                     borderRadius: BorderRadius.circular(4.r),
//                     border: Border.all(color: AppColors.blueColorEEE),
//                   ),
//                   child: Text(
//                     selectedProduct.product.quantity.toStringAsFixed(1),
//                     maxLines: 1,
//                     style: TextStyles.font18greyColor27Weight600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   validateProductQuantity(BuildContext context,
//       TextEditingController controller, GlobalKey<FormState> formKey) {
//     if (formKey.currentState!.validate()) {
//       SalesCubit.get(context)
//           .editInProductFromSelectedProducts(SelectedProductClass(
//         product: selectedProduct.product,
//         maxValueCounter:
//             int.tryParse(controller.text.split(".")[0].toString()) ?? 0,
//         minValueCounter: controller.text.contains(".")
//             ? int.tryParse(controller.text.split(".")[1].toString()) ?? 0
//             : 0,
//       ));
//     }
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/api/end_points.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/app_text_field.dart';
import 'package:pos_system/core/widgets/cached_network_image.dart';
import 'package:pos_system/features/sales/data/entities/selected_product_class.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';

class ProductSelectedWidget extends StatelessWidget {
  final SelectedProductClass selectedProduct;

  const ProductSelectedWidget({required this.selectedProduct, super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> quantityFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> discountFormKey = GlobalKey<FormState>();
    TextEditingController productQuantityController = TextEditingController(
        text:
            "${selectedProduct.maxValueCounter}.${selectedProduct.minValueCounter}");
    TextEditingController discountController = TextEditingController(text: "0");

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.greyColor82.withValues(alpha: .5)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 80.h,
                width: 73.w,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: AppColors.blueColorEEE),
                ),
                child: CachedNetworkImageWidget(
                    imgUrl: EndPoints().getImageFromApi(
                        "product/${selectedProduct.product.image}"),
                    radius: 4.r),
              ),
              horizontalSpace(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.locale.languageCode == "ar"
                          ? selectedProduct.product.nameAr
                          : selectedProduct.product.nameEn,
                      maxLines: 2,
                      style: TextStyles.font16GreyColor33Weight500,
                    ),
                    Row(
                      children: [
                        if (selectedProduct.product.discount == 0)
                          Text(
                            "${AppConstant.currency} ${selectedProduct.product.sellingPrice.toStringAsFixed(2)}",
                            style: TextStyles.font14GreyColor66Weight400,
                          ),
                        horizontalSpace(4),
                        if (selectedProduct.product.discount != 0)
                          Text(
                            selectedProduct.product.sellingPrice
                                .toStringAsFixed(2),
                            style:
                                TextStyles.font14GreyColor66Weight400.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        horizontalSpace(4),
                        if (selectedProduct.product.discount != 0)
                          Text(
                            "${AppConstant.currency}${AppConstant.getProductPriceAfterDiscount(selectedProduct.product.discountType, selectedProduct.product.sellingPrice, selectedProduct.product.discount).toStringAsFixed(2)}",
                            style: TextStyles.font14GreyColor66Weight400
                                .copyWith(color: AppColors.greenColor),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              horizontalSpace(10),
              GestureDetector(
                onTap: () {
                  SalesCubit.get(context)
                      .removeProductFromSelectedProducts(selectedProduct);
                },
                child: Container(
                  height: 28.r,
                  width: 28.r,
                  decoration: BoxDecoration(
                    color: AppColors.greyColorF8,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    color: AppColors.greyColor44,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(8),
          Divider(color: AppColors.blueColorEEE),
          verticalSpace(8),
          Form(
            key: quantityFormKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 70.w,
                    child: Text(
                      "الكمية المطلوبة",
                      maxLines: 4,
                      style: TextStyles.font16GreyColor33Weight500,
                    )),
                horizontalSpace(14),
                Expanded(
                    flex: 2,
                    child: AppTextFormField(
                      hintText: "",
                      controller: productQuantityController,
                      hintStyle: TextStyles.font16BlackColorWeight400,
                      backgroundColor: AppColors.whiteColor,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                            ((double.tryParse(value.toString()) ?? 0) >
                                selectedProduct.product.quantity)) {
                          return "notAvailable".tr();
                        }
                        return null;
                      },
                      onchange: (String? value) {
                        // if (discountController.text.isEmpty) {
                        //
                        //   discountController.text =
                        //       selectedProduct.product.discount == 0
                        //           ? selectedProduct.product.sellingPrice
                        //               .toStringAsFixed(2)
                        //           : AppConstant.getProductPriceAfterDiscount(
                        //                   selectedProduct.product.discountType,
                        //                   selectedProduct.product.sellingPrice,
                        //                   selectedProduct.product.discount)
                        //               .toStringAsFixed(2);
                        // } else {
                        //   if (selectedProduct.product.discount == 0) {
                        //     if ((double.tryParse(discountController.text) ??
                        //             0) <
                        //         selectedProduct.product.sellingPrice) {
                        //       discountController.text = selectedProduct
                        //           .product.sellingPrice
                        //           .toStringAsFixed(2);
                        //     }
                        //   }
                        //   else if (selectedProduct.product.discount != 0) {
                        //     if ((double.tryParse(discountController.text) ??
                        //             0) <
                        //         AppConstant.getProductPriceAfterDiscount(
                        //             selectedProduct.product.discountType,
                        //             selectedProduct.product.sellingPrice,
                        //             selectedProduct.product.discount)) {
                        //       discountController.text =
                        //           AppConstant.getProductPriceAfterDiscount(
                        //                   selectedProduct.product.discountType,
                        //                   selectedProduct.product.sellingPrice,
                        //                   selectedProduct.product.discount)
                        //               .toStringAsFixed(2);
                        //     }
                        //   }
                        // }
                      },
                      onTapOutside: () {
                        if (productQuantityController.text.isEmpty ||
                            ((double.tryParse(productQuantityController.text) ??
                                    0) >
                                selectedProduct.product.quantity)) {
                          productQuantityController.text =
                              "${selectedProduct.product.quantity}";
                        }
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    )),
                horizontalSpace(14),
                GestureDetector(
                  onTap: () {
                    validateProductQuantityAndDiscount(
                        context,
                        productQuantityController,
                        discountController,
                        quantityFormKey,
                        discountFormKey);
                  },
                  child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(color: AppColors.blueColorEEE),
                      ),
                      child: Icon(
                        Icons.check,
                        color: AppColors.blackColor,
                        size: 20.r,
                      )),
                ),
                horizontalSpace(14),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: AppColors.blueColorEEE),
                    ),
                    child: Text(
                      selectedProduct.product.quantity.toStringAsFixed(1),
                      maxLines: 4,
                      style: TextStyles.font18greyColor27Weight600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(8),
          Divider(color: AppColors.blueColorEEE),
          verticalSpace(8),
          Form(
            key: discountFormKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70.w,
                  child: Text("اكثر خصم",
                      maxLines: 4,
                      style: TextStyles.font14GreyColor66Weight400
                          .copyWith(color: AppColors.greenColor)),
                ),
                horizontalSpace(14),
                Expanded(
                    flex: 2,
                    child: AppTextFormField(
                      hintText: "",
                      controller: discountController,
                      hintStyle: TextStyles.font16BlackColorWeight400,
                      backgroundColor: AppColors.whiteColor,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                        if (value != null) {
                          if ((double.tryParse(value) ?? 0) >
                              (double.tryParse(selectedProduct.product.maxDiscount)??0)) {
                            return "notAvailable".tr();
                          }
                        }
                        return null;
                      },
                      onchange: (String? value) {
                        if (productQuantityController.text.isEmpty ||
                            ((double.tryParse(productQuantityController.text) ??
                                    0) >
                                selectedProduct.product.quantity)) {
                          productQuantityController.text =
                              "${selectedProduct.product.quantity}";
                        }
                      },
                      onTapOutside: () {

                        if (discountController.text.isEmpty) {
                          discountController.text = "0";
                        } else {
                          if ((double.tryParse(discountController.text) ?? 0) >
                              (double.tryParse(
                                      selectedProduct.product.maxDiscount) ??
                                  0)) {
                            discountController.text = "0";
                          }

                          // if (selectedProduct.product.maxDiscount == "0") {
                          // } else if (selectedProduct.product.maxDiscount !=
                          //     "0") {
                          //   if ((double.tryParse(discountController.text) ??
                          //           0) <
                          //       AppConstant.getProductPriceAfterDiscount(
                          //           // selectedProduct.product.discountType,
                          //           selectedProduct.product.sellingPrice,
                          //           selectedProduct.product.discount)) {
                          //     discountController.text =
                          //         AppConstant.getProductPriceAfterDiscount(
                          //                 selectedProduct.product.discountType,
                          //                 selectedProduct.product.sellingPrice,
                          //                 selectedProduct.product.discount)
                          //             .toStringAsFixed(2);
                          //   }
                          // }
                        }
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    )),
                horizontalSpace(14),
                GestureDetector(
                  onTap: () {
                    validateProductQuantityAndDiscount(
                        context,
                        productQuantityController,
                        discountController,
                        quantityFormKey,
                        discountFormKey);
                  },
                  child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(color: AppColors.blueColorEEE),
                      ),
                      child: Icon(
                        Icons.check,
                        color: AppColors.blackColor,
                        size: 20.r,
                      )),
                ),
                horizontalSpace(14),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: AppColors.blueColorEEE),
                    ),
                    child: Text(
                      "${selectedProduct.product.maxDiscount} ${AppConstant.currency}",
                      maxLines: 4,
                      style: TextStyles.font14GreyColor66Weight400
                          .copyWith(color: AppColors.greenColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  validateProductQuantityAndDiscount(
      BuildContext context,
      TextEditingController quantityController,
      TextEditingController discountController,
      GlobalKey<FormState> quantityKey,
      GlobalKey<FormState> moneyKey) {
    if (quantityKey.currentState!.validate() &&
        moneyKey.currentState!.validate()) {
      SalesCubit.get(context)
          .editInProductFromSelectedProducts(SelectedProductClass(
        product: selectedProduct.product,
        maxValueCounter:
            int.tryParse(quantityController.text.split(".")[0].toString()) ?? 0,
        minValueCounter: quantityController.text.contains(".")
            ? int.tryParse(quantityController.text.split(".")[1].toString()) ??
                0
            : 0,
        discountMoney: double.tryParse(discountController.text) ?? 0,
      ));
    }
  }
}
