import 'package:easy_localization/easy_localization.dart';
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
import 'package:pos_system/features/collections/logic/collections_cubit.dart';
import 'package:pos_system/features/collections/logic/collections_state.dart';

class CollectionsButtonsWidget extends StatelessWidget {
  const CollectionsButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ButtonWidget(
              isLoading: false,
              buttonHeight: 56.h,
              buttonWidth: double.infinity,
              buttonText: "الغاء",
              backGroundColor: AppColors.whiteColor,
              borderColor: AppColors.mainColor,
              borderRadius: 4.r,
              textStyle: TextStyles.font16MainColorWeight500,
              onPressed: () {
                CollectionsCubit.get(context).cancelCollection();
              }),
        ),
        horizontalSpace(20),
        Expanded(
          flex: 2,
          child: BlocConsumer<CollectionsCubit, CollectionsState>(
            buildWhen: (previous, current) {
              return current is OnConfirmCollectionLoadingState ||
                  current is OnConfirmCollectionErrorState ||
                  current is OnConfirmCollectionSuccessState ||
                  current is OnConfirmCollectionCatchErrorState;
            },
            listener: (context, state) {
              if (state is OnConfirmCollectionSuccessState) {
                ErrorAlertDialog.getDialog(context, state.message);
                CollectionsCubit.get(context).cancelCollection();
              } else if (state is OnConfirmCollectionErrorState) {
                ErrorAlertDialog.getDialog(context, state.error);
              } else if (state is OnConfirmCollectionCatchErrorState) {
                ErrorAlertDialog.getDialog(context, state.error);
              }
            },
            builder: (context, state) {
              return ButtonWidget(
                  isLoading: state is OnConfirmCollectionLoadingState,
                  fourGroundColor: AppColors.whiteColor,
                  buttonHeight: 56.h,
                  buttonWidth: double.infinity,
                  buttonText: "إتمام الطلب",
                  backGroundColor: AppColors.mainColor,
                  borderColor: AppColors.mainColor,
                  borderRadius: 4.r,
                  textStyle: TextStyles.font16WhiteColorWeight500,
                  onPressed: () {
                    validateCollection(context);
                  });
            },
          ),
        ),
      ],
    );
  }

  void validateCollection(BuildContext context) {
    if (CollectionsCubit.get(context).formKey.currentState!.validate()) {
      if (CollectionsCubit.get(context).selectedBankAccount == null) {
        ErrorAlertDialog.getDialog(context, "selectBankAccount".tr());
      } else {
        if (CollectionsCubit.get(context).selectedPay == null) {
          ErrorAlertDialog.getDialog(context, "selectPayWay".tr());
        } else {
          if (CollectionsCubit.get(context).selectedImagePath == null) {
            ErrorAlertDialog.getDialog(context, "selectImage".tr());
          } else {
            _collectionDoneWidget(context);
          }
        }
      }
    }
  }
}

Future<dynamic> _collectionDoneWidget(BuildContext context) {
  final collectionsCubit = CollectionsCubit.get(context); // Get existing cubit

  return showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: true,
      barrierColor: AppColors.blackColor.withValues(alpha: .7),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocProvider<CollectionsCubit>.value(
          value: collectionsCubit,
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
                      "تاكيد التحصيل ",
                      style: TextStyles.font18greyColor27Weight600,
                    ),
                    SizedBox(height: 20.h),
                    Lottie.asset(
                      ImageAsset.collectionDoneAnimation,
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
                          collectionsCubit.confirmCollection();
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
