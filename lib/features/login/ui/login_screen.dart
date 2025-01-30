import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/widgets/app_text_field.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/login/ui/widgets/back_ground_widget.dart';

import '../../../core/utils/app_colors_white_theme.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/spacing.dart';
import '../../../core/utils/styles.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            BackGroundWidget(),
            Container(
              height: 320.r,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              margin: EdgeInsets.symmetric(horizontal: 19.r),
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
                      "login.code".tr(),
                      style: TextStyles.font14BlackColorWeight400,
                    ),
                    verticalSpace(6),
                    AppTextFormField(
                      hintText: "login.enterCode".tr(),
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
                      validator: (String? value) {},
                      onchange: (String? value) {},
                      keyboardType: TextInputType.text,
                    ),
                    verticalSpace(16),
                    Text(
                      "login.password".tr(),
                      style: TextStyles.font14BlackColorWeight400,
                    ),
                    verticalSpace(6),
                    AppTextFormField(
                      hintText: "login.password".tr(),
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
                      validator: (String? value) {},
                      onchange: (String? value) {},
                      keyboardType: TextInputType.text,
                    ),
                    verticalSpace(24),
                    ButtonWidget(
                        buttonText: "login.login"..tr(),
                        backGroundColor: AppColors.mainColor,
                        borderRadius: 10,
                        textStyle: TextStyles.font14WhiteColorWeightBold,
                        onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
