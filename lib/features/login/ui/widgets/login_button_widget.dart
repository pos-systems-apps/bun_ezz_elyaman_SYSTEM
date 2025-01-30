
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/check_network.dart';
import '../../../../core/utils/app_colors_white_theme.dart';
import '../../../../core/utils/app_constant.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class LoginButtonWidget extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LoginButtonWidget(
      {required this.passwordController,
      required this.phoneController,
      required this.formKey,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      buildWhen: (previous, current) {
        return current is OnLoginLoadingState ||
            current is OnLoginSuccessState ||
            current is OnLoginErrorState ||
            current is OnLoginCatchErrorState;
      },
      listener: (context, state) {
        if (state is OnLoginSuccessState) {
          // context.pushNamed(
          //   Routes.homeScreen,
          // );
        } else if (state is OnLoginErrorState ||
            state is OnLoginCatchErrorState) {
          AppConstant.toast(
              "", AppColors.redColor);
        }
      },
      builder: (context, state) {
        return state is OnLoginLoadingState
            ? Center(
                child: CircularProgressIndicator(
                color: AppColors.redColor,
              ))
            : ButtonWidget(
                buttonText: "تسجيل الدخول",
                borderRadius: 20.r,
                backGroundColor: AppColors.redColor,
                textStyle: TextStyles.font20WhiteColorWeight700,
                onPressed: () {
                  if(MyConnectivity.isOnline()){
                    validateLogin(context);
                  }else{
                    AppConstant.toast(
                       "تآكد من اتصالك بالانترنت ", AppColors.redColor);
                  }

                });
      },
    );
  }

  void validateLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      LoginCubit.get(context)
          .login(phoneController.text, passwordController.text);
    }
  }
}
