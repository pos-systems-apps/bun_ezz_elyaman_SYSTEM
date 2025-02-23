import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/app_constant.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/extentions.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/features/statistics/data/models/statistics_response_model.dart';
import 'package:pos_system/features/statistics/ui/widgets/statistics_half_row_widget.dart';
import 'package:pos_system/features/statistics/ui/widgets/statistics_row_widget.dart';

class StatisticsOneRowWidget extends StatelessWidget {
  final List<StatisticsData> statisticsData;

  const StatisticsOneRowWidget({required this.statisticsData, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (statisticsData.length == 1)
          StatisticsHalfRowWidget(
            width: (MediaQueryValues(context).width / 2) - 16,
            title: context.locale.languageCode == "ar"
                ? statisticsData[0].nameAr
                : statisticsData[0].nameEn,
            money: (statisticsData[0].currency ? (AppConstant.currency) : "") +
                " ${statisticsData[0].money.toStringAsFixed(2)}",
            color: AppColors.random1(),
            icon: ImageAsset.random1(),
          ),
        if (statisticsData.length >= 2)
          Row(
            children: statisticsData
                .take(2)
                .map((item) => Expanded(
                      child: StatisticsHalfRowWidget(
                        width: double.infinity,
                        title: context.locale.languageCode == "ar"
                            ? item.nameAr
                            : item.nameEn,
                        money: (item.currency ? (AppConstant.currency ) : "") +
                            " ${item.money.toStringAsFixed(2)}",
                        color: AppColors.random1(),
                        icon: ImageAsset.random1(),
                      ),
                    ))
                .toList(),
          ),
        verticalSpace(16),
        if (statisticsData.length == 3)
          StatisticsRowWidget(
            title: context.locale.languageCode == "ar"
                ? statisticsData[2].nameAr
                : statisticsData[2].nameEn,
            money: (statisticsData[2].currency ? (AppConstant.currency ) : "") +
                "  ${statisticsData[2].money.toStringAsFixed(2)}",
            color: AppColors.random1(),
            icon: ImageAsset.random1(),
          ),
        verticalSpace(24),
      ],
    );
  }
}
