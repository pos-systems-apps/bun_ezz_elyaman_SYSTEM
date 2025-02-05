import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/features/statistics/ui/widgets/chart_widget.dart';
import 'package:pos_system/features/statistics/ui/widgets/statistics_first_row_widget.dart';
import 'package:pos_system/features/statistics/ui/widgets/statistics_last_row_widget.dart';
import 'package:pos_system/features/statistics/ui/widgets/statistics_row_widget.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatisticsFirstRowWidget(),
          verticalSpace(16),
          ChartWidget(),
          verticalSpace(24),
          StatisticsRowWidget(
            title: "اجمالي المبيعات الاجله",
            money: r"$50.00/ $100.00",
            color: AppColors.blueColorF7,
            icon: ImageAsset.statics3ICon,
          ),
          verticalSpace(16),
          StatisticsRowWidget(
            title: "اجمالي التحصيلات النقديه",
            money: r"$50.00/ $100.00",
            color: AppColors.blueColorEE,
            icon: ImageAsset.statics4ICon,
          ),
          verticalSpace(16),
          StatisticsRowWidget(
            title: "الراتب",
            money: r"$50.00/ $100.00",
            color: AppColors.blueColorE3,
            icon: ImageAsset.statics4ICon,
          ),
          verticalSpace(16),
          StatisticsLastRowWidget(),
          verticalSpace(30),
        ],
      ),
    ));
  }
}


