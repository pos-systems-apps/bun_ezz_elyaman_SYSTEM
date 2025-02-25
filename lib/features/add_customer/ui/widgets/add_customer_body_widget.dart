import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
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
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_status_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_tax_number_widget.dart';
import 'package:pos_system/features/add_customer/ui/widgets/add_customer_upload_image_widget.dart';

class AddCustomerBodyWidget extends StatelessWidget {
  const AddCustomerBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
            AddCustomerStatusWidget(),
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
                  // buildWhen: (previous, current) {
                  //   return current is OnCreateVisitLoadingState ||
                  //       current is OnCreateVisitSuccessState ||
                  //       current is OnCreateVisitErrorState ||
                  //       current is OnCreateVisitCatchErrorState;
                  // },
                  listener: (context, state) {
                    // if (state is OnCreateVisitSuccessState) {
                    //   ErrorAlertDialog.getDialog(context, "تم انشاء زياره");
                    //   CreateVisitCubit.get(context).clearSelectedData();
                    // } else if (state is OnCreateVisitErrorState) {
                    //   ErrorAlertDialog.getDialog(
                    //       context, "حدث خطآ ما حاول مره اخري");
                    // } else if (state is OnCreateVisitCatchErrorState) {
                    //   ErrorAlertDialog.getDialog(
                    //       context, "حدث خطآ ما حاول مره اخري");
                    // }
                  },
                  builder: (context, state) {
                    return Expanded(
                      flex: 3,
                      child: ButtonWidget(
                          isLoading: false,
                          // isLoading: state is OnCreateVisitLoadingState,
                          buttonHeight: 56.h,
                          buttonText: "اضافه عميل ",
                          borderRadius: 4.r,
                          backGroundColor: AppColors.mainColor,
                          borderColor: AppColors.mainColor,
                          textStyle: TextStyles.font16WhiteColorWeight500,
                          onPressed: () {
                            // AddCustomerCubit.get(context).createVisit();
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
    );
  }
}
