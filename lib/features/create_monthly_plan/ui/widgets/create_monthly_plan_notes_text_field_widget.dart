// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pos_system/core/utils/app_colors_white_theme.dart';
// import 'package:pos_system/core/utils/styles.dart';
// import 'package:pos_system/core/widgets/app_text_field.dart';
// import 'package:pos_system/features/create_monthly_plan/logic/create_monthly_plan_cubit.dart';
// import 'package:pos_system/features/create_visit/logic/create_visit_cubit.dart';
//
// class CreateMonthlyPlanNotesTextFieldWidget extends StatelessWidget {
//   const CreateMonthlyPlanNotesTextFieldWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AppTextFormField(
//       hintText: "ادخل ملاحظه",
//       maxLines: 5,
//       hintStyle: TextStyles.font14GreyColor87Weight400,
//       textStyle: TextStyles.font14BlackColorWeight400,
//       textAlign: TextAlign.center,
//       controller: CreateMonthlyPlanCubit.get(context).notesController,
//       backgroundColor: AppColors.whiteColor,
//       contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//       focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.blueColorEEE, width: 1.3),
//           borderRadius: BorderRadius.circular(8.r)),
//       enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.blueColorEEE, width: 1.3),
//           borderRadius: BorderRadius.circular(8.r)),
//       errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.redColor, width: 1.3),
//           borderRadius: BorderRadius.circular(8.r)),
//       focusedErrorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.redColor, width: 1.3),
//           borderRadius: BorderRadius.circular(8.r)),
//       keyboardType: TextInputType.text,
//       validator: (String? value) {
//         if (value == null || value.isEmpty) {
//           return "field".tr();
//         }
//         return null;
//       },
//       onchange: (String? value) {},
//     );
//   }
// }
