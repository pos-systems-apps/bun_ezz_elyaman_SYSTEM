import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/features/sales/logic/sales_cubit.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/reseat_widgets/reseat_order_type/reseat_select_item_widget.dart';
import 'package:pos_system/features/sales/ui/sales_section_widget/reseat_widgets/reseat_order_type/reseat_vertical_divider_widget.dart';

class ReseatOrderTypesWidget extends StatelessWidget {
  const ReseatOrderTypesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.greyColorDB, width: 1.2)),
      child: Row(
          children: SalesCubit.orderTypes
              .asMap()
              .entries
              .map(
                (item) => Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReseatSelectItemWidget(
                            name: context.locale.languageCode == "ar"
                                ? item.value.nameAr
                                : item.value.nameEn,
                            isSelected:
                                SalesCubit.get(context).selectedOrderType.id ==
                                    item.value.id),
                      ),
                      if (item.key < SalesCubit.orderTypes.length - 1)
                        ReseatVerticalDividerWidget(),
                    ],
                  ),
                ),
              )
              .toList()),
    );
  }
}
