import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/add_request_resources/data/entities/resource_selected_product_class.dart';
import 'package:pos_system/features/add_request_resources/data/entities/resource_type_class.dart';
import 'package:pos_system/features/add_request_resources/logic/add_request_resources_cubit.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/product_and_category_selected/add_request_resources_product_widget.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';

class AddRequestResourcesProductsAndSearchWidget extends StatelessWidget {
  final bool isSearch;

  const AddRequestResourcesProductsAndSearchWidget({required this.isSearch, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        controller: AddRequestResourcesCubit.get(context).categoryProductsScrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 1 / 1.8,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: isSearch
            ? AddRequestResourcesCubit.get(context).searchProducts.length
            : AddRequestResourcesCubit.get(context).products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
                if (AddRequestResourcesCubit.get(context).selectedProductsIsContainProduct(
                    ResourceSelectedProduct(
                        product: isSearch
                            ? AddRequestResourcesCubit.get(context).searchProducts[index]
                            : AddRequestResourcesCubit.get(context).products[index]))) {
                  ///item found remove it
                  ///
                  AddRequestResourcesCubit.get(context).removeProductFromSelectedProducts(
                      ResourceSelectedProduct(
                          product: isSearch
                              ? AddRequestResourcesCubit.get(context).searchProducts[index]
                              : AddRequestResourcesCubit.get(context).products[index]));
                } else {
                  ///item not found add it
                  ///
                  await _productSelectedDetailsWidget(
                          context,
                          isSearch
                              ? AddRequestResourcesCubit.get(context).searchProducts[index]
                              : AddRequestResourcesCubit.get(context).products[index],
                      AddRequestResourcesCubit.get(context).selectedResourcesTypes)
                      .then((value) {
                    if (value != null) {
                      AddRequestResourcesCubit.get(context)
                          .addProductToSelectedProducts(value);
                    }
                  });
                }

            },
            child: AddRequestResourcesProductWidget(
                product: isSearch
                    ? AddRequestResourcesCubit.get(context).searchProducts[index]
                    : AddRequestResourcesCubit.get(context).products[index],
                isSelected: AddRequestResourcesCubit.get(context)
                    .selectedProductsIsContainProduct(ResourceSelectedProduct(
                        product: isSearch
                            ? AddRequestResourcesCubit.get(context).searchProducts[index]
                            : AddRequestResourcesCubit.get(context).products[index]))),
          );
        });
  }

  Future<ResourceSelectedProduct?> _productSelectedDetailsWidget(
      BuildContext context,
      Product product,
      ResourceTypeClass selectedResourceType) async {
    return await showModalBottomSheet<ResourceSelectedProduct>(
        context: context,
        enableDrag: true,
        isDismissible: true,
        barrierColor: AppColors.blackColor.withValues(alpha: .7),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {

          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Container(
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
                                "عصير صان توب 200 ملي",
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
                        // Center(
                        //   child: SingleChildScrollView(
                        //     scrollDirection: Axis.horizontal,
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         ///increase counter
                        //         GestureDetector(
                        //           onTap: () {
                        //             if (selectedIntOrDecimal == 1) {
                        //               if (selectedOrderType.id ==
                        //                   AppConstant.orderTypes[0].id) {
                        //                 ///integer part
                        //                 if (integerPart <
                        //                     product.quantity.toInt()) {
                        //                   integerPart++;
                        //                 }
                        //                 if (integerPart ==
                        //                     product.quantity.toInt()) {
                        //                   ///to change decimal to int count
                        //                   if (decimalPart >
                        //                       ((product.quantity -
                        //                                   integerPart) *
                        //                               product.unitValue)
                        //                           .toInt()) {
                        //                     decimalPart = ((product.quantity -
                        //                                 integerPart) *
                        //                             product.unitValue)
                        //                         .toInt();
                        //                   }
                        //                 }
                        //               } else {
                        //                 integerPart++;
                        //               }
                        //             } else {
                        //               ///decimal part
                        //               if (integerPart ==
                        //                   product.quantity.toInt()) {
                        //                 if (decimalPart <
                        //                     ((product.quantity - integerPart) *
                        //                             product.unitValue)
                        //                         .toInt()) {
                        //                   decimalPart++;
                        //                 }
                        //               } else {
                        //                 if (decimalPart <
                        //                     product.unitValue - 1) {
                        //                   decimalPart++;
                        //                 } else if (decimalPart ==
                        //                     product.unitValue - 1) {
                        //                   decimalPart = 0;
                        //                   integerPart++;
                        //                 }
                        //               }
                        //             }
                        //             setState(() {});
                        //           },
                        //           child: Container(
                        //             height: 36.h,
                        //             width: 36.w,
                        //             decoration: BoxDecoration(
                        //                 color: AppColors.whiteColor,
                        //                 borderRadius:
                        //                     BorderRadius.circular(8.r),
                        //                 border: Border.all(
                        //                     color: AppColors.greyColorDA,
                        //                     width: 1)),
                        //             child: Icon(
                        //               Icons.add,
                        //               color: AppColors.blackColor,
                        //               size: 24.r,
                        //             ),
                        //           ),
                        //         ),
                        //         horizontalSpace(24),
                        //
                        //         ///decimal part
                        //         GestureDetector(
                        //           onTap: () {
                        //             selectedIntOrDecimal = 2;
                        //             setState(() {});
                        //           },
                        //           child: Container(
                        //             height: 45.h,
                        //             padding:
                        //                 EdgeInsets.symmetric(horizontal: 12.w),
                        //             alignment: Alignment.center,
                        //             decoration: BoxDecoration(
                        //               color: AppColors.whiteColor,
                        //               borderRadius: BorderRadius.circular(8.r),
                        //               border: Border.all(
                        //                   color: AppColors.mainColor,
                        //                   width: selectedIntOrDecimal == 2
                        //                       ? 2
                        //                       : 1),
                        //             ),
                        //             child: Text(
                        //               decimalPart.toString(),
                        //               maxLines: 1,
                        //               style:
                        //                   TextStyles.font18greyColor27Weight600,
                        //             ),
                        //           ),
                        //         ),
                        //         Text("\t.\t",
                        //             style:
                        //                 TextStyles.font48greyColor27Weight700),
                        //
                        //         ///integer part
                        //         GestureDetector(
                        //           onTap: () {
                        //             selectedIntOrDecimal = 1;
                        //             setState(() {});
                        //           },
                        //           child: Container(
                        //             height: 45.h,
                        //             padding:
                        //                 EdgeInsets.symmetric(horizontal: 12.w),
                        //             alignment: Alignment.center,
                        //             decoration: BoxDecoration(
                        //               color: AppColors.whiteColor,
                        //               borderRadius: BorderRadius.circular(8.r),
                        //               border: Border.all(
                        //                   color: AppColors.mainColor,
                        //                   width: selectedIntOrDecimal == 1
                        //                       ? 2
                        //                       : 1),
                        //             ),
                        //             child: Text(
                        //               integerPart.toString(),
                        //               maxLines: 1,
                        //               style:
                        //                   TextStyles.font18greyColor27Weight600,
                        //             ),
                        //           ),
                        //         ),
                        //         horizontalSpace(24),
                        //
                        //         ///decrease counter
                        //         GestureDetector(
                        //           onTap: () {
                        //             if (selectedIntOrDecimal == 1) {
                        //               ///integer part
                        //               if (integerPart > 0) {
                        //                 integerPart--;
                        //               }
                        //               if (integerPart == 0) {
                        //                 if (decimalPart == 0 &&
                        //                     ((product.quantity - integerPart) *
                        //                                 product.unitValue)
                        //                             .toInt() >
                        //                         1) {
                        //                   decimalPart = 1;
                        //                 }
                        //               }
                        //             } else {
                        //               ///decimal part
                        //               if (integerPart == 0) {
                        //                 if (decimalPart > 1) {
                        //                   decimalPart--;
                        //                 }
                        //               } else {
                        //                 if (decimalPart > 0) {
                        //                   decimalPart--;
                        //                 } else {
                        //                   if (decimalPart == 0) {
                        //                     decimalPart = product.unitValue - 1;
                        //                     integerPart--;
                        //                   }
                        //                 }
                        //               }
                        //             }
                        //             setState(() {});
                        //           },
                        //           child: Container(
                        //             height: 36.h,
                        //             width: 36.w,
                        //             decoration: BoxDecoration(
                        //                 color: AppColors.whiteColor,
                        //                 borderRadius:
                        //                     BorderRadius.circular(8.r),
                        //                 border: Border.all(
                        //                     color: AppColors.greyColorDA,
                        //                     width: 1)),
                        //             child: Icon(
                        //               Icons.remove,
                        //               color: AppColors.blackColor,
                        //               size: 24.r,
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
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
                              // Navigator.pop(
                              //     context,
                              //     SelectedProductClass(
                              //       product: product,
                              //       maxValueCounter: integerPart,
                              //       minValueCounter: decimalPart,
                              //     ));
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
            },
          );
        });
  }
}
