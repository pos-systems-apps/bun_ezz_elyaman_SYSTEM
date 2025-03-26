import 'package:easy_localization/easy_localization.dart';
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
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/add_resources_type/requested_quantity_text_field_widget.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/product_and_category_selected/add_request_resources_product_widget.dart';
import 'package:pos_system/features/sales/data/models/category_products_response.dart';

class AddRequestResourcesProductsAndSearchWidget extends StatelessWidget {
  final bool isSearch;

  const AddRequestResourcesProductsAndSearchWidget(
      {required this.isSearch, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        controller: AddRequestResourcesCubit.get(context)
            .categoryProductsScrollController,
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
              if (AddRequestResourcesCubit.get(context)
                  .selectedProductsIsContainProduct(ResourceSelectedProduct(
                      product: isSearch
                          ? AddRequestResourcesCubit.get(context)
                              .searchProducts[index]
                          : AddRequestResourcesCubit.get(context)
                              .products[index]))) {
                ///item found remove it
                ///
                AddRequestResourcesCubit.get(context)
                    .removeProductFromSelectedProducts(ResourceSelectedProduct(
                        product: isSearch
                            ? AddRequestResourcesCubit.get(context)
                                .searchProducts[index]
                            : AddRequestResourcesCubit.get(context)
                                .products[index]));
              } else {
                ///item not found add it
                ///
                await _productSelectedDetailsWidget(
                        context,
                        isSearch
                            ? AddRequestResourcesCubit.get(context)
                                .searchProducts[index]
                            : AddRequestResourcesCubit.get(context)
                                .products[index],
                        AddRequestResourcesCubit.get(context)
                            .selectedResourcesTypes)
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
                    ? AddRequestResourcesCubit.get(context)
                        .searchProducts[index]
                    : AddRequestResourcesCubit.get(context).products[index],
                isSelected: AddRequestResourcesCubit.get(context)
                    .selectedProductsIsContainProduct(ResourceSelectedProduct(
                        product: isSearch
                            ? AddRequestResourcesCubit.get(context)
                                .searchProducts[index]
                            : AddRequestResourcesCubit.get(context)
                                .products[index]))),
          );
        });
  }

  Future<ResourceSelectedProduct?> _productSelectedDetailsWidget(
      BuildContext context,
      Product product,
      ResourceTypeClass selectedResourceType) async {
    TextEditingController selectRequestingQuantity = TextEditingController();
    GlobalKey<FormState> selectRequestingQuantityKey = GlobalKey();
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
                        Text(
                          context.locale.languageCode == "ar"
                              ? product.nameAr
                              : product.nameEn,
                          maxLines: 2,
                          style: TextStyles.font18greyColor27Weight600,
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "الرصيد المتاح",
                                  style: TextStyles.font14greyColor62Weight400,
                                ),
                                verticalSpace(6),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 16.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                        color: AppColors.greyColorDB),
                                  ),
                                  child: Text(
                                    product.quantity.toStringAsFixed(2),
                                    style:
                                        TextStyles.font14BlackColor17Weight500,
                                  ),
                                ),
                              ],
                            )),
                            horizontalSpace(20),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "الكميه المطلوبة",
                                  style: TextStyles.font14greyColor62Weight400,
                                ),
                                verticalSpace(6),
                                Form(
                                  key: selectRequestingQuantityKey,
                                  child: RequestedQuantityTextFieldWidget(
                                      selectRequestingQuantity:
                                          selectRequestingQuantity),
                                ),
                              ],
                            )),
                          ],
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
                              if (selectRequestingQuantityKey.currentState!
                                  .validate()) {
                                Navigator.pop(
                                    context,
                                    ResourceSelectedProduct(
                                      product: product,
                                      requestQuantity: double.tryParse(
                                              selectRequestingQuantity.text) ??
                                          0,
                                      yourQuantity: product.quantity,
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
            },
          );
        });
  }
}
