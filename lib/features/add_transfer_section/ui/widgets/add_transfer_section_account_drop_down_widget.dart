import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/app_drop_down_field.dart';
import 'package:pos_system/features/add_transfer_section/logic/add_transfer_section_cubit.dart';
import 'package:pos_system/features/add_transfer_section/logic/add_transfer_section_state.dart';

class AddTransferSectionAccountDropDownWidget extends StatelessWidget {
  const AddTransferSectionAccountDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTransferSectionCubit, AddTransferSectionState>(
      buildWhen: (previous, current) {
        return current is OnChangeSelectedBankAccountState ||
            current is OnGetBankAccountLoadingState ||
            current is OnGetBankAccountSuccessState ||
            current is OnGetBankAccountCatchErrorState ||
            current is OnGetBankAccountErrorState;
      },
      builder: (context, state) {
        return AppDropDownField(
            hintText: AddTransferSectionCubit.get(context)
                    .selectedBankAccount
                    ?.name ??
                "اختيار الحساب",
            hintStyle: TextStyles.font14GreyColor87Weight400,
            textStyle: TextStyles.font14BlackColorWeight400,
            items: AddTransferSectionCubit.get(context).accounts,
            backgroundColor: AppColors.whiteColor,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: SvgPicture.asset(ImageAsset.icon1),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.blueColorEEE, width: 1.3),
                borderRadius: BorderRadius.circular(8.r)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.blueColorEEE, width: 1.3),
                borderRadius: BorderRadius.circular(8.r)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.redColor, width: 1.3),
                borderRadius: BorderRadius.circular(8.r)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.redColor, width: 1.3),
                borderRadius: BorderRadius.circular(8.r)),
            onChanged: (dynamic value) {
              AddTransferSectionCubit.get(context)
                  .onChangeSelectedBankAccount(value);
            });
      },
    );
  }
}
