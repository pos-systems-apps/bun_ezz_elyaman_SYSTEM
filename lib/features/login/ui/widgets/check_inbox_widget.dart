
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors_white_theme.dart';
import '../../../../core/utils/styles.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class CheckInboxWidget extends StatelessWidget {
  const CheckInboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) {
              return current is OnChangeReminderBoxState;
            },
            builder: (context, state) {
              return CheckboxListTile(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  controlAffinity: ListTileControlAffinity.leading,
                  fillColor: MaterialStateProperty.all(
                      LoginCubit.get(context).reminderBox
                          ? AppColors.redColor
                          : AppColors.whiteColor),
                  side: BorderSide(
                      color: LoginCubit.get(context).reminderBox
                          ? AppColors.redColor
                          : AppColors.blackColor),
                  checkColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  value: LoginCubit.get(context).reminderBox,
                  title: Text(
                    "تذكرني",
                    style: TextStyles.font13DarkBlueColor33Weight400,
                  ),
                  onChanged: (value) {
                    LoginCubit.get(context).changeReminderBox(value!);
                  });
            },
          ),
        ),
        InkWell(
          onTap: () {
            // context.pushNamed(Routes.forgetPasswordScreen);
          },
          child: Text(
            "هل نسيت كلمة السر؟",
            style: TextStyles.font13DarkBlueColor33Weight400,
          ),
        ),
      ],
    );
  }
}
