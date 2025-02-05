import 'package:flutter/material.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/features/statistics/ui/widgets/statistics_half_row_widget.dart';

class StatisticsLastRowWidget extends StatelessWidget {
  const StatisticsLastRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StatisticsHalfRowWidget(
          title: "مدين",
          money: r"- $567.25",
          color: AppColors.blueColor6F3,
        ),
        horizontalSpace(16),
        StatisticsHalfRowWidget(
          title: "دائن",
          money: r"- $567.25",
          color: AppColors.blueColorDE,
        ),
      ],
    );
  }
}
