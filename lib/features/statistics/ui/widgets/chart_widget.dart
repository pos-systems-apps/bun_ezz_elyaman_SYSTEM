import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:pos_system/features/statistics/data/models/statistics_response_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatelessWidget {
  final bool showAll;
  final StatisticsResponseModel statisticsResponseModel;

  const ChartWidget({required this.showAll,required this.statisticsResponseModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w, bottom: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          image: DecorationImage(
              image: AssetImage(ImageAsset.chartBackGroundImage),
              fit: BoxFit.fill)),
      child: SfCartesianChart(
        backgroundColor: Colors.transparent,
        enableAxisAnimation: true,
        legend: Legend(isVisible: false),
        tooltipBehavior: TooltipBehavior(enable: true),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: (double.tryParse(statisticsResponseModel.maxValue.value
                      .toStringAsFixed(2)) ??
                  0) *
              1.5,
          axisLine: AxisLine(
            color: AppColors.whiteColor,
            width: 0,
          ),
          labelStyle: TextStyles.font12GreyColor82Weight400,
          majorGridLines: MajorGridLines(
            width: 1,
            color: AppColors.blueColor1ED.withValues(alpha: .15),
          ),
        ),
        primaryXAxis: CategoryAxis(
          axisLine: AxisLine(
            color: AppColors.blueColor1ED,
            width: 1,
          ),
          labelStyle: TextStyles.font10GreyColor82Weight400,
          maximumLabelWidth: 80,
          labelIntersectAction: AxisLabelIntersectAction.multipleRows,
          majorGridLines: MajorGridLines(width: 0),
        ),
        title: ChartTitle(
          text: 'الاحصائيات',
          textStyle: TextStyles.font16GreyColor33Weight400,
          alignment: ChartAlignment.far,
        ),
        series: <ColumnSeries<StatisticsData, String>>[
          ColumnSeries<StatisticsData, String>(
            dataSource: statisticsResponseModel.statisticsData
                .where((item) => showAll ?  item.money > 0 :(item.showInAllStatus))
                .toList(),
            width: .6,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            xValueMapper: (StatisticsData data, _) =>
                context.locale.languageCode == "ar" ? data.nameAr : data.nameEn,
            yValueMapper: (StatisticsData data, _) =>
                double.tryParse(data.money.toStringAsFixed(2)) ?? 0,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.blueColorEB, AppColors.blueColor1EE]),
            enableTooltip: true,
          ),
        ],
      ),
    );
  }
}
