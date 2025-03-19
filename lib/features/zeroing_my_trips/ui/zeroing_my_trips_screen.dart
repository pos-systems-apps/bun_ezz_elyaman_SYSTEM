import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/login/ui/widgets/back_ground_widget.dart';
import 'package:pos_system/features/login/ui/widgets/login_form_Widget.dart';
import 'package:pos_system/features/zeroing_my_trips/ui/widgets/zeroing_my_trips_form_Widget.dart';
import 'package:screenshot/screenshot.dart';

class ZeroingMyTripsScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  ZeroingMyTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Column(
          children: [
            verticalSpace(context.topPadding + 10),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    padding: EdgeInsets.all(8.r),
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0,
                              color:
                                  AppColors.blackColor.withValues(alpha: .1)),
                        ]),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.blueColor72,
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "تصفير جميع البيانات ",
                  style: TextStyles.font20WhiteColorWeight600,
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ZeroingMyTripsFormWidget(
                    passwordController: passwordController,
                    codeController: emailController,
                    formKey: formKey,
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
