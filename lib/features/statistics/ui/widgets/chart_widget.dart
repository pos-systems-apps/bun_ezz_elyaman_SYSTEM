import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/core/utils/assets_manager.dart';
import 'package:pos_system/core/utils/styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 20.h, left: 10.w, right: 10.w, bottom: 10.h),
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
        //max value and minum value and interval
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 600,
          interval: 100,
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
          // maximumLabelWidth:40,
          maximumLabelWidth: 100,
          labelIntersectAction: AxisLabelIntersectAction.multipleRows,
          majorGridLines: MajorGridLines(width: 0),
        ),

        title: ChartTitle(
          text: 'الاحصائيات',
          textStyle: TextStyles.font16GreyColor33Weight400,
          alignment: ChartAlignment.far,
        ),

        series: <ColumnSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
            dataSource: <_ChartData>[
              _ChartData('المبيعات', 120),
              _ChartData('صافي مبيعات', 150),
              _ChartData('مرتجعات اجله', 300),
              _ChartData('تحصيلات نقديه', 500),
              _ChartData('مبيعات اجله', 120),
              _ChartData('مبيعات نقديه', 150),
            ],
            width: .6,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
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

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}