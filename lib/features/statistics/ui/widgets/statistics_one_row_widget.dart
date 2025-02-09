import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pos_system/core/services/cache_helper.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/constant_keys.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/features/statistics/data/models/statistics_response_model.dart';
import 'package:pos_system/features/statistics/ui/widgets/statistics_half_row_widget.dart';
import 'package:pos_system/features/statistics/ui/widgets/statistics_row_widget.dart';

class StatisticsOneRowWidget extends StatefulWidget {
  final List<StatisticsData> statisticsData;

  const StatisticsOneRowWidget({required this.statisticsData, super.key});

  @override
  State<StatisticsOneRowWidget> createState() => _StatisticsOneRowWidgetState();
}

class _StatisticsOneRowWidgetState extends State<StatisticsOneRowWidget> {
  String? currency;

  @override
  void initState() {
    super.initState();
    getStoreData();
  }

  getStoreData() async {
    currency =
        await CacheHelper.getSecuredString(ConstantKeys.saveCurrencyToShared) ??
            "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: widget.statisticsData
              .take(2)
              .map((item) => StatisticsHalfRowWidget(
                    title: context.locale.languageCode == "ar"
                        ? item.nameAr
                        : item.nameEn,
                    money:
                    (item.currency? (currency ?? ""):"") + " ${item.money.toStringAsFixed(2)}",
                    color: AppColors.random1(),
                    icon: ImageAsset.random1(),
                  ))
              .toList(),
        ),
        verticalSpace(16),
        if (widget.statisticsData.length == 3)
          StatisticsRowWidget(
            title: context.locale.languageCode == "ar"
                ? widget.statisticsData[2].nameAr
                : widget.statisticsData[2].nameEn,
            money: (widget.statisticsData[2].currency? (currency ?? ""):"") +
                "  ${widget.statisticsData[2].money.toStringAsFixed(2)}",
            color: AppColors.random1(),
            icon: ImageAsset.random1(),
          ),

        verticalSpace(24),
      ],
    );
  }
}
