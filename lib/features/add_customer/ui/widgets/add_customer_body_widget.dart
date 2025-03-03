import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/add_customer/logic/add_customer_cubit.dart';
import 'package:pos_system/features/add_customer/logic/add_customer_state.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_address_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_arabic_name_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_classification_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_commercial_history_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_country_code_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_country_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_email_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_english_name_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_location_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_phone_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_tax_number_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_upload_image_widget.dart';

class AddCustomerBodyWidget extends StatelessWidget {
  const AddCustomerBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: AddCustomerCubit.get(context).addCustomerKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddCustomerArabicNameWidget(),
              verticalSpace(16),
              AddCustomerEnglishNameWidget(),
              verticalSpace(16),
              AddCustomerLocationWidget(),
              verticalSpace(16),
              AddCustomerClassificationWidget(),
              verticalSpace(16),
              AddCustomerTaxNumberWidget(),
              verticalSpace(16),
              AddCustomerCommercialHistoryWidget(),
              verticalSpace(16),
              AddCustomerPhoneWidget(),
              verticalSpace(16),
              AddCustomerEmailWidget(),
              verticalSpace(16),
              Row(
                children: [
                  Expanded(child: AddCustomerCountryWidget()),
                  horizontalSpace(20),
                  Expanded(child: AddCustomerCountryCodeWidget()),
                ],
              ),
              verticalSpace(16),
              AddCustomerAddressWidget(),
              verticalSpace(16),
              AddCustomerUploadImageWidget(),
              verticalSpace(36),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ButtonWidget(
                        isLoading: false,
                        buttonHeight: 56.h,
                        buttonText: "الغاء",
                        borderRadius: 4.r,
                        backGroundColor: AppColors.whiteColor,
                        borderColor: AppColors.mainColor,
                        textStyle: TextStyles.font16MainColorWeight500,
                        onPressed: () {
                          AddCustomerCubit.get(context).clearAddCustomerData();
                        }),
                  ),
                  horizontalSpace(20),
                  BlocConsumer<AddCustomerCubit, AddCustomersState>(
                    buildWhen: (previous, current) {
                      return current is OnAddCustomerLoadingState ||
                          current is OnAddCustomerSuccessState ||
                          current is OnAddCustomerErrorState ||
                          current is OnAddCustomerCatchErrorState;
                    },
                    listener: (context, state) {
                      if (state is OnAddCustomerSuccessState) {
                        ErrorAlertDialog.getDialog(context, "تم اضافة عميل");
                        AddCustomerCubit.get(context).clearAddCustomerData();
                      } else if (state is OnAddCustomerErrorState) {
                        ErrorAlertDialog.getDialog(
                            context, "حدث خطآ ما حاول مره اخري");
                      } else if (state is OnAddCustomerCatchErrorState) {
                        ErrorAlertDialog.getDialog(
                            context, "حدث خطآ ما حاول مره اخري");
                      }
                    },
                    builder: (context, state) {
                      return Expanded(
                        flex: 3,
                        child: ButtonWidget(
                            isLoading: state is OnAddCustomerLoadingState,
                            buttonHeight: 56.h,
                            buttonText: "اضافه عميل ",
                            borderRadius: 4.r,
                            backGroundColor: AppColors.mainColor,
                            borderColor: AppColors.mainColor,
                            textStyle: TextStyles.font16WhiteColorWeight500,
                            onPressed: () {
                              if (AddCustomerCubit.get(context)
                                      .selectedRegion ==
                                  null) {
                                ErrorAlertDialog.getDialog(
                                    context, "قم بتحديد المنطقة");
                              } else {
                                if (AddCustomerCubit.get(context)
                                        .selectedCategory ==
                                    null) {
                                  ErrorAlertDialog.getDialog(
                                      context, "قم بتحديد التصنيف");
                                } else {
                                  validateAddCustomer(context);
                                }
                              }
                            }),
                      );
                    },
                  ),
                ],
              ),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }

  void validateAddCustomer(BuildContext context) {
    if (AddCustomerCubit.get(context).addCustomerKey.currentState!.validate()) {
      AddCustomerCubit.get(context).addCustomer();
    }
  }
}
