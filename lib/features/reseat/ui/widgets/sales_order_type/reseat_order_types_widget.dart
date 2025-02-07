import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/features/sales/ui/widgets/sales_order_type/sales_select_item_widget.dart';
import 'package:pos_system/features/sales/ui/widgets/sales_order_type/sales_vertical_divider_widget.dart';

class ReseatOrderTypesWidget extends StatelessWidget {
  const ReseatOrderTypesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.greyColorDB, width: 1.2)),
      child: Row(children: [
        Expanded(
          child: SalesSelectItemWidget(name: "فاتوره مبيعات", isSelected: true),
        ),
        SalesVerticalDividerWidget(),
        Expanded(
          child:
              SalesSelectItemWidget(name: "فاتوره مرتجعات", isSelected: false),
        ),
      ]),
    );
  }
}
