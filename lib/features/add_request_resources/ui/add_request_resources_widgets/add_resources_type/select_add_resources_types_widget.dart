import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/features/add_request_resources/logic/add_request_resources_cubit.dart';
import 'package:pos_system/features/add_request_resources/logic/add_request_resources_state.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/add_resources_type/select_add_resources_select_item_widget.dart';
import 'package:pos_system/features/add_request_resources/ui/add_request_resources_widgets/add_resources_type/select_add_resources_vertical_divider_widget.dart';


class SelectAddResourcesTypesWidget extends StatelessWidget {
  const SelectAddResourcesTypesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRequestResourcesCubit, AddRequestResourcesState>(
      buildWhen: (previous, current) {
        return current is OnChangeResourcesTypeSelectState;
      },
      builder: (context, state) {
        return Container(
          height: 56.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.greyColorDB, width: 1.2)),
          child: Row(
              children: AddRequestResourcesCubit.resourcesTypes
                  .asMap()
                  .entries
                  .map(
                    (item) => Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  AddRequestResourcesCubit.get(context)
                                      .changeSelectedBillType(item.value);
                                },
                                child: SelectAddResourcesSelectItemWidget(
                                    name: context.locale.languageCode == "ar"
                                        ? item.value.nameAr
                                        : item.value.nameEn,
                                    isSelected: AddRequestResourcesCubit.get(context)
                                            .selectedResourcesTypes
                                            .id ==
                                        item.value.id)),
                          ),
                          if (item.key < AddRequestResourcesCubit.resourcesTypes.length - 1)
                            SelectAddResourcesVerticalDividerWidget(),
                        ],
                      ),
                    ),
                  )
                  .toList()),
        );
      },
    );
  }
}
