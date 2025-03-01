import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/fund_list/ui/widgets/fund_list_selected_date_widget.dart';
import 'package:pos_system/features/fund_list/ui/widgets/fund_list_table_widget.dart';
import 'package:pos_system/features/fund_list/ui/widgets/mandoube_name_widget.dart';

class FundListBodyWidget extends StatelessWidget {
  const FundListBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MandoubeNameWidget(),
            verticalSpace(20),
            FundListSelectedDateWidget(),
            verticalSpace(50),
            FundListTableWidget(),
            verticalSpace(50),
            ButtonWidget(
                isLoading: false,
                buttonHeight: 56.h,
                buttonText: "تحميل",
                borderRadius: 4.r,
                backGroundColor: AppColors.mainColor,
                borderColor: AppColors.mainColor,
                textStyle: TextStyles.font16WhiteColorWeight500,
                onPressed: () {
                  // AddCustomerCubit.get(context).clearAddCustomerData();
                }),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
