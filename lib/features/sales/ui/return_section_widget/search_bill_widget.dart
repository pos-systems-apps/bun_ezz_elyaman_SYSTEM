import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/ui/return_section_widget/bill_id_text_field_widget.dart';

class SearchBillWidget extends StatelessWidget {
  const SearchBillWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SalesCubit.get(context).billKey,
      child: Row(
        children: [
          Expanded(child: BillIdTextFieldWidget()),
          horizontalSpace(12),
          ButtonWidget(
              isLoading: false,
              buttonHeight: 48.h,
              buttonWidth: 50.w,
              borderRadius: 6.r,
              buttonText: "",
              textStyle: TextStyles.font16WhiteColorWeight400,
              icon: Icons.arrow_forward,
              iconColor: AppColors.whiteColor,
              backGroundColor: AppColors.mainColor,
              borderColor: AppColors.mainColor,
              onPressed: () {
                if (SalesCubit.get(context).billKey.currentState!.validate()) {
                  SalesCubit.get(context).getInvoiceDetails();
                }
              })
        ],
      ),
    );
  }
}
