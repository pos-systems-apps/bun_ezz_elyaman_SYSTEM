import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';
import 'package:pos_system/features/sales/ui/widgets/product_and_category_selected/product_widget.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesState>(
      buildWhen: (previous, current) {
        return current is OnChangeSelectedProductState;
      },
      builder: (context, state) {
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
            itemCount: SalesCubit.get(context).products.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (SalesCubit.get(context).selectedProductsIsContainProduct(
                      SalesCubit.get(context).products[index])) {
                    SalesCubit.get(context).removeProductFromSelectedProducts(
                        SalesCubit.get(context).products[index]);
                  } else {
                    ///
                    _productSelectedDetailsWidget(context,10);
                    SalesCubit.get(context).addProductToSelectedProducts(
                        SalesCubit.get(context).products[index]);
                  }
                },
                child: ProductWidget(
                    name: SalesCubit.get(context).products[index].name,
                    isSelected: SalesCubit.get(context)
                        .selectedProductsIsContainProduct(
                            SalesCubit.get(context).products[index])),
              );
            });
      },
    );
  }

  Future<dynamic> _productSelectedDetailsWidget(
      BuildContext context, int maxCounter) {
    return showModalBottomSheet(
        context: context,
        enableDrag: true,
        isDismissible: true,
        barrierColor: AppColors.blackColor.withValues(alpha: .7),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          String? item;
          int counter = maxCounter;
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
                        Text(
                          "عصير صان توب 200 ملي",
                          style: TextStyles.font18greyColor27Weight600,
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: PopupMenuButton<String>(
                            // initialValue: item,
                            color: AppColors.whiteColor,
                            iconSize: 20.r,
                            iconColor: AppColors.greyColorA3,
                            icon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                horizontalSpace(40),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: Text(
                                    item ?? "وحده القياس",
                                    maxLines: 1,
                                    style:
                                        TextStyles.font14BlackColor17Weight500,
                                  ),
                                ),
                                horizontalSpace(10),
                                Icon(Icons.keyboard_arrow_down_rounded),
                                horizontalSpace(40),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(18.r),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor,
                              foregroundColor: AppColors.blackColor17,
                              side: BorderSide(color: AppColors.greyColorA3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.r), // Rounded corners
                              ),
                            ),

                            onSelected: (value) {
                              item = value;
                              print(value);
                              print(item);
                              setState(() {});
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem(
                                  value: 'كبري',
                                  child: Text(
                                    'كبري',
                                    style:
                                        TextStyles.font14BlackColor17Weight500,
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'صغري',
                                  child: Text(
                                    'صغري',
                                    style:
                                        TextStyles.font14BlackColor17Weight500,
                                  ),
                                ),
                              ];
                            },
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "ادخل الكميه المطلوبه",
                          style: TextStyles.font14greyColor62Weight400,
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if(counter<maxCounter){
                                  counter++;
                                  setState((){});
                                }
                              },
                              child: Container(
                                height: 36.h,
                                width: 36.w,
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(8.r),
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
                            Text(counter.toString(),
                                style: TextStyles.font48greyColor27Weight700),
                            horizontalSpace(24),
                            GestureDetector(
                              onTap: () {
                                if(counter>1){
                                  counter--;
                                  setState((){});
                                }
                              },
                              child: Container(
                                height: 36.h,
                                width: 36.w,
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(8.r),
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
                        SizedBox(height: 30.h),
                        ButtonWidget(
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
