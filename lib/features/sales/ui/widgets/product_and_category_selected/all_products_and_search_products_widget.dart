import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/sales/data/entities/selected_product_class.dart';
import 'package:pos_system/features/sales/data/entities/unit_of_measure_class.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/ui/widgets/product_and_category_selected/sales_product_widget.dart';

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
            onTap: () {
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
                _productSelectedDetailsWidget(
                    context,
                    isSearch
                        ? SalesCubit.get(context).searchProducts[index].quantity
                        : SalesCubit.get(context).products[index].quantity,
                    isSearch
                        ? SalesCubit.get(context)
                            .searchProducts[index]
                            .unitValue
                        : SalesCubit.get(context).products[index].unitValue);
                SalesCubit.get(context).addProductToSelectedProducts(
                    SelectedProductClass(
                        product: isSearch
                            ? SalesCubit.get(context).searchProducts[index]
                            : SalesCubit.get(context).products[index]));
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

  Future<dynamic> _productSelectedDetailsWidget(
      BuildContext context, double maxQuantity, int unitValue) {
    return showModalBottomSheet(
        context: context,
        enableDrag: true,
        isDismissible: true,
        barrierColor: AppColors.blackColor.withValues(alpha: .7),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          int integerPart = maxQuantity.toInt();
          int decimalPart = ((maxQuantity - integerPart) * unitValue).toInt();
          int selectedIntOrDecimal = 1;
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
                                maxQuantity.toStringAsFixed(1),
                                maxLines: 2,
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
                        Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ///
                                ///
                                GestureDetector(
                                  onTap: () {
                                    // if (counter < maxQuantity) {
                                    //   counter++;
                                    //   setState(() {});
                                    // }
                                  },
                                  child: Container(
                                    height: 36.h,
                                    width: 36.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color: AppColors.greyColorDA,
                                            width: 1)),
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.blackColor,
                                      size: 24.r,
                                    ),
                                  ),
                                ),
                                horizontalSpace(24),

                                ///
                                ///
                                ///
                                ///
                                GestureDetector(
                                  onTap: () {
                                    selectedIntOrDecimal = 2;
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 45.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: AppColors.mainColor,
                                          width: selectedIntOrDecimal == 2
                                              ? 2
                                              : 1),
                                    ),
                                    child: Text(
                                      decimalPart.toString(),
                                      maxLines: 1,
                                      style:
                                          TextStyles.font18greyColor27Weight600,
                                    ),
                                  ),
                                ),
                                Text("\t.\t",
                                    style:
                                        TextStyles.font48greyColor27Weight700),
                                GestureDetector(
                                  onTap: () {
                                    selectedIntOrDecimal = 1;
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 45.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: AppColors.mainColor,
                                          width: selectedIntOrDecimal == 1
                                              ? 2
                                              : 1),
                                    ),
                                    child: Text(
                                      integerPart.toString(),
                                      maxLines: 1,
                                      style:
                                          TextStyles.font18greyColor27Weight600,
                                    ),
                                  ),
                                ),

                                ///

                                ///
                                ///
                                horizontalSpace(24),
                                GestureDetector(
                                  onTap: () {
                                    // if (selectedIntOrDecimal == 1) {
                                    //   ///
                                    //   if (integerPart > 0) {
                                    //     integerPart--;
                                    //     setState(() {});
                                    //   }
                                    // } else {
                                    //   //int ==0   1
                                    //   //int !=0 0
                                    //
                                    //   if(integerPart==0){
                                    //
                                    //   }
                                    //   if (decimalPart > 0) {
                                    //     decimalPart--;
                                    //     setState(() {});
                                    //   }
                                    // }
                                  },
                                  child: Container(
                                    height: 36.h,
                                    width: 36.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color: AppColors.greyColorDA,
                                            width: 1)),
                                    child: Icon(
                                      Icons.remove,
                                      color: AppColors.blackColor,
                                      size: 24.r,
                                    ),
                                  ),
                                ),
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
                              ///
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
