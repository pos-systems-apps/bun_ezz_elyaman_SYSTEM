import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/add_leave_request/logic/add_leave_request_cubit.dart';
import 'package:pos_system/features/add_leave_request/logic/add_leave_request_state.dart';
import 'package:pos_system/features/add_leave_request/ui/widgets/add_leave_request_notes_text_field_widget.dart';
import 'package:pos_system/features/add_leave_request/ui/widgets/add_leave_request_select_date_widget.dart';


class AddLeaveRequestBodyWidget extends StatelessWidget {
  const AddLeaveRequestBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: AddLeaveRequestCubit.get(context).addLeaveRequestKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddLeaveRequestSelectDateWidget(),
              verticalSpace(16),
              AddLeaveRequestNotesTextFieldWidget(),
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
                          AddLeaveRequestCubit.get(context).clearSelectedData();
                        }),
                  ),
                  horizontalSpace(20),
                  BlocConsumer<AddLeaveRequestCubit, AddLeaveRequestState>(
                    buildWhen: (previous, current) {
                      return current is OnAddLeaveRequestLoadingState ||
                          current is OnAddLeaveRequestErrorState ||
                          current is OnAddLeaveRequestCatchErrorState ||
                          current is OnAddLeaveRequestSuccessState;
                    },
                    listener: (context, state) {
                      if (state is OnAddLeaveRequestSuccessState) {
                        ErrorAlertDialog.getDialog(context, "تم ارسال طلب الاجازه ",
                            isPop: true);
                        AddLeaveRequestCubit.get(context).clearSelectedData();
                      } else if (state is OnAddLeaveRequestErrorState) {
                        ErrorAlertDialog.getDialog(
                            context, "حدث خطآ ما حاول مره اخري");
                      } else if (state is OnAddLeaveRequestCatchErrorState) {
                        ErrorAlertDialog.getDialog(
                            context, "حدث خطآ ما حاول مره اخري");
                      }
                    },
                    builder: (context, state) {
                      return Expanded(
                        child: ButtonWidget(
                            isLoading: state is OnAddLeaveRequestLoadingState,
                            buttonHeight: 56.h,
                            buttonText: "انشاء طلب",
                            borderRadius: 4.r,
                            backGroundColor: AppColors.mainColor,
                            borderColor: AppColors.mainColor,
                            textStyle: TextStyles.font16WhiteColorWeight500,
                            onPressed: () {
                              validateAddRequest(context);
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

  void validateAddRequest(BuildContext context) async {
    if (AddLeaveRequestCubit.get(context).addLeaveRequestKey.currentState!.validate()) {
      AddLeaveRequestCubit.get(context).addLeaveRequest();
    }
  }
}
