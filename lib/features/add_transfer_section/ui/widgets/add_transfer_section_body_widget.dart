// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pos_system/core/utils/app_colors_white_theme.dart';
// import 'package:pos_system/core/utils/spacing.dart';
// import 'package:pos_system/core/utils/styles.dart';
// import 'package:pos_system/core/widgets/button_widget.dart';
// import 'package:pos_system/core/widgets/error_alert_dialog.dart';
// import 'package:pos_system/features/add_transfer_section/logic/add_transfer_section_cubit.dart';
// import 'package:pos_system/features/add_transfer_section/logic/add_transfer_section_state.dart';
// import 'package:pos_system/features/add_transfer_section/ui/widgets/add_transfer_section_account_drop_down_widget.dart';
// import 'package:pos_system/features/add_transfer_section/ui/widgets/add_transfer_section_money_text_field_widget.dart';
// import 'package:pos_system/features/add_transfer_section/ui/widgets/add_transfers_notes_text_field_widget.dart';
// import 'package:pos_system/features/add_transfer_section/ui/widgets/add_transfers_upload_image_widget.dart';
// import 'package:screenshot/screenshot.dart';
//
// class AddTransferSectionBodyWidget extends StatelessWidget {
//   const AddTransferSectionBodyWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: Form(
//           key: AddTransferSectionCubit.get(context).transferKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AddTransferSectionAccountDropDownWidget(),
//               verticalSpace(16),
//               AddTransferSectionMoneyTextFieldWidget(),
//               verticalSpace(16),
//               AddTransfersUploadImageWidget(),
//               verticalSpace(36),
//               AddTransfersNotesTextFieldWidget(),
//               verticalSpace(36),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: ButtonWidget(
//                         isLoading: false,
//                         buttonHeight: 56.h,
//                         buttonText: "الغاء",
//                         borderRadius: 4.r,
//                         backGroundColor: AppColors.whiteColor,
//                         borderColor: AppColors.mainColor,
//                         textStyle: TextStyles.font16MainColorWeight500,
//                         onPressed: () {
//                           AddTransferSectionCubit.get(context)
//                               .clearSelectedData();
//                         }),
//                   ),
//                   horizontalSpace(20),
//                   BlocConsumer<AddTransferSectionCubit, AddTransferSectionState>(
//                     buildWhen: (previous, current) {
//                       return current is OnAddTransferSectionLoadingState ||
//                           current is OnAddTransferSectionSuccessState ||
//                           current is OnAddTransferSectionErrorState ||
//                           current is OnAddTransferSectionCatchErrorState;
//                     },
//                     listener: (context, state) {
//                       if (state is OnAddTransferSectionSuccessState) {
//                         ErrorAlertDialog.getDialog(context, "تم اضافة تحويل ");
//                         AddTransferSectionCubit.get(context).clearSelectedData();
//                       } else if (state is OnAddTransferSectionErrorState) {
//                         ErrorAlertDialog.getDialog(
//                             context, "حدث خطآ ما حاول مره اخري");
//                       } else if (state is OnAddTransferSectionCatchErrorState) {
//                         ErrorAlertDialog.getDialog(
//                             context, "حدث خطآ ما حاول مره اخري");
//                       }
//                     },
//                     builder: (context, state) {
//                       return Expanded(
//                         flex: 3,
//                         child: ButtonWidget(
//                             // isLoading: false,
//                             isLoading: state is OnAddTransferSectionLoadingState,
//                             buttonHeight: 56.h,
//                             buttonText: "اضافه تحويل",
//                             borderRadius: 4.r,
//                             backGroundColor: AppColors.mainColor,
//                             borderColor: AppColors.mainColor,
//                             textStyle: TextStyles.font16WhiteColorWeight500,
//                             onPressed: () {
//                               validateAddTransfer(context);
//                             }),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void validateAddTransfer(BuildContext context) async {
//     if (AddTransferSectionCubit.get(context)
//         .transferKey
//         .currentState!
//         .validate()) {
//       if (AddTransferSectionCubit.get(context).selectedBankAccount == null) {
//         ErrorAlertDialog.getDialog(context, "قم باختيار حساب ");
//       } else {
//         AddTransferSectionCubit.get(context).addTransferSection();
//       }
//     }
//   }
// }
