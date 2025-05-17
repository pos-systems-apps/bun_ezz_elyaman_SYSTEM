import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/app_drop_down_field.dart';
import 'package:pos_system/features/sales_invoice/logic/sales_invoice_cubit.dart';
import 'package:pos_system/features/sales_invoice/logic/sales_invoice_state.dart';

class FilterName extends StatelessWidget {
  const FilterName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesInvoiceCubit, SalesInvoiceState>(
      buildWhen: (previous, current) {
        return current is OnChangeNameState;
      },
      builder: (context, state) {
        return AppDropDownField(
            hintText:
                SalesInvoiceCubit.get(context).selectedCustomerName?.name ??
                    "الاسم",
            hintStyle: TextStyles.font14GreyColor87Weight400,
            textStyle: TextStyles.font14BlackColorWeight400,
            items: SalesInvoiceCubit.get(context).customers,
            backgroundColor: AppColors.whiteColor,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: SvgPicture.asset(ImageAsset.icon2),
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
              SalesInvoiceCubit.get(context).changeName(value);
            });
      },
    );
    ;
  }
}
