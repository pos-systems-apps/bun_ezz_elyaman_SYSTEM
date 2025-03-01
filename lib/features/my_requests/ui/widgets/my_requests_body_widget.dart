import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/core/widgets/button_widget.dart';
import 'package:pos_system/features/fund_list/ui/widgets/fund_list_selected_date_widget.dart';
import 'package:pos_system/features/fund_list/ui/widgets/fund_list_table_widget.dart';
import 'package:pos_system/features/fund_list/ui/widgets/mandoube_name_widget.dart';
import 'package:pos_system/features/my_requests/ui/widgets/my_requests_item_widget.dart';
import 'package:pos_system/features/sales_invoice/ui/widgets/invoice_item_widget.dart';

class MyRequestsBodyWidget extends StatelessWidget {
  const MyRequestsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(26),
            ButtonWidget(
                isLoading: false,
                // isLoading: state is OnCreateVisitLoadingState,
                buttonHeight: 56.h,
                buttonText: "انشاء طلب",
                borderRadius: 4.r,
                backGroundColor: AppColors.mainColor,
                borderColor: AppColors.mainColor,
                textStyle: TextStyles.font16WhiteColorWeight500,
                onPressed: () {
                  // CreateVisitCubit.get(context).createVisit();
                }),
            verticalSpace(32),
            Center(
                child: Text("الطلبات السابقه",
                    style: TextStyles.font20MainColorWeight600)),
            verticalSpace(16),
            ...[1, 1, 1].map((item) => MyRequestsItemWidget()),
          ],
        ),
      ),
    );
  }
}
