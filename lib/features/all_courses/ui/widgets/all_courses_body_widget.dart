import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/add_transfer_section/logic/add_transfer_section_cubit.dart';
import 'package:pos_system/features/add_transfer_section/logic/add_transfer_section_state.dart';
import 'package:pos_system/features/add_transfer_section/ui/widgets/add_transfer_section_account_text_field_widget.dart';
import 'package:pos_system/features/add_transfer_section/ui/widgets/add_transfer_section_money_text_field_widget.dart';
import 'package:pos_system/features/add_transfer_section/ui/widgets/add_transfers_notes_text_field_widget.dart';
import 'package:pos_system/features/add_transfer_section/ui/widgets/add_transfers_upload_image_widget.dart';

class AllCoursesBodyWidget extends StatelessWidget {
  const AllCoursesBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(ImageAsset.notFoundImage),
          // verticalSpace(36),
          // Row(
          //   children: [
          //     Expanded(
          //       flex: 2,
          //       child: ButtonWidget(
          //           isLoading: false,
          //           buttonHeight: 56.h,
          //           buttonText: "الغاء",
          //           borderRadius: 4.r,
          //           backGroundColor: AppColors.whiteColor,
          //           borderColor: AppColors.mainColor,
          //           textStyle: TextStyles.font16MainColorWeight500,
          //           onPressed: () {
          //             // CreateVisitCubit.get(context).clearSelectedData();
          //           }),
          //     ),
          //     horizontalSpace(20),
          //     BlocConsumer<AddTransferSectionCubit, AddTransferSectionState>(
          //       // buildWhen: (previous, current) {
          //       //   return current is OnCreateVisitLoadingState ||
          //       //       current is OnCreateVisitSuccessState ||
          //       //       current is OnCreateVisitErrorState ||
          //       //       current is OnCreateVisitCatchErrorState;
          //       // },
          //       listener: (context, state) {
          //         // if (state is OnCreateVisitSuccessState) {
          //         //   ErrorAlertDialog.getDialog(context, "تم انشاء زياره");
          //         //   CreateVisitCubit.get(context).clearSelectedData();
          //         // } else if (state is OnCreateVisitErrorState) {
          //         //   ErrorAlertDialog.getDialog(
          //         //       context, "حدث خطآ ما حاول مره اخري");
          //         // } else if (state is OnCreateVisitCatchErrorState) {
          //         //   ErrorAlertDialog.getDialog(
          //         //       context, "حدث خطآ ما حاول مره اخري");
          //         // }
          //       },
          //       builder: (context, state) {
          //         return Expanded(
          //           flex: 3,
          //           child: ButtonWidget(
          //               isLoading: false,
          //               // isLoading: state is OnCreateVisitLoadingState,
          //               buttonHeight: 56.h,
          //               buttonText: "اضافه تحويل",
          //               borderRadius: 4.r,
          //               backGroundColor: AppColors.mainColor,
          //               borderColor: AppColors.mainColor,
          //               textStyle: TextStyles.font16WhiteColorWeight500,
          //               onPressed: () {
          //                 // CreateVisitCubit.get(context).createVisit();
          //               }),
          //         );
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
