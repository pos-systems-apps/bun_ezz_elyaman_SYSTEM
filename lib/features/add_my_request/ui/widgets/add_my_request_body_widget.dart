import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/features/add_my_request/logic/add_my_request_cubit.dart';
import 'package:pos_system/features/add_my_request/logic/add_my_request_state.dart';
import 'package:pos_system/features/add_my_request/ui/widgets/add_my_request_notes_text_field_widget.dart';

class AddMyRequestBodyWidget extends StatelessWidget {
  const AddMyRequestBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: AddMyRequestCubit.get(context).addRequestKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddMyRequestNotesTextFieldWidget(),
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
                        AddMyRequestCubit.get(context).clearSelectedData();
                      }),
                ),
                horizontalSpace(20),
                BlocConsumer<AddMyRequestCubit, AddMyRequestState>(
                  buildWhen: (previous, current) {
                    return current is OnAddMyRequestLoadingState ||
                        current is OnAddMyRequestErrorState ||
                        current is OnAddMyRequestCatchErrorState ||
                        current is OnAddMyRequestSuccessState;
                  },
                  listener: (context, state) {
                    if (state is OnAddMyRequestSuccessState) {
                      ErrorAlertDialog.getDialog(context, "تم ارسال طلبك ",
                          isPop: true);
                      AddMyRequestCubit.get(context).clearSelectedData();
                    } else if (state is OnAddMyRequestErrorState) {
                      ErrorAlertDialog.getDialog(
                          context, "حدث خطآ ما حاول مره اخري");
                    } else if (state is OnAddMyRequestCatchErrorState) {
                      ErrorAlertDialog.getDialog(
                          context, "حدث خطآ ما حاول مره اخري");
                    }
                  },
                  builder: (context, state) {
                    return Expanded(
                      child: ButtonWidget(
                          isLoading: state is OnAddMyRequestLoadingState,
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
    );
  }

  void validateAddRequest(BuildContext context) async {
    if (AddMyRequestCubit.get(context).addRequestKey.currentState!.validate()) {
      AddMyRequestCubit.get(context).addMyRequest();
    }
  }
}
