import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pos_system/core/services/location_service.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/create_monthly_plan/logic/create_monthly_plan_cubit.dart';
import 'package:pos_system/features/create_monthly_plan/logic/create_monthly_plan_state.dart';
import 'package:pos_system/features/create_monthly_plan/ui/widgets/create_monthly_plan_notes_text_field_widget.dart';
import 'package:pos_system/features/create_monthly_plan/ui/widgets/create_monthly_plan_search_user_widget.dart';
import 'package:pos_system/features/create_monthly_plan/ui/widgets/create_monthly_plan_select_date_widget.dart';

class CreateMonthlyPlanBodyWidget extends StatelessWidget {
  const CreateMonthlyPlanBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: CreateMonthlyPlanCubit.get(context).monthlyKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreateMonthlyPlanSearchUserWidget(),
              verticalSpace(16),
              CreateMonthlyPlanSelectDateWidget(),
              verticalSpace(16),
              CreateMonthlyPlanNotesTextFieldWidget(),
              verticalSpace(36),
              Row(
                children: [
                  Expanded(
                    child: ButtonWidget(
                        isLoading: false,
                        buttonHeight: 56.h,
                        buttonText: "الغاء",
                        borderRadius: 4.r,
                        backGroundColor: AppColors.whiteColor,
                        borderColor: AppColors.mainColor,
                        textStyle: TextStyles.font16MainColorWeight500,
                        onPressed: () {
                          CreateMonthlyPlanCubit.get(context).clearSelectedData();
                        }),
                  ),
                  horizontalSpace(20),
                  BlocConsumer<CreateMonthlyPlanCubit, CreateMonthlyPlanState>(
                    buildWhen: (previous, current) {
                      return current is OnCreateMonthlyLoadingState ||
                          current is OnCreateMonthlySuccessState ||
                          current is OnCreateMonthlyErrorState ||
                          current is OnCreateMonthlyCatchErrorState;
                    },
                    listener: (context, state) {
                      if (state is OnCreateMonthlySuccessState) {
                        ErrorAlertDialog.getDialog(context, "تم انشاء مخطط شهري");
                        CreateMonthlyPlanCubit.get(context).clearSelectedData();
                      } else if (state is OnCreateMonthlyErrorState) {
                        ErrorAlertDialog.getDialog(
                            context, "حدث خطآ ما حاول مره اخري");
                      } else if (state is OnCreateMonthlyCatchErrorState) {
                        ErrorAlertDialog.getDialog(
                            context, "حدث خطآ ما حاول مره اخري");
                      }
                    },
                    builder: (context, state) {
                      return Expanded(
                        child: ButtonWidget(
                            isLoading: state is OnCreateMonthlyLoadingState,
                            buttonHeight: 56.h,
                            buttonText: "اضافه زياره",
                            borderRadius: 4.r,
                            backGroundColor: AppColors.mainColor,
                            borderColor: AppColors.mainColor,
                            textStyle: TextStyles.font16WhiteColorWeight500,
                            onPressed: () {
                              validateCreateMonthlyPlan(context);
                            }),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateCreateMonthlyPlan(BuildContext context) async {
    if (CreateMonthlyPlanCubit.get(context).monthlyKey.currentState!.validate()) {
      Position? position = await YourLocation.getCurrentLocation();
      if (position == null) {
        ErrorAlertDialog.getDialog(context, "قم باختيار الموقع ");
      } else {
        CreateMonthlyPlanCubit.get(context)
            .createMonthlyPlan(position.latitude, position.longitude);
      }
    }
  }


}
