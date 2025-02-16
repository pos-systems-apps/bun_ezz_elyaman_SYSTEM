import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
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
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController productController = TextEditingController(
        text:
            "${selectedProduct.maxValueCounter}.${selectedProduct.minValueCounter}");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.blueColorEEE),
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
                child: CachedNetworkImageWidget(imgUrl: "", radius: 4.r),
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
                    Text(
                      "50,00 رس",
                      style: TextStyles.font14GreyColor66Weight400,
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
            key: formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                    flex: 2,
                    child: AppTextFormField(
                      hintText: "",
                      controller: productController,
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
                            (double.tryParse(value.toString()) ?? 0) >
                                selectedProduct.product.quantity) {
                          return "notAvailable".tr();
                        }
                        return null;
                      },
                      onchange: (String? value) {},
                      onTapOutside: () {
                        if (productController.text.isEmpty) {
                          productController.text =
                              "${selectedProduct.maxValueCounter}.${selectedProduct.minValueCounter}";
                        }
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                    )),
                horizontalSpace(14),
                GestureDetector(
                  onTap: () {
                    validateProductQuantity(
                        context, productController, formKey);
                  },
                  child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(color: AppColors.blueColorEEE),
                      ),
                      child: Icon(
                        Icons.edit,
                        color: AppColors.blackColor,
                        size: 20.r,
                      )),
                ),
                const Spacer(flex: 1),
                Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: AppColors.blueColorEEE),
                  ),
                  child: Text(
                    selectedProduct.product.quantity.toStringAsFixed(1),
                    maxLines: 1,
                    style: TextStyles.font18greyColor27Weight600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  validateProductQuantity(BuildContext context,
      TextEditingController controller, GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      SalesCubit.get(context)
          .editInProductFromSelectedProducts(SelectedProductClass(
        product: selectedProduct.product,
        maxValueCounter:
            int.tryParse(controller.text.split(".")[0].toString()) ?? 0,
        minValueCounter: controller.text.contains(".")
            ? int.tryParse(controller.text.split(".")[1].toString()) ?? 0
            : 0,
      ));
    }
  }
}
