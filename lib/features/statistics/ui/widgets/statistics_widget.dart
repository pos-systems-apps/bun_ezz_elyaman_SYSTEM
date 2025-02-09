import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/spacing.dart';
import 'package:pos_system/features/statistics/data/models/statistics_response_model.dart';
import 'package:pos_system/features/statistics/logic/statistics_cubit.dart';
import 'package:pos_system/features/statistics/logic/statistics_state.dart';
import 'package:pos_system/features/statistics/ui/widgets/chart_widget.dart';
import 'package:pos_system/features/statistics/ui/widgets/statistics_one_row_widget.dart';
import 'package:pos_system/features/statistics/ui/widgets/statistics_shimmer_widget.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
      child: BlocBuilder<StatisticsCubit, StatisticsState>(
        buildWhen: (previous, current) {
          return current is OnGetStaticsLoadingState ||
              current is OnGetStaticsSuccessState ||
              current is OnGetStaticsErrorState ||
              current is OnGetStaticsCatchErrorState;
        },
        builder: (context, state) {
          if (StatisticsCubit.get(context).statisticsResponseModel == null) {
            return StatisticsShimmerWidget();
          } else {
            List<StatisticsData> firstThreeItems = StatisticsCubit.get(context).statisticsResponseModel!.statisticsData.take(3).toList();
            List<StatisticsData> remainingItems = StatisticsCubit.get(context).statisticsResponseModel!.statisticsData.skip(3).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(16),
                StatisticsOneRowWidget(statisticsData: firstThreeItems),
                verticalSpace(16),
                ChartWidget(
                    statisticsResponseModel:
                        StatisticsCubit.get(context).statisticsResponseModel!),
                verticalSpace(16),
                for (var i = 0; i < (remainingItems.length); i += 3)
                  StatisticsOneRowWidget(
                    statisticsData: remainingItems.skip(i).take(3).toList(),
                  ),
                verticalSpace(30),
              ],
            );
          }
        },
      ),
    ));
  }
}
