import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/logic/sales_state.dart';
import 'package:pos_system/features/sales/ui/widgets/sales_order_type/sales_select_item_widget.dart';
import 'package:pos_system/features/sales/ui/widgets/sales_order_type/sales_vertical_divider_widget.dart';

class SalesOrderTypesWidget extends StatelessWidget {
  const SalesOrderTypesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesCubit, SalesState>(
      buildWhen: (previous, current) {
        return current is OnChangeBillTypeSelectState;
      },
      builder: (context, state) {
        return Container(
          height: 56.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.greyColorDB, width: 1.2)),
          child: Row(children: [
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    SalesCubit.get(context).changeSelectedBillType(1);
                  },
                  child: SalesSelectItemWidget(
                      name: "فاتوره مبيعات",
                      isSelected:
                          SalesCubit.get(context).selectedBillType == 1)),
            ),
            SalesVerticalDividerWidget(),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    SalesCubit.get(context).changeSelectedBillType(2);
                  },
                  child: SalesSelectItemWidget(
                      name: "فاتوره مرتجعات",
                      isSelected:
                          SalesCubit.get(context).selectedBillType == 2)),
            ),
          ]),
        );
      },
    );
  }
}
