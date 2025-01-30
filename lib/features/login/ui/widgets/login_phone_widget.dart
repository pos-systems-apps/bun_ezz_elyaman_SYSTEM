
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/app_text_field.dart';

class LoginPhoneWidget extends StatelessWidget {
  final TextEditingController phoneController;

  const LoginPhoneWidget(
      {required this.phoneController,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: "5XXXXXXXX",
      controller: phoneController,
      hintStyle: TextStyles.font16GreyColorWeight400,
      // suffixIcon: Padding(
      //   padding: EdgeInsets.all(12.r),
      //   child: Text(
      //     selectedCountry.selectedCountry?.id.toString() ?? "",
      //     style: TextStyles.font15RedColorWeight700,
      //   ),
      // ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "ادخل رقم الجوال ";
        }
        return null;
      },
      onchange: (String? value) {},
      keyboardType: TextInputType.phone,
    );
  }
}
