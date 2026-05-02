// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pos_system/core/utils/app_colors_white_theme.dart';
// import 'package:pos_system/core/utils/spacing.dart';
// import 'package:pos_system/core/utils/styles.dart';
// import 'package:pos_system/core/widgets/button_widget.dart';
// import 'package:pos_system/features/fund_list/logic/fund_list_cubit.dart';
// import 'package:pos_system/features/fund_list/logic/fund_list_state.dart';
// import 'package:pos_system/features/fund_list/ui/widgets/fund_list_selected_date_widget.dart';
// import 'package:pos_system/features/fund_list/ui/widgets/fund_list_table_widget.dart';
// import 'package:pos_system/features/fund_list/ui/widgets/mandoube_name_widget.dart';
// import 'package:screenshot/screenshot.dart';
//
// class FundListBodyWidget extends StatelessWidget {
//   const FundListBodyWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           BlocBuilder<FundListCubit, FundListState>(
//             buildWhen: (previous, current) {
//               return current is OnGetFundListSuccessState ||
//                   current is OnGetFundListLoadingState ||
//                   current is OnGetFundListErrorState ||
//                   current is OnGetFundListCatchErrorState;
//             },
//             builder: (context, state) {
//               return Expanded(
//                 child: Screenshot(
//                   controller: FundListCubit.get(context).screenshotController,
//                   child: SingleChildScrollView(
//                     padding: EdgeInsets.symmetric(horizontal: 20.w),
//                     child: Column(
//                       children: [
//                         MandoubeNameWidget(),
//                         verticalSpace(20),
//                         FundListSelectedDateWidget(),
//                         verticalSpace(50),
//                         FundListTableWidget(),
//                         verticalSpace(50),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//           BlocBuilder<FundListCubit, FundListState>(
//             buildWhen: (previous, current) {
//               return current is OnSavePDFLoadingState ||
//                   current is OnSavePDFDoneState;
//             },
//             builder: (context, state) {
//               print(" state teaaaaa ${state}");
//               return Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.w),
//                 child: ButtonWidget(
//                     isLoading: state is OnSavePDFLoadingState,
//                     buttonHeight: 56.h,
//                     buttonText: "تحميل",
//                     borderRadius: 4.r,
//                     backGroundColor: AppColors.mainColor,
//                     borderColor: AppColors.mainColor,
//                     textStyle: TextStyles.font16WhiteColorWeight500,
//                     onPressed: () {
//                       FundListCubit.get(context).captureAndGeneratePDF();
//                     }),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
