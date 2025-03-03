import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_system/core/utils/app_colors_white_theme.dart';
import 'package:pos_system/features/collections/logic/collections_cubit.dart';
import 'package:pos_system/features/collections/logic/collections_state.dart';
import 'package:pos_system/features/collections/ui/widgets/select_items/collections_select_item_widget.dart';
import 'package:pos_system/features/collections/ui/widgets/select_items/collections_vertical_divider_widget.dart';
import 'package:pos_system/features/splash/data/models/bank_accounts_response_model.dart';
import 'package:shimmer/shimmer.dart';

class CollectionsBankAccountWidget extends StatelessWidget {
  const CollectionsBankAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionsCubit, CollectionsState>(
      buildWhen: (previous, current) {
        return current is OnChangeBankSelectState ||
            current is OnGetBankAccountsLoadingState ||
            current is OnGetBankAccountsSuccessState ||
            current is OnGetBankAccountsErrorState ||
            current is OnGetBankAccountsCatchErrorState;
      },
      builder: (context, state) {
        if (CollectionsCubit.get(context).bankAccounts.isEmpty) {
          return Container(
            height: 60.h,
            alignment: Alignment.topLeft,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(.2),
              highlightColor: Colors.grey.withOpacity(.4),
              period: const Duration(seconds: 1),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: 56.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.greyColorDB, width: 1.2)),
              child: Row(
                children: CollectionsCubit.get(context)
                    .bankAccounts
                    .asMap()
                    .entries
                    .map((item) {
                  int index = item.key;
                  AccountsResponseData value = item.value;
                  return Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            CollectionsCubit.get(context)
                                .changeSelectedBankAccount(value);
                          },
                          child: CollectionsSelectItemWidget(
                              name: value.name,
                              isSelected: value.id ==
                                  CollectionsCubit.get(context)
                                      .selectedBankAccount
                                      ?.id)),
                      if (index <
                          CollectionsCubit.get(context).bankAccounts.length - 1)
                        CollectionsVerticalDividerWidget(),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
