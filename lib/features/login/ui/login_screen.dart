import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/features/login/ui/widgets/back_ground_widget.dart';
import 'package:pos_system/features/login/ui/widgets/login_form_Widget.dart';

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
        resizeToAvoidBottomInset: true,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BackGroundWidget(),
            Positioned(
              top: 250.h,
              left: 0,
              right: 0,
              child: LoginFormWidget(
                passwordController: passwordController,
                codeController: codeController,
                formKey: formKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
