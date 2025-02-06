import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/features/collections/logic/collections_cubit.dart';
import 'package:pos_system/features/collections/logic/collections_state.dart';
import 'package:pos_system/features/collections/ui/widgets/select_items/select_item_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/select_items/vertical_divider_widget.dart';

class BankAccountWidget extends StatelessWidget {
  const BankAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionsCubit, CollectionsState>(
      buildWhen: (previous, current) {
        return current is OnChangeBankSelectState;
      },
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: 56.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.greyColorDB, width: 1.2)),
            child: Row(
              children: CollectionsCubit.get(context)
                  .banks
                  .asMap()
                  .entries
                  .map((item) {
                int index = item.key;
                BB value = item.value;
                return Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          CollectionsCubit.get(context)
                              .changeSelectedBank(value);
                        },
                        child: SelectItemWidget(
                            name: value.name,
                            isSelected: value.id ==
                                CollectionsCubit.get(context).selectedBank?.id)),
                    if (index < CollectionsCubit.get(context).banks.length - 1)
                      VerticalDividerWidget(),
                  ],
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
