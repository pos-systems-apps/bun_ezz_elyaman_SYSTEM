import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/config/routes/routes.dart';
import 'package:pos_system/core/services/check_network.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/app_text_field.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/core/widgets/error_alert_dialog.dart';
import 'package:pos_system/core/widgets/loading_widget.dart';
import 'package:pos_system/core/widgets/offline_alert_dialog.dart';
import 'package:pos_system/features/login/logic/login_cubit.dart';
import 'package:pos_system/features/login/logic/login_state.dart';

class LoginFormWidget extends StatelessWidget {
  final TextEditingController codeController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LoginFormWidget(
      {required this.passwordController,
      required this.codeController,
      required this.formKey,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      margin: EdgeInsets.symmetric(horizontal: 19.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: .25),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 4,
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "البريد الالكتروني",
              style: TextStyles.font14BlackColorWeight400,
            ),
            verticalSpace(6),
            AppTextFormField(
              hintText: "ادخل البريد الالكتروني ",
              controller: codeController,
              hintStyle: TextStyles.font16BlackColorWeight400,
              backgroundColor: AppColors.whiteColor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.greyColorDC,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.greyColorDC,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              errorBorder:   OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.redColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              focusedErrorBorder:  OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.redColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "اكمل هذا الحقل";
                }
                return null;
              },
              onchange: (String? value) {},
              keyboardType: TextInputType.text,
            ),
            verticalSpace(16),
            Text(
              "كلمه المرور",
              style: TextStyles.font14BlackColorWeight400,
            ),
            verticalSpace(6),
            AppTextFormField(
              hintText: "كلمه المرور",
              controller: passwordController,
              hintStyle: TextStyles.font16BlackColorWeight400,
              backgroundColor: AppColors.whiteColor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.greyColorDC,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.greyColorDC,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              errorBorder:   OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.redColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              focusedErrorBorder:  OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.redColor,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "اكمل هذا الحقل";
                }
                return null;
              },
              onchange: (String? value) {},
              keyboardType: TextInputType.text,
            ),
            verticalSpace(24),
            BlocConsumer<LoginCubit, LoginState>(
              buildWhen: (previous, current) {
                return current is OnLoginLoadingState ||
                    current is OnLoginSuccessState ||
                    current is OnLoginErrorState ||
                    current is OnLoginCatchErrorState;
              },
              listener: (context, state) {
                if (state is OnLoginSuccessState) {
                  context.pushNamed(Routes.buttonNavigationScreen);
                }
                if (state is OnLoginErrorState) {
                  ErrorAlertDialog.getDialog(context, state.error);
                }
                if (state is OnLoginCatchErrorState) {
                  ErrorAlertDialog.getDialog(context, state.error);
                }
              },
              builder: (context, state) {
                return state is OnLoginLoadingState
                    ? LoadingWidget(color: AppColors.mainColor)
                    : ButtonWidget(
                        isLoading: false,
                        buttonText: "تسجيل الدخول",
                        backGroundColor: AppColors.mainColor,
                        borderRadius: 10,
                        textStyle: TextStyles.font14WhiteColorWeightBold,
                        onPressed: () {
                          // if (MyConnectivity.isOnline()) {
                            validateLogin(context);
                          // } else {
                          //   OfflineAlertDialog.getDialog();
                          // }
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  void validateLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      LoginCubit.get(context)
          .login(codeController.text, passwordController.text);
    }
  }
}
