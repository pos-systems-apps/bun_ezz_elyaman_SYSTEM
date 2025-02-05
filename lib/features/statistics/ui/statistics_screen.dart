import 'package:flutter/material.dart';
import 'package:pos_system/features/statistics/ui/widgets/statistic_app_bar_widget.dart';
import 'package:pos_system/features/statistics/ui/widgets/statistics_widget.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatisticAppBarWidget(),
          StatisticsWidget(),
        ],
      ),
    );
  }
}
