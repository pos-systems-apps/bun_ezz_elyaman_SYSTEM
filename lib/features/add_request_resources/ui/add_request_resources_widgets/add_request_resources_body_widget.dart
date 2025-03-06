import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/add_request_resources/logic/add_request_resources_cubit.dart';
import 'package:pos_system/features/add_request_resources/logic/add_request_resources_state.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/add_request_resources_search_product_widget.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/add_resources_type/select_add_resources_types_widget.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/product_and_category_selected/add_request_resources_categories_widget.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/product_and_category_selected/add_request_resources_products_widget.dart';

class AddRequestResourcesBodyWidget extends StatelessWidget {
  const AddRequestResourcesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                    SelectAddResourcesTypesWidget(),
                    verticalSpace(24),
                    AddRequestResourcesSearchProductWidget(),
                    AddRequestResourcesCategoriesWidget(),
                    verticalSpace(10),
                    AddRequestResourcesProductsWidget(),
                    verticalSpace(30),
                  ],
                ),
              ),
            ),
            BlocBuilder<AddRequestResourcesCubit, AddRequestResourcesState>(
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
                      if (AddRequestResourcesCubit.get(context).selectedProducts.isEmpty) {
                        ErrorAlertDialog.getDialog(
                            context, "لم يتم اختيار منتجات ");
                      } else {
                        _requestResourcesDoneWidget(context);
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

  Future<dynamic> _requestResourcesDoneWidget(BuildContext context) {
    final addRequestResourcesCubit = AddRequestResourcesCubit.get(context); // Get existing cubit

    return showModalBottomSheet(
        context: context,
        enableDrag: true,
        isDismissible: true,
        barrierColor: AppColors.blackColor.withValues(alpha: .7),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return BlocProvider<AddRequestResourcesCubit>.value(
            value: addRequestResourcesCubit,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r)),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        "تاكيد الاوردر",
                        style: TextStyles.font18greyColor27Weight600,
                      ),
                      SizedBox(height: 20.h),
                      Lottie.asset(
                        ImageAsset.requestResourceDoneAnimation,
                        height: 170.h,
                        repeat: true,
                        fit: BoxFit.fitHeight,
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
                            addRequestResourcesCubit.addRequestResources(context);
                            context.pop();
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
            ),
          );
        });
  }

}
