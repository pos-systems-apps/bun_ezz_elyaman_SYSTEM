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
import 'package:pos_system/features/create_visit/logic/create_visit_cubit.dart';
import 'package:pos_system/features/create_visit/logic/create_visit_state.dart';
import 'package:pos_system/features/create_visit/ui/widgets/create_visit_notes_text_field_widget.dart';
import 'package:pos_system/features/create_visit/ui/widgets/create_visit_search_user_widget.dart';

class CreateVisitBodyWidget extends StatelessWidget {
  const CreateVisitBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: CreateVisitCubit.get(context).visitKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CreateVisitSearchUserWidget(),
            verticalSpace(16),
            CreateVisitNotesTextFieldWidget(),
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
                        CreateVisitCubit.get(context).clearSelectedData();
                      }),
                ),
                horizontalSpace(20),
                BlocConsumer<CreateVisitCubit, CreateVisitState>(
                  buildWhen: (previous, current) {
                    return current is OnCreateVisitLoadingState ||
                        current is OnCreateVisitSuccessState ||
                        current is OnCreateVisitErrorState ||
                        current is OnCreateVisitCatchErrorState;
                  },
                  listener: (context, state) {
                    if (state is OnCreateVisitSuccessState) {
                      ErrorAlertDialog.getDialog(context, "تم انشاء زياره");
                      CreateVisitCubit.get(context).clearSelectedData();
                    } else if (state is OnCreateVisitErrorState) {
                      ErrorAlertDialog.getDialog(
                          context, "حدث خطآ ما حاول مره اخري");
                    } else if (state is OnCreateVisitCatchErrorState) {
                      ErrorAlertDialog.getDialog(
                          context, "حدث خطآ ما حاول مره اخري");
                    }
                  },
                  builder: (context, state) {
                    return Expanded(
                      child: ButtonWidget(
                          isLoading: state is OnCreateVisitLoadingState,
                          buttonHeight: 56.h,
                          buttonText: "اضافه زياره",
                          borderRadius: 4.r,
                          backGroundColor: AppColors.mainColor,
                          borderColor: AppColors.mainColor,
                          textStyle: TextStyles.font16WhiteColorWeight500,
                          onPressed: () {
                            validateCreateVisit(context);
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

  void validateCreateVisit(BuildContext context) async {
    if (CreateVisitCubit.get(context).visitKey.currentState!.validate()) {
      Position? position = await YourLocation.getCurrentLocation();
      if (position == null) {
        ErrorAlertDialog.getDialog(context, "قم باختيار الموقع ");
      } else {
        CreateVisitCubit.get(context)
            .createVisit(position.latitude, position.longitude);
      }
    }
  }
}
